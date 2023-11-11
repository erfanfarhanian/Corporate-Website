<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManagePortalDesign.aspx.cs" Inherits="ManagePortalDesign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-success" ID="btnInsertPortal" runat="server" Text="افزودن پرتال طرح جدید" PostBackUrl="~/InsertPortal.aspx" />
        <asp:Button CssClass="btn btn-primary" ID="btnPortals" runat="server" Text="لیست پرتال ها" Visible="True" PostBackUrl="~/ManagePortalDesign.aspx" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">پرتال طرح ها</h3>
                        <div style="float: left; margin-top: 10px;">
                        </div>
                        <div style="margin-top: 20px;" class="card-tools">
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tr>
                                <th>شناسه</th>
                                <th>تصویر</th>
                                <th>عنوان</th>
                                <th>url</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptPortalsList" runat="server" OnItemCommand="rptPortalsList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("PortalID") %>' /></td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" Width ="200" Height="100" ImageUrl='<%# Eval("PortalPic", "Images/PortalWebImg/{0}") %>'/></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PortalTitle") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("PortalUrl") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("PortalID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PortalID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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

