﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="furnitureHub.logout" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <!-- App favicon -->
        <link rel="shortcut icon" href="<%=this.baseUrl%>/assets/images/favicon.ico">
        <!-- App title -->
        <title>Furniture Hub </title>

        <!-- App css -->
        <link href="<%=this.baseUrl%>/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/menu.css" rel="stylesheet" type="text/css" />
        <link href="<%=this.baseUrl%>/assets/css/responsive.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="<%=this.baseUrl%>/assets/js/modernizr.min.js"></script>

    </head>


    <body>

        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                  <div class="spinner-wrapper">
                    <div class="rotator">
                      <div class="inner-spin"></div>
                      <div class="inner-spin"></div>
                    </div>
                  </div>
                </div>
            </div>
        </div>

        <!-- HOME -->
        <section>
            <div class="container-alt">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="wrapper-page">

                            <div class="m-t-40 account-pages">
                                <div class="text-center account-logo-box">
                                    <h2 class="text-uppercase">
                                        <a href="index.html" class="text-success">
                                            <span><img src="<%=this.baseUrl%>/assets/images/logo.png" alt="" height="36"></span>
                                        </a>
                                    </h2>
                                    <!--<h4 class="text-uppercase font-bold m-b-0">Sign In</h4>-->
                                </div>
                                <div class="account-content">
                                    <form class="form-horizontal" runat="server">

                                        <asp:Literal ID="message" runat="server"></asp:Literal>
                                        
                                        <div class="form-group ">
                                            <div class="col-xs-12">
                                                <input class="form-control" id="userNameAspx" type="text" required="" placeholder="Username" runat="server">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <input class="form-control" id="passwordAspx" type="password" required="" placeholder="Password" runat="server">
                                            </div>
                                        </div>

                                        <!--<div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="checkbox checkbox-success">
                                                    <input id="checkbox-signup" type="checkbox" checked="">
                                                    <label for="checkbox-signup">
                                                        Remember me
                                                    </label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group text-center m-t-30">
                                            <div class="col-sm-12">
                                                <a href="page-recoverpw.html" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot your password?</a>
                                            </div>
                                        </div>-->

                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <asp:button CssClass="btn w-md btn-bordered btn-danger waves-light" runat="server" text="Log In" onClick="loginClick" />
                                                <%--<button class="btn w-md btn-bordered btn-danger waves-effect waves-light" type="submit" onserverclick="loginClick" runat="server">Log In</button>--%>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="clearfix"></div>

                                </div>
                            </div>
                            <!-- end card-box-->


                            <div class="row m-t-50">
                                <div class="col-sm-12 text-center">
                                    <p class="text-muted">Don't have an account? <a href="<%=this.baseUrl%>/signup.aspx" class="text-primary m-l-5"><b>Sign Up</b></a></p>
                                </div>
                            </div>

                        </div>
                        <!-- end wrapper -->

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->

        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="<%=this.baseUrl%>/assets/js/jquery.min.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/bootstrap.min.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/detect.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/fastclick.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/jquery.blockUI.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/waves.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/jquery.slimscroll.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/jquery.scrollTo.min.js"></script>

        <!-- App js -->
        <script src="<%=this.baseUrl%>/assets/js/jquery.core.js"></script>
        <script src="<%=this.baseUrl%>/assets/js/jquery.app.js"></script>

        <asp:Literal ID="timeScript" runat="server"></asp:Literal>
    </body>
</html>
