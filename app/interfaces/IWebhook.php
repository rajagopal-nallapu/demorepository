<?php

namespace CRCSignup\Interfaces;

interface IWebhook
{
    /**
     * Parepare data for the webhook to send
     */
    public function prepareData();


    /**
     * Make call to the webhook
     * 
     * @param string $url Webhook url to send the data to
     * @param array $data Webhook data to send
     */
    public function makeRequest();
}