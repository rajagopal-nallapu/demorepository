<?php

namespace CRCSignup\Interfaces;

interface IRecurly
{

    /**
     * To authorize with Recurly for every request 
     */
    public function authorize();

    /**
     * To create the Recurly account for the user
     * 
     * @param array $payload User information to create new recurly account
     */
    public function createAccount(array $payload);
    

    /**
     * Create a recurly subscription for the created account
     * Payload contains subscription information along with Recurly Account Id
     * 
     * @param array $payload Subscription information to create new subscription
     */
    public function createSubscription(array $payload);


    /**
     * Get Recurly account information of the user by using Recurly Account Id
     * 
     * @param string $recurlyId
     */
    public function getAccountInformation(string $accountCode);

    /**
     * Get Recurly subscription of the user by using subscription Id
     * 
     * @param string $subscriptionId
     */
    public function getSubscriptionInformation(string $subscriptionId);


    /**
     * Take charge for the user 
     * 
     * @param array $payload Payment information to create new transaction
     */
    public function charge(array $payload);
}