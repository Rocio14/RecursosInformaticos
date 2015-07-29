
      <div id="logosep"><a href="#"><img src="../images/sep.png"/></a></div>
           <div id="logo"><a href="#"><img src="../images/logotv.png"/></a></div>
           
      <div id="titulo"><h1>Recursos Informáticos</h1></div>    

<nav>
    <ul class="menu">
        <li><a href="/RecursosInformaticos"><i class="icon-home"></i>Inicio</a>
          
        </li>
        <li><a  href="#"><i class="icon-user"></i>Servidores</a>
            <ul class="sub-menu">
            <li><a  href="servidor.php"><i class="icon-user"></i>Servidores</a>
                <li><a href="softwareservidor.php">Software servidor</a></li>
                <li><a href="contactoservidor.php">Contacto Servidores</a></li>
                <li><a href="servicio_red.php">Servicio de Red</a></li>
            </ul>
        </li>
        <li><a  href="#"><i class="icon-camera"></i>Bases de Datos</a>
            <ul class="sub-menu">
            <li><a  href="bases_datos.php"><i class="icon-camera"></i>Bases de Datos</a>   
                <li><a href="contactobd.php">Contacto Bases de Datos</a></li>
            </ul>
            
        </li>
        <li><a  href="#"><i class="icon-bullhorn"></i>Software</a>
                        <ul class="sub-menu">   
                            <li><a href="software.php">Software</a></li>
            </ul>
        </li>
        <li><a  href="#"><i class="icon-bullhorn"></i>Sistemas</a>
            <ul class="sub-menu">   
                <li><a  href="sistemas_inf.php"><i class="icon-bullhorn"></i>Sistemas</a>
                <li><a href="contactosistemas.php">Contacto Sistemas</a></li>
            </ul>
        </li>
        <li><a  href="contacto.php"><i class="icon-envelope-alt"></i>Contacto</a></li>
    </ul>
</nav>
<a id="touch-menu" class="mobile-menu" href="#"><i class="icon-reorder"></i>Menu</a>
     
<script>
    $(document).ready(function () {
        var touch = $('#touch-menu');
        var menu = $('.menu');

        $(touch).on('click', function (e) {
            e.preventDefault();
            menu.slideToggle();
        });

        $(window).resize(function () {
            var w = $(window).width();
            if (w > 767 && menu.is(':hidden')) {
                menu.removeAttr('style');
            }
        });

    });
</script>