<?php

// Un-Comment for debugging
//error_reporting(E_ALL);
//ini_set('display_errors', '1');
class Common {

    protected $langVars;
    protected $headerFiles = array();
    protected $showBackLink = true;

    public function logError($message, $file, $line) {
        $message = sprintf('An error occurred in script %s on line %s: %s', $file, $line, $message);
        throw new Exception($message);
        echo '<span style="color: red;">' . $message . '</span>';
        //var_dump($message);
        exit();
    }

    protected function displayHeaderHtml() {
        ?>

        <html>
            <head>
                <title>Servicios Informáticos</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                <link href="../css/table_styles.css" rel="stylesheet" type="text/css" />
                <link href="../css/icon_styles.css" rel="stylesheet" type="text/css" />
                <link href="../css/style.css" rel="stylesheet" type="text/css" />

                <link href="../js/jquery/css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />
                <script type="text/javascript" src="../js/lang/lang_vars-es.js"></script>
                <script type="text/javascript" src="../js/jquery/js/jquery-1.8.3.js"></script>
                <script type="text/javascript" src="../js/jquery/js/jquery-ui-1.9.2.custom.min.js"></script>
                <script type="text/javascript" src="../js/jquery/js/jquery.json.min.js"></script>
                <script type="text/javascript" src="../js/jquery/js/jquery.cookie.js"></script>
                <script type="text/javascript" src="../js/ajax_table_editor.js"></script>

<link href="../css/menuvertical.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"></link>

                <?php echo implode("\n", $this->headerFiles); ?>




            </head>	
            <body>
                <div class="main">   
  <div class="header">
        <?php require 'header.php';?>
  </div>
  <div class="content">
                      <?php
            }

            protected function displayFooterHtml() {
                ?>
                <?php if ($this->showBackLink): ?>
<!--                    <br /><br /><div align="center"><a href="index.php">Inicio</a></div><br /><br />-->
                <?php endif; ?>
  </div>   
     <div class="footer">
      <p class="lf">Copyright &copy; <a href="http://www.televisioneducativa.gob.mx/">DGTVE</a>. Todos los derechos reservados</p>
      <p class="rf">Coordinación de Informática. Soporte a Sistemas</p>
      <p class="rf">Desarrollado por Ing.Sonia Martínez Castro Ext. 56589</p>
  </div>
</div>
            </body>
        </html>
        <?php
    }

    protected function getAjaxUrl() {
        $ajaxUrl = $_SERVER['PHP_SELF'];
        if (count($_GET) > 0) {
            $queryStrArr = array();
            foreach ($_GET as $var => $val) {
                $queryStrArr[] = $var . '=' . urlencode($val);
            }
            $ajaxUrl .= '?' . implode('&', $queryStrArr);
        }
        return $ajaxUrl;
    }

}
?>
