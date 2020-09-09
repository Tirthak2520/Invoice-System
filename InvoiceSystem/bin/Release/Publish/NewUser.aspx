<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Site.Master" CodeBehind="NewUser.aspx.cs" Inherits="InvoiceSystem.NewUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="container">
            <br />
            <div class="row form-horizontal">
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">First Name :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" PlaceHolder="Please Enter Your First Name" Width="320px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="This Field Is Required." ValidationExpression="[A-Za-z]{1,32}" ForeColor="red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
               
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">Last Name :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" PlaceHolder="Please Enter Your Last Name" Width="320px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="This Field Is Required."   ValidationExpression="[A-Za-z]{1,32}" ForeColor="red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">User Name :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" PlaceHolder="Please Enter Your Last Name" Width="320px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="This Field Is Required." ForeColor="red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">Password :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" PlaceHolder="Please Enter Password" Width="320px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                            ErrorMessage="This Field Is Required." ForeColor="red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">Email :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" PlaceHolder="Please Enter Email" Width="320px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5"
                            ErrorMessage="This Field Is Required." ForeColor="red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Email In Valid Format"
                            ControlToValidate="TextBox5" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                            ValidationExpression="[A-Za-z0-9._%+-]+@+[A-Za-z0-9.-]+\.[a-zA-Z]{2,}">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
              
                <div class="form-group">
                    <asp:Label class="control-label col-sm-2" runat="server" Style="font-size: 20px">Active :-</asp:Label>
                    <div class="col-sm-10">
                        <asp:CheckBox  ID="CheckBox1" runat="server" />
                    </div>
                </div>
                    
              
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button Style="font-size:18px" class=" btn  btn-primary text-uppercase" ID="AddButton" Text="Submit"  runat="server" OnClick="AddButton_Click" Width="100px" Height="40px" />
                        <asp:Button Style="font-size:18px" class=" btn  btn-danger text-uppercase" ID="Cancel_Button" Text="Cancel"  runat="server" Width="100px" Height="40px" CausesValidation="false" OnClick="Cancel_Button_Click" />
                    </div>
                </div>
                
                      
                    
                </div>
              
                <div class="alert-success form-group" style="width: 320px; border-radius: 5px; text-align: center">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>

            </div>
        </div>
 
     <script type="text/javascript">
         document.getElementsByClassName("header-text")[0].innerHTML = "Add User";
         function hideNavigation() {
             document.getElementsByClassName("navbar-fixed-top")[0].style.display = "none";
         }
    </script>
</asp:Content>
