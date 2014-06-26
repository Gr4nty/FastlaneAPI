<?php

class car_model extends CI_Model {

    function getCarProfile($value) {
        if (is_numeric($value) == TRUE){
        $sql = "SELECT * FROM car_type WHERE car_type_id = ?";   
        }else{
        $sql = "SELECT * FROM car_type WHERE make = ?";}
        $q = $this->db->conn_id->prepare($sql);
        // Binding
//        $q->bindValue(1, $name, PDO::PARAM_INT);
        $q->bindValue(1, $value, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetchAll(PDO::FETCH_ASSOC);;
            return $data;
        }   
    }
}
