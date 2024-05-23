<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>




<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Gp Bootstrap Template - Index</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/fit.png" rel="icon">
        <link href="assets/img/fit.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

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

    </head>

    <body>
        <div class="wrapper overlay-sidebar">
            <!-- ======= Header ======= -->
            <header id="header" class="fixed-top" style="background-color: #1f283e ; padding: 2px;">
                <div class="container d-flex align-items-center justify-content-lg-between">

                    <h1 class="logo me-auto me-lg-0"><a href="IndexServlet">FitMax<span>.</span></a></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->


                    <c:choose>


                        <c:when test="${miPersonaObtenida != null}">

                            <div class="nav-toggle">
                                <button class="btn btn-toggle sidenav-overlay-toggler">
                                    <i class="icon-menu"></i>
                                </button>
                            </div>
                        </c:when>
                    </c:choose>

                    <nav id="navbar" class="navbar order-last order-lg-0">
                        <ul>
                            <li><a class="nav-link scrollto active" href="#hero">Inicio</a></li>
                            <li><a class="nav-link scrollto" href="#about">Nosotros</a></li>
                            <li><a class="nav-link scrollto" href="#services">Servicios</a></li>
                            <li><a class="nav-link scrollto " href="#portfolio">Portafolio</a></li>
                            <li><a class="nav-link scrollto" href="#team">Equipo</a></li>


                            <li><a class="nav-link scrollto" href="#contact">Contacto</a></li>
                        </ul>
                        <i class="bi bi-list mobile-nav-toggle"></i>
                    </nav><!-- .navbar -->


                    <c:choose>
                        <c:when test="${miPersonaObtenida == null}">
                            <div class="container-fluid">
                                <ul class="navbar-nav topbar-nav ml-md-auto align-items-end">
                                    <li class="nav-item">
                                        <a href="auth/login.jsp" class="get-started-btn scrollto">LogIn</a>
                                        <!--<a class="nav-link" href="auth/login.jsp" style="color: whitesmoke;">Log In</a>-->

                                        <a href="auth/register.jsp" class="get-started-btn scrollto">Registrar</a>
                                        <!--<a class="nav-link" href="auth/register.jsp" style="color: whitesmoke;">Register</a>-->
                                    </li>
                                </ul>
                            </div>
                        </c:when>
                        <c:when test="${miPersonaObtenida != null}">
                            <div class="container-fluid">
                                <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                                    <li class="nav-item dropdown hidden-caret">
                                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false" style="color: whitesmoke;">
                                            ${miPersonaObtenida.rolesId.descripcion}
                                            <i class="fa icon-user"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user animated fadeIn" style="background-color: #ffc451;">
                                            <div class="dropdown-user-scroll scrollbar-outer">
                                                <li>
                                                    <div class="user-box">
                                                        <div class="avatar-lg"><img src="assets/img/usuario2.png" alt="image profile" class="avatar-img rounded"></div>
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
                    </c:choose>
                </div>
            </header><!-- End Header -->




            <c:choose>
                <c:when test="${miPersonaObtenida == null}">


                    <!-- ======= Hero Section ======= -->
                    <section id="hero" class="d-flex align-items-center justify-content-center">
                        <div class="container" data-aos="fade-up">

                            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                                <div class="col-xl-6 col-lg-8">
                                    <h1>FitMax Vamos +Z<span>.</span></h1>
                                    <h2>El éxito en el gym comienza con la mentalidad correcta.</h2>
                                </div>
                            </div>

                            <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-store-line"></i>
                                        <h3><a href="">Nuestra infraestructura</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-bar-chart-box-line"></i>
                                        <h3><a href="">Sistema</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-calendar-todo-line"></i>
                                        <h3><a href="">Calendario</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-paint-brush-line"></i>
                                        <h3><a href="">Personalización</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-database-2-line"></i>
                                        <h3><a href="">Sesiones</a></h3>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section><!-- End Hero -->

                    <main id="main">

                        <!-- ======= About Section ======= -->
                        <section id="about" class="about">
                            <div class="container" data-aos="fade-up">

                                <div class="row">
                                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                                        <img src="assets/img/about.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                                        <h3>Nosotros</h3>
                                        <p class="fst-italic">
                                            En Fitmax, nos dedicamos a impulsar tu bienestar integral. Somos más que un gimnasio; somos una comunidad
                                            comprometida con tu éxito y tu salud en cada paso del camino.
                                        </p>
                                        <ul>
                                            <li><i class="ri-check-double-line"></i>En Fitmax, la variedad y la diversión van de la mano. Ofrecemos
                                                una amplia gama de clases grupales, desde entrenamientos de fuerza hasta yoga regenerativo, para que
                                                siempre encuentres
                                                algo que se adapte a tu estilo y nivel de condición física. </li>
                                            <li><i class="ri-check-double-line"></i> Nuestras instalaciones de vanguardia cuentan con equipos de
                                                última generación para satisfacer todas tus necesidades de entrenamiento.</li>
                                            <li><i class="ri-check-double-line"></i> Fitmax encontrarás una comunidad acogedora y solidaria. Aquí,
                                                cada logro es motivo de celebración y cada desafío es una oportunidad para crecer juntos. </li>
                                        </ul>
                                        <p>
                                            Únete a nosotros en Fitmax y descubre cómo una vida activa puede transformar no solo tu cuerpo, sino
                                            también tu mente y tu espíritu.
                                            ¡Te esperamos para entrenar, crecer y celebrar juntos en Fitmax!
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </section><!-- End About Section -->

                        <!-- ======= Clients Section ======= -->
                        <section id="clients" class="clients">
                            <div class="container" data-aos="zoom-in">

                                <div class="clients-slider swiper">
                                    <div class="swiper-wrapper align-items-center">
                                        <div class="swiper-slide"><img src="assets/img/clients/client-1.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-2.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-3.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-4.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-5.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-6.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-7.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-8.png" class="img-fluid" alt=""></div>
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>

                            </div>
                        </section><!-- End Clients Section -->

                        <!-- ======= Features Section ======= -->
                        <section id="features" class="features">
                            <div class="container" data-aos="fade-up">

                                <div class="row">
                                    <div class="image col-lg-6" style='background-image: url("assets/img/features.jpeg");' data-aos="fade-right">
                                    </div>
                                    <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
                                        <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-receipt"></i>
                                            <h4>Labor</h4>
                                            <p> No se trata solo de levantar pesas o correr kilómetros, se trata de desafiarte a ti mismo, superar tus
                                                límites y alcanzar nuevas alturas.</p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-cube-alt"></i>
                                            <h4>Motivacion</h4>
                                            <p>"El verdadero cambio comienza fuera de tu zona de confort. En Fitmax, te desafiamos a superar tus
                                                límites, a crecer más allá de lo que creías posible y a convertirte en la mejor versión de ti mismo.
                                            </p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-images"></i>
                                            <h4>Mejora tu imagen</h4>
                                            <p> ¡No hay límites para lo que puedes lograr cuando te comprometes con tu propio éxito! ¡Únete a nosotros
                                                y descubre el poder de tu determinación en cada entrenamiento</p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-shield"></i>
                                            <h4>Decidete</h4>
                                            <p>La diferencia entre el 'quiero' y el 'lo estoy haciendo' es la decisión de actuar. En Fitmax, tomamos
                                                esa decisión todos los días. Nos levantamos, nos esforzamos y nos comprometemos con nuestro bienestar.
                                                Cada decisión que tomamos nos acerca un paso más a nuestros objetivos. </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </section><!-- End Features Section -->

                        <!-- ======= Services Section ======= -->
                        <section id="services" class="services">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Servicios</h2>
                                    <p>Tipos de entrenamiento</p>
                                </div>

                                <div class="row">
                                    <c:forEach var="tmpObj" items="${listaDePaquetes}">
                                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in">

                                            <div class="card" style="width: 18rem; padding: 10px;">
                                                <div class="card-body">
                                                    <h5 class="card-title">${tmpObj.nombre}</h5>
                                                    <p class="card-text">${tmpObj.descripcion}.</p>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Duración: ${tmpObj.duracion} días</li>
                                                    <li class="list-group-item">Precio: S/. ${tmpObj.precio}</li>
                                                </ul>
                                                <div class="card-body">
                                                    <a href="auth/login.jsp" class="btn btn-warning btn-lg" role="button" aria-disabled="true">Suscribirse!</a>
                                                </div>
                                            </div>
                                        </div>


                                    </c:forEach>

                                    <!--
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bxl-dribbble"></i></div>
                                                                    <h4><a href="">Entrenamiento funcional</a></h4>
                                                                    <p>El entrenamiento funcional se centra en ejercicios que imitan los movimientos naturales del cuerpo,
                                                                        como empujar, tirar, levantar y girar.
                                                                        Este tipo de entrenamiento mejora la fuerza, la estabilidad,
                                                                        la movilidad y la coordinación, lo que te ayuda a realizar mejor tus actividades diarias y a prevenir
                                                                        lesiones.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in"
                                                                 data-aos-delay="200">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-file"></i></div>
                                                                    <h4><a href="">Entrenamiento de alta intensidad</a></h4>
                                                                    <p>combina ráfagas cortas de ejercicio intenso con períodos de descanso o actividad de baja intensidad.
                                                                        Este tipo de entrenamiento
                                                                        es eficaz para quemar calorías, mejorar la resistencia
                                                                        cardiovascular y aumentar el metabolismo. Además, sigue quemando calorías incluso después de terminar el
                                                                        entrenamiento.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in"
                                                                 data-aos-delay="300">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-tachometer"></i></div>
                                                                    <h4><a href="">Entrenamiento de Fuerza y ​​Musculación</a></h4>
                                                                    <p>El entrenamiento de fuerza se enfoca en levantar pesas para fortalecer los músculos y mejorar la
                                                                        densidad ósea. Puede implicar el uso de pesas libres, máquinas de pesas o el peso corporal.
                                                                        El entrenamiento de fuerza es fundamental para aumentar la masa muscular, mejorar la composición
                                                                        corporal y aumentar la fuerza funcional.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-world"></i></div>
                                                                    <h4><a href="">Yoga y Pilates</a></h4>
                                                                    <p>Estas disciplinas se centran en la conexión mente-cuerpo a través de movimientos controlados,
                                                                        respiración consciente y posturas específicas. El yoga mejora la flexibilidad, la fuerza y el
                                                                        equilibrio,
                                                                        mientras que Pilates se enfoca en fortalecer los músculos centrales, mejorar la postura y desarrollar
                                                                        una base sólida para el movimiento.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-slideshow"></i></div>
                                                                    <h4><a href="">Clases de Baile</a></h4>
                                                                    <p>Las clases de baile ofrecen una forma divertida de hacer ejercicio mientras aprendes nuevos movimientos
                                                                        y ritmos. Desde el baile latino hasta el hip-hop, estas clases son excelentes para mejorar la
                                                                        coordinación,
                                                                        la resistencia cardiovascular y la expresión artística, todo mientras quemas calorías y te diviertes.
                                                                    </p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-arch"></i></div>
                                                                    <h4><a href="">Entrenamiento en Circuito</a></h4>
                                                                    <p> El entrenamiento en circuito consiste en una serie de estaciones de ejercicio que se realizan en
                                                                        rápida sucesión, con períodos cortos de descanso entre cada estación. Este formato ofrece una variedad
                                                                        de
                                                                        ejercicios que trabajan diferentes grupos musculares y sistemas energéticos, proporcionando un
                                                                        entrenamiento completo y eficiente.</p>
                                                                </div>
                                                            </div>-->

                                </div>

                            </div>
                        </section><!-- End Services Section -->

                        <!-- ======= Cta Section ======= -->
                        <section id="cta" class="cta">
                            <div class="container" data-aos="zoom-in">

                                <div class="text-center">
                                    <h3>Comienza ahora</h3>
                                    <p> En Fitmax, cada paso que das te acerca más a tus metas.</p>
                                    <a class="cta-btn" href="#">Volver a Inicio</a>
                                </div>

                            </div>
                        </section><!-- End Cta Section -->

                        <!-- ======= Portfolio Section ======= -->
                        <section id="portfolio" class="portfolio">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Resultados</h2>
                                    <p>Revisa nuestros testimonios</p>
                                </div>

                                <div class="row" data-aos="fade-up" data-aos-delay="100">
                                    <div class="col-lg-12 d-flex justify-content-center">
                                        <ul id="portfolio-flters">
                                            <li data-filter="*" class="filter-active">All</li>
                                            <li data-filter=".filter-app">Fuerza</li>
                                            <li data-filter=".filter-card">Resistencia</li>
                                            <li data-filter=".filter-web">Bienestar</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 1</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-1.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-2.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 3</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-2.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-3.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 2</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-3.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 2</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-5.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 2</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-5.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 3</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-7.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 1</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-7.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 3</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-9.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 3</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-9.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </section><!-- End Portfolio Section -->

                        <!-- ======= Counts Section ======= -->
                        <section id="counts" class="counts">
                            <div class="container" data-aos="fade-up">

                                <div class="row no-gutters">
                                    <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start"
                                         data-aos="fade-right" data-aos-delay="100"></div>
                                    <div class="col-xl-7 ps-4 ps-lg-5 pe-4 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left"
                                         data-aos-delay="100">
                                        <div class="content d-flex flex-column justify-content-center">
                                            <h3> Nuestro equipo está dedicado a ayudarte en cada paso de tu viaje fitness, brindándote el apoyo y la
                                                motivación que necesitas.</h3>
                                            <p>
                                                Elige Fitmax, donde tu bienestar es nuestra prioridad y tu satisfacción, nuestra misión.
                                            </p>
                                            <div class="row">
                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-emoji-smile"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="65" data-purecounter-duration="2"
                                                              class="purecounter"></span>
                                                        <p><strong>Clientes satisfechos</strong></p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-journal-richtext"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="2"
                                                              class="purecounter"></span>
                                                        <p><strong>Progreso de metas</strong> </p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-clock"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="5" data-purecounter-duration="4"
                                                              class="purecounter"></span>
                                                        <p><strong>Años de expericencia</strong> </p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-award"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="10" data-purecounter-duration="4"
                                                              class="purecounter"></span>
                                                        <p><strong>reconocimientos</strong></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- End .content-->
                                    </div>
                                </div>

                            </div>
                        </section><!-- End Counts Section -->

                        <!-- ======= Testimonials Section ======= -->
                        <section id="testimonials" class="testimonials">
                            <div class="container" data-aos="zoom-in">

                                <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                                    <div class="swiper-wrapper">

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                                <h3>Saul Goodman</h3>
                                                <h4>Ceo &amp; Founder</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                                <h3>Sara Wilsson</h3>
                                                <h4>Designer</h4>
                                                <p>
                                                    <!--        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                                <h3>Jena Karlis</h3>
                                                <h4>Store Owner</h4>
                                                <p>
                                                    <!--       <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                                                <h3>Matt Brandon</h3>
                                                <h4>Freelancer</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                                                <h3>John Larson</h3>
                                                <h4>Entrepreneur</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i> -->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>

                            </div>
                        </section><!-- End Testimonials Section -->

                        <!-- ======= Team Section ======= -->
                        <section id="team" class="team">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Team</h2>
                                    <p>Nuestro Equipo</p>
                                </div>

                                <div class="row">

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="100">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Luciano</h4>
                                                <span>Gerente general</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="200">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Jolaus Meza</h4>
                                                <span>Supervisor</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="300">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Freddy</h4>
                                                <span>CTO</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                      <div class="member" data-aos="fade-up" data-aos-delay="400">
                                        <div class="member-img">
                                          <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                                          <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href=""><i class="bi bi-facebook"></i></a>
                                            <a href=""><i class="bi bi-instagram"></i></a>
                                            <a href=""><i class="bi bi-linkedin"></i></a>
                                          </div>
                                        </div>
                                        <div class="member-info">
                                          <h4>Amanda Jepson</h4>
                                          <span>Accountant</span>
                                        </div>
                                      </div>
                                    </div>
                                    -->
                                </div>

                            </div>
                        </section><!-- End Team Section -->

                        <!-- ======= Contact Section ======= -->
                        <section id="contact" class="contact">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Contacto</h2>
                                    <p>Contactanos</p>
                                </div>

                                <div>
                                    <iframe style="border:0; width: 100%; height: 270px;"
                                            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621"
                                            frameborder="0" allowfullscreen></iframe>
                                </div>

                                <div class="row mt-5">

                                    <div class="col-lg-4">
                                        <div class="info">
                                            <div class="address">
                                                <i class="bi bi-geo-alt"></i>
                                                <h4>Ubicacion:</h4>
                                                <p></p>
                                            </div>

                                            <div class="email">
                                                <i class="bi bi-envelope"></i>
                                                <h4>Email:</h4>
                                                <p>clientes@fitmax.com</p>
                                            </div>

                                            <div class="phone">
                                                <i class="bi bi-phone"></i>
                                                <h4>Telefono:</h4>
                                                <p>+1 5589 55488 55s</p>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-lg-8 mt-5 mt-lg-0">

                                        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                            <div class="row">
                                                <div class="col-md-6 form-group">
                                                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre" required>
                                                </div>
                                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3">
                                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Asunto" required>
                                            </div>
                                            <div class="form-group mt-3">
                                                <textarea class="form-control" name="message" rows="5" placeholder="Mensaje" required></textarea>
                                            </div>
                                            <div class="my-3">
                                                <div class="loading">Loading</div>
                                                <div class="error-message"></div>
                                                <div class="sent-message">Gracias por escribirnos</div>
                                            </div>
                                            <div class="text-center"><button type="submit">Enviar mensaje </button></div>
                                        </form>

                                    </div>

                                </div>

                            </div>
                        </section><!-- End Contact Section -->

                    </main><!-- End #main -->

                </c:when>
                <c:when test="${miPersonaObtenida != null}">

                    <c:choose>
                        <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('Administrador')}">
                            <!-- Sidebar -->
                            <div class="sidebar sidebar-style-2" data-background-color="dark2">			
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
                            <div class="sidebar sidebar-style-2" data-background-color="dark2">			
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
                            <div class="sidebar sidebar-style-2" data-background-color="dark2">			
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
                            <div class="sidebar sidebar-style-2" data-background-color="dark2">			
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
                            <div class="sidebar sidebar-style-2" data-background-color="dark2">			
                                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                                    <div class="sidebar-content">




                                    </div>
                                </div>
                            </div>
                            <!-- End Sidebar -->
                        </c:when>
                    </c:choose>































                    <!-- ======= Hero Section ======= -->
                    <section id="hero" class="d-flex align-items-center justify-content-center">
                        <div class="container" data-aos="fade-up">

                            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                                <div class="col-xl-6 col-lg-8">
                                    <h1>FitMax Vamos +Z<span>.</span></h1>
                                    <h2>El éxito en el gym comienza con la mentalidad correcta.</h2>
                                </div>
                            </div>

                            <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-store-line"></i>
                                        <h3><a href="">Nuestra infraestructura</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-bar-chart-box-line"></i>
                                        <h3><a href="">Sistema</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-calendar-todo-line"></i>
                                        <h3><a href="">Calendario</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-paint-brush-line"></i>
                                        <h3><a href="">Personalización</a></h3>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-md-4">
                                    <div class="icon-box">
                                        <i class="ri-database-2-line"></i>
                                        <h3><a href="">Sesiones</a></h3>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section><!-- End Hero -->

                    <main id="main">

                        <!-- ======= About Section ======= -->
                        <section id="about" class="about">
                            <div class="container" data-aos="fade-up">

                                <div class="row">
                                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                                        <img src="assets/img/about.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                                        <h3>Nosotros</h3>
                                        <p class="fst-italic">
                                            En Fitmax, nos dedicamos a impulsar tu bienestar integral. Somos más que un gimnasio; somos una comunidad
                                            comprometida con tu éxito y tu salud en cada paso del camino.
                                        </p>
                                        <ul>
                                            <li><i class="ri-check-double-line"></i>En Fitmax, la variedad y la diversión van de la mano. Ofrecemos
                                                una amplia gama de clases grupales, desde entrenamientos de fuerza hasta yoga regenerativo, para que
                                                siempre encuentres
                                                algo que se adapte a tu estilo y nivel de condición física. </li>
                                            <li><i class="ri-check-double-line"></i> Nuestras instalaciones de vanguardia cuentan con equipos de
                                                última generación para satisfacer todas tus necesidades de entrenamiento.</li>
                                            <li><i class="ri-check-double-line"></i> Fitmax encontrarás una comunidad acogedora y solidaria. Aquí,
                                                cada logro es motivo de celebración y cada desafío es una oportunidad para crecer juntos. </li>
                                        </ul>
                                        <p>
                                            Únete a nosotros en Fitmax y descubre cómo una vida activa puede transformar no solo tu cuerpo, sino
                                            también tu mente y tu espíritu.
                                            ¡Te esperamos para entrenar, crecer y celebrar juntos en Fitmax!
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </section><!-- End About Section -->

                        <!-- ======= Clients Section ======= -->
                        <section id="clients" class="clients">
                            <div class="container" data-aos="zoom-in">

                                <div class="clients-slider swiper">
                                    <div class="swiper-wrapper align-items-center">
                                        <div class="swiper-slide"><img src="assets/img/clients/client-1.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-2.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-3.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-4.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-5.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-6.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-7.png" class="img-fluid" alt=""></div>
                                        <div class="swiper-slide"><img src="assets/img/clients/client-8.png" class="img-fluid" alt=""></div>
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>

                            </div>
                        </section><!-- End Clients Section -->

                        <!-- ======= Features Section ======= -->
                        <section id="features" class="features">
                            <div class="container" data-aos="fade-up">

                                <div class="row">
                                    <div class="image col-lg-6" style='background-image: url("assets/img/features.jpeg");' data-aos="fade-right">
                                    </div>
                                    <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
                                        <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-receipt"></i>
                                            <h4>Labor</h4>
                                            <p> No se trata solo de levantar pesas o correr kilómetros, se trata de desafiarte a ti mismo, superar tus
                                                límites y alcanzar nuevas alturas.</p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-cube-alt"></i>
                                            <h4>Motivacion</h4>
                                            <p>"El verdadero cambio comienza fuera de tu zona de confort. En Fitmax, te desafiamos a superar tus
                                                límites, a crecer más allá de lo que creías posible y a convertirte en la mejor versión de ti mismo.
                                            </p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-images"></i>
                                            <h4>Mejora tu imagen</h4>
                                            <p> ¡No hay límites para lo que puedes lograr cuando te comprometes con tu propio éxito! ¡Únete a nosotros
                                                y descubre el poder de tu determinación en cada entrenamiento</p>
                                        </div>
                                        <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                            <i class="bx bx-shield"></i>
                                            <h4>Decidete</h4>
                                            <p>La diferencia entre el 'quiero' y el 'lo estoy haciendo' es la decisión de actuar. En Fitmax, tomamos
                                                esa decisión todos los días. Nos levantamos, nos esforzamos y nos comprometemos con nuestro bienestar.
                                                Cada decisión que tomamos nos acerca un paso más a nuestros objetivos. </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </section><!-- End Features Section -->

                        <!-- ======= Services Section ======= -->
                        <section id="services" class="services">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Servicios</h2>
                                    <p>Tipos de entrenamiento</p>
                                </div>

                                <div class="row">
                                    <c:forEach var="tmpObj" items="${listaDePaquetes}">
                                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in">

                                            <div class="card" style="width: 18rem; padding: 10px;">
                                                <div class="card-body">
                                                    <h5 class="card-title">${tmpObj.nombre}</h5>
                                                    <p class="card-text">${tmpObj.descripcion}.</p>
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Duración: ${tmpObj.duracion} días</li>
                                                    <li class="list-group-item">Precio: S/. ${tmpObj.precio}</li>
                                                </ul>
                                                <div class="card-body">
                                                    <a href="auth/login.jsp" class="btn btn-warning btn-lg" role="button" aria-disabled="true">Suscribirse!</a>
                                                </div>
                                            </div>
                                        </div>


                                    </c:forEach>

                                    <!--
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bxl-dribbble"></i></div>
                                                                    <h4><a href="">Entrenamiento funcional</a></h4>
                                                                    <p>El entrenamiento funcional se centra en ejercicios que imitan los movimientos naturales del cuerpo,
                                                                        como empujar, tirar, levantar y girar.
                                                                        Este tipo de entrenamiento mejora la fuerza, la estabilidad,
                                                                        la movilidad y la coordinación, lo que te ayuda a realizar mejor tus actividades diarias y a prevenir
                                                                        lesiones.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in"
                                                                 data-aos-delay="200">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-file"></i></div>
                                                                    <h4><a href="">Entrenamiento de alta intensidad</a></h4>
                                                                    <p>combina ráfagas cortas de ejercicio intenso con períodos de descanso o actividad de baja intensidad.
                                                                        Este tipo de entrenamiento
                                                                        es eficaz para quemar calorías, mejorar la resistencia
                                                                        cardiovascular y aumentar el metabolismo. Además, sigue quemando calorías incluso después de terminar el
                                                                        entrenamiento.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in"
                                                                 data-aos-delay="300">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-tachometer"></i></div>
                                                                    <h4><a href="">Entrenamiento de Fuerza y ​​Musculación</a></h4>
                                                                    <p>El entrenamiento de fuerza se enfoca en levantar pesas para fortalecer los músculos y mejorar la
                                                                        densidad ósea. Puede implicar el uso de pesas libres, máquinas de pesas o el peso corporal.
                                                                        El entrenamiento de fuerza es fundamental para aumentar la masa muscular, mejorar la composición
                                                                        corporal y aumentar la fuerza funcional.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-world"></i></div>
                                                                    <h4><a href="">Yoga y Pilates</a></h4>
                                                                    <p>Estas disciplinas se centran en la conexión mente-cuerpo a través de movimientos controlados,
                                                                        respiración consciente y posturas específicas. El yoga mejora la flexibilidad, la fuerza y el
                                                                        equilibrio,
                                                                        mientras que Pilates se enfoca en fortalecer los músculos centrales, mejorar la postura y desarrollar
                                                                        una base sólida para el movimiento.</p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-slideshow"></i></div>
                                                                    <h4><a href="">Clases de Baile</a></h4>
                                                                    <p>Las clases de baile ofrecen una forma divertida de hacer ejercicio mientras aprendes nuevos movimientos
                                                                        y ritmos. Desde el baile latino hasta el hip-hop, estas clases son excelentes para mejorar la
                                                                        coordinación,
                                                                        la resistencia cardiovascular y la expresión artística, todo mientras quemas calorías y te diviertes.
                                                                    </p>
                                                                </div>
                                                            </div>
                                    
                                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
                                                                <div class="icon-box">
                                                                    <div class="icon"><i class="bx bx-arch"></i></div>
                                                                    <h4><a href="">Entrenamiento en Circuito</a></h4>
                                                                    <p> El entrenamiento en circuito consiste en una serie de estaciones de ejercicio que se realizan en
                                                                        rápida sucesión, con períodos cortos de descanso entre cada estación. Este formato ofrece una variedad
                                                                        de
                                                                        ejercicios que trabajan diferentes grupos musculares y sistemas energéticos, proporcionando un
                                                                        entrenamiento completo y eficiente.</p>
                                                                </div>
                                                            </div>-->

                                </div>

                            </div>
                        </section><!-- End Services Section -->

                        <!-- ======= Cta Section ======= -->
                        <section id="cta" class="cta">
                            <div class="container" data-aos="zoom-in">

                                <div class="text-center">
                                    <h3>Comienza ahora</h3>
                                    <p> En Fitmax, cada paso que das te acerca más a tus metas.</p>
                                    <a class="cta-btn" href="#">Volver a Inicio</a>
                                </div>

                            </div>
                        </section><!-- End Cta Section -->

                        <!-- ======= Portfolio Section ======= -->
                        <section id="portfolio" class="portfolio">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Resultados</h2>
                                    <p>Revisa nuestros testimonios</p>
                                </div>

                                <div class="row" data-aos="fade-up" data-aos-delay="100">
                                    <div class="col-lg-12 d-flex justify-content-center">
                                        <ul id="portfolio-flters">
                                            <li data-filter="*" class="filter-active">All</li>
                                            <li data-filter=".filter-app">Fuerza</li>
                                            <li data-filter=".filter-card">Resistencia</li>
                                            <li data-filter=".filter-web">Bienestar</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 1</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-1.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-2.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 3</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-2.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-3.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 2</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-3.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 2</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-5.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 2</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-5.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>App 3</h4>
                                                <p>App</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-7.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 1</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-7.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Card 3</h4>
                                                <p>Card</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <div class="portfolio-wrap">
                                            <img src="assets/img/portfolio/portfolio-9.jpeg" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4>Web 3</h4>
                                                <p>Web</p>
                                                <div class="portfolio-links">
                                                    <a href="assets/img/portfolio/portfolio-9.jpeg" data-gallery="portfolioGallery"
                                                       class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                                                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </section><!-- End Portfolio Section -->

                        <!-- ======= Counts Section ======= -->
                        <section id="counts" class="counts">
                            <div class="container" data-aos="fade-up">

                                <div class="row no-gutters">
                                    <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start"
                                         data-aos="fade-right" data-aos-delay="100"></div>
                                    <div class="col-xl-7 ps-4 ps-lg-5 pe-4 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left"
                                         data-aos-delay="100">
                                        <div class="content d-flex flex-column justify-content-center">
                                            <h3> Nuestro equipo está dedicado a ayudarte en cada paso de tu viaje fitness, brindándote el apoyo y la
                                                motivación que necesitas.</h3>
                                            <p>
                                                Elige Fitmax, donde tu bienestar es nuestra prioridad y tu satisfacción, nuestra misión.
                                            </p>
                                            <div class="row">
                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-emoji-smile"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="65" data-purecounter-duration="2"
                                                              class="purecounter"></span>
                                                        <p><strong>Clientes satisfechos</strong></p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-journal-richtext"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="2"
                                                              class="purecounter"></span>
                                                        <p><strong>Progreso de metas</strong> </p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-clock"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="5" data-purecounter-duration="4"
                                                              class="purecounter"></span>
                                                        <p><strong>Años de expericencia</strong> </p>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 d-md-flex align-items-md-stretch">
                                                    <div class="count-box">
                                                        <i class="bi bi-award"></i>
                                                        <span data-purecounter-start="0" data-purecounter-end="10" data-purecounter-duration="4"
                                                              class="purecounter"></span>
                                                        <p><strong>reconocimientos</strong></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- End .content-->
                                    </div>
                                </div>

                            </div>
                        </section><!-- End Counts Section -->

                        <!-- ======= Testimonials Section ======= -->
                        <section id="testimonials" class="testimonials">
                            <div class="container" data-aos="zoom-in">

                                <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                                    <div class="swiper-wrapper">

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                                <h3>Saul Goodman</h3>
                                                <h4>Ceo &amp; Founder</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                                <h3>Sara Wilsson</h3>
                                                <h4>Designer</h4>
                                                <p>
                                                    <!--        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                                <h3>Jena Karlis</h3>
                                                <h4>Store Owner</h4>
                                                <p>
                                                    <!--       <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                                                <h3>Matt Brandon</h3>
                                                <h4>Freelancer</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>-->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->

                                        <div class="swiper-slide">
                                            <div class="testimonial-item">
                                                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                                                <h3>John Larson</h3>
                                                <h4>Entrepreneur</h4>
                                                <p>
                                                    <!--      <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                                    
                                                    <i class="bx bxs-quote-alt-right quote-icon-right"></i> -->
                                                </p>
                                            </div>
                                        </div><!-- End testimonial item -->
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>

                            </div>
                        </section><!-- End Testimonials Section -->

                        <!-- ======= Team Section ======= -->
                        <section id="team" class="team">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Team</h2>
                                    <p>Nuestro Equipo</p>
                                </div>

                                <div class="row">

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="100">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Luciano</h4>
                                                <span>Gerente general</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="200">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Jolaus Meza</h4>
                                                <span>Supervisor</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                        <div class="member" data-aos="fade-up" data-aos-delay="300">
                                            <div class="member-img">
                                                <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                                                <div class="social">
                                                    <a href=""><i class="bi bi-twitter"></i></a>
                                                    <a href=""><i class="bi bi-facebook"></i></a>
                                                    <a href=""><i class="bi bi-instagram"></i></a>
                                                    <a href=""><i class="bi bi-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="member-info">
                                                <h4>Freddy</h4>
                                                <span>CTO</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                      <div class="member" data-aos="fade-up" data-aos-delay="400">
                                        <div class="member-img">
                                          <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                                          <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href=""><i class="bi bi-facebook"></i></a>
                                            <a href=""><i class="bi bi-instagram"></i></a>
                                            <a href=""><i class="bi bi-linkedin"></i></a>
                                          </div>
                                        </div>
                                        <div class="member-info">
                                          <h4>Amanda Jepson</h4>
                                          <span>Accountant</span>
                                        </div>
                                      </div>
                                    </div>
                                    -->
                                </div>

                            </div>
                        </section><!-- End Team Section -->

                        <!-- ======= Contact Section ======= -->
                        <section id="contact" class="contact">
                            <div class="container" data-aos="fade-up">

                                <div class="section-title">
                                    <h2>Contacto</h2>
                                    <p>Contactanos</p>
                                </div>

                                <div>
                                    <iframe style="border:0; width: 100%; height: 270px;"
                                            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621"
                                            frameborder="0" allowfullscreen></iframe>
                                </div>

                                <div class="row mt-5">

                                    <div class="col-lg-4">
                                        <div class="info">
                                            <div class="address">
                                                <i class="bi bi-geo-alt"></i>
                                                <h4>Ubicacion:</h4>
                                                <p></p>
                                            </div>

                                            <div class="email">
                                                <i class="bi bi-envelope"></i>
                                                <h4>Email:</h4>
                                                <p>clientes@fitmax.com</p>
                                            </div>

                                            <div class="phone">
                                                <i class="bi bi-phone"></i>
                                                <h4>Telefono:</h4>
                                                <p>+1 5589 55488 55s</p>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="col-lg-8 mt-5 mt-lg-0">

                                        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                            <div class="row">
                                                <div class="col-md-6 form-group">
                                                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre" required>
                                                </div>
                                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3">
                                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Asunto" required>
                                            </div>
                                            <div class="form-group mt-3">
                                                <textarea class="form-control" name="message" rows="5" placeholder="Mensaje" required></textarea>
                                            </div>
                                            <div class="my-3">
                                                <div class="loading">Loading</div>
                                                <div class="error-message"></div>
                                                <div class="sent-message">Gracias por escribirnos</div>
                                            </div>
                                            <div class="text-center"><button type="submit">Enviar mensaje </button></div>
                                        </form>

                                    </div>

                                </div>

                            </div>
                        </section><!-- End Contact Section -->

                    </main><!-- End #main -->

                </c:when>
            </c:choose>



            <!-- ======= Footer ======= -->
            <footer id="footer">
                <div class="footer-top">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-3 col-md-6">
                                <div class="footer-info">
                                    <h3>FITMAX<span>.</span></h3>
                                    <p>
                                        A108 Adam Street <br>
                                        NY 535022, USA<br><br>
                                        <strong>Phone:</strong> +1 5589 55488 55<br>
                                        <strong>Email:</strong> info@fitmax.com<br>
                                    </p>
                                    <div class="social-links mt-3">
                                        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-6 footer-links">
                                <h4>Useful Links</h4>
                                <ul>
                                    <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                                </ul>
                            </div>

                            <!--    <div class="col-lg-3 col-md-6 footer-links">
                              <h4>Our Services</h4>
                              <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                              </ul>
                            </div>
                            -->
                            <div class="col-lg-4 col-md-6 footer-newsletter">
                                <h4>Suscribete</h4>
                                <p>Suscribete para tener mas informacion sobre nosotros</p>
                                <form action="" method="post">
                                    <input type="email" name="email"><input type="submit" value="Subscribe">
                                </form>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="copyright">
                        &copy; Copyright <strong><span>Gp</span></strong>. All Rights Reserved
                    </div>
                    <div class="credits">
                        <!-- All the links in the footer should remain intact. -->
                        <!-- You can delete the links only if you purchased the pro version. -->
                        <!-- Licensing information: https://bootstrapmade.com/license/ -->
                        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/ -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>
                </div>
            </footer><!-- End Footer -->

            <div id="preloader"></div>
            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                    class="bi bi-arrow-up-short"></i></a>

            <!-- Vendor JS Files -->
            <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
            <script src="assets/vendor/aos/aos.js"></script>
            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
            <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="assets/vendor/php-email-form/validate.js"></script>

            <!-- Template Main JS File -->
            <script src="assets/js/main.js"></script>





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
        </div>
    </body>

</html>

