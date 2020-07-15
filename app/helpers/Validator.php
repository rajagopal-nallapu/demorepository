<?php

namespace CRCSignup\Helper;
use Valitron\Validator as Valitron;
use Exception;

class Validator
{
    /**
     * password length variable
     * @var int 
     */
    public const MIN_PASSWORD_LENGTH = 6;

    public const MIN_ZIPCODE_LENGTH = 5;

    public const MAX_ZIPCODE_LENGTH = 9;

    public const MIN_NAME_LENGTH = 2;
    public const MAX_NAME_LENGTH = 50;

    public const RECURLY_TOKEN_REGEX = '/^[a-zA-Z0-9_+-]*$/';

    public const ALPHABET_SPACES_REGEX = '/^[a-zA-Z ]*$/';
    
    /**
     * Stores the input submitted by form
     * @var array
     */
    protected array $data = [];

    /**
     * constructor
     * @param array $data The user data
     */
    public function __construct(array $data)
    {
        $this->data = $data;
    }

    /**
     * Validation rules for user basic information* 
     * @return array
     */
    private static function _userInfoRules(): array
    {
        return [
            'required' => ['firstName', 'lastName', 'email', 'password'],
            'email' => ['email'],
            'lengthMin' => [
                ['password',  static::MIN_PASSWORD_LENGTH],
                ['firstName', static::MIN_NAME_LENGTH],
                ['lastName',  static::MIN_NAME_LENGTH]
            ],
            'lengthMax' => [
                ['firstName', static::MAX_NAME_LENGTH],
                ['lastName',  static::MAX_NAME_LENGTH]
            ],
            'regex' => [
                ['firstName', static::ALPHABET_SPACES_REGEX],
                ['lastName',  static::ALPHABET_SPACES_REGEX]
            ]
        ];
    }

    /**
     * Validation rules for user billing information* 
     * @return array
     */
    private static function _billingInfoRules(): array
    {
        return [
            'required' => ['fullAddress', 'cityName', 'state', 'zipcode', 'recurly-token'],
            'integer'  => ['zipcode'],
            'lengthMin' => [
                ['zipcode', static::MIN_ZIPCODE_LENGTH]
            ],
            'lengthMax' => [
                ['zipcode', static::MAX_ZIPCODE_LENGTH]
            ],
            'regex' => [
                ['recurly-token', static::RECURLY_TOKEN_REGEX]
            ]
        ];
    }

    /**
     * validates user basic information
     * @return mixed
     */
    public function validateUserInformation()
    {
        try 
        {
            $this->data = array_map('trim', $this->data);
            $v = new Valitron($this->data);

            $v->rules(self::_userInfoRules());

            if ($v->validate()) {
                return true;
            } else {
                return (array) $v->errors();
            }
        }
        catch(\InvalidArgumentException $e) 
        {
            return false;
        }
        
    }

    /**
     * validates user billing information
     * @return mixed
     */
    public function validateBillingInfo()
    {
        try 
        {
            $this->data = array_map('trim', $this->data);
            $v = new Valitron($this->data);

            $v->rules(self::_billingInfoRules());

            if ($v->validate()) {
                return true;
            } else {
                return (array) $v->errors();
            }
        }
        catch(\InvalidArgumentException $e) 
        {
            return false;
        }
        
    }

    /**
     * Validate user email address
     * Use for email alone validation
     * @return mixed
     */
    public function validateUserEmail()
    {
        try
        {
            $this->data = array_map('trim', $this->data);
            $v = new Valitron($this->data);

            $v->rule('email', 'email');

            if ($v->validate()) {
                return true;
            } else {
                return (array) $v->errors();
            }
        }
        catch(\InvalidArgumentException $e)
        {
            return false;
        }
    }

    /**
     * Validate password
     * use for password alone validation
     * @return mixed
     */
    public function validateUserPassword()
    {
        try
        {
            $this->data = array_map('trim', $this->data);
            $v = new Valitron($this->data);

            $v->rule('lengthMin', 'password', static::MIN_PASSWORD_LENGTH);

            if ($v->validate()) {
                return true;
            } else {
                return (array) $v->errors();
            }
        }
        catch(\InvalidArgumentException $e)
        {
            return false;
        }
    }
}