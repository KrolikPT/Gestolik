<?php

    defined('BASEPATH') OR exit('URL inválida.');
    
    class Registar extends CI_Controller{
    
        public function index()
        {
            $this->session->unset_userdata('id');

            $dados_registo = [
				"nome"			=> htmlspecialchars($this->input->post('nome')),
				"senha"			=> htmlspecialchars($this->input->post('senha'))
			];

            print_r($dados_registo);
            exit();

			$registar_utilizador = $this->db->query('INSERT INTO utilizadores(nome, senha) VALUES(?,?)', $dados_registo);          
        }
    }
    
?>