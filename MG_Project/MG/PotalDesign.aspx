<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="PotalDesign.aspx.cs" Inherits="PotalDesign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form3" runat="server" dir="rtl" style="text-align: right">
        <section class="hero_area">
            <div class="hero_content" style="background-image: url(Images/img/PortalDesign.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover; height: 250px; padding: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 style="color: floralwhite; margin-right: 230px; margin-top: 30px;">پرتال طرح های</h1>
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
                            <li class="active">پرتال طرح ها</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <main class="site-main category-main">
            <div class="container">
                <div class="row">
                    <section class="category-content col-sm-12">
                        <h2 style="margin-top: -10px">پرتال طرح ها</h2>
                        <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                        <asp:Repeater ID="rptGallery" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="gallery" style="float: right; margin-bottom: 40px;" dir="rtl">
                                    <a target="_blank" href="fjords.jpg">
                                        <asp:ImageButton ID="ImgBtnPicGallery" runat="server" Height="200px" Width="262px" ImageUrl='<%# Eval("PortalPic", "Images/PortalWebImg/{0}") %>' PostBackUrl='<%# Eval("PortalUrl", "{0}") %>' /></a>
                                    </a>
                                    <h3 class="desc" style="text-align: center">
                                        <asp:HyperLink Target="_blank" ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("PortalUrl", "{0}") %>' ForeColor="#005FA6">
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("PortalTitle") %>' />
                                        </asp:HyperLink></h3><div class="desc">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT [PortalID], [PortalTitle], [PortalUrl], [PortalPic] FROM [Tbl_Portal]"></asp:SqlDataSource>
                    </section>
                </div>
                <div style="margin-left: -50px; font-family: 'BYek'; font-size: 14px; text-align: center">
                </div>
            </div>
        </main>
    </form>
</asp:Content>

