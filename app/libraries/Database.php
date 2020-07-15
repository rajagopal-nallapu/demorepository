<?php

namespace CRCSignup\Libraries;

use PDO;

class Database
{

    private $host;
    private $username;
    private $password;
    private $database;

    private $db;
    private $statement;
    private $error;

    /**
     * Constructor
     * Makes connection with the database server
     * 
     * @param string $database Database name
     */
    public function __construct(string $database = '')
    {
        $this->host     = getenv('DB_HOST_NAME');
        $this->username = getenv('DB_USERNAME');
        $this->password = getenv('DB_PASSWORD');
        $this->database = $database;

        $this->connect();
    }

    /**
     * PDO connection attributes
     * 
     * @return array Connection attributes
     */
    private static function _options()
    {
        return [
            PDO::ATTR_PERSISTENT => false,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true,
            PDO::MYSQL_ATTR_FOUND_ROWS => true
        ];
    }

    /**
     * Set bind type while binding parameter to the statement
     * 
     * @return $type PDO bind type
     */
    private static function _setBindType($type, $value)
    {
        if(is_null($type))
        {
            switch(true)
            {
            case is_int($value):
                $type = PDO::PARAM_INT;
                break;

            case is_bool($value):
                $type = PDO::PARAM_BOOL;
                break;

            case is_null($value):
                $type = PDO::PARAM_NULL;
                break;

            default:
                $type = PDO::PARAM_STR;
            }
        }

        return $type;
    }

    /**
     * Set the connection DSN (Data Source Name) string for PDO
     * 
     * @return string $dsn Connection String
     */
    private function _getDsn(): string
    {
        $dsn = 'mysql:';
        $dsn .= 'host=' . $this->host . ';';

        if (!empty($this->database)) {
            $dsn .= 'dbname=' . $this->database . ';';
        }
        
        $dsn .= 'charset=utf8;';

        return (string) $dsn;
    }

    /**
     * Connect to the database using the DSN
     */
    public function connect()
    {
        try {
            $this->db = new PDO($this->_getDsn(), 
                                $this->username, 
                                $this->password, 
                                self::_options()
                            );
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
            echo $this->_getDsn();
            echo $this->username;
            echo $this->password;
            echo $this->error;
        }
    }

    /**
     * Prepares a statement for execution
     * 
     * @param string $sql The SQL statement
     * @return void
     */
    public function query(string $sql): void
    {
        $this->statement = $this->db->prepare($sql);
    }

    /**
     * Binds a value to a parameter
     * 
     * @param $param The parameter name
     * @param $value The parameter value
     * @param $type The parameter type
     * @return void
     */
    public function bind($param, $value, $type = null): void
    {
        $type = self::_setBindType($type, $value);

        $this->statement->bindValue($param, $value, $type);
    }

    /**
     * Bind parameters to the statement from an array
     * 
     * @param array $parama An associative array of parameters and their values
     * @return void
     */
    public function bindArray(array $params): void
    {
        foreach ($params as $key => $param) {
            $type = self::_setBindType(null, $param);
            $this->statement->bindValue($key, $param);
        }
        
    }

    /**
     * Prepare statement string for multiple condtional and update statements
     * 
     * @param string $seperator The seperator for the statement string
     * @param array $param The parameter array
     * @return string The prepared statement string
     */
    private static function _prepareString(array $params, string $separator): string
    {
        return implode($separator, array_map(fn ($key) => 
           sprintf("%s=:%s", $key, $key), array_keys($params))
        );
    }

    /**
     * Executes a prepared statement
     * 
     * @return bool Returns TRUE on success or FALSE on failure.
     */
    public function execute(): bool
    {
        return $this->statement->execute();
    }

    /**
     * Returns an array containing all of the result set rows
     * 
     * @return array Result set object
     */
    public function result(): array
    {
        $this->execute();
        return $this->statement->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * Fetches the sngile row from a result set
     * 
     * @return mixed The row from the records
     */
    public function single()
    {
        $this->execute();
        return $this->statement->fetch(PDO::FETCH_OBJ);
    }

    /**
     * Returns the number of rows affected by the last SQL statement
     * 
     * @return int The count
     */
    public function rowCount(): int
    {
        return $this->statement->rowCount();
    }

    /**
     * Initiates a transaction
     * @return bool Returns TRUE on success or FALSE on failure.
     */
	public function beginTransaction(): bool
	{
		return $this->db->beginTransaction();
	}

    /**
     * Commits a transaction
     * @return bool Returns TRUE on success or FALSE on failure.
     */
	public function commit(): bool
	{
		return $this->db->commit();
	}

    /**
     * Rolls back a transaction
     * @return bool Returns TRUE on success or FALSE on failure.
     */
	public function rollBack(): bool
	{
		return $this->db->rollBack();
	}

    /**
     * Checks if inside a transaction
     * @return bool Returns TRUE if a transaction is currently active, and FALSE if not.
     */
	public function inTransaction()
	{
		return $this->db->inTransaction();
    }
    
    /**
     * Inserts the data from an array into the database
     * 
     * @param $tableName
     * @param null $params
     * @return bool|string
     */
	public function insert(string $tableName, array $params = [])
	{
        $keys = array_keys($params);
        
		$this->query(
			'INSERT INTO `' . $tableName . '` (`' . implode('`,`', $keys) . '`) 
			 VALUES (:' . implode(',:', $keys) . ')'
        );
        $this->bindArray($params);
        $rowCount = $this->execute();

		if ($rowCount === 0) {
			return false;
		}
		return $this->lastInsertId();
    } 

    /**
     * Update the table
     * 
     * @param $tableName
     * @param null $params
     * @return bool|string
     */
	function update(string $tableName, array $params = [],array $condition = [])
	{
        $set = $where = '';

        $set = self::_prepareString($params,', ');
        $where = 'WHERE '.self::_prepareString($condition, ' AND ');
        
		$this->query("UPDATE $tableName SET $set $where");
        $this->bindArray(array_merge($params,$condition));
        $this->execute();

		if ($this->rowCount() == 0) {
			return false;
		}
		return true;
    }
    
    /**
     * Returns the ID of the last inserted row or sequence value
     * @return string
     */
	public function lastInsertId(): string
	{
		return $this->db->lastInsertId();
	}

    /**
     * Closes the connection
     */
    public function closeConnection()
    {
        $this->db = null;
    }

    /**
     * Executes a simple query statement
     * 
     * @param string $sql The SQL statement
     */
    public function execQuery(string $sql)
    {
        return $this->db->exec($sql);
    }


}