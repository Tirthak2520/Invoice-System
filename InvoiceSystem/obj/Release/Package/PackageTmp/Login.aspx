<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InvoiceSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice Login</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />

</head>
<body>
    <img src="image/TB1.jpg" height="120px" width="120px" alt="logo image" />
    <h1 id="h1">Welcome to  Invoice System</h1>
    <style>
        #h1 {
            text-align: center;
            font-family: 'Copperplate Gothic';
            font-size: 50px;
            margin-top: 0px;
        }

        :root {
            --input-padding-x: 1.5rem;
            --input-padding-y: .75rem;
        }

        body {
            background-color: cyan;
        }

        .card-signin {
            border: 2px solid black;
            border-radius: 20px;
            box-shadow: 0 0.5rem 1rem 0 rgba(1,1,1,1);
            margin-top: 30px;
            background-color: white;
        }

            .card-signin .card-title {
                margin-bottom: 2rem;
                font-weight: 300;
                font-size: 40px;
                font-family: Algerian;
            }

            .card-signin .card-body {
                padding: 50px;
            }

        .form-signin {
            width: 100%;
        }

            .form-signin .btn {
                font-size: 80%;
                border-radius: 30px;
                letter-spacing: .1rem;
                font-weight: bold;
                padding: 1;
                transition: all 0.2s;
            }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

            .form-label-group input {
                height: auto;
                border-radius: 20px;
            }

            .form-label-group > input,
            .form-label-group > label {
                adding: var(--input-padding-y) var(--input-padding-x);
            }

            .form-label-group > label {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100%;
                margin-bottom: 0;
            }

            .form-label-group input::-ms-input-placeholder {
                color: transparent;
            }

        .alert-danger {
            border-radius: 20px;
            text-align: center;
        }
    </style>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Sign In</h5>
                            <div class="form-signin">
                                <div class="form-label-group">
                                    <asp:Label ID="Label1" Style="font-size: medium" runat="server"><b>User Name:</b></asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="100%" placeholder="Enter your User name" class="form-control" required autofocus></asp:TextBox>
                                </div>
                                <div class="form-label-group">
                                    <asp:Label ID="Label2" Style="font-size: medium" runat="server"><b>Password:</b></asp:Label>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="100%" placeholder="Enter your Password" class="form-control" required TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                <asp:Button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" runat="server" OnClick="btnsignin_Click" Text="SIGN IN"></asp:Button>
                                <hr class="my-4" />   
                               <p class="lead snipp-title" style="font-size:15px;text-align:center" >Do not have an Account?
                                   <asp:LinkButton class="btn btn-md btn-primary text-uppercase" runat="server" ID="btn_signup" OnClick="btn_signup_Click" text="sign up"></asp:LinkButton>
                               </p>
                                
                            </div>
                            <div class="alert-danger">
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
