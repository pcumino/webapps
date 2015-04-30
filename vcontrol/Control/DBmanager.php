<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * 
 * Description of DBmanager
 *
 * @author pedroluizcumino
 * 
 * All the methods bellow return a JSON output if well successed.
 *  public function insertValue($table_name, $parameters)
 *  public function updateValue($table_name,$col,$newval,$id)
 *  public function deleteValue($table_name,$param,$val)
 *  public function listAllValues($table_name)
 * 
 * The default usage of the class
 *  $myDb = new DBmanager();
 *  $myDb->setUserNpass('[mysql_login]','[mysql_password]');
 *  $myDb->mysqlConnect();
 *      [code to edit database]
 *  $myDb->mysqlDisconnect();
 * 
 */

class DBmanager{
    private $host = '127.0.0.1';
    private $port = "3306";
    private $db = 'vehicleManagerDB';
    private $connection = NULL, $user = NULL, $pass = NULL;
    private $columnsNames;
    
    public function setUserNpass($u, $p){
        $this->user = $u;
        $this->pass = $p;
    }
    
    public function mysqlConnect() {
        // connecting to the database server
        $this->connection = mysqli_connect($this->host, $this->user, $this->pass, $this->db, $this->port);
        if (!$this->connection) {
            die('Could not connect: ' . mysql_error());
        }
    }
    
    public function mysqlDisconnect(){
        mysqli_close($this->connection);
    }

    public function insertValue($table_name, $parameters){
        //get table columns' names
        $sql = "SHOW COLUMNS FROM ".$table_name.";";
        $query = mysqli_query($this->connection, $sql);
        if (!$query) {
            echo "Error: " . $sql . "<br>" . mysqli_error($this->connection);
        }
        $i = 0;
        while($data = mysqli_fetch_array($query)){
            if($data['Field'] != "id".$table_name){
                if ($i == 0) {
                    $this->columnsNames .= $data['Field'];
                } else {
                    $this->columnsNames .= ', ' . $data['Field'];
                }
                $i++;
            }
        }

        // joining parameters into $values to be inserted into the sql query string
        $values = "'".$parameters[0]."'";
        if(sizeof($parameters) > 1){
            for($i = 1; $i < sizeof($parameters); $i++){
                $values .= ", '".$parameters[$i]."'";
            }
        }
        
        // sql to be used to insert values
        $sql = "INSERT INTO ".$table_name." (".$this->columnsNames.") VALUES(".$values.");";
        $query = mysqli_query($this->connection, $sql);
        if (!$query) {
            echo "Error: " . $sql . "<br>" . mysqli_error($this->connection);
        }
        else{
            listAllValues($table_name);
        }
    }
    public function deleteValue($table_name,$param,$val){
        $sql = "DELETE FROM ".$table_name." WHERE ".$param." = ".$val.";";
        $query = mysqli_query($this->connection, $sql);
        if (!$query) {
            echo "Error: " . $sql . "<br>" . mysqli_error($this->connection);
        }
        else{
            listAllValues($table_name);
        }
    }
    public function updateValue($table_name,$col,$newval,$id){
        $sql = "UPDATE ".$table_name." SET ".$col." = '".$newval."' WHERE id".$table_name." = ".$id.";";
        $query = mysqli_query($this->connection, $sql);
        if (!$query) {
            echo "Error: " . $sql . "<br>" . mysqli_error($this->connection);
        }
        else{
            listAllValues($table_name);
        }
    }
    public function listAllValues($table_name){
        $sql = "SELECT * FROM ".$table_name.";";
        $query = mysqli_query($this->connection, $sql);
        if (!$query) {
            echo "Error: " . $sql . "<br>" . mysqli_error($this->connection);
        }
        $i = 0;
        while($data = mysqli_fetch_array($query)){
            $arrCar[$i] = $data;
            $i++;
        }
        $vehiclesJSON = "{\"".$table_name."\":".json_encode($arrCar)."}";
        
        echo $vehiclesJSON;
    }
}
