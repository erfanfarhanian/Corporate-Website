<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">تغییر کلمه عبور</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <asp:Panel ID="pnlChangePassword" runat="server">
                <article style="column-count: 1">
                    <strong><i class="fa fa-key mr-1"></i>کلمه عبور قبلی</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtPrevPass" runat="server" Width="233px" MaxLength="15" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpPrevPass" runat="server" Text="لطفا کلمه عبور قبلی را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-key mr-1"></i>کلمه عبور جدید</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtNewPass" runat="server" Width="233px" MaxLength="15" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpNewPass" runat="server" Text="لطفا کلمه عبور جدید را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>

                    <strong><i class="fa fa-key mr-1"></i>تکرار کلمه عبور</strong>
                    <p class="text-muted">
                        <asp:TextBox ID="txtRepeatPass" runat="server" Width="233px" MaxLength="15" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="lblEmpRepeatPass" runat="server" Text="لطفا تکرار کلمه عبور را وارد نمایید" ForeColor="Red" Visible="False"></asp:Label>
                    </p>
                    <br />
                    <asp:Label ID="lblWrongPassAndRptPass" runat="server" Text="رمز عبور و تکرار آن با هم برابر نمی باشند" Visible="False" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblWrongPrevPass" runat="server" Text="کلمه عبور قبلی صحیح نمی باشد" Visible="False" ForeColor="Red"></asp:Label>
                </article>
                <hr>
                <asp:Button CssClass="btn btn-success" ID="btnEditProfile" runat="server" Text="ثبت" OnClick="btnEditProfile_Click" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-danger" ID="btnChangePassword" runat="server" Text="انصراف" PostBackUrl="~/ProfilePage.aspx" />
            </asp:Panel>
            <asp:Label ID="lblSuccessMsg" runat="server" Visible="False"></asp:Label>

            <%if (lblSuccessMsg.Text == "1")
                {%>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                کلمه عبور با مووفقیت تغییر کرد.
            </div>
            <% } %>
            <br />
            <br />
            <br />
            <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ProfilePage.aspx" Visible="False" />
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

