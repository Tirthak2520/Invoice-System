<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" MasterPageFile="~/Master/Site.Master" Inherits="InvoiceSystem.Invoice" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>       
        <div class="text-center" style="text-align: center">
            <div class="container">
                <br />
                <div class="row">
                    <div "form-horizontal"></div>                   
                     <div class="form-group">                   
                    <table>  
                        <tr>          
                            <td>                                    
                                <asp:Label ID="Invoice_No"  runat="server" Style="font-size: 20px;margin-right:20px">Invoice Number :-</asp:Label>                                
                            </td>
                            <td>
                                 <div class="col-sm-10"> 
                                <asp:TextBox class="form-control" ID="Invoicetxt_No"  runat="server" PlaceHolder="Please Enter Your Invoice Number" Width="320px"></asp:TextBox>
                                </div>
                                     <br /><br /></td> 
                             <td>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Invoicetxt_No"
                                        ErrorMessage="Invoice Number Is Required."  ForeColor="red" ></asp:RequiredFieldValidator>
                                </td>
                        </tr> 
                        <tr>                
                            <td>                                
                                <asp:Label  ID="Datelbl" runat="server" Style="font-size: 20px;margin-left:75px">Date :-</asp:Label>  
                            </td>
                          
                            <td>
                                 <div class="col-sm-10">
                                <asp:TextBox class="form-control" ID="Date_txt"  runat="server"  Width="320px" TextMode="Date"></asp:TextBox>
                           </div>
                                     <br /><br /></td>                                 
                        </tr> 
                         <tr>                
                            <td>                                
                                <asp:Label  ID="Customer_lbl" runat="server" Style="font-size: 20px;margin-left:30px">Customer :-</asp:Label>  
                            </td>               
                            <td>
                                 <div class="col-sm-2 dropdown">                               
                                <asp:DropDownList id="DropDownList1" CssClass="selectpicker" Style="border-radius:5px;height:40px" runat="server">                                    
                                </asp:DropDownList>
                           </div>
                           </td>
                                   <td>    
                                  <div class="col-sm-10"></div>
                                           <asp:Label  ID="Term_lbl" runat="server" Style="font-size: 20px;margin-left:70px">Term :-</asp:Label>   
                                   </td>
                             
                                 <td>
                                  <div class="col-sm-10">
                                    <asp:TextBox class="form-control" ID="Term_txt" runat="server" Width="320px" PlaceHolder="Please Enter Your Term" ></asp:TextBox>
                            </div>
                                        </td>
                             <td>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Term_txt"
                                        ErrorMessage="Term Is Required." ForeColor="red"  >
                                    </asp:RequiredFieldValidator>
                                </td>
                                </tr> 
                        </table>
                      </div>
                   </div>
                </div>
            </div>
        </div>
    <br /><br />
    <div>
        <div class="text-center form-inline" style="text-align: center; margin-left:50px;margin-right:50px">
            <div class="alert-success form-group" style="width:320px; border-radius:5px;text-align:center">
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                </div>
            <asp:GridView CssClass="table table-hover table-dark table-striped" ItemStyle-BorderWidth="3px" runat="server" 
                          BorderWidth="3px" BackColor="#66FFFF"  ID="GridView1" AutoGenerateColumns="false" Visible="true"
                AllowSorting="true"  OnRowDataBound="GridView1_RowDataBound">   
                  <Columns>
                      <asp:TemplateField  HeaderText="Item Description" Visible="true" HeaderStyle-BorderStyle="Solid">
                            <ItemTemplate >
                                <asp:TextBox class="form-control"  ID="txtItem_Description" runat="server"  />
                            </ItemTemplate>
                               
                       </asp:TemplateField>
                      <asp:TemplateField  HeaderText="Quantity">
                            <ItemTemplate>
                                     <asp:TextBox class="form-control" ID="txt_Quantity"  runat="server" onchange="calculate_price(txt_Quantity, txt_Price, txtDiscount, txtTotal)"  />
                            </ItemTemplate>
                       </asp:TemplateField>
                      <asp:TemplateField  HeaderText="Price">
                            <ItemTemplate>
                                    <asp:TextBox class="form-control" ID="txt_Price"  runat="server" />
                            </ItemTemplate>                               
                       </asp:TemplateField>
                       <asp:TemplateField  HeaderText="Discount">
                            <ItemTemplate>
                                 <asp:TextBox class="form-control" ID="txtDiscount"  runat="server" />
                            </ItemTemplate>                        
                       </asp:TemplateField>
                       <asp:TemplateField  HeaderText="Total">
                            <ItemTemplate>
                                 <asp:Label ID="txtTotal" runat="server" CssClass="Invoice_total" EnableViewState="true"/>
                            </ItemTemplate>                                                 
                       </asp:TemplateField>
                  </Columns>                
            </asp:GridView>
           <div class="row">
                    <div  style="text-align:right">
                         <div class="form-group form-inline">                             
                             <asp:Label runat="server" ID="Subtotal" Style="font-size: 20px;margin-right:10px" >Sub Total :- </asp:Label>
                             <asp:TextBox class="form-control subtotal" style="margin-right:20px;text-align:center;font-size:20px" Width="210px" runat="server" ID="txtSub_total" ReadOnly="True"></asp:TextBox>                             
                        <br />
                        <br />
                             <asp:Label runat="server" ID="Gstlbl" Style="font-size: 20px;margin-right:10px">GST(5%) :- </asp:Label>
                             <asp:TextBox class="form-control gst" style="margin-right:20px;text-align:center;font-size:20px" Width="210px" runat="server"   ID="txtGST" ReadOnly="True"></asp:TextBox> 
                        <br />
                        <br />
                              <asp:Label runat="server" ID="total" Style="font-size: 20px;margin-right:10px">Total :- </asp:Label>
                             <asp:TextBox class="form-control total " style="margin-right:22px;text-align:center;font-size:20px" Width="210px" runat="server"  ID="txttotal" ReadOnly="True"></asp:TextBox>
                        </div>      
                        </div>
                         </div>                                    
<br />
             
            <asp:Button class=" btn btn-lg btn-primary text-uppercase" style="text-align:center" runat="server" ID="Submit" Text="Submit" OnClick="Submit_Click"/>
             <asp:Button class=" btn btn-lg btn-danger text-uppercase" style="text-align:center" runat="server" ID="cancel_btn" Text="Cancel" OnClick="cancel_btn_Click" CausesValidation="false"/>
        </div>
    </div>
    <br />
    <br />

    <script type="text/javascript">
        document.getElementsByClassName("header-text")[0].innerHTML = "New Invoice";
    </script>
    </asp:Content>
