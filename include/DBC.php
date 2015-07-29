<?php

class DBC {


    private static $instance = null;
    private static $host = 'localhost';
    private static $db = 'recursos_informaticos';
    private static $user = 'root';
    private static $pass = '';

    public static function get() {
        if (self::$instance == null) {
            try {
                self::$instance = new PDO(
                        'mysql:host=' . self::$host . ';dbname=' . self::$db, self::$user, self::$pass, array(
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        )
                );
            } catch (PDOException $e) {
                echo "Error!: " . $e->getMessage() . "<br/>";
                die();
            }
        }
        return self::$instance;
    }

    public function getPrepareSets($arr) {
        $prepareSets = array();
        foreach ($arr as $column => $value) {
            $prepareSets[] = "`$column` = :" . $column;
        }
        return $prepareSets;
    }

}

?>
