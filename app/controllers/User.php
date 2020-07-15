<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\Controller;
use CRCSignup\Interfaces\IUser;
use CRCSignup\Controller\Base;
use CRCSignup\Controller\Folder;
use CRCSignup\Controller\Zapier;
use CRCSignup\Helper\Validator;
use CRCSignup\Helper\IpAddress;
use CRCSignup\Helper\Timezone;
use CRCSignup\Controller\RecurlyFactory;
use CRCSignup\Controller\Rackspace;
use CRCSignup\Controller\Skeleton;


/**
 * Handles complete user registration 
 */
class User extends Controller implements IUser
{

    /**
     * Message to display when an exception occured
     * @var string
     */
    public const EXCEPTION_MESSAGE = "We have encountered an unexpected problem. Please try again.";

    private const DEFAULT_STATUS    = 'active';
    private const DEFAULT_PACKAGE   = 7;
    private const DEFAULT_PLAN_TYPE = 'monthly';
    private const DATABASE_SUFFIX   = "_crd";
    private const USER_TYPE         = "1";
    private const EMAIL_FLAG        = "off";
    private const NOTIFICATION_EMAIL_FLAG = "1-";
    Protected $RegistrationID;
    Protected $userID; 
    Protected $documentRoot;
    Protected $scriptName;
    protected $signupLogId;
    /**
     * variable to store the $_POST data
     * @var array $input
     */
    public array $input = [];

    /**
     * constructor
     * @param array $data The POST data from the user
     */
    public function __construct()
    {
        $this->baseModel = $this->model('Base');
        $this->userModel = $this->model('User');
        
    }

    public function __call($method, $args)
    {
        $data = [];
        $response = false;
        
        if (isset($args) && !empty($args)) {
            $data = $args[0];   
        }

        if ($data) {
            $validator = new Validator($data);
            $response  = $validator->$method();
        }

        if ($response === true) {
            return true;
        } else if(is_array($response)){
            echo json_encode($response); exit;
        } else {
            echo static::EXCEPTION_MESSAGE; exit;
        }
    }

    /**
     * To check wheather user is already exist in the system
     * Checking user email id existed in half registed signup table and company registration table
     * 
     * @param string $email Email Address
     */
    public function checkAlreayExists(string $email)
    {
        $user = $this->userModel->checkEntryInUserAccess($email);
        if($user) {
            return true;
        } else {
            echo 'Already exists'; exit;
        }
    }

    public function registerUser()
    {
        $this->validateUserInformation($_POST);
        $this->validateUserAlreayExists();
        $signupLogId = "";

        try {
            $signupLogId = $this->userModel->updateSignupLog($_POST);

            if ($signupLogId) {
                echo json_encode([
                    'status'    => 'success',
                    'firstName' => $_POST['firstName'],
                    'lastName'  => $_POST['lastName'],
                    'logId'     => $signupLogId
                ]);
            }else{
                echo json_encode([
                    'status'  => 'fail',
                    'message' => static::EXCEPTION_MESSAGE
                ]);
            }

        } catch (\Exception $e) {
            echo json_encode([
                'status'  => 'fail',
                'message' => static::EXCEPTION_MESSAGE
            ]);
        }
    }

    public function validateUserAlreayExists()
    {
        extract($_POST);
        $userInfo = $this->userModel->getUserStatusByEmail($email);
        
        if ($userInfo) {
            $userInfo = (array) $userInfo;
            extract($userInfo);
            $error;
            if ($vuser_type=="admin") {
                die(json_encode([
                    'status'  => 'fail',
                    'message' => "You already have a Credit Repair Cloud account with this same email address"
                ]));  
            } else { 
               die(json_encode([
                    'status'  => 'fail',
                    'message' => "This email address is already in our system (as a Team Member of Client) and it can not be used again. Please use a different email address"
                ])); 
                
            }
        }
    }
    
