<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageGallery.aspx.cs" Inherits="ManageGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-success" ID="btnInsertGallery" runat="server" Text="افزودن گالری" PostBackUrl="~/InsertGallery.aspx" />
        <asp:Button CssClass="btn btn-primary" ID="btnShowGallery" runat="server" Text="لیست گالری تصاویر" Visible="True" OnClick="btnShowGallery_Click" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">گالری</h3>
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
                                <th>عنوان</th>
                                <th>تاریخ</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptGalleryList" runat="server" OnItemCommand="rptGalleryList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("GalleryID") %>' /></td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" Width ="262" Height="150" ImageUrl='<%# Eval("Pic", "Images/ImageGallery/{0}") %>'/></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("SaveDate") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GalleryID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("GalleryID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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

