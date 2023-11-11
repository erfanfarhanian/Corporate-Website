<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="NewsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form2" runat="server" style="text-align: right;">
        <section class="hero_area">
            <div class="hero_content" style="background-image: url(Images/img/LastestNews.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover; height: 250px; padding: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 style="color: floralwhite; margin-right: 170px; margin-top: 30px;">آخرین اخبار و اطلاعیه های</h1>
                            <h1 style="color: #005FA6; margin-top: 60px; margin-right: 600px; margin-top: 40px">شرکت مهاب قدس</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="bread_area" dir="rtl" style="margin-top:-45px;">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ol class="breadcrumb">
                            <li><a href="Default.aspx" title="Post">صفحه اصلی</a></li>
                            <li class="active">اخبار</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <main class="site-main category-main">
            <div class="container">
                <div class="row">
                    <section class="category-content col-sm-9">
                        <h2 style="margin-top: -2px">اخبار و اطلاعیه های شرکت</h2>
                        <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                        <ul class="media-list">
                            <asp:Repeater ID="RptNewsList" runat="server">
                                <ItemTemplate>
                                    <li class="media">
                                        <div class="media-left" style="float: right; margin-left: 20px; margin-right: -20px;">
                                            <div class="img-box img-box-right">
                                                <asp:ImageButton ID="ImgBtnNews" Width="262" Height="200" runat="server" ImageUrl='<%# Eval("Pic", "Images/NewsImage/{0}") %>' PostBackUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>' />
                                                <div>
                                                    <span>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>' ForeColor="WhiteSmoke">مشاهده خبر</asp:HyperLink></a></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media-body">
                                            <h3 class="media-heading">
                                                <asp:HyperLink ID="HypLnkTitleNews" runat="server" Text='<%# Eval("TitleNews", "{0}") %>' NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>'></asp:HyperLink>
                                            </h3>
                                            <p>
                                                <asp:Label ID="lblStextNews" runat="server" Text='<%# Eval("STextNews") %>' />
                                            </p>
                                            <p>
                                                <asp:HyperLink class="readmore" ID="HypLnkReadMoreNews" runat="server" ForeColor="#005FA6" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>'>مشاهده خبر</asp:HyperLink>
                                            </p>
                                            <aside class="meta category-meta">
                                                <div class="pull-left">
                                                    <div class="arc-comment">
                                                    </div>
                                                    <div class="arc-date"></div>
                                                </div>
                                                <div class="pull-right">
                                                    <ul class="arc-share">
                                                    </ul>
                                                </div>
                                                <br />
                                            </aside>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <br />
                        <div style="margin-left: -50px; font-family: 'BYek'; font-size: 14px; text-align: center">
                            <asp:Repeater ID="rptPager" runat="server">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                        CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                        OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>' ForeColor="#005FA6"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </section>
                    <aside class="sidebar col-sm-3" dir="rtl">
                        <div>
                            <h4 style="margin-top: 5px; margin-bottom: 17px;">جستجوی خبر</h4>
                            <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>

                            <asp:Label ID="Label6" runat="server" Font-Names="byek" Text="جستجو: "></asp:Label>
                            <asp:TextBox ID="txtSearch" runat="server" Font-Names="byek" Width="163px"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblNotFound" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSearch" runat="server" Font-Names="byek" Text="جستجو" Width="117px" OnClick="btnSearch_Click" />
                        </div>
                    </aside>
                </div>
            </div>
        </main>
    </form>
</asp:Content>

