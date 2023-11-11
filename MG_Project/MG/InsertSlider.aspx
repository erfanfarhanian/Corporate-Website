<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="InsertSlider.aspx.cs" Inherits="InsertSlider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">  
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgPreview.ClientID%>').prop('src', e.target.result).width(800).height(300);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">افزودن اسلایدر</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label CssClass="alert alert-success" ID="lblSuccessMsg" runat="server" Text="" Visible="False"></asp:Label>
                            <%if (lblSuccessMsg.Text == "1")
                                {%>
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <h5><i class="icon fa fa-check"></i>تبریک!</h5>
                                اسلایدر با موفقیت ثبت شد.
                               
                                <asp:Button CssClass="btn btn-danger" ID="btnReturn" runat="server" Text="بازگشت" PostBackUrl="~/ManageSliders.aspx" />
                            </div>
                            <% } %>
                            <asp:Panel ID="pnlInsertSlider" runat="server" Visible="True">
                                <div class="card-body">
                                    <div class="callout callout-warning">
                                        <h5>توجه!</h5>
                                        <p>بهتر است سایز تصویر 300*800 باشد. در غیر این صورت در اسلایدر به خوبی نمایش داده نمی شود.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>توضیحات :</label>
                                    <br />
                                    <br />
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        </div>
                                        <asp:TextBox ID="txtDescription" runat="server" placeholder="توضیحات را وارد کنید..." Height="211px" Width="800px" MaxLength="150" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Label CssClass="text text-danger" ID="lblEmpDecription" runat="server" Text="لطفا توضیحات را وارد کنید." Visible="False"></asp:Label>
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
                                            <asp:Image ID="imgPreview" Height="300px" Width="800px" runat="server" ImageUrl="~/Images/img/NoPhoto.jpg" /><br />
                                            <br />
                                            <asp:FileUpload ID="imgUpload" runat="server" onchange="ImagePreview(this);" />
                                            <asp:Label CssClass="text text-danger" ID="lblEmpPic" runat="server" Text="لطفا تصویری برای اسلایدر انتخاب کنید." Visible="False"></asp:Label>
                                        </fieldset>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->



                                <hr>
                                <asp:Button CssClass="btn btn-success" ID="btnInsertSlider" runat="server" Text="ثبت" OnClick="btnInsertSlider_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button CssClass="btn btn-danger" ID="btnCancel" runat="server" Text="انصراف" PostBackUrl="~/ManageSliders.aspx" />
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

