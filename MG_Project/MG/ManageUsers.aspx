<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-warning" ID="btnInsertNews" runat="server" Text="ثبت کاربر جدید" OnClick="btnInsertNews_Click" />
        <asp:Button CssClass="btn btn-primary" ID="btnYourNews" runat="server" Text="نمایش کاربران" Visible="True" OnClick="btnYourNews_Click" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">همه کاربران</h3>
                        <div style="float: left; margin-top: 10px;">
                            <asp:Label CssClass="text text-danger" ID="lblNotFound" runat="server" Text="Label" Visible="False"></asp:Label>
                        </div>
                        <div style="margin-top: 20px;" class="card-tools">
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <asp:TextBox ID="txtSearch" runat="server" placeholder="جستجو" Width="110px"></asp:TextBox>
                                <div class="input-group-append">
                                    <asp:ImageButton ID="imgBtnSearch" runat="server" Width="40" Height="35" ImageUrl="~/Images/Icon/Search.png" OnClick="imgBtnSearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tr>
                                <th>شناسه</th>
                                <th>نام</th>
                                <th>نام خانوادگی</th>
                                <th>کدملی</th>
                                <th>ایمیل</th>
                                <th>شماره همراه</th>
                                <th>تاریخ تولد</th>
                                <th>رشته تحصیلی</th>
                                <th>مدرک تحصیلی</th>
                                <th>نام کاربری</th>
                                <th>پسورد</th>
                                <th>سمت</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptUsersList" runat="server" OnItemCommand="rptUsersList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("UserID") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("FirstName") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("LastName") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MelliCode") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Mobile") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("BirthDate") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Major") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Degree") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Username") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Password") %>' /></td>
                                        <td>
                                            <asp:Label CssClass="badge bg-info" ID="Label5" runat="server" Text='<%# Eval("Status") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("UserID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("UserID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                        <div style="text-align: center">
                            <asp:Panel ID="pnlPager" runat="server">
                                <asp:Repeater ID="rptPager" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>' ForeColor="#005FA6"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.row -->
    </div>
</asp:Content>

