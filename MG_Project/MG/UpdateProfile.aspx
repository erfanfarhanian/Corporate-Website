<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">ویرایش پروفایل</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body" style="text-align: justify">
            <asp:Panel ID="pnlUpdateProfile" runat="server">
                <article style="column-count: 3">
                    <strong><i class="fa fa-user mr-1"></i>نام</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtName" runat="server" Width="216px" MaxLength="50"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpName" runat="server" Text="لطفا نام را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-user mr-1"></i>نام خانوادگی</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtFamily" runat="server" Width="216px" MaxLength="100"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpFamily" runat="server" Text="لطفا نام خانوادگی را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-file-text-o mr-1"></i>کد ملی</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtMelliCode" runat="server" Width="216px" MaxLength="10"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpMelliCode" runat="server" Text="لطفا کد ملی را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-user mr-1"></i>نام کاربری</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtUsername" runat="server" Width="216px" Enabled="False" MaxLength="50"></asp:TextBox>
                    </p>

                    <strong><i class="fa fa-envelope mr-1"></i>ایمیل</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtEmail" runat="server" Width="216px" MaxLength="50"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpEmail" runat="server" Text="لطفا ایمیل را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-mobile mr-1"></i>شماره همراه</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtMobile" runat="server" Width="216px" MaxLength="11"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpMobile" runat="server" Text="لطفا شماره همراه را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-calendar mr-1"></i>تاریخ تولد</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtBirthDate" runat="server" Width="216px" MaxLength="10"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpBirthDate" runat="server" Text="لطفا تاریخ تولد را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-graduation-cap mr-1"></i>مدرک</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtDegree" runat="server" Width="216px" MaxLength="50"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpDegree" runat="server" Text="لطفا مدرک تحصیلی را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-book mr-1"></i>رشته تحصیلی</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtMajor" runat="server" Width="216px" MaxLength="50"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpMajor" runat="server" Text="لطفا رشته تحصیلی را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                </article>
                <hr>
                <asp:Button CssClass="btn btn-success" ID="btnEditProfile" runat="server" Text="ویرایش" OnClick="btnEditProfile_Click" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-danger" ID="btnChangePassword" runat="server" Text="انصراف" PostBackUrl="~/ProfilePage.aspx" />
            </asp:Panel>
            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
            <%if (lblSuccessMsg.Text == "1")
                {%>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                اطلاعات شما با موفقیت ویرایش شد.
            </div>
            <% } %>
            <br />
            <br />
            <br />
            <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ProfilePage.aspx" Visible="False" />
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

