<%@ Page Title="" Language="C#" MasterPageFile="~/supervisor/furnitureHubSupervisor.Master" AutoEventWireup="true" CodeBehind="orderItemDesign.aspx.cs" Inherits="furnitureHub.supervisor.order.orderItemDesign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
    <!-- Start content -->
    <div class="content">
        <style>
            input{
                border: 0px;
                width: 100%;
            }
        </style>
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
                    <div class="panel panel-color panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="text-align: center;">Item Design </h3>
                        </div>
                        <div class="panel-body">
                            <h4 class="m-t-0 header-title"></h4>
                            <p class="text-muted m-b-10 font-13">
                            </p>
                            <div class="row">
                                <form class="form-horizontal" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12 col-xs-12">
                                            <div class="p-20">
                                                <label style="font-size: 20px" >
                                                    <asp:literal id="itemNameAspx" runat="server"></asp:literal>
                                                </label>
                                                <div class="form-group clearfix">
                                                    <div class="col-sm-12 padding-left-0 padding-right-0">
                                                        <input type="file" name="files[]" id="filer_input1"
                                                               multiple="multiple">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end row -->
                                    <div class="table-responsive">
                                        <table id="" class="table table-bordered table-info table-colored">
                                            <thead>
                                                <%--<tr>
                                                    <th colspan="5">items on order </th>
                                                </tr>--%>
                                            </thead>
                                            <tbody id="item">
                                                <tr>
                                                    <th style="width: 5%;">S. No. </th>
                                                    <th style="width: 45%;">
                                                        <%--<div hidden="hidden">
                                                            <input type="text" id="" value="123" runat="server" />
                                                            <input type="text" id="" value="234" runat="server" />
                                                        </div>--%>
                                                        Column 
                                                    </th>
                                                    <th style="width: 45%;">
                                                        Value 
                                                    </th>
                                                    <th style="width: 5%;">
                                                        <button type="button" id="addItem" class="btn btn-success btn-sm">+ </button>
                                                    </th>
                                                </tr>
                                                <tr id="itemRow1">
                                                    <td>1 </td>
                                                    <td>
                                                        <input type="text" id="columnAspx1" autocomplete="off" required="required" />
                                                    </td>
                                                    <td>
                                                        <input type="text" id="valueAspx1" autocomplete="off" required="required" />
                                                    </td>
                                                    <th>
                                                        <button type="button" name="remove" data-row="itemRow1" class="btn btn-danger btn-sm remove">- </button>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br /><br />
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <div class="button-list" id="hover">
                                                <a class="btn btn-success btn-bordered waves-effect w-md waves-light col-md-1" runat="server" >Save </a>
                                                <a class="btn btn-danger btn-bordered waves-effect w-md waves-light col-md-1" href="orderFormList.aspx" runat="server">Cancel </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
        $(document).ready(function () {

            $('.datePickerForAll').datepicker({
                format: "yyyy-mm-dd",
                autoclose: true,
                todayHighlight: true
            });

            $('#addItem').click(function () {

                var count = $('#item tr').length;
                console.log(count);
                var html_code = "<tr id='itemRow" + count + "'>";
                html_code += "<td>" + count + " </td>";
                html_code += "<td><input type='text' id='columnAspx" + count + "' autocomplete='off' /> </td>";
                html_code += "<td><input type='text' id='valueAspx" + count + "' autocomplete='off' /> </td>";
                html_code += "<td><button type='button' name='remove' data-row='itemRow" + count + "' class='btn btn-danger btn-sm remove'>- </button> </td>";
                html_code += "</tr>";
                $('#item').append(html_code);
            });
            $(document).on('click', '.remove', function () {

                var delete_row = $(this).data("row");
                $('#' + delete_row).remove();
            });

            <%--$('#hover').hover(function () {

                $('#<%=itemIdsAspx.ClientID%>').val('');
                $('#<%=itemNamesAspx.ClientID%>').val('');
                $('#<%=datesAspx.ClientID%>').val('');
                $('#<%=pricesAspx.ClientID%>').val('');

                var count = $('#item tr').length;
                var itemId = "";
                var itemName = "";
                var itemDate = "";
                var itemPrice = "";
                //console.log(count);

                for (var i = 1; i < count; i++) {

                    if (itemName) {

                        itemId += "|";
                        itemName += "|";
                        itemDate += "|";
                        itemPrice += "|";
                    }
                    itemId += $("#itemIdAspx" + i).val();
                    itemName += $("#itemNameAspx" + i).val();
                    itemDate += $("#itemDateAspx" + i).val();
                    itemPrice += $("#itemPriceAspx" + i).val();
                }

                $('#<%=itemIdsAspx.ClientID%>').val(itemId);
                $('#<%=itemNamesAspx.ClientID%>').val(itemName);
                $('#<%=datesAspx.ClientID%>').val(itemDate);
                $('#<%=pricesAspx.ClientID%>').val(itemPrice);
            });--%>

            //Restricts input for each element in the set of matched elements to the given inputFilter
            (function ($) {
                $.fn.inputFilter = function (inputFilter) {
                    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
                        if (inputFilter(this.value)) {
                            this.oldValue = this.value;
                            this.oldSelectionStart = this.selectionStart;
                            this.oldSelectionEnd = this.selectionEnd;
                        } else if (this.hasOwnProperty("oldValue")) {
                            this.value = this.oldValue;
                            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                        }
                    });
                };
            }(jQuery));
            //Install input filters
            $(".onlyNumber").inputFilter(function (value) {
                return /^\d*$/.test(value);
            });

        })

    </script>
</asp:Content>
