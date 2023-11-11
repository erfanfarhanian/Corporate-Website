<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageNews.aspx.cs" Inherits="ManageNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-success" ID="btnInsertNews" runat="server" Text="افزودن خبر" PostBackUrl="~/InsertNews.aspx" />
        <asp:Button CssClass="btn btn-primary" ID="btnYourNews" runat="server" Text="خبرهای شما" Visible="True" OnClick="btnYourNews_Click" />
        <asp:Button CssClass="btn btn-info" ID="btnAllNews" runat="server" Text="همه خبرها" OnClick="btnAllNews_Click" />
    </div>
    <asp:Panel ID="pnlNewsList" runat="server" Visible="False">
        <div class="card card-info">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">همه خبرها</h3>
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
                                    <th>تصویر</th>
                                    <th>موضوع</th>
                                    <th>متن کوتاه</th>
                                    <th>تاریخ انتشار</th>
                                    <th>تاریخ انقضا</th>
                                    <th>ساعت</th>                                
                                    <th>وضعیت نمایش</th>
                                    <th>نظرات</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <asp:Repeater ID="rptNewsList" runat="server" OnItemCommand="rptNewsList_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblStextNews" runat="server" Text='<%# Eval("NewsID") %>' /></td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Width="100" Height="70" ImageUrl='<%# Eval("Pic", "Images/NewsImage/{0}") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TitleNews") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("STextNews") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("SaveDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("ExpiredDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SaveTime") %>' /></td>
                                            <td>
                                                <asp:Label CssClass="badge bg-info" ID="Label5" runat="server" Text='<%# Eval("Status") %>' /></td>
                                            <td>
                                                <asp:Label CssClass="badge bg-info" ID="Label8" runat="server" Text='<%# Eval("CommentStatus") %>' /></td>
                                            <td>
                                                <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("NewsID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                                <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("NewsID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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
    </asp:Panel>

    <asp:Panel ID="pnlNewsListByUserID" runat="server">
        <div class="card card-primary">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">خبرهای شما</h3>
                            <div style="float: left; margin-top: 10px;">
                                <asp:Label CssClass="text text-danger" ID="lblNotFound2" runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                            <div style="margin-top: 20px;" class="card-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <asp:TextBox ID="txtSearch2" runat="server" placeholder="جستجو" Width="110px"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:ImageButton ID="imgBtnSearch2" runat="server" Width="40" Height="35" ImageUrl="~/Images/Icon/Search.png" OnClick="imgBtnSearch2_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover">
                                <tr>
                                    <th>شناسه</th>
                                    <th>تصویر</th>
                                    <th>موضوع</th>
                                    <th>متن کوتاه</th>
                                    <th>تاریخ انتشار</th>
                                    <th>تاریخ انقضا</th>
                                    <th>ساعت</th>
                                    <th>وضعیت نمایش</th>
                                    <th>نظرات</th>
                                    <th>&nbsp;</th>
                                </tr>
                                <asp:Repeater ID="rptNewsListByID" runat="server" ClientIDMode="Inherit" Visible="True" OnItemCommand="rptNewsListByID_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblStextNews" runat="server" Text='<%# Eval("NewsID") %>' /></td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Width="100" Height="70" ImageUrl='<%# Eval("Pic", "Images/NewsImage/{0}") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TitleNews") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("STextNews") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("SaveDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("ExpiredDate") %>' /></td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SaveTime") %>' /></td>
                                            <td>
                                                <asp:Label CssClass="badge bg-info" ID="Label5" runat="server" Text='<%# Eval("Status") %>' /></td>
                                            <td>
                                                <asp:Label CssClass="badge bg-info" ID="Label8" runat="server" Text='<%# Eval("CommentStatus") %>' /></td>
                                            <td>
                                                <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("NewsID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                                <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("NewsID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                            <div style="text-align: center">
                                <asp:Panel ID="pnlPager2" runat="server">
                                    <asp:Repeater ID="rptPager2" runat="server">
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
    </asp:Panel>

</asp:Content>

