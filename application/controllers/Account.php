<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Account extends CI_Controller {

    /**
     * Constructor
     */
    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
    }

    /**
     * Manage user account
     */
    public function index() {
        $data['title'] = 'My account | News Portal';

        if(!is_logged_in()) {
            redirect('account/login');
            return;
        }

        $this->form_validation->set_rules('password', 'password', 'trim|min_length[6]|md5');
        $this->form_validation->set_rules('conf_password', 'password confirmation', 'trim|md5|matches[password]');
        $this->form_validation->set_rules('gravatar_email', 'gravatar email', 'valid_email');
        $this->form_validation->set_rules('first_name', 'first name', 'required');
        $this->form_validation->set_rules('last_name', 'last name', 'required');

        if($this->input->method(TRUE) == 'POST' && $this->form_validation->run()) {

            $current_user = $this->user->get();
            $current_profile = $this->user->profile();

            if($current_user->iduser != $this->input->post('iduser') || (isset($current_profile->idprofile) && $current_profile->idprofile != $this->input->post('idprofile'))) {
                $this->template->alert(
                    'Form spoofing detected.',
                    'warning'
                );
                redirect(base_url('account/logout'));
                return;
            }

            $this->load->model('user_model', 'um');
            $this->load->model('profile_model', 'pm');

            if(strlen($this->input->post('password')) > 0) {
                $this->um->update(
                    array(
                        'password' => $this->input->post('password'),
                        'edit_date' => date('Y-m-d H:i:s'),
                        'edited_by' => 'user'
                    ),
                    array(
                        'iduser' => $current_user->iduser
                    )
                );
            }

            if($current_profile && isset($current_profile->idprofile)) {
                $this->pm->update(
                    array(
                        'first_name'     => $this->input->post( 'first_name' ),
                        'last_name'      => $this->input->post( 'last_name' ),
                        'display_name'   => $this->input->post( 'display_name' ),
                        'gravatar_email' => $this->input->post( 'gravatar_email' )
                    ),
                    array(
                        'idprofile' => $current_profile->idprofile
                    )
                );
            } else {
                $this->pm->add(
                    array(
                        'iduser'         => $current_user->iduser,
                        'first_name'     => $this->input->post( 'first_name' ),
                        'last_name'      => $this->input->post( 'last_name' ),
                        'display_name'   => $this->input->post( 'display_name' ),
                        'gravatar_email' => $this->input->post( 'gravatar_email' )
                    )
                );
            }

            $this->template->alert(
                'Updated profile values.',
                'success'
            );
        }

        $data['user'] = $this->user->get();
        $data['profile'] = $this->user->profile();
        $this->template->view('account/profile', $data);
    }

    /**
     * Handle the user signup
     */
    public function signup() {
        $this->load->model('User_model');
        $data['title'] = 'Sign up | News Portal';

        $this->form_validation->set_rules('email', 'email', 'required|valid_email|is_unique[users.email]');
        $this->form_validation->set_rules('password', 'password', 'required');
        $this->form_validation->set_rules('confirm_password', 'confirm password', 'required|matches[password]');

        if($this->form_validation->run()) {
        
            // Validation is ok and now we should store new data.
            $data = array(
                'email' => $this->input->post('email'),
                'password' => md5($this->input->post('password')),
                'code' => generate_validation_code($this->input->post('email'))
            );
            if ($this->User_model->store($data)) {
                return redirect(base_url());
            } else {
                $this->template->alert(
                    'could not insert'
                );
            }
        }else {
            //die(validation_errors());
            $this->template->alert(
                validation_errors()
            );
        }
        $this->template->view('account/signup');
    }

    public function activate($key) {
        $data['title'] = 'Activate account | News Portal';
        $this->load->model('user_model', 'um');

        $current_user = $this->um->get_by_key($key);
        $data['user'] = $current_user;
        $data['key'] = $key;

        if(!$current_user) {
            $this->template->alert(
                'Invalid token provided.',
                'warning'
            );
            redirect(base_url());
            return;
        }

        $this->form_validation->set_rules('password', 'password', 'trim|required|min_length[6]|md5');
        $this->form_validation->set_rules('conf_password', 'password confirmation', 'trim|required|md5|matches[password]');

        if($this->input->method(TRUE) == 'POST' && ($this->input->post('key') != $key || $this->input->post('iduser') != $current_user->iduser)) {
            $this->template->alert(
                'Form spoofing detected.',
                'warning'
            );
            redirect(base_url());
            return;
        }

        if($this->input->method(TRUE) == 'POST' && $this->form_validation->run()) {
            if($this->user->activate($key, $current_user->iduser, $this->input->post('password'))) {
                $this->user->notify($current_user->iduser, 'welcome');
                $this->template->alert(
                    'Your account has been activated. Please log in using the form below.',
                    'success'
                );
                redirect('account/login');
                return;
            } else {
                $this->template->alert(
                    'Could not activate account. Please contact administrator.',
                    'warning'
                );
                redirect(base_url());
                return;
            }
        }

        $this->template->view('account/set_password', $data);
    }

    /**
     * Handle user login
     */
    public function login() {
        $this->load->model('user_model');
        $data['title'] = 'Log in | News Portal';
        if($_SERVER['REQUEST_METHOD'] == 'POST') {

        
        $this->form_validation->set_rules('email', 'email', 'required|valid_email');
        $this->form_validation->set_rules('password', 'password', 'required');
        $email =  $this->input->post('email');
        $pass = md5($this->input->post('password'));
        if($this->form_validation->run()) {
            if($this->user->login($email, $pass)) {
                $data['user'] = $this->user_model->login(array('email'=>$email, 'password'=>$pass));
                $data['user'] = $data['user'][0];
                $this->session->set_userdata($data['user']);
                 redirect('account');
            }else {
                $this->template->alert(
                    'Credentials did not match',
                    'danger'
                );
            }
            
        }else {
            die(validation_errors());
        }
    }

        if(!is_logged_in()) {
            $this->template->view('account/login', $data);
            return;
        }

        redirect('account');
        return;
    }

    /**
     * Log the user out of the system
     */
    public function logout() {
        $this->user->logout();
        redirect(base_url());
    }

    public function retrieve() {
        $data['title'] = 'Retrieve password | News Portal';

        $this->form_validation->set_rules('email', 'email', 'required|valid_email');
        if($this->input->method(TRUE) == 'POST' && $this->form_validation->run()) {
            $this->load->model('user_model', 'um');

            $current_user = $this->um->get_by_email($this->input->post('email'));
            if(!$current_user) {
                $this->template->alert(
                    'Could not find your account. Make sure you are providing the right email address.',
                    'danger'
                );
                redirect('account/retrieve');
                return;
            }

            $this->um->update(
                array(
                    'code' => generate_validation_code($this->input->post('email'))
                ),
                array(
                    'email' => $this->input->post('email')
                )
            );

            if($this->user->notify($current_user->iduser, 'retrieve')) {
                $this->template->alert(
                    'An email with instructions about resetting your password has been sent.',
                    'info'
                );
                redirect(base_url());
                return;
            } else {
                $this->template->alert(
                    'Sorry! Could not execute the reset request. Please try again in few minutes.',
                    'danger'
                );
            }

        }

        $this->template->view('account/retrieve', $data);
    }

    public function reset($key) {
        $data['title'] = 'Reset password | News Portal';
        $this->load->model('user_model', 'um');

        $current_user = $this->um->get_by_key($key);
        $data['user'] = $current_user;
        $data['key'] = $key;

        if(!$current_user) {
            $this->template->alert(
                'Invalid token provided.',
                'warning'
            );
            redirect(base_url());
            return;
        }

        $this->form_validation->set_rules('password', 'password', 'trim|required|min_length[6]|md5');
        $this->form_validation->set_rules('conf_password', 'password confirmation', 'trim|required|md5|matches[password]');

        if($this->input->method(TRUE) == 'POST' && ($this->input->post('key') != $key || $this->input->post('iduser') != $current_user->iduser)) {
            $this->template->alert(
                'Form spoofing detected.',
                'warning'
            );
            redirect(base_url());
            return;
        }

        if($this->input->method(TRUE) == 'POST' && $this->form_validation->run()) {
            if($this->user->activate($key, $current_user->iduser, $this->input->post('password'))) {

                $this->template->alert(
                    'Your password has been saved. Please log in using the form below.',
                    'success'
                );
                redirect('account/login');
                return;
            } else {
                $this->template->alert(
                    'Could not reset the password. Please contact administrator.',
                    'warning'
                );
                redirect(base_url());
                return;
            }
        }

        $this->template->view('account/reset_password', $data);
    }
}