    private function _createRecurly(array $input, $user)
    {
        try {
            $userInfoForRecurly = [
                'firstName'     => $user['first_name'],
                'lastName'      => $user['last_name'],
                'email'         => $user['email'],
                'recurly-token' => $input['recurly-token']
            ];
            $response = RecurlyFactory::create($userInfoForRecurly);
            return $response;
        } catch (\Exception $e) {
            echo static::EXCEPTION_MESSAGE; exit;
        }
        
    }

    private function _updateRecurly(array $input, $user)
    {
        try {
            $userInfoForRecurly = [
                'firstName'     => $user['first_name'],
                'lastName'      => $user['last_name'],
                'email'         => $user['email'],
                'recurly-token' => $input['recurly-token'],
                'recurly_account_code' => $user['recurly_account_code']
            ];
            $response = RecurlyFactory::update($userInfoForRecurly);
            return $response;
        } catch (\Exception $e) {
            echo static::EXCEPTION_MESSAGE; exit;
        }
        
    }

    
    public function addBillingInformation()
    {
        $this->validateBillingInfo($_POST);
        $userData = (array)$this->userModel->getSingupDetailsById($_POST['logId']);
        $signupStatus = [
            'email' => $userData['email'],
            'recurly_token' => $_POST['recurly-token'],
            'status_log' => '2'
        ];
        $this->userModel->updateSignupLog($signupStatus); 
        try {
        
            if (isset($userData['recurly_account_code']) && !empty($userData['recurly_account_code'])) {
                $recurlyResponse = $this->_updateRecurly($_POST, $userData);
            } else {
                $recurlyResponse = $this->_createRecurly($_POST, $userData);
            }

            if(isset($recurlyResponse['accounts'])){
                if(isset($recurlyResponse['subscriptions'])){
                    if (count($recurlyResponse)>=2 && !empty($recurlyResponse)) {
                        $account = $recurlyResponse['account'];
                        $subscription = $recurlyResponse['subscription'];
                        $recurlyInfo = [
                            'vcompany_addr1' => $_POST['fullAddress'],
                            'vcompany_city'  => $_POST['cityName'],
                            'vcompany_state' => $_POST['state'],
                            'vpostcode'      => $_POST['zipcode'],
                            'vRecurly_email' => $userData['email'],
                            'vRecurlyAc_code'=> $account->getCode(),
                            'vRecurlySubscriptionId' => $subscription->getUuid()
                        ];
                        $registrationData       = array_merge($userData,$recurlyInfo);
                        $this->RegistrationID   = $this->makeEntryInCompanyRegistration($registrationData);
                        
                        if ($this->RegistrationID) {
                            $recurlyInfo += [
                                'email'         => $userData['email'],
                                'recurly_token' => $_POST['recurly-token'],
                                'final_status'  => 'Recurly_Data_Updated'
                            ];
                            $this->userModel->updateSignupLog($recurlyInfo);
                            $this->userID = $this->makeEntryInUserAccess($userData);

                            if ($this->userID) {
                                $this->userModel->signupStepsUpdate('submit_signup_data_step1',$this->RegistrationID);
                                $agendaSettingsResponse  = $this->makeEntryInAgendaSettings();
                                $this->
                                $uploadsFolderResponse   = $this->createUploadsFolderForUser();
                                $this->userModel->signupStepsUpdate('entry_data_signup_step1_useraccess',$this->RegistrationID);

                                $rackspaceResponse = $this->createRackspaceObjects($userData['country_code']);
                                if ($rackspaceResponse) {
                                    $rackspaceLog = [
                                        'email'         => $userData['email'],
                                        'final_status'  => 'Rackspace_Objects_Created'
                                    ];
                                    $this->userModel->updateSignupLog($rackspaceLog);
                                    $this->userModel->signupStepsUpdate('entry_data_signup_step2_another_6_cf',$this->RegistrationID);
                                } else {
                                    $error = "RACKSPACE FILES IS FAILED TO MOVE FILES";
                                    $this->messageFailedStatus($error,$userData);
                                }

                                $userData['SampleClientId']     = $this->createSampleClient();
                                $userData['SampleAffiliateId']  = $this->createSampleAffiliate();
                                $userData['CroControls']        = $this->createCroControls($userData);

                                if (isset($userData['SampleClientId']) && isset($userData['SampleAffiliateId']) && isset($userData['CroControls'])) {
                                    $this->userModel->signupStepsUpdate('entry_data_signup_step3',$this->RegistrationID);
                                    $sampleDataLog = [
                                        'email'         => $userData['email'],
                                        'final_status'  => 'ClientAffiliateControls_Created'
                                    ];
                                    $this->userModel->updateSignupLog($sampleDataLog);
                                } else {
                                    $error = "SAMPLE CLIENT AFFILIATE CONTROLS IS FAILED TO CREATE";
                                    $this->messageFailedStatus($error,$userData);
                                }

                                $skeletonResponse  = $this->createDatabaseSkeleton($userData['country_code']);
                                if ($skeletonResponse) {
                                    $skeletonLog = [
                                        'email'         => $userData['email'],
                                        'final_status'  => 'Skeleton_Created'
                                    ];
                                    $this->userModel->updateSignupLog($skeletonLog);
                                } else {
                                    $error = "SKELETON DATABASE IS FAILED TO CREATE";
                                    $this->messageFailedStatus($error,$userData);
                                }
                                /*
                                $partnerstackResponse = $this->createPartnerstack($registrationData);
                                if ($partnerstackResponse) {
                                    $partnerstackLog = [
                                        'email'         => $userData['email'],
                                        'final_status'  => 'Partnerstack_Created'
                                    ];
                                    $this->userModel->updateSignupLog($partnerstackLog); 

                                } else {
                                    $error = "PARTNERSTACK IS FAILED TO CREATE";
                                    $this->messageFailedStatus($error,$userData);
                                }*/
                                                
                                $defaultDataUpdated = $this->insertDefaultDataIntoTheChildTables($userData);

                                $this->userModel->signupStepsUpdate('entry_data_signup_step4',$this->RegistrationID);

                                $intercomResponse = $this->createIntercomRequest($userData);
                                if ($intercomResponse) {
                                    $intercomLog = [
                                        'email'         => $userData['email'],
                                        'final_status'  => 'Intercom_Created'
                                    ];
                                    $this->userModel->updateSignupLog($intercomLog);
                                } else {
                                    $error = "INTERCOM IS FAILED TO CREATE";
                                    $this->messageFailedStatus($error,$userData);
                                }
                                
                                $signupStatus = [
                                    'email'         => $userData['email'],
                                    'status_log'    => '1'
                                ];
                                $this->userModel->updateSignupLog($signupStatus); 
                            
                                /*$successURL ="";
                                $zapierResponse = $this->createZapierRequest();
                                $this->userModel->updateSignupLog($zapierLog); */ 
                                echo json_encode([
                                    'status'        => 'success',
                                    'company_id'    => $this->RegistrationID,
                                    'recurly_account_code' => $account->getCode()
                                ]);
                                exit;
                            } else {
                                $error = "";
                                @mail("debuglog@creditrepaircloud.com", 'USER ACCESS REGISTRATION IS FAILED', print_r($userData,true));
                                die(json_encode([
                                    'status'  => 'fail',
                                    'message' => static::EXCEPTION_MESSAGE
                                ]));
                            }
                        } else {
                            @mail("debuglog@creditrepaircloud.com", 'COMPANY REGISTRATION IS FAILED', print_r($userData,true));
                            die(json_encode([
                                'status'  => 'fail',
                                'message' => static::EXCEPTION_MESSAGE
                            ]));
                        }
                    } else {
                        @mail("debuglog@creditrepaircloud.com", 'RECURLY ACCOUNT SUBSCRIPTION NOT FOUND', print_r($userData,true));
                        die(json_encode([
                            'status'  => 'fail',
                            'message' => static::EXCEPTION_MESSAGE
                        ]));
                    }
                } else {
                    @mail("debuglog@creditrepaircloud.com", 'RECURLY SUBSCRIPTION NOT FOUND', print_r($userData,true));
                    die(json_encode([
                        'status'  => 'fail',
                        'message' => static::EXCEPTION_MESSAGE
                    ]));    
                }    
            } else {
                @mail("debuglog@creditrepaircloud.com", 'RECURLY ACCOUNT NOT FOUND', print_r($userData,true));
                die(json_encode([
                    'status'  => 'fail',
                    'message' => static::EXCEPTION_MESSAGE
                ]));
            }    
        } catch(\Exception $error) {
            @mail("debuglog@creditrepaircloud.com", 'PROBLEM WITH SINGUP', print_r($userData,true));
            die(json_encode([
                'status'  => 'fail',
                'message' => static::EXCEPTION_MESSAGE
            ]));
        }  
    }

