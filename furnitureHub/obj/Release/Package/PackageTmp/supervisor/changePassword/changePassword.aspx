<%@ Page Title="" Language="C#" MasterPageFile="~/supervisor/furnitureHubSupervisor.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="furnitureHub.supervisor.changePassword.changePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
    <!-- Start content -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Employee </h4>
                        <ol class="breadcrumb p-0 m-0">
                            <li>
                                Furniture Hub 
                            </li>
                            <li class="active">
                                Order Form 
                            </li>
                        </ol>
                        <div class="clearfix"></div>    
                    </div>
                </div>
            </div>
            <!-- end row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-color panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="text-danger">* </span>Denotes Mandatory Fields </h3>
                        </div>
                        <div class="panel-body">
                            <h4 class="m-t-0 header-title"></h4>
                            <p class="text-muted m-b-30 font-13">
                            </p>
                            <form class="form-horizontal" runat="server">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            Old Password
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" id="oldPasswordAspx" class="form-control" value="" name="oldPasswordAspx" required="required" runat="server">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            New Password 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" id="newPasswordAspx" class="form-control" value="" name="newPasswordAspx" required="required" runat="server">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            Confirm Password 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-10">
                                            <input type="text" id="confirmPasswordAspx" class="form-control" value="" name="confirmPasswordAspx" required="required" runat="server">
                                        </div>
                                    </div>
                                    <br /><br />
                                    <div class="form-group row">
                                        <div class="col-sm-9 col-sm-offset-2">
                                            <div class="button-list">
                                                <asp:Button ID="saveButton" text="Save" CssClass="btn btn-success btn-bordered w-md btn-bordered col-md-1" runat="server" />
                                                <a class="btn btn-danger btn-bordered waves-effect w-md waves-light col-md-1" href="employeeList.aspx" runat="server">Cancel </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div> <!-- container -->
    </div> <!-- content -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>
        $('.datePickerForAll').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayHighlight: true
        });
    </script>
</asp:Content>
