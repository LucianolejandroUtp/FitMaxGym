<%-- 
    Document   : template
    Created on : May 4, 2024, 11:57:45 AM
    Author     : Lucy
--%>
<%@tag language="java" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%--<%@tag description="put the tag description here" pageEncoding="UTF-8"%>--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>
<%@attribute name="title"%>
<%@attribute name="head_area" fragment="true" %>
<%@attribute name="body_area" fragment="true" %>
<%@attribute name="script_area" fragment="true" %>

<%@attribute name="justIndex" fragment="true" %>

<%-- any content can be specified here e.g.: --%>
<html>
    <head>
        <title>${title}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Atlantis Lite - Bootstrap 4 Admin Dashboard</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/icon.ico" type="image/x-icon"/>

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Lato:300,400,700,900"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/atlantis.min.css">

        <jsp:invoke fragment="head_area"/>
    </head>
    <body>
        <c:choose>
            <c:when test="${miPersonaObtenida == null}">

                <div class="wrapper overlay-sidebar">
                </c:when>
                <c:when test="${miPersonaObtenida != null}">

                    <div class="wrapper">
                    </c:when>
                </c:choose>
                <div class="main-header">

                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="orange">

                        <a href="IndexServlet" class="logo">
                            <img src="assets/img/Fitmax.png" width="70%" height="70%" alt="navbar brand" class="navbar-brand">
                        </a>
                        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon">
                                <i class="icon-menu"></i>
                            </span>
                        </button>
                        <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="icon-menu"></i>
                            </button>
                        </div>
                    </div>
                    <!-- End Logo Header -->

                    <!-- Navbar Header -->
                    <nav class="navbar navbar-header navbar-expand-lg" data-background-color="orange2">






