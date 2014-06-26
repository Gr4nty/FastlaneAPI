<?php

class user_model extends CI_Model {

    function getUserByID($id) {
        
        $sql = "SELECT * FROM user_profile WHERE user_id = ?";
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
