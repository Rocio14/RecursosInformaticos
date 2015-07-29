
Calendar._DN = new Array
        ("Domingo",
                "Lunes",
                "Martes",
                "Miercoles",
                "Jueves",
                "Viernes",
                "Sabado",
                "Domingo");

Calendar._SDN = new Array
        ("Dom",
                "Lun",
                "Mar",
                "Mi�",
                "Jue",
                "Vie",
                "Sab",
                "Dom");


Calendar._FD = 1;

Calendar._MN = new Array
        ("Enero",
                "Febrero",
                "Marzo",
                "Abril",
                "Mayo",
                "Junio",
                "Julio",
                "Agosto",
                "Septiembre",
                "Octubre",
                "Noviembre",
                "Diciembre");

// short month names
Calendar._SMN = new Array
        ("Ene",
                "Feb",
                "Mar",
                "Abr",
                "May",
                "Jun",
                "Jul",
                "Ago",
                "Sep",
                "Oct",
                "Nov",
                "Dic");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "Acerca del calendario";



Calendar._TT["PREV_YEAR"] = "A�o anterior (mantener para men�)";
Calendar._TT["PREV_MONTH"] = "Mes anterior (mantener para men�)";
Calendar._TT["GO_TODAY"] = "Ir a hoy";
Calendar._TT["NEXT_MONTH"] = "Mes siguiente (mantener para men�)";
Calendar._TT["NEXT_YEAR"] = "A�o siguiente (mantener para men�)";
Calendar._TT["SEL_DATE"] = "Seleccionar fecha";
Calendar._TT["DRAG_TO_MOVE"] = "Arrastrar para mover";
Calendar._TT["PART_TODAY"] = " (hoy)";

// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
Calendar._TT["DAY_FIRST"] = "Hacer %s primer d�a de la semana";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "Cerrar";
Calendar._TT["TODAY"] = "Hoy";
Calendar._TT["TIME_PART"] = "(May�scula-)Clic o arrastre para cambiar valor";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%d/%m/%Y";
Calendar._TT["TT_DATE_FORMAT"] = "%A, %e de %B de %Y";

Calendar._TT["WK"] = "sem";
Calendar._TT["TIME"] = "Hora:";
