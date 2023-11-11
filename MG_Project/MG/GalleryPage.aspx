<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="GalleryPage.aspx.cs" Inherits="GalleryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form3" runat="server" dir="rtl" style="text-align: right">
        <section class="hero_area">
            <div class="hero_content" style="background-image: url(Images/img/GalleryPage.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover; height: 250px; padding: 0;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 style="color: floralwhite; margin-right: 230px; margin-top: 30px;">گالری تصاویر</h1>
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
                            <li class="active">تصاویر</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <main class="site-main category-main">
            <div class="container">
                <div class="row">
                    <section class="category-content col-sm-9">
                        <h2 style="margin-top: -10px">گالری تصاویر</h2>
                        <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                        <asp:Repeater ID="rptGallery" runat="server">
                            <ItemTemplate>
                                <div class="gallery" style="float: right; margin-bottom: 40px;" dir="rtl">
                                    <a target="_blank" href="fjords.jpg">
                                        <asp:ImageButton ID="ImgBtnPicGallery" runat="server" Height="200px" Width="262px" ImageUrl='<%# Eval("Pic", "Images/ImageGallery/{0}") %>' PostBackUrl='<%# Eval("GalleryID", "ImagePage.aspx?GalleryID={0}") %>' />
                                    </a>
                                    <h3 class="desc" style="text-align: center">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("GalleryID", "ImagePage.aspx?GalleryID={0}") %>' ForeColor="#005FA6">
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                        </asp:HyperLink></h3>
                                    <div class="desc">
                                        <asp:Label ID="SaveDateLabel" runat="server" Text='<%# Eval("SaveDate") %>' />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </section>
                    <aside class="sidebar col-sm-3" dir="rtl">
                        <div>
                            <h4 style="margin-top: -3px; margin-bottom: 17px;">جستجوی گالری</h4>
                            <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                            <asp:Label ID="Label6" runat="server" Font-Names="byek" Text="جستجو: "></asp:Label><asp:TextBox ID="txtSearch" runat="server" Font-Names="byek" Width="163px"></asp:TextBox><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
                            <asp:Label ID="lblNotFound" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSearch" runat="server" Font-Names="byek" Text="جستجو" Width="117px" OnClick="btnSearch_Click" />
                        </div>
                    </aside>
                </div>
                <div style="margin-left: -50px; font-family: 'BYek'; font-size: 14px; text-align: center">
                    <asp:Repeater ID="rptPager" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>' ForeColor="#005FA6"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </main>
    </form>
</asp:Content>