    /**
     * Update the user signup status after every defined step
     * To continue the user from the last step in case of any failure
     * 
     * @param string $status The status of the user registration
     */
    public function updateRegistrationStatus(string $status)
    {
        //TODO: implement
    }

    /**
     * To Register the user in company registration table
     * This is the main Registartion for the user to store all the information
     * 
     * @param array $data User information array
     * 
     * @return int The Registration ID of the user if success
     */
    public function makeEntryInCompanyRegistration(array $data)
    {
        $ipAddress = IpAddress::get();
        $timezone  = Timezone::get($ipAddress);
        date_default_timezone_set($timezone);
        $CompanyRegistrationArray = [
            'vfirst_name'       => $data['first_name'],
            'vlast_name'        => $data['last_name'],
            'vemail'            => $data['email'],
            'vcompany_country'  => $data['country_code'],
            'icompany_timezone' => $timezone,
            'isales_person_id'  => 0,
            'vplan_type'        => 'monthly',
            'vtimezone_abbr'    => Timezone::getTimezoneOffset($this->baseModel, $timezone),
            'vaccount_status'   => static::DEFAULT_STATUS,
            'ipackage_id'       => static::DEFAULT_PACKAGE,
            'vIP_address'       => $ipAddress,
            "dreg_date"         => date("Y-m-d H:i:s"),
            "trial_period_end"  => date('Y-m-d', strtotime('+30 days')),
            'vcompany_addr1'    => $data['vcompany_addr1'],
            'vcompany_city'     => $data['vcompany_city'],
            'vcompany_state'    => $data['vcompany_state'],
            'vpostcode'         => $data['vpostcode'],
            'vRecurly_email'    => $data['vRecurly_email'],
            'vRecurlyAc_code'   => $data['vRecurlyAc_code'],
            'lastlogin'         => date("Y-m-d H:i:s"), 
            'growsumo_pk'       => (isset($data['txtgs_id']))?$data['txtgs_id']:"",
            'vRecurlySubscriptionId'        => $data['vRecurlySubscriptionId'],
            "lead_notification_email"       => static::NOTIFICATION_EMAIL_FLAG,
            "affiliate_notification_email"  => static::NOTIFICATION_EMAIL_FLAG            
        ];
        try {
            return $this->userModel->save($CompanyRegistrationArray);
        } catch (\Exception $e) {
            echo static::EXCEPTION_MESSAGE; exit;
        }
    }

