<%@ Page Title="" Language="C#" MasterPageFile="~/supervisor/furnitureHubSupervisor.Master" AutoEventWireup="true" CodeBehind="orderList.aspx.cs" Inherits="furnitureHub.supervisor.order.orderList" %>
<asp:Content id="Content1" ContentPlaceHolderID="content" runat="server">
    <!-- Start content -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Order Form </h4>
                        <ol class="breadcrumb p-0 m-0">
                            <li>
                                Furniture Hub 
                            </li>
                            <li class="active">
                                Order Form 
                            </li>
                        </ol>
                        <div class="clearfix"> </div>    
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box table-responsive">
                        <form runat="server">
                            <table id="datatable" class="table table-striped table-colored table-info">
                                <thead>
                                    <tr>
                                        <th>FH Order # </th>
                                        <th>Order Date </th>
                                        <th>Customer </th>
                                        <th>Order Items </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Literal ID="tableBody" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div> <!-- container -->
    </div> <!-- content -->
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="footer" runat="server">

</asp:Content>
