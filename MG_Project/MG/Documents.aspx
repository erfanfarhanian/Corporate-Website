<%@ Page Title="" Language="C#" MasterPageFile="~/MsDefault.master" AutoEventWireup="true" CodeFile="Documents.aspx.cs" Inherits="Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form4" runat="server" dir="rtl">
        <div dir="rtl" style="text-align: right">
            <section class="hero_area">
                <div class="hero_content" style="background-image: url(Images/img/Documents.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover; height: 250px; padding: 0;">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h1 style="color: brown; margin-right: 100px; margin-top: 30px;">مستندات منابع سازمانی</h1>
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
                                <li class="active">مستندات منابع سازمانی</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <main class="site-main category-main">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="container">
                    <div class="row">
                        <section class="category-content col-sm-9">
                            <h2 style="margin-top: -10px">مستندات منابع سازمانی</h2>
                            <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                            <div class="text-center">
                                <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
                                    <ProgressTemplate>
                                        <img style="text-align: center" width="100" height="100" src="Images/Gifs/Wait.gif" alt="لطفا صبر کنید" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdShowDocuments" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" Font-Names="byek" AutoGenerateColumns="False" GridLines="Vertical" UseAccessibleHeader="False">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <Columns>
                                                <asp:BoundField HeaderText="شناسه" DataField="PDFDocID">
                                                    <HeaderStyle Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="مستند" DataField="DocumentTitle" />
                                                <asp:BoundField HeaderText="نوع" DataField="DocumentTypeTitle" />
                                                <asp:BoundField HeaderText="توضیحات" DataField="Description" />
                                                <asp:TemplateField HeaderText="فایل">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgBtnDownload" runat="server" ImageUrl="Images/img/dl.jpg" CommandArgument='<%# Eval("PDFFileName") %>' OnClick="DownloadFile" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="PDFFileName" HeaderText="نام فایل" Visible="False" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle BackColor="#005FA6" Font-Bold="True" ForeColor="White" Wrap="True" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" Height="50px" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </section>
                        <aside class="sidebar col-sm-3" style="float: right">
                            <div>
                                <h4 style="margin-top: 5px;">فیلتر اسناد</h4>
                                <h3 class="title" style="font-size: 20px; margin-bottom: 20px; margin-top: -2px"></h3>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="Label1" runat="server" Font-Names="byek" Text="طبقه مستند: "></asp:Label>
                                        &nbsp;&nbsp;
                                        <asp:DropDownList ID="DropDownLstDocs" runat="server" Font-Names="byek" Height="26px" Width="186px" AutoPostBack="True" OnSelectedIndexChanged="DropDownLstDocs_SelectedIndexChanged1">
                                        </asp:DropDownList>
                                        &nbsp;<br />
                                        <asp:Label ID="Label2" runat="server" Font-Names="byek" Text="نوع مستند: "></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList ID="DropDownLstDocTypes" runat="server" Font-Names="byek" Style="margin-bottom: 0" Width="185px" AutoPostBack="True" OnSelectedIndexChanged="DropDownLstDocTypes_SelectedIndexChanged1">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Font-Names="byek" Text="جستجو: "></asp:Label>
                                        &nbsp;<asp:TextBox ID="txtSearchFilter" runat="server" Font-Names="byek" Width="215px" AutoPostBack="True" OnTextChanged="txtSearchFilter_TextChanged"></asp:TextBox>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Label ID="lblNotFound" runat="server" Font-Names="byek" Font-Size="Medium" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnFilter" runat="server" Font-Names="byek" Text="جستجو" Width="117px" OnClick="btnFilter_Click1" />

                                        <br />

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                

                                &nbsp;<br />
                                <br />
                                <br />
                            </div>
                        </aside>
                    </div>
                </div>
            </main>
        </div>
    </form>
</asp:Content>

