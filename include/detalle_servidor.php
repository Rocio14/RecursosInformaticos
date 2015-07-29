<?php

require_once('DBC.php');
require_once('Common.php');
require_once('../php/lang/LangVars-es.php');
require_once('../php/AjaxTableEditor.php');

class CkEditor extends Common {

    protected $Editor;
    protected $instanceName = 'fichatecnica';

    protected function setHeaderFiles() {
        $this->headerFiles[] = '<script type="text/javascript" src="//cdn.jsdelivr.net/ckeditor/4.0.1/ckeditor.js"></script>';
        $this->headerFiles[] = '<script type="text/javascript" src="../js/calendario.js"></script>';
    }

    protected function displayHtml() {
        $html = '
			
			<br />
			
			<div class="mateAjaxLoaderDiv"><div id="ajaxLoader1"><img src="../images/ajax_loader.gif" alt="Loading..." /></div></div>
			
			<br /><br />
			
			<div id="' . $this->instanceName . 'information">
			</div>
			
			<div id="' . $this->instanceName . 'titleLayer" class="mateTitleDiv">
			</div>
			
			<div id="' . $this->instanceName . 'tableLayer" class="mateTableDiv">
			</div>
			
			<div id="' . $this->instanceName . 'recordLayer" class="mateRecordLayerDiv">
			</div>		
			
			<div id="' . $this->instanceName . 'searchButtonsLayer" class="mateSearchBtnsDiv">
			</div>';

        echo $html;

        // Set default session configuration variables here
        $defaultSessionData['orderByColumn'] = 'first_name';

        $defaultSessionData = base64_encode($this->Editor->jsonEncode($defaultSessionData));

        $javascript = '	
			<script type="text/javascript">
				var mateHashes = {};
				var mateForward = false;
				var ' . $this->instanceName . ' = new mate("' . $this->instanceName . '");
				' . $this->instanceName . '.setAjaxInfo({url: "' . $_SERVER['PHP_SELF'] . '", history: true});
				if(' . $this->instanceName . '.ajaxInfo.history == false) {
					' . $this->instanceName . '.toAjaxTableEditor("update_html","");
				} else if(window.location.hash.length == 0) {
					mateHashes.' . $this->instanceName . ' = {info: "", action: "update_html", sessionData: "' . $defaultSessionData . '"};
					mateForward = true;
				}
				if(mateForward) {
					var sessionCookieName = ' . $this->instanceName . '.getSessionCookieName();
					if($.cookie(sessionCookieName) != undefined) {
						window.location.href = window.location.href+"#"+$.cookie(sessionCookieName);
					} else {
						window.location.href = window.location.href+"#"+Base64.encode($.toJSON(mateHashes));
					}
				}
				
				function addCkEditor(id)
				{
					if(CKEDITOR.instances[id])
					{
					   CKEDITOR.remove(CKEDITOR.instances[id]);
					}
					CKEDITOR.replace(id);
				}
				
			</script>';
        echo $javascript;
    }

//	public function addCkEditor()
//	{
//		$this->Editor->addJavascript('addCkEditor("'.$this->instanceName.'notes");');
//	}

    protected function initiateEditor() {
        $tableColumns['id_detalle_servidor'] = array(
            'display_text' => 'ID',
           
            'perms' => 'XQSO'
        );


        $tableColumns['instancias'] = array(
            'display_text' => '# de instancias',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'valnum')
        );

        $tableColumns['aplicaciones'] = array(
            'display_text' => '# Aplicaciones desplegadas',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'vallet')
        );

        $tableColumns['url'] = array(
            'display_text' => 'URL de Administración (Servidor : puerto)',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );

        $tableColumns['usuario'] = array(
            'display_text' => 'Usuario Administrador',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'vallet')
        );

        $tableColumns['password'] = array(
            'display_text' => 'Contraseña Administrador',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );

        $tableColumns['plataforma'] = array(
            'display_text' => 'Plataforma',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'vallet')
        );


        $tableColumns['sistema_opera'] = array(
            'display_text' => 'Gateway del Host Name',
            'req' => true,
            'perms' => 'EVCTAXQSHO',
            'val_fun' => array (&$this, 'valida')
        );
		$tableColumns['desarrollo'] = array(
			'display_text' => 'Desarrollo Java', 
			'perms' => 'EVCAXQSFHOT', 
                    'val_fun' => array(&$this,'vallet'),
			'select_array' => array(
				'Applets' => 'Applets', 
				'Servlets' => 'Servlets', 
				'JSPs' => 'JSPs', 
				'EARSs' => 'EARSs',
                            'WARs' => 'WARs',
                            'EJBs' => 'EJBs',
                            'PL/SQL' => 'PL/SQL'
			)
		); 

        $tableColumns['ambientes'] = array(
            'display_text' => 'Ambientes de desarrollo y de Producción',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'vallet')
        );




        $tableColumns['hora_respaldo'] = array(
            'display_text' => 'Hora de Respaldos',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );


        $tableColumns['perioricidad'] = array(
            'display_text' => 'Periodicidad de Respaldos',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );



        $tableColumns['opera_dias_habil'] = array(
            'display_text' => 'Días Hábiles de Operación',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );





        $tableColumns['opera_dias_criti'] = array(
            'display_text' => 'Días Críticos de Operación',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );



        $tableColumns['opera_hora_habil'] = array(
            'display_text' => 'Horas Críticas de Operación',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );




        $tableColumns['opera_hora_criti'] = array(
            'display_text' => 'Hora de Respaldos',
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );
	$tableColumns['arquitectura_apli'] = array(
            'display_text' => 'Arquitectura de Componentes',
            'perms' => 'EVCAXQSFHOT',
            'req' => true,
            'val_fun' => array(&$this,'vallet'),
            'select_array' => array(
                'Servlets' => 'Servlets',
                'JSP' => 'JSP',
                'JavaBeans' => 'JavaBeans',
                'Componentes de negocio EnterpriseJavaBeans (EJB)' => 'Componentes de negocio EnterpriseJavaBeans (EJB)',
            )
        );

        $tableColumns['servidor_id_servidor'] = array(
            'display_text' => 'Servidor',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'vallet'),
            'join' => array(
                'table' => 'servidor',
                'column' => 'id_servidor',
                'display_mask' => "servidor.host",
                'type' => 'left'
            )
        );                
