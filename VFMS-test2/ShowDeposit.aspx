<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="ShowDeposit.aspx.vb" Inherits="VFMS_test2.ShowDeposit" %>

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
            <li class="active">แสดงฝากเงินทั้งหมด</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการฝากทั้งหมด</h3>
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
