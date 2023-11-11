<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="NewsPage.aspx.cs" Inherits="NewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="bread_area" align="right" dir="rtl">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="Default.aspx">صفحه اصلی</a></li>
                        <li><a href="NewsList.aspx">اخبار</a></li>
                        <li class="active">متن خبر</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <form id="form3" runat="server" dir="rtl">
        <main class="site-main page-main">
            <div class="container">
                <div class="row">
                    <section class="page col-sm-9">
                        <asp:Panel ID="pnlPrint" runat="server">
                            <asp:DataList ID="DataListTitle" runat="server" DataKeyField="NewsID" DataSourceID="SqlDataSource1" Width="100%">
                                <ItemTemplate>
                                    <h2 style="margin-top: -2px">
                                        <asp:Label ID="TitleNewsLabel" runat="server" Text='<%# Eval("TitleNews") %>' />
                                    </h2>
                                    <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                                    <p style="font-weight: bold; margin-top: -10px;">
                                        <asp:Label ID="SaveDateLabel" runat="server" Text='<%# Eval("SaveDate") %>' />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="SaveTimeLabel" runat="server" Text='<%# Eval("SaveTime") %>' />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    کد خبر:
                                    <asp:Label ID="NewsIDLabel" runat="server" Text='<%# Eval("NewsID") %>' />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="imgBtnPrintNews" runat="server" Height="15px" ImageUrl="~/Images/img/Print.png" OnClientClick="return PrintPanel();" Width="20px" BorderStyle="None" />
                                        <p style="font-size: 1px;">
                                            <asp:Label ID="CommentStatusLabel" runat="server" Text='<%# Eval("CommentStatus") %>' />
                                        </p>
                                    </p>
                                </ItemTemplate>
                            </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT TitleNews, SaveDate, SaveTime, NewsID, CommentStatus FROM Tbl_News WHERE (NewsID = @NewsID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="NewsID" QueryStringField="NewsID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="NewsID" DataSourceID="SqlDataSource2" Width="100%">
                                <ItemTemplate>
                                    <div class="entry" style="font-size: 16px;">
                                        <div style="text-align: center">
                                            <asp:Image ID="Image1" runat="server" Height="411px" Width="700px" ImageUrl='<%# Eval("Pic", "Images/NewsImage/{0}") %>' />
                                        </div>
                                        <h3 style="text-align: justify">
                                            <asp:Label ID="STextNewsLabel" runat="server" Text='<%# Eval("STextNews") %>' />
                                        </h3>
                                        <p style="text-align: justify">
                                            <asp:Label ID="LTextNewsLabel" runat="server" Text='<%# Eval("LTextNews") %>' />
                                        </p>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT NewsID, STextNews, LTextNews, Pic FROM Tbl_News WHERE (NewsID = @NewsID) AND (ShowStatus &lt;&gt; 0)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="NewsID" QueryStringField="NewsID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="entry" style="font-size: 16px;">
                                        <div style="text-align: left">
                                            <asp:ImageButton ID="imgBtnLike" runat="server" Width="30" Height="30" ImageUrl="~/Images/Icon/Like.png" OnClick="imgBtnLike_Click" />
                                            <asp:Label ID="lblLikeNo" runat="server" Text=""></asp:Label>
                                            <asp:ImageButton ID="imgBtnDislike" runat="server" Width="30" Height="30" ImageUrl="~/Images/Icon/Dislike.png" OnClick="imgBtnDislike_Click" />
                                            <asp:Label ID="lblDislikeNo" runat="server" Text=""></asp:Label>
                                        </div>
                                        <asp:Label ID="lblUserValidation" CssClass="text text-danger" runat="server" Text="رای شما قبلا برای این خبر ثبت شده است." Visible="False"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Panel ID="pnlComment" runat="server" Height="493px">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="page col-sm-12">
                                        <h2 style="margin-top: -2px">نظرات کاربران</h2>
                                        <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                                        <table style="width: 400px">
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label1" runat="server" Text=" نام و نام خانوادگی: "></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:TextBox ID="txtFullName" runat="server" Width="220px"></asp:TextBox>
                                                    <br />
                                                    <asp:Label CssClass="text text-danger" ID="lblEmpFullName" runat="server" Text="لطفا نام و نام خانوادگی خود را وارد کنید." Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label2" runat="server" Text="پست الکترونیکی: "></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:TextBox ID="txtEmail" runat="server" Width="220px"></asp:TextBox>
                                                    <br />
                                                    <asp:Label CssClass="text text-danger" ID="lblEmpEmail" runat="server" Text="لطفا پست الکترونیکی را وارد کنید." Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label4" runat="server" Text="تاریخ: " Font-Names="BYek"></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:TextBox ID="txtCommentDate" runat="server" Width="220px" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label5" runat="server" Text="زمان: " Font-Names="BYek"></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:TextBox ID="txtCommentTime" runat="server" Width="220px" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label3" runat="server" Text="نظر شما: " Font-Names="BYek"></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:TextBox ID="txtCommentText" runat="server" Width="300px" Height="129px" TextMode="MultiLine"></asp:TextBox>
                                                    <br />
                                                    <asp:Label CssClass="text text-danger" ID="lblEmpCommentText" runat="server" Text="لطفا متن نظر را وارد کنید." Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left"></td>
                                                <td style="text-align: right">
                                                    <asp:Button ID="btnSendCm" runat="server" Text="ارسال نظر" CssClass="btn btn-success" Height="31px" Width="149px" OnClick="btnSendCm_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">&nbsp;</td>
                                                <td style="text-align: right">&nbsp;</td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="lblAcceptComment" CssClass="text text-success" runat="server" Text="نظر شما ثبت شد. در صورت تایید در سایت قرار خواهد گرفت." Visible="False" Font-Size="Medium"></asp:Label>
                                        <hr />
                                        <asp:DataList ID="DataList3" runat="server" DataKeyField="CommentID" DataSourceID="SqlDataSource4" Width="100%" Font-Names="BYek">
                                            <ItemTemplate>
                                                <div>
                                                    <h3 style="line-height: 25px; font-size: 17px; text-align: justify; text-align: right;">
                                                        <asp:Label ID="CUsernameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                                    </h3>
                                                    <p style="line-height: 20px;">
                                                        <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
                                                        &nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="CommentTimeLabel" runat="server" Text='<%# Eval("CommentTime") %>' />
                                                    </p>
                                                    <p style="line-height: 25px;">
                                                        <asp:Label ID="CommentTextLabel" runat="server" Text='<%# Eval("CommentText") %>' />
                                                    </p>
                                                    <hr />
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList><asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT CommentID, FullName, Email, CommentText, CommentDate, CommentTime, ShowStatus, NewsID FROM Tbl_Comment WHERE (NewsID = @NewsID) AND (ShowStatus = 1)">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="NewsID" QueryStringField="NewsID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </section>
                    <aside class="sidebar col-sm-3" dir="rtl">
                        <div>
                            <h4 style="margin-top: 5px; margin-bottom: 17px;">آخرین اخبار</h4>
                            <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                            <ul>
                                <asp:Repeater ID="rptLastNews" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <li>
                                            <h5>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>'>
                                                    <asp:Label ID="TitleNewsLabel" runat="server" Text='<%# Eval("TitleNews") %>' />
                                                </asp:HyperLink></h5>
                                            <p>
                                                <asp:Label ID="SaveDateLabel" runat="server" Text='<%# Eval("SaveDate") %>' />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="SaveTimeLabel" runat="server" Text='<%# Eval("SaveTime") %>' />
                                            </p>
                                            <p>
                                                <asp:Label ID="STextNewsLabel" runat="server" Text='<%# Eval("STextNews") %>' />
                                            </p>
                                            <hr />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT top 3 NewsID, TitleNews, STextNews, SaveDate, SaveTime FROM Tbl_News ORDER BY NewsID DESC"></asp:SqlDataSource>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </main>
        <script type="text/javascript">
            function PrintPanel() {
                var panel = document.getElementById("<%=pnlPrint.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>خبر</title>');
                printWindow.document.write('</head><body class="container" dir="rtl"');
                printWindow.document.write(panel.innerHTML);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                setTimeout(function () {
                    printWindow.print();
                }, 500);
                return false;
            }
        </script>
    </form>
</asp:Content>