    /**
     * Create an entry in User Access table for the user
     * This is for storing information related to login to the application
     * 
     * @param array $data
     */
    public function makeEntryInUserAccess(array $data)
    {
        //TODO: implement        
        $CountryData     = $this->baseModel->getCountryDetails($data['country_code']);
        $CountryCode     = $CountryData->country_code;
        $UserAccessArray = [
                        "ireg_id"       => $this->RegistrationID,
                        "vuser_name"    => addslashes($data['email']),
                        "vpasswd"       => base64_encode(addslashes($data['password'])),
                        "vuser_type"    => static::USER_TYPE,
                        "vFirst_Name"   => stripslashes($data['first_name']),
                        "vLast_Name"    => stripslashes($data['last_name']),
                        "vemail"        => $data['email'],
                        "vCountryCode"  => $CountryCode,
                        "db_name"       => $this->RegistrationID.static::DATABASE_SUFFIX  
                    ];
            try {
                return $this->userModel->saveUserAccess($UserAccessArray);
            } catch (\Exception $e) {
                echo static::EXCEPTION_MESSAGE; exit;
            }
    }

    /**
     * Create an entry in Agenda Settings table for the user
     * This is for storing information related to login to the application
     * 
     * @param int $userID
     */
     public function makeEntryInAgendaSettings()
    {

        if($this->userModel->checkUserIDExistsInAgendaSettings($this->userID) <= 0)
        {
            $AgendaSettingsArray = [
                                     "iuser_id"     => $this->userID,
                    				 "esend_email"  => static::EMAIL_FLAG               
                                   ];
            try {
                return $this->userModel->saveUserAccess($AgendaSettingsArray);
            } catch (\Exception $e) {
                echo static::EXCEPTION_MESSAGE; exit;
            }
        }    
 
    } 
    
