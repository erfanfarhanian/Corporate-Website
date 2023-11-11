<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start WOWSlider.com HEAD section -->
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    <script type="text/javascript" src="engine1/jquery.js"></script>
    <!-- End WOWSlider.com HEAD section -->
    <form id="form1" runat="server" dir="rtl">
        <main class="site-main">
            <section class="hero_area">
                <div class="hero_content" style="display: block; background-image: url(Images/img/Main.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover; height: 300px; padding: 0;">
                    <div class="col-xs-9 container" style="float: left;">
                        <!-- Start WOWSlider.com BODY section -->
                        <div id="Slider" style="margin-left: 20px;">
                            <div id="wowslider-container1">
                                <div class="ws_images">
                                    <ul>
                                        <asp:Repeater ID="rptSlider" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <li>
                                                    <asp:Image ID="ImgSlider" runat="server" Height="100%" Width="100%" title='<%# Eval("Description") %>' ImageUrl='<%# Eval("SliderPic", "Images/Slider/{0}") %>' />
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <div class="ws_bullets">
                                    <div>
                                        <asp:Repeater ID="rptSliderBullet" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <a href="#" title='<%# Eval("Description") %>'><span></span></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="ws_script" style="position: absolute; left: -99%"><a href="http://wowslider.com">wordpress slider</a> by WOWSlider.com v7.7</div>
                                <div class="ws_shadow"></div>
                            </div>
                            <script type="text/javascript" src="engine1/wowslider.js"></script>
                            <script type="text/javascript" src="engine1/script.js"></script>
                        </div>
                        <!-- End WOWSlider.com BODY section -->
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT [SliderID], [SliderPic], [Description] FROM [Tbl_Slider] ORDER BY SliderID DESC"></asp:SqlDataSource>
                    </div>
                    <div id="SideHeader" class="sidebar col-sm-3">
                        <aside dir="rtl" style="margin-right: 170px;">
                            <h4 id="hlink" style="text-align: center; margin-top: 15px; margin-bottom: 17px;">لینک های مهم</h4>
                            <h3 class="col-xs-12 title" style="font-size: 20px; margin-bottom: 15px; margin-top: -2px"></h3>
                            <div id="ImageStyle">
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><a href="#" target="_blank">
                                            <img src="Images/img/bime.png" alt="بیمه" /></a></td>
                                        <td>&nbsp;</td>
                                        <td><a href="#" target="_blank">
                                            <img src="Images/img/gharar.png" alt="قرارداد" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><a href="#" target="_blank">
                                            <img src="/Images/img/amoozesh.png" alt="آموزش" /></a></td>
                                        <td>&nbsp;</td>
                                        <td><a href="#" target="_blank">
                                            <img src="Images/img/sey.png" alt="سیمره" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </aside>
                    </div>
                </div>
            </section>
            <section class="boxes_area" dir="rtl">
                <div class="col-sm-12">
                    <h2 class="text-right container" style="margin-bottom: 5px; margin-top: 10px">آخرین اخبار &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink CssClass="btn btn-default" ID="HyperLink4" runat="server" NavigateUrl="~/NewsList.aspx" Font-Size="Small" ForeColor="#005FA6">مشاهده همه</asp:HyperLink></h2>
                    <h3 class="title container"></h3>
                </div>
                <div class="home_list container">
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <li class="col-md-3 col-sm-6 col-xs-12" style="text-align: center; float: right;">
                                    <div class="thumbnail">
                                        <div class="img-box img-box-top">
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="130" Width="205" ImageUrl='<%# Eval("Pic", "Images/NewsImage/{0}") %>' PostBackUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>' />
                                            <div>
                                                <span>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>' ForeColor="WhiteSmoke">مشاهده خبر</asp:HyperLink></a></span>
                                            </div>
                                        </div>
                                        <div class="caption">
                                            <h3><a href="#"></a>
                                                <asp:HyperLink ID="HprLnkClickInTitleNews" runat="server" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>'>
                                                    <asp:Label ID="TitleNewsLabel" runat="server" Text='<%# Eval("TitleNews") %>' />
                                                </asp:HyperLink></h3>
                                            <p>
                                                <asp:Label ID="STextNewsLabel" runat="server" Text='<%# Eval("STextNews") %>' />
                                            </p>
                                            <a href="#" class="btn btn-link" role="button">
                                                <asp:HyperLink ID="HprLnkMore" runat="server" NavigateUrl='<%# Eval("NewsID", "NewsPage.aspx?NewsID={0}") %>' ForeColor="#005FA6">بیشتر</asp:HyperLink></a>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT Top 4 [NewsID], [TitleNews], [STextNews], [Pic] FROM [Tbl_News] ORDER BY NewsID DESC"></asp:SqlDataSource>
                </div>
            </section>
            <div class="container">
                <h2 class="text-right container" style="margin-bottom: -10px; margin-top: 10px">پرتال طرح ها &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink CssClass="btn btn-default" ID="HyperLink3" runat="server" NavigateUrl="~/PotalDesign.aspx" Font-Size="Small" ForeColor="#005FA6">مشاهده همه</asp:HyperLink></h2>
                <h3 class="title container"></h3>
                <div class="home_list container">
                    <asp:Repeater ID="rptPortal" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="gallery" style="float: right; margin-bottom: 40px;" dir="rtl">
                                <a target="_blank" href="fjords.jpg">
                                    <asp:ImageButton ID="ImgBtnPicGallery" runat="server" Height="200px" Width="262px" ImageUrl='<%# Eval("PortalPic", "Images/PortalWebImg/{0}") %>' PostBackUrl='<%# Eval("PortalUrl", "{0}") %>' />
                                </a>
                                <h3 class="desc" style="text-align: center">
                                    <asp:HyperLink Target="_blank" ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("PortalUrl", "{0}") %>' ForeColor="#005FA6">
                                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PortalTitle") %>' />
                                    </asp:HyperLink></h3>
                                <div class="desc">
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT TOP (4) PortalID, PortalTitle, PortalUrl, PortalPic FROM Tbl_Portal ORDER BY PortalID DESC"></asp:SqlDataSource>
            </div>
            <section class="home-area" align="right">
                <div class="home_content">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 home_bottom">
                                <h2 class="sub_title">شرکت های طرف قرارداد</h2>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="carousel slide" data-ride="carousel" data-type="multi" data-interval="6000" id="myCarousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="col-md-2 col-sm-6 col-xs-12 p10">
                                                    <a href="#">
                                                        <img src="Images/img/client01.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12 p10">
                                                    <a href="#">
                                                        <img src="Images/img/client02.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client03.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client04.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client05.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client06.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client07.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client08.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12 p10">
                                                    <a href="#">
                                                        <img src="Images/img/client09.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12 p10">
                                                    <a href="#">
                                                        <img src="Images/img/client10.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client11.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client12.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client13.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client14.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client15.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <a href="#">
                                                        <img src="Images/img/client16.png" class="img-responsive" alt="Reference"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </form>
</asp:Content>
