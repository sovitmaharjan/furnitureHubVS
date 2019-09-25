<%@ Page Title="" Language="C#" MasterPageFile="~/supervisor/furnitureHubSupervisor.Master" AutoEventWireup="true" CodeBehind="orderItemList.aspx.cs" Inherits="furnitureHub.supervisor.order.orderItemList" %>
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
                                        <th>S. No. </th>
                                        <th>Item </th>
                                        <th>Delievery Date </th>
                                        <th> </th>
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