    /**
     * Create uploads folder for the user
     *
     * */
    public function createUploadsFolderForUser()
    {   
        
        try {
            $folder = new Folder($this->RegistrationID);
            return $folder->mount();            
        } catch (\Exception $e) {
                echo static::EXCEPTION_MESSAGE; exit;
        }
 
    }    


    public function insertDefaultDataIntoTheChildTables(array $data=[])
    {
        $countryData     = (array) $this->baseModel->getCountryDetails($data['country_code']);
        $updateSkeleton  = new Skeleton($this->RegistrationID,$data['country_code']);
        $currentDateTime = date('Y-m-d H:i:s');
        $currentDateTimePlusTwoHours = date("Y-m-d H:i:s", strtotime("+2 hour"));
        $commenQueries = [
            'INSERT INTO `crd_team` (`iTeam_id`, `iUser_id`, `iRole_id`, `vFirst_Name`, `vLast_Name`, `vEmail`, `vPhone`, `vMobile`, `vFax`, `vPhoto`, `vAddress`, `gender`,`created_date`) VALUES 
                (1,'.$this->userID.', 1, "' .$data['first_name'] . '", "' . $data['last_name'] . '", "' . $data['email'] . '", "", "", "", "", NULL, "Male", now())',
            "INSERT INTO `crd_scheduler` (`Id`, `Subject`, `Location`, `Description`, `StartTime`, `EndTime`, `IsAllDayEvent`, `Color`, `RecurringRule`, `iclient_id`, `iTeam_id`,`created_by`, `reminder_type`,`estatus`) VALUES 
                (1, 'Remember to complete your \'To-Do\' Items on your Home page!', NULL, NULL, '{$currentDateTime}', '{$currentDateTimePlusTwoHours}', 0, NULL, NULL, NULL, 0, NULL, NULL, NULL),
                (2, 'Complete my Company Profile', NULL, NULL, '{$currentDateTime}', '{$currentDateTimePlusTwoHours}', 0, NULL, NULL,NULL, '1', '1', 'Follow Up', 'pending'),        
                (3, 'Set my default Client Agreement', NULL, NULL, '{$currentDateTime}', '{$currentDateTimePlusTwoHours}', 0, NULL, NULL,NULL,  '1', '1', 'Follow Up', 'pending'),
                (4, 'Add my Team Members', NULL, NULL, '{$currentDateTime}', '{$currentDateTimePlusTwoHours}', 0, NULL, NULL,NULL,  '1', '1', 'Follow Up', 'pending'),
                (5, 'Log into my Sample Client and Run Wizard 1-2-3', NULL, NULL, '{$currentDateTime}', '{$currentDateTimePlusTwoHours}', 0, NULL, NULL,NULL,  '1', '1', 'Follow Up', 'pending')",
            "INSERT INTO `crd_client_status_logs` (`iid`, `iold_status_id`, `inew_status_id`, `iclient_id`, `ddate`, `iteam_id`) VALUES (NULL, '0', '1', '1', CURRENT_DATE(), '0'), (NULL, '0', '2', '2', CURRENT_DATE(), '0')",
            "UPDATE `crd_clients` SET `iuser_id` = '" . $data['SampleClientId'] . "',`ePortalAccessClient` = 'on', `dreg_date` = CURRENT_DATE() WHERE `iclient_id`=1",
            "UPDATE `crd_clients` SET `dreg_date` = CURRENT_DATE() WHERE `iclient_id` = 2",
            "UPDATE `crd_affiliate` SET `iUser_id` = '" . $data['SampleAffiliateId'] . "',`ePortalAccess` = 'on',`dreg_date` = CURRENT_DATE() WHERE `iAffilate_id`= 1",
        ];
        
         if ($data['country_code'] != 224) {
            $countryQueries = [ 
               "UPDATE crd_agreements SET `tagreement` = REPLACE(`tagreement`, '$', '" . $countryData['currency_symbol']. "')",
               "UPDATE crd_dispute_reasons SET `vdispute_reason` = REPLACE(`vdispute_reason`, '$', '" . $countryData['currency_symbol'] . "')",
               "UPDATE crd_letter_templ SET `vtempt_text` = REPLACE(`vtempt_text`, '$', '" . $countryData['currency_symbol'] . "')",
               "UPDATE crd_options SET `vOptionValue` = REPLACE(`vOptionValue`, '$', '" . $countryData['currency_symbol'] . "')"
            ];
            $queries = array_merge($commenQueries,$countryQueries);
        }else{
         $queries =  $commenQueries;
        }
        return $updateSkeleton->updateDefaultData($queries);
    }

