<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageNotifications.aspx.cs" Inherits="ManageNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-warning" ID="btnInsertNotification" runat="server" Text="ثبت اطلاعیه جدید" PostBackUrl="~/InsertNotification.aspx" />
        <asp:Button CssClass="btn btn-primary" ID="btnShowNotifications" runat="server" Text="نمایش اطلاعیه ها" Visible="True" PostBackUrl="~/ManageNotifications.aspx" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">همه اطلاعیه ها</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tr>
                                <th>شناسه</th>
                                <th>عنوان</th>
                                <th>توضیحات</th>
                                <th>تاریخ</th>
                                <th>ساعت</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptNotificationsList" runat="server" OnItemCommand="rptNotificationsList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("NotifID") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("NotifTitle") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("NotifDescription") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NotifDate") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NotifTime") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("NotifID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("NotifID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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

