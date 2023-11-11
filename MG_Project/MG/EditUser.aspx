<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">ویرایش خبر</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                کاربر با موفقیت ویرایش شد.
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageUsers.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlEditUser" runat="server" Visible="True">
                                <div class="form-group">
                                    <label>نام :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtName" runat="server" placeholder="نام را وارد کنید..." Height="35px" Width="398px" MaxLength="50"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpName" runat="server" Text="لطفا نام را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>نام خانوادگی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtFamily" runat="server" placeholder="نام خانوادگی را وارد کنید..." Height="35px" Width="398px" MaxLength="100"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpFamily" runat="server" Text="لطفا نام خانوادگی را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>کد ملی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtMelliCode" runat="server" placeholder="کد ملی را وارد کنید..." Height="35px" Width="398px" MaxLength="10"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpMelliCode" runat="server" Text="لطفا کد ملی را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>ایمیل :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="ایمیل را وارد کنید..." Height="35px" Width="398px" MaxLength="50"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpEmail" runat="server" Text="لطفا ایمیل را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>شماره همراه :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtMobile" runat="server" placeholder="شماره همراه را وارد کنید..." Height="35px" Width="398px" MaxLength="11"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpMobile" runat="server" Text="لطفا شماره همراه را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>تاریخ تولد :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtBirthDate" runat="server" placeholder="روز/ماه/سال" Height="35px" Width="398px" MaxLength="10"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpBirthDate" runat="server" Text="لطفا تاریخ تولد را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>نام کاربری :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtUsername" runat="server" placeholder="نام کاربری را وارد کنید..." Height="35px" Width="398px" MaxLength="50"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpUsername" runat="server" Text="لطفا نام کاربری را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>کلمه عبور :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtPassword" runat="server" placeholder="کلمه عبور را وارد کنید..." Height="35px" Width="398px" MaxLength="15"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpPassword" runat="server" Text="لطفا کلمه عبور را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>مدرک تحصیلی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtDegree" runat="server" placeholder="مدرک تحصیلی را وارد کنید..." Height="35px" Width="450px"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>رشته تحصیلی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtMajor" runat="server" placeholder="رشته تحصیلی را وارد کنید..." Height="35px" Width="450px"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <asp:Label ID="lblShowStatus" runat="server" Text="سمت کاربر: " Visible="True"></asp:Label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-tasks"></i></span>
                                        </div>
                                        <asp:DropDownList ID="drpDnLstStatus" runat="server" Width="175px" Enabled="True" Visible="True">
                                            <asp:ListItem>مجوز ندارد</asp:ListItem>
                                            <asp:ListItem>مدیر</asp:ListItem>
                                            <asp:ListItem>کاربر معمولی</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->
                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnEditProfile" runat="server" Text="ویرایش" OnClick="btnEditProfile_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageUsers.aspx" />
                            </asp:Panel>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</asp:Content>

