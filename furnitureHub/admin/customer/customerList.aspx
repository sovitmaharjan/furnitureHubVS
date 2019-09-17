<%@ Page Title="" Language="C#" MasterPageFile="~/furnitureHubMaster.Master" AutoEventWireup="true" CodeBehind="customerList.aspx.cs" Inherits="furnitureHub.admin.customer.customerList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
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
            <!-- end row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box table-responsive">
                        <form runat="server">
                            <div class="form-group">
                            </div>
                            <table id="datatable" class="table table-striped  table-colored table-info">
                                <thead>
                                    <tr>
                                        <th>S. No. </th>
                                        <th>Name </th>
                                        <th>Address </th>
                                        <th>Number </th>
                                        <th>FH Order# </th>
                                        <th>Order Date </th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--<tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target="#myModal">Standard Modal</a>
                                            <div class='button-list'><a class='btn btn-warning w-md waves-effect waves-light btn-sm' data-toggle='modal' data-target='#myModal'><i class='mdi mdi-cart'></i><span>Item </span></a></div>
                                        </td>
                                    </tr>-->
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
                                                        <th>Delivery </th>
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
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(document).ready(function() {
        
            $('.item').on('click', function () {
                
                var orderId = this.id;
                var tableRow = "";
                //console.log(orderId);
                
                $.ajax({
                    
                    method: 'post',
                    data: '{orderId:' + orderId + '}',
                    url: 'customerList.aspx/getItemById',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {

                        //console.log(data);
                        var data = data.d;
                        var i = 1;
                        $('#itemTableBody').html(" ");

                        //console.log(data);
                        data.forEach(function (e) {

                            tableRow += '<tr>';
                            var item = e.split('./.');
                            tableRow += '<td>' + i + '</td>';
                            tableRow += '<td>' + item[0] + '</td>';
                            tableRow += '<td>' + item[1] + '</td>';
                            tableRow += '<td>Rs. ' + item[2] + '</td>';
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
