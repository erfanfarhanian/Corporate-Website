<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="InsertGallery.aspx.cs" Inherits="InsertGallery" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" runat="server" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Scripts/PersianDatePicker/css/PersianDatePicker.min.css" rel="stylesheet" />
    <script src="Scripts/PersianDatePicker/js/PersianDatePicker.min.js"></script>
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

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">افزودن گالری تصاویر</h3>
                        </div>
                        <div class="card-body">

                            <asp:Panel ID="pnlInsertGallery" runat="server">
                                <asp:Panel ID="pnlGalleryInfo" runat="server">
                                    <div class="card-body">
                                        <div class="callout callout-warning">
                                            <h5>توجه!</h5>
                                            <p>1- فایل های انتخابی حتما فرمت jpg باشند.</p>
                                            <p>2- نام عکس مورد نظر مطابق با عنوان گالری باشد و به ترتیب شماره گذاری شود.</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>عنوان :</label>
                                        <br />
                                        <br />
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                            </div>
                                            <asp:TextBox ID="txtTitle" runat="server" placeholder="عنوان را وارد کنید..." Height="35px" Width="398px" MaxLength="150"></asp:TextBox>
                                            <asp:Label CssClass="text text-danger" ID="lblEmpTitle" runat="server" Text="لطفا عنوان را وارد کنید." Visible="False"></asp:Label>
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <!-- /.form group -->

                                    <div class="form-group">
                                        <label>تاریخ رویداد:</label>
                                        <br />
                                        <br />
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                            <asp:TextBox ID="txtSaveDate" runat="server" Height="35px" Width="275px" Enabled="True" MaxLength="10"></asp:TextBox>
                                            <asp:Label CssClass="text text-danger" ID="lblEmpSaveDate" runat="server" Text="لطفا تاریخ رویداد را وارد کنید." Visible="False"></asp:Label>
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <!-- /.form group -->

                                    <div class="form-group">
                                        <label>تصویر پیش نمایش :</label>
                                        <br />
                                        <br />
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                            </div>
                                            <fieldset style="width: 250px;">
                                                <asp:Image ID="imgPreview" Height="150px" Width="250px" runat="server" ImageUrl="~/Images/img/NoPhoto.jpg" /><br />
                                                <br />
                                                <asp:FileUpload ID="imgUpload" runat="server" onchange="ImagePreview(this);" />
                                                <asp:Label CssClass="text text-danger" ID="lblEmpImg" runat="server" Text="لطفا تصویری برای پیش نمایش را انتخاب کنید." Visible="False"></asp:Label>
                                            </fieldset>
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <!-- /.form group -->
                                </asp:Panel>
                                <asp:Panel ID="pnlUploadImg" runat="server" Visible="False">
                                    <div class="card-body">
                                        <div class="callout callout-warning">
                                            <h5>توجه!</h5>
                                            <p>1- لطفا تصاویر گالری را با دقت انتخاب کنید، زیرا دیگر امکان ویرایش تصاویر انتخاب شده را نخواهید داشت و برای این کار ابتدا باید گالری مورد نظر را پاک کنید و مجدد یک گالری جدید بسازید. </p>
                                            <p>2- سعی شود سایز تصاویر در حدود 430 * 800 باشند، در غیر این صورت ممکن است تصاویر به درستی نمایش داده نشوند.</p>
                                            <p>3- فایل های انتخابی باید حتما فرمت jpg باشند.</p>
                                            <p>3-نامگذاری عکس ها به اینگونه باشد که ابتدا نام رویداد عکس نوشته شود، سپس به ترتیب شماره گذاری شود.</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblUploadImg" runat="server" Text="Label">آپلود تصاویر: </asp:Label>
                                        <br />
                                        <br />
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                            </div>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <ajaxToolkit:AjaxFileUpload Width="500px" ID="AjaxFileUpload1" runat="server" ThrobberID="myThrobber" OnUploadComplete="AjaxFileUpload1_UploadComplete" MaximumNumberOfFiles="100" AllowedFileTypes="jpg"></ajaxToolkit:AjaxFileUpload>
                                            <br />
                                            <br />
                                            <div id="showimage">
                                            </div>
                                            <hr />
                                            <asp:Label CssClass="text text-danger" ID="lblEmpPic" runat="server" Text="لطفا تصاویر گالری را انتخاب کنید." Visible="False"></asp:Label>
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <!-- /.form group -->
                                </asp:Panel>
                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnInsertGallery" runat="server" Text="ثبت" OnClick="btnInsertGallery_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-warning" ID="btnCancel" runat="server" Text="بازگشت" PostBackUrl="~/ManageGallery.aspx" />
                            </asp:Panel>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</asp:Content>

