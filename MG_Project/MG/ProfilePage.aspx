<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">درباره من</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <article style="column-count:3">
                <strong><i class="fa fa-user mr-1"></i>نام</strong>
                <p class="text-muted">
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                </p>
                <strong><i class="fa fa-user mr-1"></i>نام خانوادگی</strong>
                <p class="text-muted">
                   <asp:Label ID="lblFamily" runat="server" Text="Label"></asp:Label>
           
                </p>

                <strong><i class="fa fa-file-text-o mr-1"></i>کد ملی</strong>
                <p class="text-muted">
                   <asp:Label ID="lblMelliCode" runat="server" Text="Label"></asp:Label>
           
                </p>

                <strong><i class="fa fa-user mr-1"></i>نام کاربری</strong>
                <p class="text-muted">
                   <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
           
                </p>

                <strong><i class="fa fa-envelope mr-1"></i>ایمیل</strong>
                <p class="text-muted">
                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
           
                </p>

                <strong><i class="fa fa-mobile mr-1"></i>شماره همراه</strong>
                <p class="text-muted">
                    <asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label>
           
                </p>

                <strong><i class="fa fa-calendar mr-1"></i>تاریخ تولد</strong>
                <p class="text-muted">
                    <asp:Label ID="lblBirthDate" runat="server" Text="Label"></asp:Label>
           
                </p>
                <strong><i class="fa fa-graduation-cap mr-1"></i>مدرک</strong>
                <p class="text-muted">
                    <asp:Label ID="lblDegree" runat="server" Text="Label"></asp:Label>
           
                </p>
                <strong><i class="fa fa-book mr-1"></i>رشته تحصیلی</strong>
                <p class="text-muted">
                    <asp:Label ID="lblMajor" runat="server" Text="Label"></asp:Label>
           
                </p>
            </article>
            <hr>
            <strong><i class="fa fa-map-marker mr-1"></i>سمت شما در سایت</strong>

            <p class="text-muted">
                <asp:Label ID="lblRegisterStatus" runat="server" Text="نامشخص"></asp:Label>
            </p>
            <hr>
            <asp:Button CssClass="btn btn-info" ID="btnEditProfile" runat="server" Text="ویرایش پروفایل" PostBackUrl="~/UpdateProfile.aspx" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-warning" ID="btnChangePassword" runat="server" Text="تغییر کلمه عبور" PostBackUrl="~/ChangePassword.aspx" />
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>

