<?php

namespace CRCSignup\Model;

use CRCSignup\Libraries\Database;

/**
 * CRC Signup Module - User model
 */
class User
{
    private $db;

    /**
     * Constructor
     * Sets the Database object
     */
    public function __construct()
    {
        //$this->db = new Database(getenv('DEFAULT_DATABASE'));
        $this->setDatabaseObject(new Database(getenv('DEFAULT_DATABASE')));
    }
    public function setDatabaseObject($db){
        $this->db = $db;
    }
    /**
     * Checks emails is already exists in user access table
     * 
     * @param string $email The email address
     * @return bool Returns false if the email is already found or true if not found
     */
    public function checkEntryInUserAccess(string $email): bool
    {
        $this->db->query("SELECT * FROM ".CRO_USER_ACCESS." WHERE vemail = :email");
        $this->db->bind(':email', $email);
        return ($this->db->rowCount() > (int) 0) ? (bool)false : (bool)true;
    }
    public function checkUserIDExistsInAgendaSettings(int $userID)
    {
        $this->db->query("SELECT * FROM ".CRO_AGENDA_SETTINGS." WHERE iuser_id = :user_id");
        $this->db->bind(':user_id', $userID);
        return ($this->db->rowCount() > (int) 0) ? (bool)false : (bool)true;
    }    

    /**
     * Save the user in Main Registration table.
     * 
     * @param array $data User information array
     * @return int Returns inserted ID on success
     */
    public function save(array $data): int
    {
        $insertId = $this->db->insert(CRO_COMPANY_REGISTRATION, $data);
        return (int) $insertId;
    }
    public function saveUserAccess(array $data): int
    {
        $insertId = $this->db->insert(CRO_USER_ACCESS, $data);
        return (int)$insertId;
    }

    /**
     * Get the user from company registration table
     * 
     * @param int $id The Registration ID
     * @return object The user object
     */
    public function getInfo(int $id)
    {
        $this->db->query("SELECT * FROM ".CRO_COMPANY_REGISTRATION." WHERE ireg_id = :id");
        $this->db->bind(':id', $id);

        return $this->db->result();
    }
    /**
     * update the user in Main Registration table.
     * 
     * @param array $data User information array
     * @return bool Returns true if success or false
     */
    public function update(array $data, $condition): bool
    {
        return $this->db->update(CRO_COMPANY_REGISTRATION, $data, $condition);
    }

