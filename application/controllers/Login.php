<?php

    defined('BASEPATH') OR exit('URL inválida.');
    
    class Login extends CI_Controller{
    
        public function index($alerta = null)
        {
            $this->session->unset_userdata('id');
            $this->session->unset_userdata('nome');

            if($alerta != null){
                $this->load->view("template/_header");
                $this->load->view("login", $alerta); 
                return;
            }                   

            $this->load->view("template/_header");
            $this->load->view("login"); 
        }

        public function form()
        {
            $dados_login = [
				"nome"			=> htmlspecialchars($this->input->post('nome')),
				"senha"			=> htmlspecialchars($this->input->post('senha')),
                "registar"      => $this->input->post('registar'),
                "entrar"        => $this->input->post('entrar')
			];

            if($dados_login["registar"] != "" && $dados_login["entrar"] == "") { $this->registar($dados_login); }
            else if($dados_login["entrar"] != "" && $dados_login["registar"] == "") { $this->entrar($dados_login); }

        }

        public function registar($dados)
        {
            $data = [
                "nome"      => $dados["nome"],
                "senha"     => hash('sha512', $dados["senha"])
            ];

            // Verifica se já o nome já existe
            $this->db->from('utilizadores');
			$this->db->where('nome', $dados['nome']);
            $num_linhas = $this->db->get();

			if($num_linhas->num_rows() > 0)
			{
                $alerta['tipo'] = false;
                $alerta['mensagem'] = 'O utilizador '.$dados["nome"].' já existe.';
                    
                $this->index($alerta);
                return;
			}

            $query_registar = $this->db->query("INSERT INTO utilizadores(nome, senha) VALUES(?,?);", $data);

            $this->db->from('utilizadores');
			$this->db->where('nome', $dados['nome']);
            $this->db->where('senha', hash('sha512', $dados['senha']));
			$resultado_saldo = $this->db->get()->result_array();

            $dados_saldo = [
                "id_utilizador"     => $resultado_saldo[0]["id_utilizador"]
            ];

            $query_registar_saldo = $this->db->query("INSERT INTO saldo(id_utilizador) VALUES(?);", $dados_saldo);
            $query_registar_gestor = $this->db->query("INSERT INTO gestor(id_utilizador) VALUES(?);", $dados_saldo);

            $alerta['tipo'] = true;
            $alerta['mensagem'] = "O utilizador foi registado com sucesso.";
                
            $this->index($alerta);
            return;
        }

        public function entrar($dados)
        {
            $data = [
                "nome"      => $dados["nome"],
                "senha"     => $dados["senha"]
            ];

			$this->db->from('utilizadores');
			$this->db->where('nome', $dados['nome']);
            $this->db->where('senha', hash('sha512', $dados['senha']));
			$resultado = $this->db->get()->result_array();

            $this->db->from('utilizadores');
			$this->db->where('nome', $dados['nome']);
            $this->db->where('senha', hash('sha512', $dados['senha']));
            $num_linhas = $this->db->get();

			if($num_linhas->num_rows() > 0)
			{
                $this->session->set_userdata("id", $resultado[0]["id_utilizador"]);  
                $this->session->set_userdata("nome", $resultado[0]["nome"]);  
				$this->load->view("template/header");
                $this->load->view("balancos");
                $this->load->view("template/footer");
			}
            else
            {
                $alerta = [
                    "tipo"          => false,
                    "mensagem"      => ""
                ];

                $alerta['tipo'] = false;
                $alerta['mensagem'] = "Os dados de login estão incorrectos.";
                
                $this->index($alerta);
            }
        }
    
    }
    
?>