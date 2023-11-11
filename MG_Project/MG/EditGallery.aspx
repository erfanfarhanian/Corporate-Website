<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="EditGallery.aspx.cs" Inherits="EditGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <h3 class="card-title">ویرایش گالری تصاویر</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                گالری با موفقیت ویرایش شد.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageGallery.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlEditGallery" runat="server">
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
                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnEditGallery" runat="server" Text="ویرایش" OnClick="btnEditGallery_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageGallery.aspx" />
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

