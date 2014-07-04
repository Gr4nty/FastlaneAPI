<?php

class car_model extends CI_Model {

    function getCarProfilebyId($id) {
        $sql = "SELECT * FROM car_profile WHERE car_profile_id = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
//        $q->bindValue(1, $name, PDO::PARAM_INT);
        $q->bindValue(1, $id, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetch(PDO::FETCH_ASSOC);;
            return $data;
        }  
    }
    function getCarProfilesbyMake($make) {
        $sql = "SELECT * FROM car_profile WHERE car_make = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
//        $q->bindValue(1, $name, PDO::PARAM_INT);
        $q->bindValue(1, $make, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() >=2) {
            $data = $q->fetchAll(PDO::FETCH_ASSOC);;
            return $data;
        } 
        if ($q->rowCount() >0 and $q->rowCount() <2) {
            $data = $q->fetch(PDO::FETCH_ASSOC);;
            return $data;
        } 
    }
}
