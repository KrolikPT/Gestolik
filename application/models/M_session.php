<?php
    
    defined('BASEPATH') OR exit('URL inválida.');
    
    class M_session extends CI_Model{
    
        public function verificar_sessao()
        {
            if(!$this->session->has_userdata('id'))
            {
                redirect('login');
            }
        } 
    }  

?>
