<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="EditDocument.aspx.cs" Inherits="EditDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">ویرایش مستند</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                مستند با موفقیت ویرایش شد.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageDocuments.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlEditDocument" runat="server" Visible="True">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>طبقه مستند :</label>
                                            <br />
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                </div>
                                                <asp:DropDownList ID="DropDownLstDocs" runat="server" Font-Names="byek" Height="35px" Width="398px" AutoPostBack="True" OnSelectedIndexChanged="DropDownLstDocs_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:Label CssClass="text text-danger" ID="lblEmpDocument" runat="server" Text="لطفا طبقه مستند را انتخاب کنید." Visible="False"></asp:Label>
                                            </div>
                                            <!-- /.input group -->
                                        </div>
                                        <!-- /.form group -->

                                        <div class="form-group">
                                            <label>نوع مستند :</label>
                                            <br />
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                </div>
                                                <asp:DropDownList ID="DropDownLstDocTypes" runat="server" Font-Names="byek" Style="margin-bottom: 0" Height="35px" Width="398px" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </div>
                                            <!-- /.input group -->
                                        </div>
                                        <!-- /.form group -->
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="form-group">
                                    <label>توضیحات :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtDescription" runat="server" placeholder="متن توضیحات را وارد کنید..." Height="167px" Width="727px" TextMode="MultiLine" MaxLength="150"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>فایل :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <fieldset style="width: 250px;">
                                            <asp:Label ID="lblFile" runat="server" Text="Label"></asp:Label>
                                            <br />
                                            <asp:FileUpload ID="fileUpload" runat="server" />
                                            <asp:Label CssClass="text text-danger" ID="lblEmpFileUpload" runat="server" Text="لطفا فایل مستند را انتخاب کنید." Visible="False"></asp:Label>
                                        </fieldset>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnEditDocument" runat="server" Text="ثبت" OnClick="btnEditDocument_Click" />
                                &nbsp;&nbsp;&nbsp;
                        <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageDocuments.aspx" />
                                <asp:Label ID="lblDDtID" runat="server" Text="Label" Visible="False"></asp:Label>
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

