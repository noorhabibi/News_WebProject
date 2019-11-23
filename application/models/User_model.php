<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model {

    private $default_table = 'users';

    public function add($data) {
        if($this->db->insert($this->default_table, $data)){
            return $this->db->insert_id();
        }

        return FALSE;
    }

    public function update($data, $where) {
        if($this->db->update($this->default_table, $data, $where)) {
            return $this->db->affected_rows();
        }
        return FALSE;
    }

    public function get($iduser) {
        $user = $this->db->get_where($this->default_table, array('iduser' => $iduser), 1);
        if(!$user) {
            return FALSE;
        }
        return $user->row();
    }

    public function get_by_email($email) {
        $user = $this->db->get_where($this->default_table, array('email' => $email), 1);
        if(!$user) {
            return FALSE;
        }
        return $user->row();
    }

    public function get_by_key($key) {
        $user = $this->db->get_where($this->default_table, array('code' => $key), 1);
        if(!$user) {
            return FALSE;
        }
        return $user->row();
    }

    public function get_profile($iduser) {
        $this->load->model('profile_model', 'pm');
        return $this->pm->get_by_iduser($iduser);
    }
    public function store($data) {
        return $this->db->insert('users',$data);
      
    }
    public function login($data) {
        if(!isset($data['status'])) {
            $data['status'] = 1;
        }

          $user = $this->db->get_where($this->default_table, $data, 1);
 
         $user_data = $user->row_array();
      
        $this->db->select('*')->from('users');
        $this->db->where('email',$data['email']);
        $this->db->where('password',$data['password']);
        $query = $this->db->get();
        if($query) {
            return $query->result_array();
        }else {
            return FALSE;
        }
    }

}