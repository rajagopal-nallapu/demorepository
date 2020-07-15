<?php
namespace CRCSignup\Model;
use CRCSignup\Libraries\Database;

/**
 * CRC Signup Module - Rackspace model
 */
class Rackspace
{
    private $db;

    /**
     * Constructor
     * Sets the Database object
     */
    public function __construct()
    {
        $this->db = new Database(getenv('DEFAULT_DATABASE'));
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

    public function getSignupDetailsByRegistrationId(int $registrationId)
    {
        $this->db->query("SELECT * FROM ".CRO_COMPANY_REGISTRATION." WHERE ireg_id = :id");
        $this->db->bind(':id', $registrationId);
        return $this->db->single();
    }

    // public function getCompanyIdByRegistration(){
    //     $this->db->query("SELECT vcompany_country FROM ".CRO_COMPANY_REGISTRATION." WHERE ireg_id = :id");
    //     $this->db->bind(':id', $registrationId);
    //     return $this->db->single();
    // }

    public function createControlsForRegistredUser(array $data): int
    {
        $insertId = $this->db->insert(CRO_CONTROLS, $data);
        return (int) $insertId;
    }

    public function createAccessForUser(array $data): int
    {
        $insertId = $this->db->insert(CRO_USER_ACCESS, $data);
        return (int) $insertId;
    }
   
}