    public function createSampleClient()
    {
        $samplePassword = base64_encode(substr(str_shuffle('abcefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'), 0, 8));
        $sampleClientData = [
            'vuser_name' => 'sample_'.$this->RegistrationID,
            'vpasswd' => $samplePassword,
            'ireg_id' => '0',
            'vuser_type' => 'client',
            'vemail' => 'sample_'.$this->RegistrationID.'@client.com',
            'db_name' => $this->RegistrationID.'_crd'
        ];
        return $this->userModel->updateAccessForUser($sampleClientData);
    }

    public function createSampleAffiliate()
    {
        $samplePassword = base64_encode(substr(str_shuffle('abcefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'), 0, 8));
        $sampleAffiliateData =  [
            'vuser_name' => 'sample_affiliate_'.$this->RegistrationID,
            'vpasswd' => $samplePassword,
            'ireg_id' => '0',
            'vuser_type' => 'affiliate',
            'vemail' => 'sample_'.$this->RegistrationID.'@affiliate.com',
            'db_name' => $this->RegistrationID.'_crd'
            ];
        return $this->userModel->updateAccessForUser($sampleAffiliateData);
    }

    public function createDefaultTasks()
    {
        //TODO: implement
    }
    
    public function createZapierRequest()
    {
        $zapierRequestData=[];

        $zapObject     = new Zapier($url,$zapierRequestData);
        $zapResponse   = $zapObject->makeRequest();
        return $zapResponse;
    }

    public function createRackspaceObjects(int $countryId=0)
    {
        $rackspace = new Rackspace($countryId);
        return $rackspace->createContainerFolders($this->RegistrationID);
    }

    public function createDatabaseSkeleton(int $countryId=0)
    {
        $skeleton  = new Skeleton($this->RegistrationID,$countryId);
        return $skeleton->readSqlStatements();
    }

