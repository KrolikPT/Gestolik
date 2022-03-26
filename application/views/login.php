<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>

        <div class="container">

            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="login_title">Gestolik</h1>
                </div>
            </div>

            <div class="row" id="login_div">
                <div class="col-md-12">

                    <form action="<?php echo site_url("login/form"); ?>" method="post" id="frm_login">

                        <!-- Nome -->
                        <div class="form-group">
                            <label for="nome">Nome de Utilizador</label>
                            <input type="text" class="form-control" name="nome" id="nome">                  
                        </div>

                        <!-- Senha -->
                        <div class="form-group mt-4">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" name="senha" id="senha">              
                        </div>

                        <!-- Botões -->
                        <div class="form-group mt-4 text-center">  

                            <div class="row">
                                <div class="col-md-6">
                                    <input type="submit" class="botao_blue ml-1" style="outline: none;" value="Registar" name="registar"> 
                                </div>

                                <div class="col-md-6">
                                    <input type="submit" class="botao_green ml-1" style="outline: none;" value="Entrar" name="entrar"> 
                                </div>
                            </div>
                    
                        </div>

                        <?php if(isset($tipo) && !$tipo): ?>

                        <div class="alerta_erro mb-5" role="alert">
                            <?php echo $mensagem; ?>
                        </div>

                        <?php elseif(isset($tipo) && $tipo): ?>

                        <div class="alerta_sucesso mb-5" role="alert">
                            <?php echo $mensagem; ?>
                        </div>

                        <?php endif; ?>

                    </form>

                </div>
            </div>

        </div>

    </body>

</html>