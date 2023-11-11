<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="InsertNotification.aspx.cs" Inherits="InsertNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">افزودن اطلاعیه برای کاربران سایت</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                اطلاعیه با موفقیت ثبت شد.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageNotifications.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlInsertNotification" runat="server" Visible="True">
                                <div class="form-group">
                                    <label>عنوان :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtNotifTitle" runat="server" placeholder="عنوان را وارد کنید..." Height="35px" Width="398px" MaxLength="100"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblNotifTitle" runat="server" Text="لطفا عنوان را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>توضیحات :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtNotifDescription" runat="server" placeholder="توضیحات را وارد کنید..." Height="167px" Width="727px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblNotifDescription" runat="server" Text="لطفا توضیحات را وارد کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>تاریخ انتشار:</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtNotifDate" runat="server" Height="35px" Width="275px" Enabled="False" MaxLength="10"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>زمان انتشار:</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-clock-o"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtNotifTime" runat="server" Height="35px" Width="275px" Enabled="False" ReadOnly="True" MaxLength="5"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnInsertNotification" runat="server" Text="ثبت" OnClick="btnInsertNotification_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageNotifications.aspx" />
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