    public function getUserStatusByEmail(string $email)
    {
        $this->db->query("SELECT cua.ireg_id,cua.vuser_name,cua.vuser_type,ccr.vaccount_status,ccr.signup_status
                          FROM ".CRO_USER_ACCESS." as cua
                          LEFT JOIN ".CRO_COMPANY_REGISTRATION." as ccr ON ccr.ireg_id = cua.ireg_id
                          WHERE cua.vemail = :email");
        $this->db->bind(':email', $email);


        return $this->db->single();
    }

    public function updateSignupLog(array $logSingupData=[])
    {
        $data = [];
        $result = 0;
        if ($logSingupData) { 
            extract($logSingupData); 
             
            if (isset($firstName))    $data += ['first_name' => trim($firstName)];
            if (isset($lastName))     $data += ['last_name' => trim($lastName)];
            if (isset($email))        $data += ['email' => trim($email)];
            if (isset($password))     $data += ['password' => base64_encode(addslashes(trim($password)))];
            if (isset($country))      $data += ['country_code' => trim($country)];
            if (isset($growsumo_pid)) $data += ['growsumo_pid' => trim($growsumo_pid)];
            
            $this->db->query("SELECT id FROM ".CRO_SIGNUP_LOG." WHERE email = :email"); 
            $this->db->bind(':email', $email);
            $this->db->execute();
            if ($this->db->rowCount() >(int) 0) {
                $id = $this->db->result()[0]->id;
                if (isset($recurly_token))          $data += ['recurly_token' => trim($recurly_token)];
                if (isset($vRecurlyAc_code))        $data += ['recurly_account_code' => trim($vRecurlyAc_code)];
                if (isset($vRecurlySubscriptionId)) $data += ['recurly_subscription_id' => trim($vRecurlySubscriptionId)];
                if (isset($phone_number))           $data += ['phone_number' => trim($phone_number)];
                if (isset($vcompany_addr1))            $data += ['address' => trim($vcompany_addr1)];
                if (isset($vcompany_city))          $data += ['city' => trim($vcompany_city)];
                if (isset($vcompany_state))         $data += ['state_province' => trim($vcompany_state)];        
                if (isset($vpostcode))              $data += ['postcode' => trim($vpostcode)];        
                if (isset($upsell_details))         $data += ['upsell_details' => trim($upsell_details)];        
                if (isset($final_status))           $data += ['final_status' => trim($final_status)];        
                if (isset($status_log))             $data += ['status_log' => trim($status_log)];
                
                if (count($data)>0){
                    $data += [
                        'date_updated'  => date('Y-m-d  H:m:s'),
                        'updated_by'    => $_SERVER['REMOTE_ADDR']
                    ];

                    try{
                        $condition = ['id'=>$id];
                        $updatestatus = $this->db->update(CRO_SIGNUP_LOG, $data, $condition);
                        if($updatestatus) {
                            $result = $id ;
                        }
                    }catch(\Exception $error){
                        echo $error->getMessage();
                    }
                }
            } else {
                $data += [
                    'date_created' => date('Y-m-d H:m:s'),
                    'created_by' => $_SERVER['REMOTE_ADDR']
                ];

                try{
                    $result = $this->db->insert(CRO_SIGNUP_LOG, $data);
                }catch(\Exception $error){
                    echo $error->getMessage();
                }
            }
            
            return (int) $result;
        }
    }

    public function getSingupDetailsById($logId)
    {
        $this->db->query("SELECT * FROM ".CRO_SIGNUP_LOG." WHERE id = :logId");
        $this->db->bind(':logId', $logId);
        return $this->db->single();
    }

    public function getUserIdByRegitrationId(int $resgirationId)
    {
        $this->db->query("SELECT iuser_id FROM ".CRO_USER_ACCESS." WHERE ireg_id = :ireg_id");
        $this->db->bind(':ireg_id', $resgirationId);
        return $this->db->single();
    }

    public function updateCroControlsForUser(array $data): int
    {
        $insertId = $this->db->insert(CRO_CONTROLS, $data);
        return (int) $insertId;
    }

    public function updateAccessForUser(array $data): int
    {
        $insertId = $this->db->insert(CRO_USER_ACCESS, $data);
        return (int) $insertId;
    }

    /**
     * Checks exists and update the latest status of singup steps
     * 
     * @param string $latestStatus defines last_completed_step on singup with uniqe $registrationId 
     * @return bool Returns false if the update is not done
     */
    public function signupStepsUpdate(string $latestStatus,int $registrationId): bool
    {
        $data = [':lastest_step' => $latestStatus,':id' => $registrationId];
        $sql = "UPDATE ".CRO_COMPANY_REGISTRATION." SET last_completed_step=:lastest_step  WHERE ireg_id = :id";
        $this->db->query($sql);
        $this->db->bindArray($data);
        $this->db->execute();
        return ($this->db->rowCount() > (int) 0) ? (bool)false : (bool)true;
    }

    public function updatePartnerstackId(string $partnerstackId,int $registrationId): bool
    {
        $data = [':partnerstackId' => $partnerstackId,':id' => $registrationId];
        $sql = "UPDATE ".CRO_COMPANY_REGISTRATION." SET growsumo_pk=:partnerstackId  WHERE ireg_id = :id";
        $this->db->query($sql);
        $this->db->bindArray($data);
        $this->db->execute();
        return ($this->db->rowCount() > (int) 0) ? (bool)false : (bool)true;
    }
} 