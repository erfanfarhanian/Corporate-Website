<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageComment.aspx.cs" Inherits="ManageComment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-primary" ID="btnShowComment" runat="server" Text="نمایش نظرات" Visible="True" OnClick="btnShowComment_Click" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">همه نظرات</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tr>
                                <th>شناسه</th>
                                <th>نام و نام خانوادگی</th>
                                <th>ایمیل</th>
                                <th>عنوان خبر</th>
                                <th>متن نظر</th>
                                <th>تاریخ</th>
                                <th>ساعت</th>
                                <th>وضعیت</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptCommentList" runat="server" OnItemCommand="rptCommentList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("CommentID") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("FullName") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("TitleNews") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("CommentText") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("CommentDate") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CommentTime") %>' /></td>
                                        <td>
                                            <asp:Label CssClass="badge bg-info" ID="Label5" runat="server" Text='<%# Eval("Status") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("CommentID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("CommentID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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

