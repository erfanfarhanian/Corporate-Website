<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="ImagePage.aspx.cs" Inherits="ImagePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bread_area" align="right" dir="rtl">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="Default.aspx">صفحه اصلی</a></li>
                        <li><a href="GalleryPage.aspx">گالری تصاویر</a></li>
                        <li class="active">تصاویر</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <form id="form3" runat="server" dir="rtl">
        <main class="site-main page-main">
            <div class="container">
                <div class="row">
                    <section class="page col-sm-12">

                        <asp:DataList ID="DataList2" runat="server" DataKeyField="GalleryID" DataSourceID="SqlDataSource2" Width="100%">
                            <ItemTemplate>
                                <h2 style="margin-top: -30px">
                                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></h2>
                                <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                                <p style="font-weight: bold; margin-top: -10px;">
                                    <asp:Label ID="SaveDateLabel" runat="server" Text='<%# Eval("SaveDate") %>' />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    شناسه گالری:<asp:Label ID="GalleryIDLabel" runat="server" Text='<%# Eval("GalleryID") %>' />
                                </p>
                            </ItemTemplate>
                        </asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT GalleryID, Title, SaveDate FROM Tbl_Gallery WHERE (GalleryID = @GalleryID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="GalleryID" QueryStringField="GalleryID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <!-- Start WOWSlider.com BODY section -->
                        <div id="wowslider-container1">
                            <div class="ws_images">
                                <ul>
                                    <asp:Repeater ID="rptSlierGallery" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <li>
                                                <asp:Image ID="Image1" runat="server" Height="100%" Width="100%" ImageUrl='<%# Eval("ImageName", "Images/ImageGallery/{0}") %>' />
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="ws_bullets">
                                <div>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <a href="#" title=""><span></span></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="ws_script" style="position: absolute; left: -99%"><a href="http://wowslider.com">slider wordpress</a> by WOWSlider.com v7.7</div>
                            <div class="ws_shadow"></div>
                        </div>
                        <script type="text/javascript" src="Gallery/engine1/wowslider.js"></script>
                        <script type="text/javascript" src="Gallery/engine1/script.js"></script>
                        <!-- End WOWSlider.com BODY section -->
                        <h2 style="text-align: right; margin-bottom: -10px;">همه تصاویر</h2>
                        <h3 class="title"></h3>
                        <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="gallery" style="float: right; margin-bottom: 40px;" dir="rtl">
                                    <asp:ImageButton ID="imgBtnImages" runat="server" Height="200px" Width="262px" ImageUrl='<%# Eval("ImageName", "Images/ImageGallery/{0}") %>' PostBackUrl='<%# Eval("ImageID", "SinglePic.aspx?ImageID={0}") %>' BorderStyle="NotSet" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT ImageID, ImageName, GalleryID FROM Tbl_Image WHERE (GalleryID = @GalleryID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="GalleryID" QueryStringField="GalleryID" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </section>

                </div>
            </div>
        </main>
    </form>
</asp:Content>

