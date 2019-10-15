<%@ Page Title="" Language="C#" MasterPageFile="~/admin/furnitureHubAdmin.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="furnitureHub.admin.employee.employee" %>
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
                                        <div hidden="hidden">
                                            <input type="text" id="employeeIdAspx" name="employeeIdAspx" runat="server" />
                                            <input type="text" id="statusAspx" name="statusAspx" value="0" runat="server" />
                                        </div>
                                        <label class="col-md-2 control-label">
                                            Employee Name
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-3">
                                            <input type="text" id="firstNameAspx" class="form-control" value="" name="firstNameAspx" placeholder="First Name" required="required" runat="server">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" id="middleNameAspx" class="form-control" value="" name="middleName" placeholder="Middle Name" runat="server">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="lastNameAspx" class="form-control" value="" name="LastName" placeholder="Last Name" required="required" runat="server">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            Address 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="addressAspx" class="form-control" value="" name="address" required="required" runat="server">
                                        </div>
                                        
                                        <label class="col-md-2 control-label">
                                            Contact No. 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <input type="text" id="numberAspx" class="form-control" value="" name="number" required="required" runat="server">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">
                                            Designation 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <select id="designationAspx" class="form-control" name="designationAspx" required="required" runat="server">
                                                <option value="">Select Designation</option>
                                                <option value="1">1 </option>
                                                <option value="2">2 </option>
                                                <option value="3">3 </option>
                                            </select>
                                        </div>
                                        <label class="col-md-2 control-label">
                                            Join Date 
                                            <span class="text-danger">* </span>
                                        </label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input type="text" id="joinDateAspx" name="joinDateAspx" class="form-control datePickerForAll" placeholder="yyyy-mm-dd" autocomplete="off" required="required" runat="server">
                                                <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar text-white"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <br /><br />
                                    <div class="form-group row">
                                        <div class="col-sm-9 col-sm-offset-2">
                                            <div class="button-list">
                                                <%--<asp:Button ID="saveButton" text="Save" CssClass="btn btn-success btn-bordered w-md btn-bordered col-md-1" OnClick="saveClick" runat="server" />--%>
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
