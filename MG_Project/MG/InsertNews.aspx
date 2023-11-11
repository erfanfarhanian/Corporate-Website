<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="InsertNews.aspx.cs" Inherits="EditNews" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Scripts/PersianDatePicker/css/PersianDatePicker.min.css" rel="stylesheet" />
    <script src="Scripts/PersianDatePicker/js/PersianDatePicker.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">  
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgPreview.ClientID%>').prop('src', e.target.result).width(250).height(150);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script src="/Scripts/ckeditor/adapters/jquery.js"></script>
    <script src="/Scripts/ckeditor/config.js"></script>
    <script src="/Scripts/ckeditor/ckeditor.js"></script>

    <script>
        $(function () {
            $('#mytextarea').ckeditor();
        });
    </script>
    <script src="/Scripts/ckfinder/ckfinder.js"></script>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">افزودن خبر</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1" && Session["RegisterStatusS"].ToString() == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                خبر شما با موفقیت ثبت شد.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageNews.aspx" />
                            </div>
                            <% } %>
                            <%if (lblSuccessMsg.Text == "1" && Session["RegisterStatusS"].ToString() != "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                خبر شما با موفقیت ثبت شد. لطفا منتظر تایید خبر از سوی مدیر سایت باشید.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn2" runat="server" Text="بازگشت" PostBackUrl="~/ManageNews.aspx" />
                            </div>
                            <% } %>

                            <div class="card-body">
                                <div class="callout callout-warning">
                                    <h5>توجه!</h5>
                                    <p>1- لطفا تاریخ را به درستی وارد کنید، در غیر این صورت در خبرهای مدت دار با مشکل مواجه خواهید شد.</p>
                                    <p>2- نام تصویر خبر مطابق با عنوان خبر (یا خلاصه تر در صورت لزوم) باشد.</p>
                                </div>
                                <div class="form-group">
                                    <label>عنوان :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtTitleNews" runat="server" placeholder="عنوان خبر را وارد کنید..." Height="35px" Width="398px"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpTitle" runat="server" Text="لطفا عنوان خبر را تایپ کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>متن کوتاه :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtSTextNews" runat="server" placeholder="متن کوتاه خبر را وارد کنید..." Height="167px" Width="727px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpSTextNews" runat="server" Text="لطفا متن کوتاه خبر را تایپ کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>متن اصلی :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <CKEditor:CKEditorControl ID="CKEditorLTextNews" runat="server" ContentsCss="Scripts/ckeditor/contents.css" Font-Italic="False" Height="260px" TemplatesFiles="Scripts/ckeditor/plugins/templates/templates/default.js" Width="729px">
                                        </CKEditor:CKEditorControl>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpLTextNews" runat="server" Text="لطفا متن اصلی خبر را تایپ کنید." Visible="False"></asp:Label>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>تصویر :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <fieldset style="width: 250px;">
                                            <asp:Image ID="imgPreview" Height="150px" Width="250px" runat="server" ImageUrl="~/Images/img/NoPhoto.jpg" /><br />
                                            <br />
                                            <asp:FileUpload ID="imgUpload" runat="server" onchange="ImagePreview(this);" />
                                            <asp:Label CssClass="text text-danger" ID="lblEmpImg" runat="server" Text="لطفا تصویری برای خبر را انتخاب کنید." Visible="False"></asp:Label>
                                        </fieldset>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <label>تاریخ انتشار:</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtSaveDate" runat="server" Height="35px" Width="275px" Enabled="False"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox ID="chkExpDate" runat="server" AutoPostBack="True" Text="تاریخ انقضای خبر" />

                                        <!-- /.form group -->
                                        <asp:Panel ID="pnlExpiredDate" runat="server" Visible="False">
                                            <div class="form-group">
                                                <label>تاریخ انقضاء:</label>
                                                <br />
                                                <br />
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                                    <asp:TextBox ID="txtExpDate" runat="server" Height="35px" Width="275px" Enabled="True" placeholder="روز/ماه/سال" MaxLength="10" EnableViewState="True" EnableTheming="True"></asp:TextBox>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <!-- /.form group -->
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="form-group">
                                    <label>زمان انتشار:</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-clock-o"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtSaveTime" runat="server" Height="35px" Width="275px" Enabled="False" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->

                                <div class="form-group">
                                    <asp:Label ID="lblShowStatus" runat="server" Text="دسترسی ثبت نظرات: " Visible="True"></asp:Label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-tasks"></i></span>
                                        </div>
                                        <asp:DropDownList ID="dropDownLstIsCM" runat="server" Width="175px" Enabled="True" Visible="True">
                                            <asp:ListItem Value ="0">عدم ثبت</asp:ListItem>
                                            <asp:ListItem Value="1">ثبت</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->
                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnInsertNews" runat="server" Text="ثبت" OnClick="btnEditProfile_Click" />
                                &nbsp;&nbsp;&nbsp;
                        <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageNews.aspx" />
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
    </section>
</asp:Content>

