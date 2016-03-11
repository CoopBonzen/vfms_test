<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="PaymentLoan1.aspx.vb" Inherits="VFMS_test2.PaymentLoan1" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>ชำระเงินกู้บัญชี 1
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 1</a></li>
            <li class="active">ชำระเงินกู้บัญชี 1</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-header with-border">
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
                        <dx:ASPxComboBox ID="cmb_Number" ClientInstanceName="CIN_cmb_Number" runat="server"
                            Width="20%" Height="20px"
                            DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_id"
                            EnableCallbackMode="True" CallbackPageSize="20">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {OnValueChanged(s); }"></ClientSideEvents>
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="lds_Member" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            Select="new (mem_id, mem_name)"
                            TableName="members" EntityTypeName="">
                        </asp:LinqDataSource>
                        <script type="text/javascript">

                            function OnValueChanged(CIN_cmb_Number) {
                                CIN_cmb_Loan.PerformCallback(CIN_cmb_Number.GetValue().toString());

                            }

                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เลขที่ผู้กู้</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_Loan" ClientInstanceName="CIN_cmb_Loan" runat="server"
                            Width="20%" Height="20px"
                            DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="ldr_Loan" TextField="lmem_id" ValueField="lmem_id">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnData(s); }"></ClientSideEvents>
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="ldr_Loan" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            TableName="loan_members" Where="mem_id == @Name">
                            <WhereParameters>
                                <asp:ControlParameter Name="Name" Type="String" ControlID="cmb_Number" PropertyName="Value"
                                    DefaultValue="1" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <script type="text/javascript">

                            function OnData(cmb_Loan) {
                                CIN_cmb_Loan.PerformCallback(cmb_Loan.GetValue());
                            }

                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-6">
                        <dx:ASPxLabel ID="txt_Name" runat="server" ClientInstanceName="CIN_txt_Name" Width="170px"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="16"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ระยะเวลากู้</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_TimeLoan" runat="server" class="form-control" Width="80%"></asp:TextBox>
                    </div>
                    <div class="col-md-2 ">
                        <label for="inputPassword3" class="control-label">เดือน</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">เงินต้น</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_Money1" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">บาท</label>
                    </div>
                    <div class="col-xs-4 col-sm-1 control-label">
                        <label for="inputPassword3">ชำระเงินต้น</label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_Money2" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">บาท</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_Interest1" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-xs-4 col-sm-1">
                        <label for="inputPassword3" class="control-label">เปอร์เซ็น</label>
                    </div>
                    <div class="col-xs-4 col-sm-1 control-label">
                        <label for="inputPassword3">ชำระดอกเบี้ย</label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txt_Interest2" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">บาท</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-offset-2 col-xs-12 col-sm-6 col-md-8">

                        <button type="submit" id="btn_Save" runat="server" class="btn btn-info "><i class="fa fa-save">&nbsp;บันทึก</i></button>
                        <button type="submit" id="btn_cancel" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

                    </div>
                </div>
            </div>
        </div>

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการชำระเงินกู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้" FieldName="Q_Date" VisibleIndex="2"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="company_name" VisibleIndex="4"
                            Width="15%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เงินต้น" FieldName="company_name" VisibleIndex="4"
                            Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ระยะเวลากู้" FieldName="Title" VisibleIndex="6" Width="8%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชำระแล้ว" FieldName="Title" VisibleIndex="7" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ดอกเบี้ย" FieldName="Title" VisibleIndex="8" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ยอดคงเหลือ" FieldName="Title" VisibleIndex="9" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="พนักงาน" FieldName="Title" VisibleIndex="10" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="15" ShowInCustomizationForm="True"
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
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsPager Visible="False">
                    </SettingsPager>
                </dx:ASPxGridView>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