//        $tableColumns['arquitectura_apli'] = array(
//            'display_text' => 'Arquitectura de Componentes J2EE'
//            . ' Componentes web. Servlets, JSP, JavaBeans. Componentes de negocio EnterpriseJavaBeans (EJB). '
//            . 'Componentes BI. Recursos J2EE. Pool de conexiones. Servicio de mensajería.'
//            . ' Recursos de Conector (Adaptador de recursos EIS). Servicios de seguridad.'
//            . ' Autenticación básica HTTP.Autenticación basada en Certificados',
//            'perms' => 'EVCTAXQSHO'
//        );




        $tableName = 'detalle_servidor';
        $primaryCol = 'id_detalle_servidor';
        $errorFun = array(&$this, 'logError');
        $permissions = 'EAVDQCSXHOI';

        $this->Editor = new AjaxTableEditor($tableName, $primaryCol, $errorFun, $permissions, $tableColumns);
        $this->Editor->setConfig('tableInfo', 'cellpadding="1" cellspacing="1" align="center" width="80%" class="mateTable"');
        $this->Editor->setConfig('orderByColumn', 'first_name');
        $this->Editor->setConfig('tableTitle', 'Detalle servidor');
        $this->Editor->setConfig('addRowTitle', 'Agregar');
        $this->Editor->setConfig('editRowTitle', 'Editar');
//		$this->Editor->setConfig('addScreenFun',array(&$this,'addCkEditor'));
//		$this->Editor->setConfig('editScreenFun',array(&$this,'addCkEditor'));
        $this->Editor->setConfig('instanceName', $this->instanceName);
        $this->Editor->setConfig('persistentAddForm', false);
        $this->Editor->setConfig('paginationLinks', true);
    }

    function __construct() {
        session_start();
        ob_start();
        $this->initiateEditor();
        if (isset($_POST['json'])) {
            if (ini_get('magic_quotes_gpc')) {
                $_POST['json'] = stripslashes($_POST['json']);
            }
            $this->Editor->data = $this->Editor->jsonDecode($_POST['json'], true);
            $this->Editor->setDefaults();
            $this->Editor->main();
        } else if (isset($_GET['mate_export'])) {
            $this->Editor->data['sessionData'] = $_GET['session_data'];
            $this->Editor->setDefaults();
            ob_end_clean();
            header('Cache-Control: no-cache, must-revalidate');
            header('Pragma: no-cache');
            header('Content-type: application/x-msexcel');
            header('Content-Type: text/csv');
            header('Content-Disposition: attachment; filename="' . $this->Editor->tableName . '.csv"');
            // Add utf-8 signature for windows/excel
            echo chr(0xEF) . chr(0xBB) . chr(0xBF);
            echo $this->Editor->exportInfo();
            exit();
        } else {
            $this->setHeaderFiles();
            $this->displayHeaderHtml();
            $this->displayHtml();
            $this->displayFooterHtml();
        }
    }
    function valida($col,$valida,$row,$instanceName)
{
     if (preg_match('/^\d{3}.\d{3}.\d{3}.\d{3}$/' , $valida)|| preg_match('/^\d{3}.\d{3}.\d{3}.\d{3}$/' , $valida))
     {
          return true;
     }
     else
     {
          // Create custom validation message and return false
          $this->Editor->showDefaultValidationMsg = false;
          $this->Editor->addTooltipMsg('Por Favor ingrese solo letras');
          return false;
     }
}
function valnum($col,$vali,$row,$instanceName)
{
     if (preg_match('/^([0-9])*$/' , $vali)|| preg_match('/^([0-9])*$/' , $vali))
     {
          return true;
     }
     else
     {
          // Create custom validation message and return false
          $this->Editor->showDefaultValidationMsg = false;
          $this->Editor->addTooltipMsg('Por Favor ingrese solo numeros');
          return false;
     }
}
function vallet($col,$valid,$row,$instanceName)
{
     if (preg_match('/^[A-Za-z\_\-\.\s\xF1\xD1]+$/' , $valid)|| preg_match('/^[A-Za-z\_\-\.\s\xF1\xD1]+$/' , $valid))
     {
          return true;
     }
     else
     {
          // Create custom validation message and return false
          $this->Editor->showDefaultValidationMsg = false;
          $this->Editor->addTooltipMsg('Por Favor ingrese solo letras');
          return false;
     }
}
}

$page = new CkEditor();
?>


