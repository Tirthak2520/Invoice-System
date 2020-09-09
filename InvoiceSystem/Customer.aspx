<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" MasterPageFile="~/Master/Site.Master" Inherits="InvoiceSystem.Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Panel ID="Form_Panel" runat="server">
            <div class="text-center" style="text-align: center">
                <div class="container">
                    <br />
                    <div class="row">
                        <%-- <div "form-horizontal"></div>--%>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                            DisplayMode="BulletList" ShowSummary="true" HeaderText="Errors:" Style="text-align: left; color: red" />
                        <div class="form-group">
                            <div class="alert-success form-group" style="width: 320px; border-radius: 5px; text-align: center">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                            <div class="alert-success form-group" style="width: 320px; border-radius: 5px; text-align: center">
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lable1" runat="server" Style="font-size: 20px; margin-right: 20px">First Name :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                            ErrorMessage="First Name Is Required." ForeColor="red" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" PlaceHolder="Please Enter Your First Name" Width="320px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter First Name In Valid Form"
                                            ControlToValidate="TextBox1" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z]{1,32}">
                                        </asp:RegularExpressionValidator><br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <asp:Label ID="label2" runat="server" Style="font-size: 20px; margin-right: 20px">Last Name :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox2" runat="server" PlaceHolder="Please Enter Your Last Name" Width="320px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Last Name In Valid Form"
                                            ControlToValidate="TextBox2" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z]{1,32}">
                                        </asp:RegularExpressionValidator><br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lable3" runat="server" Style="font-size: 20px; margin-right: 20px">Address 1 :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Text="*"
                                            ErrorMessage="Address 1 Is Required." ForeColor="red">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" PlaceHolder="Please Enter Your Address" Width="320px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lable4" runat="server" Style="font-size: 20px; margin-right: 20px">Address 2 :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox4" runat="server" PlaceHolder="Please Enter Your Address" Width="320px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label5" runat="server" Style="font-size: 20px; margin-left: 35px">City :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" Text="*"
                                            ErrorMessage="City is Required." ForeColor="red">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" PlaceHolder="Please Enter Your City" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter City In Valid Form"
                                            ControlToValidate="TextBox5" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z]{1,32}">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label6" runat="server" Style="font-size: 20px; margin-left: 25px">State :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" Text="*"
                                            ErrorMessage="State Is Required." ForeColor="red">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" PlaceHolder="Please Enter Your State" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please Enter State In Valid Form"
                                            ControlToValidate="TextBox6" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z]{1,32}">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label7" runat="server" Style="font-size: 20px; margin-right: 5px">Zip Code :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" PlaceHolder="Please Enter Your Zip Code" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label8" runat="server" Style="font-size: 20px; margin-right: 60px">Phone Number :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox8" runat="server" PlaceHolder="Please Enter Your Phone Number" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please Enter Phone In Valid Form"
                                            ControlToValidate="TextBox8" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[0-9]{10}">
                                        </asp:RegularExpressionValidator><br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="label9" runat="server" Style="font-size: 20px; margin-left: 5px">Gender :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:RadioButton ID="RadioButton3" runat="server" Text="Male" GroupName="gender" />
                                        <asp:RadioButton ID="RadioButton4" runat="server" Text="Female" GroupName="gender" />
                                    </td>
                                    <td>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label10" runat="server" Style="font-size: 20px; margin-left: 20px">Email :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" PlaceHolder="Please Enter Your Email" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please Enter Email In Valid Form"
                                            ControlToValidate="TextBox9" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z0-9._%+-]+@+[A-Za-z0-9.-]+\.[a-zA-Z]{2,}">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label11" runat="server" Style="font-size: 20px; margin-right: 50px">GST Number :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox10" Text="*"
                                            ErrorMessage="GST Number Is Required." ForeColor="red">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" PlaceHolder="Please Enter Your GST Number" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please Enter GST In Valid Form"
                                            ControlToValidate="TextBox10" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z0-9]{1,32}">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label12" runat="server" Style="font-size: 20px; margin-right: 50px">PAN Number :-</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox11" Text="*"
                                            ErrorMessage="PAN Number Is Required." ForeColor="red">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox class="form-control" ID="TextBox11" runat="server" PlaceHolder="Please Enter Your PAN Number" Width="320px" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Please Enter PAN Number In Valid Form"
                                            ControlToValidate="TextBox11" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                            ValidationExpression="[A-Za-z0-9]{1,32}">
                                        </asp:RegularExpressionValidator><br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="label13" runat="server" Style="font-size: 20px; margin-left: 10px">Active :-</asp:Label>
                                    </td>
                                    <td></td>
                                    <td>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-3">
                                <asp:Button class=" btn  btn-primary text-uppercase" ID="AddButton" Text="Submit" OnClick="SubmitButton_Click" runat="server" Width="100px" Height="40px" EnableViewState="True" />
                                <asp:Button class=" btn  btn-danger text-uppercase" ID="cancel_btn" Text="Cancel" runat="server" Width="100px" Height="40px" EnableViewState="True" OnClick="cancel_btn_Click" CausesValidation="false" />
                            </div>

                            <br />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
    <asp:Panel ID="Grid_Panel" runat="server" CssClass="panel-center">
        <div>
            <asp:Button class=" btn btn-lg btn-info text-uppercase pull-right btn-margin" ID="Add1" CausesValidation="false" Text="Add" runat="server" OnClick="Add1_Click" Width="100px" Height="40px"  />
          
            <asp:GridView CssClass="table table-hover table-striped" ItemStyle-BorderWidth="3px" Height="450px" style="text-align: center"
                BorderWidth="3px" BackColor="#FFCC99" ID="GridView1" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                PageSize="5" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" DataKeyNames="Customer_ID">
                <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                <Columns>

                    <asp:BoundField DataField="First_Name" HeaderText="First Name" SortExpression="First_Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last Name" SortExpression="Last_Name" />
                    <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode" />
                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" SortExpression="Phone_Number" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="GST_Number" HeaderText="GST Number" SortExpression="GST_Number" />
                    <asp:BoundField DataField="PAN_Number" HeaderText="PAN Number" SortExpression="PAN_Number" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="Button1" CommandName="Edit" runat="server" class="btn btn-primary" CommandArgument='<%# Eval("Customer_ID") %>'><span class="glyphicon glyphicon-pencil"></span>
                            </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" ButtonType="Link" ControlStyle-CssClass="btn btn-danger" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash'></i>" />
                </Columns>
            </asp:GridView>

        </div>
    </asp:Panel>
    <script type="text/javascript">
        document.getElementsByClassName("header-text")[0].innerHTML = " Manage Customer";
    </script>
</asp:Content>
