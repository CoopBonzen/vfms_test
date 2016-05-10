<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="Dividend2.aspx.vb" Inherits="VFMS_test2.Dividend2" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>แจกแจงรายการปันผล
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">ปันผล</a></li>
            <li class="active">แจกแจงรายการปันผล</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-6">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">แจงเงินกู้บัญชี 1</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body form-horizontal ">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ดอกเบี้ยรวม</label>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_MoneyLoan1" runat="server" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-6 control-label">แจกแจงบัญชี 1</label>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ปันผล</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_dividend1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_dividend1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">เฉลี่ยคืน</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_return1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_return1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">กรรมการ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_board1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_board1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สาธารณะ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_public1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_public1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">อื่น ๆ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_other1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_other1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ประกันความเสี่ยง</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_risk1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_risk1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สมทบ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_join1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_join1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สวัสดิ์การ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_welfare1" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_welfare1" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label"></label>
                            <div class="col-sm-offset-2 col-xs-12 col-sm-6 col-md-8">

                                <button type="submit" id="btn_Dividend1" class="btn btn-success" runat="server" style="margin-right: 5px;"><i class="fa trash-o">แจกแจง</i></button>
                                <button type="submit" id="btn_Save1" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>

                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <!-- /.box-footer -->
                </div>
            </div>
            <!-- /.col (left) -->
            <div class="col-md-6">

                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">แจงเงินกู้บัญชี 2</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body form-horizontal ">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ดอกเบี้ยรวม</label>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_MoneyLoan2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-6 control-label">แจกแจงบัญชี 2</label>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ปันผล</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_dividend2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_dividend2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">เฉลี่ยคืน</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_return2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_return2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">กรรมการ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_board2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_board2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สาธารณะ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_public2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_public2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">อื่น ๆ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_other2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_other2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">ประกันความเสี่ยง</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_risk2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_risk2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สมทบ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_join2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_join2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">สวัสดิ์การ</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_welfare2" runat="server" class="form-control" Width="100%" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">%</label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_welfare2" runat="server" Text="" Font-Size="16"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <label for="inputPassword3" class="control-label ">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label"></label>
                            <div class="col-sm-offset-2 col-xs-12 col-sm-6 col-md-8">
                                <button type="submit" id="btn_Dividend2" class="btn btn-success" runat="server" style="margin-right: 5px;"><i class="fa trash-o">แจกแจง</i></button>
                                <button type="submit" id="btn_Save2" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col (right) -->
        </div>
        <!-- /.row -->

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการชำระเงินกู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body form-horizontal">
                <div class="form-group">
                    <label for="inputPassword3" class="col-md-6 col-md-offset-2">สรุปปันผล</label>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เงินฝากทั้งหมด</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_total" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">%</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">ปันผลรวม</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_rum" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">%</label>
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-md-2">
                    </div>
                    <div class="col-md-1">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">ปันผลสมาชิก</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_ban" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">บาท</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label"></label>
                    <div class="col-md-2">
                        <button type="submit" id="btn_cal" class="btn btn-success" runat="server" style="margin-right: 5px;"><i class="fa trash-o">คำนวณ</i></button>
                        <button type="submit" id="btn_save3" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>

                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
