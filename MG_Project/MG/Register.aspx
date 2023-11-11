<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>اینترانت شرکت مهاب قدس | ثبت نام</title>
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

    <link href="Scripts/PersianDatePicker/css/PersianDatePicker.min.css" rel="stylesheet" />
    <script src="Scripts/PersianDatePicker/js/PersianDatePicker.min.js"></script>
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <b>فرم ثبت نام</b>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                    <%if (lblSuccessMsg.Text == "1")
                        {%>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                        ثبت نام شما شما با موفقیت انجام شد. لطفا منتظر تایید خبر از سوی مدیر سایت باشید.
                    </div>
                    <% } %>
                    <p class="login-box-msg">فرم زیر را تکمیل کنید و برروی ثبت نام بزنید</p>

                    <form action="AdminPanel/index2.html" method="post">
                        <div class="input-group mb-3">
                            <asp:Label ID="Label2" runat="server" Text="Label">نام&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                            <asp:TextBox ID="txtName" runat="server" placeholder="نام" Height="40px" Width="280px" MaxLength="50"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-user input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpName" runat="server" Text="لطفا نام را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label3" runat="server" Text="Label">نام خانوادگی</asp:Label>
                            <asp:TextBox ID="txtFamily" runat="server" placeholder="نام خانوادگی" Height="40px" Width="280px" MaxLength="100"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-user input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpFamily" runat="server" Text="لطفا نام خانوادگی را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label1" runat="server" Text="Label">کد ملی</asp:Label>
                            <asp:TextBox ID="txtMelliCode" runat="server" placeholder="کد ملی" Height="40px" Width="280px" MaxLength="10"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-file-text-o input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpMelliCode" runat="server" Text="لطفا کد ملی را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label4" runat="server" Text="Label">ایمیل&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="ایمیل" Height="40px" Width="277px" MaxLength="50"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-envelope input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpEmail" runat="server" Text="لطفا ایمیل را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label11" runat="server" Text="Label">شماره همراه</asp:Label>
                            <asp:TextBox ID="txtMobile" runat="server" placeholder="شماره همراه" Height="40px" Width="287px" MaxLength="11"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-mobile input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpMobile" runat="server" Text="لطفا شماره همراه را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label5" runat="server" Text="Label">تاریخ تولد</asp:Label>
                            <asp:TextBox ID="txtBirthDate" runat="server" placeholder="روز/ماه/سال" Height="40px" Width="280px" MaxLength="10"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-calendar  input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpBirthDate" runat="server" Text="لطفا تاریخ تولد را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label6" runat="server" Text="Label">مدرک تحصیلی</asp:Label>
                            <asp:TextBox ID="txtDegree" runat="server" placeholder="مدرک تحصیلی(اختیاری)" Height="40px" Width="274px" MaxLength="50"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-graduation-cap input-group-text"></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label8" runat="server" Text="Label">رشته تحصیلی</asp:Label>
                            <asp:TextBox ID="txtMajor" runat="server" placeholder="رشته تحصیلی(اختیاری)" Height="40px" Width="280px" MaxLength="50"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-book input-group-text"></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label10" runat="server" Text="Label">نام کاربری</asp:Label>
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="نام کاربری" Height="41px" Width="282px" MaxLength="50"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-user input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpUsername" runat="server" Text="لطفا نام کاربری را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label7" runat="server" Text="Label">کلمه عبور</asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="کلمه عبور" Height="41px" Width="282px" TextMode="Password" MaxLength="15"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-lock input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpPassword" runat="server" Text="لطفا کلمه عبور را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="input-group mb-3">
                            <asp:Label ID="Label9" runat="server" Text="Label">تکرار کلمه عبور</asp:Label>
                            <asp:TextBox ID="txtRepeatedPass" runat="server" placeholder="تکرار کلمه عبور" Height="41px" Width="282px" TextMode="Password" MaxLength="15"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="fa fa-lock input-group-text"></span>
                            </div>
                            <asp:Label ID="lblEmpRepeatedPass" runat="server" Text="لطفا تکرار کلمه عبور را وارد کنید." ForeColor="Red" Visible="False"></asp:Label>
                            <asp:Label ID="lblWrongRepeatedPass" runat="server" Text="کلمه عبور با تکرار آن برابر نیست." ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="checkbox icheck">
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4" style="margin-left: 40px; margin-right: 25px; margin-bottom: 10px;">
                                <asp:Button ID="btnLogin" runat="server" Text="ثبت نام" CssClass="btn btn-primary btn-block btn-flat" OnClick="btnLogin_Click" />
                            </div>
                            <div class="col-5">
                                <a href="Login.aspx" class="btn btn-danger btn-block btn-flat">بازگشت</a>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                    <!-- /.social-auth-links -->
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
