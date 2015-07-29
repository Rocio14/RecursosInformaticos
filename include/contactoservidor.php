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
                        $tableColumns['id_servidorcontacto'] = array(
            'display_text' => 'Id',
            'req' => true,
            'perms' => 'XQS'
        );
        $tableColumns['servidor_id_servidor'] = array(
            'display_text' => 'ID Servidor',
            'perms' => 'EVCTAXQSHO',
            'req' => true,
            'val_fun' => array(&$this,'valnum')
        );

        $tableColumns['contacto_id_contacto'] = array(
            'display_text' => 'ID Contacto',
            'val_fun' => array(&$this,'valnum'),
            'req' => true,
            'perms' => 'EVCTAXQSHO'
        );

        $tableColumns['servidor_id_servidor'] = array(
            'display_text' => 'Servidor',
            'req' => true,
            'perms' => 'EVCTAXQ',
          
            'join' => array(
                'table' => 'servidor',
                'column' => 'id_servidor',
                'display_mask' => "concat(servidor.id_servidor,' ',servidor.host)",
                'type' => 'left'
            )
        );
        $tableColumns['contacto_id_contacto'] = array(
            'display_text' => 'Contacto',
            'req' => true,
            'perms' => 'EVCTAXQ',
            
            'join' => array(
                'table' => 'contacto',
                'column' => 'id_contacto',
                'display_mask' => "concat(contacto.id_contacto,' ',contacto.nombre_con)",
                'type' => 'left'
            )
        );

        $tableColumns['ser_rol'] = array(
            'display_text' => 'Rol que desempeña en el servidor',
            'req' => true,
            'perms' => 'EVCTAXQSHO',
            'val_fun' => array(&$this,'vallet')
        );

        $tableColumns['ser_nombre_usuario'] = array(
            'display_text' => 'Nombre de usuario',
            'req' => true,
            'perms' => 'EVCTAXQSHO',
            'val_fun' => array(&$this,'vallet')
        );

        $tableColumns['ser_password'] = array(
            'display_text' => 'contraseña de usuario',
            'req' => true,
            'perms' => 'EVCTAXQSHO',
            'mysql_add_fun' => "md5('password')", 
//            'mysql_edit_fun' => "md5('password')",
            'format_input_fun' => array(&$this,'getRadioBtns')
        );

        $tableColumns['ser_fecha_alta'] = array(
            'display_text' => 'Fecha alta',
            'req' => true,
            'perms' => 'EATVXSQ',
            'display_mask' => 'date_format(`ser_fecha_alta`,"%d%M%Y")',
            'order_mask' => 'date_format(`ser_fecha_alta`,"%Y%m%d %T")',
            'range_mask' => 'date_format(`ser_fecha_alta`,"%Y%m%d %T")',
            'calendar' => array(
                'js_format' => 'yymmdd',
                'options' => array('showButtonPanel' => true))
        );


        $tableName = 'servidor_has_contacto';
        $primaryCol = 'id_servidorcontacto';
        $errorFun = array(&$this, 'logError');
        $permissions = 'EAVDQCSXHOI';

        $this->Editor = new AjaxTableEditor($tableName, $primaryCol, $errorFun, $permissions, $tableColumns);
        $this->Editor->setConfig('tableInfo', 'cellpadding="1" cellspacing="1" align="center" width="80%" class="mateTable"');
        $this->Editor->setConfig('orderByColumn', 'first_name');
        $this->Editor->setConfig('tableTitle', 'Contactos de Servidor');
        $this->Editor->setConfig('addRowTitle', 'Agregar Contacto a Servidor');
        $this->Editor->setConfig('editRowTitle', 'Editar Contacto de Servidor');
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
function getRadioBtns($colName,$value,$row) 
{ 
     
     $html = '<label><input name="'.$colName.'" type="password" id="'.$colName.'" </label>'; 
     return $html; 
}
}

$page = new CkEditor();
?>


