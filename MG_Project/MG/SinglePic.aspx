<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="SinglePic.aspx.cs" Inherits="SinglePic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bread_area" align="right" dir="rtl">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li><a href="Default.aspx">صفحه اصلی</a></li>
                        <li><a href="GalleryPage.aspx">گالری تصاویر</a></li>
                        <li class="active">تصویر</li>
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
                        <h2 style="margin-top: -20px">
                            تصویر
                        </h2>
                        <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                        <div style="text-align:center">
                            <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Width="800" Height="500" ImageUrl='<%# Eval("ImageName", "Images/ImageGallery/{0}") %>' />
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mg_DBConnectionString %>" SelectCommand="SELECT ImageID, ImageName FROM Tbl_Image WHERE (ImageID = @ImageID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ImageID" QueryStringField="ImageID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </section>
                </div>
            </div>
        </main>
    </form>
</asp:Content>

