﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="Deposit.aspx.vb" Inherits="VFMS_test2.Deposit" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>ฝากเงิน
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-home"></i>หน้าแรก</a></li>
            <li><a href="#">เงินฝาก</a></li>
            <li class="active">ฝากเงิน</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">กรอกข้อมูล</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body form-horizontal ">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เลขที่สมาชิก</label>
                    <div class="col-sm-10">
                        <%--<asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="16"></asp:Label>--%>
                        <dx:ASPxComboBox ID="ASPxCom_Number" runat="server" ValueType="System.String" CssClass="form-control" Width="20%"></dx:ASPxComboBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txt_Name" runat="server" class="form-control" Width="40%"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">วันที่ฝาก</label>
                    <div class="col-sm-10">
                        <dx:ASPxDateEdit ID="ASPxDate" runat="server" CssClass="form-control" Width="20%"></dx:ASPxDateEdit>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">จำนวนเงิน</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_Money" runat="server" class="form-control" Width="80%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">บาท</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" id="btn_Save" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>
                        <button type="submit" id="btn_cancel" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

                    </div>
                </div>
            </div>
        </div>



        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการฝาก</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่รายการ" FieldName="Q_ID" ReadOnly="True"
                            VisibleIndex="0" CellStyle-HorizontalAlign="Center" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="Q_ID" ReadOnly="True"
                            VisibleIndex="0" CellStyle-HorizontalAlign="Center" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ-สกุล" FieldName="Title" VisibleIndex="2" Width="20%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่ฝาก" FieldName="Q_Date" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("Q_Date", "{0:d/MM/yyyy}") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินฝาก" FieldName="attn" VisibleIndex="5"
                            Width="20%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactName" runat="server" Text='<%# Eval("attn") %>'></asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="company_name" VisibleIndex="6"
                            Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="8" ShowInCustomizationForm="True"
                            Width="8%" Caption="แก้ไข">
                            <EditButton Visible="True">
                                <Image AlternateText="Edit" Url="../images/edit.png">
                                </Image>
                            </EditButton>
                            <UpdateButton Visible="True">
                                <Image AlternateText="Update" Url="../images/disk.png">
                                </Image>
                            </UpdateButton>
                            <CancelButton Visible="True">
                                <Image AlternateText="Cancel" Url="../images/cancel.gif">
                                </Image>
                            </CancelButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>