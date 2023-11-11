<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ManageDocuments.aspx.cs" Inherits="ManageDocuments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div style="margin-bottom: 10px; margin-right: 15px;">
        <asp:Button CssClass="btn btn-info" ID="btnInsertDoc" runat="server" Text="ثبت مستند جدید" OnClick="btnInsertDoc_Click"  />
        <asp:Button CssClass="btn btn-primary" ID="btnShowDoc" runat="server" Text="نمایش همه مستندات" Visible="True" OnClick="btnShowDocuments_Click" />
    </div>
    <div class="card card-primary">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">مستندات منابع سازمانی</h3>
                        <div style="float: left; margin-top: 10px;">
                            <asp:Label CssClass="text text-danger" ID="lblNotFound" runat="server" Text="Label" Visible="False"></asp:Label>
                        </div>
                        <div style="margin-top: 20px;" class="card-tools">
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <asp:TextBox ID="txtSearch" runat="server" placeholder="جستجو" Width="110px"></asp:TextBox>
                                <div class="input-group-append">
                                    <asp:ImageButton ID="imgBtnSearch" runat="server" Width="40" Height="35" ImageUrl="~/Images/Icon/Search.png" OnClick="imgBtnSearch_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tr>
                                <th>شناسه</th>
                                <th>مستند</th>
                                <th>نوع</th>
                                <th>توضیحات</th>
                                <th>فایل</th>
                                <th>&nbsp;</th>
                            </tr>
                            <asp:Repeater ID="rptDocumentsList" runat="server" OnItemCommand="rptDocuemntsList_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("PDFDocID") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("DocumentTitle") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DocumentTypeTitle") %>' /></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' /></td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnDownload" runat="server" ImageUrl="Images/img/dl.jpg" CommandArgument='<%# Eval("PDFFileName") %>' OnClick="DownloadFile" />
                                        <td>
                                            <asp:ImageButton ID="imgBtnSelect" runat="server" CommandName="Edit" CommandArgument='<%# Eval("PDFDocID") %>' AlternateText="ویرایش" ImageUrl="~/Images/Icon/Edit.png" Width="20" Height="20" />
                                            <asp:ImageButton ID="imgBtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PDFDocID") %>' AlternateText="حذف" ImageUrl="~/Images/Icon/Delete.png" Width="20" Height="20" />
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

