<%@ Page Title="" Language="C#" MasterPageFile="~/admin/furnitureHubAdmin.Master" AutoEventWireup="true" CodeBehind="orderForm.aspx.cs" Inherits="furnitureHub.admin.orderFrom.orderForm" %>
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
                            <h3 class="panel-title" style="text-align: center;">Furniture Hub - Order Form </h3>
                        </div>
                        <div class="panel-body">
                            <h4 class="m-t-0 header-title"></h4>
                            <p class="text-muted m-b-10 font-13">
                            </p>
                            <div class="row">
                                <form class="form-horizontal" runat="server">
                                    <div class="table-responsive">
                                        <table id="" class="table table-bordered table-info table-colored">
                                            <thead></thead>
                                            <tbody>
                                                <tr>
                                                    <th style="width: 20%;">Date </th>
                                                    <td style="width: 30%;">
                                                        <input type="text" id="orderDateAspx" autocomplete="off" class="datePickerForAll" required="required" runat="server" />
                                                    </td>
                                                    <th style="width: 20%;">FH Order # </th>
                                                    <td style="width: 30%;">
                                                        <input type="text" id="orderIdAspx" readonly="" required="" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Customer Name </th>
                                                    <td>
                                                        <div hidden="hidden">
                                                            <input type="text" id="customerIdAspx" runat="server" />
                                                        </div>
                                                        <input type="text" id="customerNameAspx" autocomplete="off" required="required" runat="server" />
                                                    </td>
                                                    <th>Contact Number </th>
                                                    <td>
                                                        <input type="text" id="customerNumberAspx" autocomplete="off" required="required" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Address </th>
                                                    <td colspan="3">
                                                        <input type="text" id="customerAddressAspx" autocomplete="off" required="required" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>What Happened? </th>
                                                    <th colspan="3">
                                                        <div class="radio col-md-3">
                                                            <input type="radio" name="whatHappened" id="showroomVisitAspx" value="showroomVisit" required="required" runat="server" />
                                                            <label for="showroomVisit">
                                                                Showroom Visit 
                                                            </label>
                                                        </div>
                                                        <div class="radio col-md-3">
                                                            <input type="radio" name="whatHappened" id="homeVisitAspx" value="homeVisit" runat="server" />
                                                            <label for="homeVisit">
                                                                Home Visit 
                                                            </label>
                                                        </div>
                                                        <div class="radio col-md-3">
                                                            <input type="radio" name="whatHappened" id="onlineOrderAspx" value="onlineOrder" runat="server" />
                                                            <label for="onlineOrder">
                                                                Online Order 
                                                            </label>
                                                        </div>
                                                        <div class="radio col-md-3">
                                                            <input type="radio" name="whatHappened"  id="phoneOrderAspx" value="phoneOrder" runat="server" />
                                                            <label for="phoneOrder">
                                                                Phone Order  
                                                            </label>
                                                        </div>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>FH Member </th>
                                                    <td colspan="3">
                                                        <input type="text" id="fhMemberAspx" autocomplete="off" runat="server" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table id="" class="table table-bordered table-info table-colored">
                                            <thead>
                                                <tr>
                                                    <th colspan="5">Items on Order </th>
                                                </tr>
                                            </thead>
                                            <tbody id="item">
                                                <tr>
                                                    <th style="width: 6%;">S. No. </th>
                                                    <th style="width: 60%;">
                                                        List of Items 
                                                        <div hidden="hidden">
                                                            <input type="text" id="itemIdsAspx" value="123" runat="server" />
                                                            <input type="text" id="itemNamesAspx" value="234" runat="server" />
                                                            <input type="text" id="datesAspx" value="345" runat="server" />
                                                            <input type="text" id="pricesAspx" value="456" runat="server" />
                                                        </div>
                                                    </th>
                                                    <th style="width: 15%;">
                                                        Delivery Date 
                                                    </th>
                                                    <th style="width: 15%;">
                                                        Detail Price 
                                                    </th>
                                                    <th style="width: 4%;">
                                                        <button type="button" id="addItem" class="btn btn-success btn-sm">+ </button>
                                                    </th>
                                                </tr>
                                                <tr id="itemRow1">
                                                    <td>1 </td>
                                                    <td>
                                                        <input type="hidden" id="itemIdAspx1" />
                                                        <input type="text" id="itemNameAspx1" autocomplete="off" required="required" />
                                                    </td>
                                                    <td>
                                                        <input type="text" id="itemDateAspx1" autocomplete="off" class="datePickerForAll" required="required" />
                                                    </td>
                                                    <td>
                                                        <input type="text" class="onlyNumber forAddition" id="itemPriceAspx1" autocomplete="off" placeholder="Rs. " required="required" />
                                                    </td>
                                                    <th>
                                                        <button type="button" name="remove" data-row="itemRow1" class="btn btn-danger btn-sm remove">- </button>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table id="" class="table table-bordered table-info table-colored">
                                            <thead>
                                                <tr>
                                                    <th colspan="6">Pricing and Costs </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th style="width: 20%;">Total Deal Amount </th>
                                                    <td style="width: 15%;">
                                                        <div hidden="hidden">
                                                            <input type="text" id="paymentIdAspx" runat="server" />
                                                        </div>
                                                        <input type="text" class="onlyNumber" id="totalAmountAspx" autocomplete="off" placeholder="Rs. " required="required" runat="server" />
                                                    </td>
                                                    <th style="width: 14%;">Advance </th>
                                                    <td style="width: 15%;">
                                                        <input type="text" class="onlyNumber" id="advanceAspx" autocomplete="off" placeholder="Rs. " required="required" runat="server" />
                                                    </td>
                                                    <th style="width: 16%;">Collected By: </th>
                                                    <td style="width: 20%;">
                                                        <input type="text" id="collectedByAspx" autocomplete="off" required="required" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Payment Method
                                                    </th>
                                                    <th colspan="5">
                                                        <div class="col-sm-1">
                                                            <div class="checkbox">
                                                                <input id="cashAspx" type="checkbox" runat="server">
                                                                <label for="cashAspx">
                                                                    Cash 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <input id="chequeAspx" type="checkbox" runat="server">
                                                                <label for="chequeAspx">
                                                                    Cheque 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <input id="bankDepositeAspx" type="checkbox" runat="server">
                                                                <label for="bankDepositeAspx">
                                                                    Bank Deposit 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <input id="creditCardAspx" type="checkbox" runat="server">
                                                                <label for="creditCardAspx">
                                                                    Credit Card 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-1">
                                                            <div class="checkbox">
                                                                <input id="imeAspx" type="checkbox" runat="server">
                                                                <label for="imeAspx">
                                                                    IME 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <input id="onlineAspx" type="checkbox" runat="server">
                                                                <label for="onlineAspx">
                                                                    Online 
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <div class="checkbox">
                                                                <input id="otherAspx" type="checkbox" runat="server">
                                                                <label for="otherAspx">
                                                                    Other 
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>Other Notes </th>
                                                    <td colspan="5">
                                                        <input type="text" id="otherNotesAspx" autocomplete="off" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Exchange Details </th>
                                                    <td colspan="5">
                                                        <input type="text" id="exchangeDetailsAspx" autocomplete="off" runat="server" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table id="" class="table table-bordered table-info table-colored">
                                            <thead>
                                                <tr>
                                                    <th colspan="6">For office admin use only </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th style="width: 15%;">Production Form </th>
                                                    <td style="width: 15%;">
                                                        <div class="radio col-md-6">
                                                            <input type="radio" name="productionForm" id="productionFormYes" value="yes" runat="server" />
                                                            <label for="productionFormsYes">
                                                                Yes 
                                                            </label>
                                                        </div>
                                                        <div class="radio col-md-6">
                                                            <input type="radio" name="productionForm"  id="productionFormNo" value="no" runat="server" />
                                                            <label for="productionFormsNo">
                                                                No 
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <th style="width: 15%;">Factory Form </th>
                                                    <td style="width: 15%;">
                                                        <div class="radio col-md-6">
                                                            <input type="radio" name="factoryForm" id="factoryFormYes" value="yes" runat="server" />
                                                            <label for="factoryFormYes">
                                                                Yes 
                                                            </label>
                                                        </div>
                                                        <div class="radio col-md-6">
                                                            <input type="radio" name="factoryForm" id="factoryFormNo" value="no" runat="server" />
                                                            <label for="factoryFormNo">
                                                                No 
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <th style="width: 15%;">Handled By: </th>
                                                    <td style="width: 25%;">
                                                        <input type="text" id="handledByAspx" autocomplete="off" runat="server" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br /><br />
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <div class="button-list" id="hover">
                                                <a class="btn btn-success btn-bordered waves-effect w-md waves-light col-md-1" runat="server" onserverclick="saveClick">Save </a>
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
        $(document).ready(function() {

            $('.datePickerForAll').datepicker({
                format: "yyyy-mm-dd",
                autoclose: true,
                todayHighlight: true
            });

            $('#addItem').click(function() {

                var count = $('#item tr').length;
                console.log(count);
                var html_code = "<tr id='itemRow" + count + "'>";
                html_code += "<td>" + count + " </td>";
                html_code += "<td><input type='hidden' id='itemIdAspx" + count + "' /><input type='text' id='itemNameAspx" + count + "' autocomplete='off' /> </td>";
                html_code += "<td><input type='text' id='itemDateAspx" + count + "' class='datePickerForAll' autocomplete='off' /> </td>";
                html_code += "<td><input type='text' class='onlyNumber forAddition' id='itemPriceAspx" + count + "' placeholder='Rs. ' autocomplete='off' /> </td>";
                html_code += "<td><button type='button' name='remove' data-row='itemRow" + count + "' class='btn btn-danger btn-sm remove'>- </button> </td>";
                html_code += "</tr>";
                $('#item').append(html_code);
                $('.datePickerForAll').datepicker({
                    format: "yyyy-mm-dd",
                    autoclose: true,
                    todayHighlight: true
                });
            });
            $(document).on('click', '.remove', function() {

                var delete_row = $(this).data("row");
                $('#' + delete_row).remove();
            });

            $('#hover').hover(function() {

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
            });

            //Restricts input for each element in the set of matched elements to the given inputFilter
            (function($) {
                $.fn.inputFilter = function(inputFilter) {
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
            $(".onlyNumber").inputFilter(function(value) {
                return /^\d*$/.test(value);
            });
        })
    
    </script>
</asp:Content>
