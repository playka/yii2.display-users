<?php

namespace app\models;

use Yii;
use yii\base\Model;

class SignUpForm extends Model
{
    public $username;
    public $password;
    public $name;
    public $lastName;
    public $gender;
    public $postcode;
    public $country;
    public $city;
    public $street;
    public $houseNumber;
    public $apartmentNumber;
    

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['username', 'password', 'name', 'lastName', 'gender', 'postcode','country', 'city','street'], 'required'],
        ];
    }

    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function signUp()
    {
        if ($this->validate()) {
            return true;
        } else {
            return false;
        }
    }
}
