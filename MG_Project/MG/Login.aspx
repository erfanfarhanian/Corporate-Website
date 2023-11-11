<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>اینترانت شرکت مهاب قدس | ورود</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="AdminPanel/dist/css/adminlte.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="AdminPanel/plugins/iCheck/square/blue.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- bootstrap rtl -->
    <link rel="stylesheet" href="AdminPanel/dist/css/bootstrap-rtl.min.css">
    <!-- template rtl version -->
    <link rel="stylesheet" href="AdminPanel/dist/css/custom-style.css">
    <link rel="shortcut icon" href="Images/Icon/favicon.png" type="image/x-icon" />
</head>
<body style="background-image: url(Images/img/LoginBackground.jpg);" class="hold-transition login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <div style="background-color:#006db7; margin:10px; opacity:0.9">
                    <b>ورود به ناحیه کاربری</b>
                </div>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">فرم زیر را تکمیل کنید و ورود بزنید</p>

                    <form action="AdminPanel/index2.html" method="post">
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="نام کاربری" Height="40px" Width="280px"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-user input-group-text"></span>
                            </div>
                            <asp:Label ID="lblUsername" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="کلمه عبور" Height="41px" Width="282px" TextMode="Password"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-lock input-group-text"></span>
                            </div>
                            <asp:Label ID="lblPassword" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                            <asp:Label ID="lblNotAccepted" runat="server" Text="متاسفانه شما هنوز مورد تایید مدیر سایت قرار نگرفته اید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="checkbox icheck">
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4" style="margin-left: 40px; margin-right: 25px; margin-bottom: 10px;">
                                <asp:Button ID="btnLogin" runat="server" Text="ورود" CssClass="btn btn-primary btn-block btn-flat" OnClick="btnLogin_Click" />
                            </div>
                            <div class="col-5">
                                <a href="Default.aspx" class="btn btn-danger btn-block btn-flat">صفحه اصلی</a>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                    <!-- /.social-auth-links -->
                    <p class="mb-1">
                        <a href="ForgetPassword.aspx">رمز عبورم را فراموش کرده ام.</a>
                    </p>
                    <p class="mb-0">
                        <a href="Register.aspx" class="text-center">ثبت نام</a>
                    </p>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->
        <!-- jQuery -->
        <script src="AdminPanel/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="AdminPanel/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- iCheck -->
        <script src="AdminPanel/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                })
            })
</script>
    </form>
</body>
</html>
