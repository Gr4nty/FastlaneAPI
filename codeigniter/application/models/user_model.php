<?php

class user_model extends CI_Model {

    function getUserProfileByID($id) {
        
        $sql = "SELECT * FROM users_profile WHERE user_id = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
        $q->bindValue(1, $id, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetch(PDO::FETCH_ASSOC);
            return $data;
        }      
    }
    function getUserStatusByID($id) {
        
        $sql = "SELECT * FROM users_status WHERE user_id = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
        $q->bindValue(1, $id, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetch(PDO::FETCH_ASSOC);
            return $data;
        }      
    }
    function getUserFuelByID($id) {
        
        $sql = "SELECT * FROM users_fuel WHERE user_id = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
        $q->bindValue(1, $id, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetch(PDO::FETCH_ASSOC);
            return $data;
        }      
    }
    function getUserMoneyByID($id) {
        
        $sql = "SELECT * FROM users_money WHERE user_id = ?";
        $q = $this->db->conn_id->prepare($sql);
        // Binding
        $q->bindValue(1, $id, PDO::PARAM_INT);
        $q->execute();
        // Check if user exists
        if ($q->rowCount() > 0) {
            $data = $q->fetch(PDO::FETCH_ASSOC);
            return $data;
        }      
    }
}
