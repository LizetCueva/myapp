<%-- 
    Document   : index
    Created on : 03/01/2019, 04:34:53 PM
    Author     : Lizet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="es">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/themify-icons.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/metisMenu.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/slicknav.min.css">
        <!-- amchart css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <!-- others css -->
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/typography.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/default-css.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/styles.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/responsive.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/css_app/view/estilos.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/css_app/view/sweetalert.css">
        <!-- modernizr css -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- preloader area start -->
        <div id="preloader">
            <div class="loader"></div>
        </div>
        <!-- preloader area end -->
        <!-- page container area start -->
        <div class="page-container">
            <!-- sidebar menu area start -->
            <div class="sidebar-menu">
                <div class="sidebar-header">
                    <div class="logo">
                        <a href="index.html"><img src="<%out.print(getServletContext().getContextPath());%>/assets/images/icon/logo.png" alt="logo"></a>
                    </div>
                    <br>
                    <h6 class="text-center" style="color: aliceblue"><i class="fa fa-user"></i> <strong>JCode</strong></h6>
                </div>
                <jsp:include page="../../menu.jsp" />
            </div>
            <!-- sidebar menu area end -->
            <!-- main content area start -->
            <div class="main-content">
                <!-- header area start -->
                <div class="header-area">
                    <div class="row align-items-center">
                        <!-- nav and search button -->
                        <div class="col-4 clearfix">
                            <div class="nav-btn pull-left" style="margin-top: 0px">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <!-- profile info & task notification -->
                        <div class="col-8 clearfix">
                            <ul class="notification-area pull-right">
                                <li>
                                    <a href="">
                                        Cerrar Sessión
                                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- header area end -->
                <div class="main-content-inner">
                    <div class="row" style="padding-top: 30px">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h6 id="nameCrudCategoria">CATEGORIAS</h6>
                                    <input type="hidden" id="nameFormCategoria" value="FrmCategoria">
                                    <input type="hidden" id="actionCategoria" name="action" value="paginarCategoria">
                                    <input type="hidden" id="numberPageCategoria" name="numberPageCategoria" value="1">
                                    <form id="FrmCategoria">
                                        <div class="row mt-3">
                                            <div class="form-group col-sm-9 col-12">
                                                <input type="text" id="txtNombreCategoria" name="txtNombreCategoria" class="form-control form-control-sm" placeholder="NOMBRE">
                                            </div>
                                            <div class="col-sm-3 col-12">
                                                <button type="submit" id="btnBuscarCategoria" class="btn btn-primary btn-xs mr-3"><i class="fa fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNCategoria" class="btn btn-primary btn-xs"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered">
                                                    <thead class="bg-primary">
                                                        <tr class="text-white">
                                                            <th>NOMBRE</th>
                                                            <th style="width: 15%" colspan="2">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyCategoria">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 col-12">
                                            <select id="sizePageCategoria" name="sizePageCategoria" class="form-control form-control-sm combo-paginar" idBtnBuscar="btnBuscarCategoria">
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-12">
                                            <nav>
                                                <ul id="paginationCategoria" class="pagination pagination-sm justify-content-end">

                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ventanaModalManCategoria" class="modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form id="FrmCategoriaModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="tituloModalManCategoria"></h6>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtNombreCategoriaER">NOMBRE</label>
                                        <input type="text" id="txtNombreCategoriaER" name="txtNombreCategoriaER" class="form-control form-control-sm" placeholder="NOMBRE">
                                        <div class="error-validation" id="validarNombreCategoriaER">Ingrese Categoria</div>
                                    </div>
                                </div>
                                <input type="hidden" id="txtIdCategoriaER" name="txtIdCategoriaER" value="">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-xs" data-dismiss="modal">CERRAR</button>
                                <button type="submit" class="btn btn-primary btn-xs">GUARDAR</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal" id="modalCargandoCategoria" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="progress" style="margin-bottom: 0px;">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                    Cargando...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main content area end -->
            <!-- footer area start-->
            <jsp:include page="../../footer.jsp" />
            <!-- footer area end-->
        </div>
        <!-- page container area end -->
        <!-- jquery latest version -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/jquery-2.2.4.min.js"></script>
        <!-- bootstrap 4 js -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/popper.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/owl.carousel.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/metisMenu.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slimscroll.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slicknav.min.js"></script>

        <!-- start chart js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
        <!-- start highcharts js -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <!-- start zingchart js -->
        <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
        <script>
            zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
            ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
        </script>
        <!-- all line chart activation -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/line-chart.js"></script>
        <!-- all pie chart -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/pie-chart.js"></script>
        <!-- others plugins -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/plugins.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/view/jquery.Pagination.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/view/sweetalert.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/app/categoria.js"></script>
    </body>

</html>
