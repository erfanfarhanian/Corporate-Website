<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="EditComment.aspx.cs" Inherits="EditComment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">ویرایش نظر</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                نظر با موفقیت تایید یا رد شد.
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageComment.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlEditComment" runat="server" Visible="True">
                                <div class="form-group">
                                    <label>نام و نام خانوادگی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtFullName" runat="server" Height="35px" Width="398px" MaxLength="150" Enabled="False"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>پست الکترونیکی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtEmail" runat="server" Height="35px" Width="398px" MaxLength="150" Enabled="False"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>عنوان خبر :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtTitleNews" runat="server" Height="35px" Width="398px" MaxLength="150" Enabled="False"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>متن نظر :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtCommentText" runat="server" Height="167px" Width="727px" TextMode="MultiLine" ReadOnly="True" MaxLength="500" Enabled="False"></asp:TextBox>
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
                                        <asp:TextBox ID="txtCommentDate" runat="server" Height="35px" Width="275px" Enabled="False" MaxLength="10"></asp:TextBox>
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
                                        <asp:TextBox ID="txtCommentTime" runat="server" Height="35px" Width="275px" Enabled="False" ReadOnly="True" MaxLength="5"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <asp:Label ID="lblShowStatus" runat="server" Text="وضعیت نمایش: " Visible="True"></asp:Label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-tasks"></i></span>
                                        </div>
                                        <asp:DropDownList ID="drpDnLstStatus" runat="server" Width="175px" Visible="True">
                                            <asp:ListItem>در حال بررسی</asp:ListItem>
                                            <asp:ListItem>تایید شده</asp:ListItem>
                                            <asp:ListItem>رد شده</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnEditNotification" runat="server" Text="ویرایش" OnClick="btnEditComment_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageComment.aspx" />
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