<!--                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#hero">Home </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="IndexServlet#about#">Features</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Pricing</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Disabled</a>
                                </li>
                            </ul>
                        </div>-->
                        <c:choose>
                            <c:when test="${miPersonaObtenida == null}">
                                <div class="container-fluid">
                                    <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                                        <li class="nav-item">
                                            <a class="nav-link" href="auth/login.jsp">Log In</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="auth/register.jsp">Register</a>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${miPersonaObtenida != null}">
                                <div class="container-fluid">
                                    <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                                        <li class="nav-item dropdown hidden-caret">
                                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
                                                ${miPersonaObtenida.rolesId.descripcion}
                                                <i class="fa icon-user"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-user animated fadeIn">
                                                <div class="dropdown-user-scroll scrollbar-outer">
                                                    <li>
                                                        <div class="user-box">
                                                            <div class="avatar-lg"><img src="assets/img/usuario.png" alt="image profile" class="avatar-img rounded"></div>
                                                            <div class="u-text">
                                                                <h4>
                                                                    ${miPersonaObtenida.nombres}
                                                                </h4>

                                                                <p class="text-muted">
                                                                    ${miPersonaObtenida.email}
                                                                </p>
                                                                <!--<a href="profile.html" class="btn btn-xs btn-secondary btn-sm">View Profile</a>-->
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="/fitmax/UserLogoutServlet">Cerrar Sesión</a>
                                                    </li>
                                                </div>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>

                    </nav>
                    <!-- End Navbar -->



                </div>

                <c:choose>
                    <c:when test="${miPersonaObtenida == null}">
                        <!--Redirigiendo al login cuando no encuentra persona-->
                        <% //response.sendRedirect("auth/login.jsp");%>

                        <% //response.sendRedirect("index.jsp");%>

                        <!--                                <ul class="nav nav-primary">
                                                            <li class="nav-item">
                                                                <a href="auth/login.jsp">
                                                                    <i class="fas fa-user"></i>
                                                                    <p>LogIn</p>
                                                                </a>
                                                            </li>
                                                        </ul>-->
                    </c:when>
                    <c:when test="${miPersonaObtenida != null}">

                        <c:choose>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Administrador')}">
                                <!-- Sidebar -->
                                <div class="sidebar sidebar-style-2">			
                                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                        <div class="sidebar-content">
                                            <ul class="nav nav-primary">
                                                <li class="nav-item">
                                                    <a href="RolListServlet">
                                                        <i class="fas fa-users-cog"></i>
                                                        <p>Roles</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="UserListServlet">
                                                        <i class="fas fa-user"></i>
                                                        <p>Usuarios</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="DistritoListServlet">
                                                        <i class="fas fa-map-marked-alt"></i>
                                                        <p>Distritos</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="MembresiaListServlet">
                                                        <i class="fas fa-handshake"></i>
                                                        <p>Membresías</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="PaqueteListServlet">
                                                        <i class="fas fa-list"></i>
                                                        <p>Paquetes</p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Sidebar -->
                            </c:when>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Empleado')}">
                                <!--</div>-->
                                <!-- Sidebar -->
                                <div class="sidebar sidebar-style-2">			
                                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                        <div class="sidebar-content">


                                            <ul class="nav nav-primary">
                                                <li class="nav-item">
                                                    <a href="UserListServlet">
                                                        <i class="fas fa-user"></i>
                                                        <p>Usuarios</p>
                                                    </a>
                                                </li>
                                                <!--  <li class="nav-item">
                                                    <a href="../DireccionListServlet">
                                                      <i class="fas fa-map-marked-alt"></i>
                                                      <p>Dirección</p>
                                                    </a>
                                                  </li>
                                                  <li class="nav-item">
                                                    <a href="../TelefonoListServlet">
                                                      <i class="fas fa-phone"></i>
                                                      <p>Teléfono</p>
                                                    </a>
                                                  </li>-->
                                                <li class="nav-item">
                                                    <a href="MembresiaListServlet">
                                                        <i class="fas fa-handshake"></i>
                                                        <p>Membresías</p>
                                                    </a>
                                                </li>

                                            </ul>


                                        </div>
                                    </div>
                                </div>
                                <!-- End Sidebar -->
                            </c:when>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Cliente')}">
                                <!--</div>-->
                                <!-- Sidebar -->
                                <div class="sidebar sidebar-style-2">			
                                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                        <div class="sidebar-content">


                                            <ul class="nav nav-primary">
                                                <li class="nav-item">
                                                    <a href="index.jsp">
                                                        <i class="fas fa-receipt"></i>
                                                        <p>Menú</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="PersonaListServlet">
                                                        <i class="fas fa-receipt"></i>
                                                        <p>Perfil</p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="MembresiaListServlet">
                                                        <i class="fas fa-handshake"></i>
                                                        <p>Membresías</p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Sidebar -->
                            </c:when>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Técnico')}">
                                <!--</div>-->
                                <!-- Sidebar -->
                                <div class="sidebar sidebar-style-2">			
                                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                        <div class="sidebar-content">


                                            <ul class="nav nav-primary">
                                                <li class="nav-item">
                                                    <a href="CitaListServlet">
                                                        <i class="fas fa-handshake"></i>
                                                        <p>Citas</p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Sidebar -->
                            </c:when>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Chofer')}">
                                <!--</div>-->
                                <!-- Sidebar -->
                                <div class="sidebar sidebar-style-2">			
                                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                        <div class="sidebar-content">




                                        </div>
                                    </div>
                                </div>
                                <!-- End Sidebar -->
                            </c:when>
                        </c:choose>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

                <jsp:invoke fragment="justIndex"/>
                <!--Content DashBoard-->

                <div class="main-panel">
                    <div class="content">
                        <div class="page-inner">

                            <div class="page-category">










                                <jsp:invoke fragment="body_area"/>










                            </div>
                        </div>
                    </div>
                    <footer class="footer">
                        <div class="container-fluid">

                            <div class="copyright ml-auto">
                                2024, made with <i class="fa fa-heart heart text-danger"></i> by <a href="#">Grupo Integrador</a>
                            </div>				
                        </div>
                    </footer>
                </div>
            </div>


            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery.3.2.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>
            <!-- jQuery UI -->
            <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
            <script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
            <!--Chart JS--> 
            <script src="assets/js/plugin/chart.js/chart.min.js"></script>
            <!--jQuery Sparkline--> 
            <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
            <!--Chart Circle--> 
            <script src="assets/js/plugin/chart-circle/circles.min.js"></script>
            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>
            <!--Bootstrap Notify--> 
            <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
            <!--jQuery Vector Maps--> 
            <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
            <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>
            <!--Sweet Alert--> 
            <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>
            <!-- Atlantis JS -->
            <script src="assets/js/atlantis.min.js"></script>



            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


            <jsp:invoke fragment="script_area"/>

    </body>
</html>