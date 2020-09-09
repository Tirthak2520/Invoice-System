<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" MasterPageFile="~/Master/Site.Master" Inherits="InvoiceSystem.List" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div>       
        <div class="text-center" style="text-align: center">
            <div class="container">
                <asp:Button runat="server" ID="Add1" CssClass="btn btn-lg btn-info text-uppercase" OnClick="Add1_Click" CausesValidation="false" Text="Add" Style="margin-right: -1130px" Width="100px" Height="40px"/>
                <asp:GridView ID="GridView_List" CssClass="table table-hover table-dark table-striped"  AutoGenerateColumns="False"  
                              ItemStyle-BorderWidth="3px" OnPageIndexChanging="GridView_List_PageIndexChanging" AllowPaging="True" PageSize="5" BorderWidth="3px"
                            runat="server" style="margin-right:100px;margin-top:50px;margin-bottom:100px" Width="1195px" BackColor="#FFCC99" OnRowDeleting="GridView_List_RowDeleting" >

                    <columns> 
                        <asp:BoundField DataField="Invoice_Number" HeaderText="Invoice Number" SortExpression="Invoice_Number" /> 
                        <asp:Boundfield DataField="Customer_Name" HeaderText="Customer Name" SortExpression="Customer_Name" />
                          <asp:BoundField DataField="Invoice_Date" HeaderText="Invoice Date" DataFormatString = "{0:dd/MM/yyyy}"  SortExpression="Invoice_Date" />
                         <asp:BoundField DataField="Term" HeaderText="Term" SortExpression="Term" />
                         <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" DataFormatString="{0:N}" SortExpression="SubTotal" />
                         <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" DataFormatString="{0:N}" />
                         <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:N}" SortExpression="Total" />
                        <asp:TemplateField  HeaderText="Delete">
                     <ItemTemplate>
                        <asp:LinkButton ID="Button1"  class="btn btn-danger" OnClick="Button1_Click" CommandName="delete"   runat="server" OnClientClick="return confirm('Are you sure you want to delete?')"><span class="glyphicon glyphicon-trash"></span>
                            </asp:LinkButton>
                     </ItemTemplate>
                   </asp:TemplateField>
                        </columns>
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center"/>
                </asp:GridView>
             </div>
            </div>
       </div>
    <script type="text/javascript">
        document.getElementsByClassName("header-text")[0].innerHTML = "Invoice Details";
    </script>
</asp:Content>
