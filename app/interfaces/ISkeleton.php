<?php

namespace CRCSignup\Interfaces;

interface ISkeleton
{
    /**
     * To raed the data from the skeleton file data\
     * 
     * @param string $fileName The file to read the data from
     */
    public function readSqlStatements(string $fileName);


    /**
     * Execute all the quaries from skeleton to create the database for users
     * All the quaries will be executed one by one
     * 
     * @param string $lines The lines read from the skeleton file
     */
    public function execute(string $lines);
}