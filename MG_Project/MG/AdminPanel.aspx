<%@ Page Title="" Language="C#" MasterPageFile="~/MsAdminPanel.master" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">

                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label Text='<%# Eval("Column1") %>' runat="server" ID="Column1Label" />
                                        </h3>
                                    </ItemTemplate>
                                </asp:DataList>
                                <p>مستندات منابع سازمانی</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-android-archive"></i>
                            </div>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="select count(1) from dbo.Tbl_Document"></asp:SqlDataSource>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label Text='<%# Eval("Column1") %>' runat="server" ID="Column1Label" />
                                        </h3>
                                    </ItemTemplate>
                                </asp:DataList>
                                <p>کاربران ثبت شده</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT COUNT(1) FROM dbo.Tbl_User"></asp:SqlDataSource>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label Text='<%# Eval("Column1") %>' runat="server" ID="Column1Label" />
                                        </h3>
                                    </ItemTemplate>
                                </asp:DataList>
                                <p>کل خبرهای سایت</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT COUNT(1) FROM dbo.Tbl_News"></asp:SqlDataSource>

                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label Text='<%# Eval("Column1") %>' runat="server" ID="Column1Label" />
                                        </h3>
                                    </ItemTemplate>
                                </asp:DataList>
                                <p>پرتال طرح ها</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT COUNT(1) FROM [Tbl_Portal]"></asp:SqlDataSource>

                </div>
                <!-- /.row -->
                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-12 connectedSortable">
                        <div class="card card-primary card-outline">
                            <div class="card-header fa fa-envelope">
                                <h3 class="card-title" style="font-family: 'BYek'">اطلاعیه ها</h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm">
                                    </div>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="mailbox-controls">
                                </div>
                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="mailbox-name" style="color: royalblue; font-weight: bold">
                                                            <asp:Label ID="STextNewsLabel" runat="server" Text='<%# Eval("NotifTitle") %>' /></td>
                                                        <td class="mailbox-subject">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("NotifDescription") %>' /></td>
                                                        <td class="mailbox-date">
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("NotifDate") %>' /></td>
                                                        <td class="mailbox-attachment">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NotifTime") %>' /></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Mg_DBConnectionString %>' SelectCommand="SELECT [NotifID], [NotifTitle], [NotifDescription], [NotifDate], [NotifTime] FROM [Tbl_Notification]"></asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>
                                <!-- /.mail-box-messages -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer p-0">
                                <div class="mailbox-controls">
                                </div>
                            </div>
                        </div>
                        <!-- /. box -->
                    </section>
                    <!-- /.Left col -->
                    <!-- right col (We are only adding the ID to make the widgets sortable)-->
                    <section class="col-lg-5 connectedSortable">
                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    
</asp:Content>