    public function createIntercomRequest(array $data=[])
    {
        $intercom = new Intercom();
        $companysData = $usersData = $tagsData = $companysResponse =  $usersResponse = $tagsResponse = [];
        $companyUserName = $data['first_name'].' '. $data['last_name'];
        
        $companysData = [
            'remote_created_at' => time(),
            'company_id'        => $this->RegistrationID,
            'name'              => trim(stripslashes($companyUserName)),
            "plan"              => 'Start',
            "custom_attributes" => [
                "phone"             => "",
                'Account Status'    => 'Active',
                'Account Type'      => 'Trial',
                'Mandrill Active'   => 'No',
                'Mailchimp Active'  => 'No',
                "Chargebee Active"  => 'No',
                'Number Of Leads'   => 0,
                'Number Of Active Clients'  => 0,
                'Number Of Affiliates'      => 0,
                'Number Of Team Members'    => 0,
                'Batch Print'               => 'off',      
                'CC Information Added'      => 'No',
                'Signup Flow'               => 1
            ]
        ];
        $companysResponse = (array)$intercom->intercomRequest('companies', $companysData);

        if (!empty($companysResponse)) {
            $userName = trim(ucfirst(strtolower($data['first_name']))) . ' ' . trim(ucfirst(strtolower($data['last_name'])));
            $usersData = [
                'user_id'   => $this->userID,
                'email'     => trim($data['email']),
                'id'        => $this->userID,
                'signed_up_at' => time(),
                'name'         => $userName,
                'companies'    => [
                    [
                        'id' => $this->RegistrationID
                    ]
                ],
                'custom_attributes'  => [
                    'Account Status' => 'Active',
                    'Role'           => 'Account Holder'
                ]
            ];
            $usersResponse = (array)$intercom->intercomRequest('users', $usersData);
       }

       if (!empty($usersResponse)) {
            $tagsData = [
                'name'  => 'Account Holder',
                'users' => [
                    [
                        'user_id' => $this->userID
                    ]
                ]
            ];
            $tagsResponse = (array)$intercom->intercomRequest('tags', $tagsData);
       }
       if (!empty($tagsResponse)) return true; else return false;
    }

    public function createPartnerstack(array $data=[])
    {
        $partnestack  = new Partnestack();
        $customerName = ucwords(trim($data['first_name']) . ' ' . trim($data['last_name']));
        $ipAddress    = IpAddress::get();
        $response     = false;
       
        $customerData = [
            'customer_key' => $data['vRecurlyAc_code'],
            'full_name'    => $customerName,
            'email'        => $data['email'],
            'ip_address'   => $ipAddress
        ];

        $customerCheck = $partnestack->checkPartnerstackCustomer($data['email']);
        if (trim($customerCheck->message) == 'Customer retrieved'){
            $response = $partnestack->updatePartnerstackCustomer($customerData);
            $this->userModel->signupStepsUpdate($data['growsumo_pk_latest'],$this->RegistrationID);
        } else {
            if (isset($data['growsumo_pk_latest'])) {
                $customerData += [
                    'customer_referred' => $data['growsumo_pk_latest']
                ];
                $response = $partnestack->updatePartnerstackCustomer($customerData);
            }
        }
        return $response;
    }

    public function createCroControls(array $data)
    {
        $croControlsData = [
            'ireg_id'       => $this->RegistrationID,
            'sender_name'   => ucfirst(strtolower($data['first_name'])).' '.ucfirst(strtolower($data['last_name'])),
            'sender_email'  => $data['email']
        ];
        return $this->userModel->updateCroControlsForUser($croControlsData);
    }

    public function messageFailedStatus(string $message='',array $data=[])
    {
		@mail("debuglog@creditrepaircloud.com", $message, print_r($data,true));
        die(json_encode([
            'status'  => 'fail',
            'message' => static::EXCEPTION_MESSAGE
        ]));
    }
}