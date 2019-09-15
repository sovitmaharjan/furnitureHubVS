<%@ Page Title="" Language="C#" MasterPageFile="~/furnitureHubMaster.Master" AutoEventWireup="true" CodeBehind="orderFormList.aspx.cs" Inherits="furnitureHub.admin.orderFrom.orderFormList" %>
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
                            <div class="form-group">
                                <a href="orderForm.aspx" class="btn btn-success waves-effect w-md waves-light" runat="server">
                                    <i class="mdi mdi-plus"></i> Add New Order
                                </a>
                            </div>
                            <table id="datatable" class="table table-striped table-colored table-info">
                                <thead>
                                    <tr>
                                        <th>FH Order # </th>
                                        <th>Order Date </th>
                                        <th>Customer </th>
                                        <th>Number </th>
                                        <th>Amount </th>
                                        <th>Order Items </th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Literal ID="tableBody" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                            <!-- sample modal content -->
                            <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">FH Order#: 1 </h4>
                                        </div>
                                        <div class="modal-body">
                                            <table id="" class="table table-striped table-colored table-info">
                                                <thead>
                                                    <tr>
                                                        <th>S. No. </th>
                                                        <th>Item </th>
                                                        <th>Price </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="itemTableBody">
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </form>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div> <!-- container -->
    </div> <!-- content -->
</asp:Content>
<asp:Content id="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(document).ready(function() {

            $('.item').on('click', function () {

                var orderId = this.id;
                var tableRow = "";
                console.log(orderId);
                $.ajax({

                    method: 'post',
                    data: '{orderId:' + orderId + '}',
                    url: 'orderFormList.aspx/getItemById',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function(data) {

                        //console.log(data);
                        var data = data.d;
                        var i = 1;
                        $('#itemTableBody').html(" ");

                        //console.log(data);
                        data.forEach(function(e) {

                            tableRow += '<tr>';
                            var item = e.split('./.');
                            tableRow += '<td>' + i + '</td>';
                            tableRow += '<td>' + item[1] + '</td>';
                            tableRow += '<td>Rs. ' + item[3] + '</td>';
                            tableRow += '</tr>';
                            i++;
                        })
                        //console.log(tableRow);
                        $('#itemTableBody').append(tableRow);
                    },
                    error: function (error) {
                        alert('error');
                    }
                })
            })
        })
    </script>
</asp:Content>
