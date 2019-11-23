<?php
defined('BASEPATH') OR exit('No direct script access allowed');


if(!function_exists('assets_url')) {

    /**
     * @param string $path
     * @return string
     */
    function assets_url($path = '') {
        $return_url = base_url() . 'assets/';
        if(strlen($path) > 0) {
            $return_url .= $path;
        }
        return $return_url;
    }
}