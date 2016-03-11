<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AddLoan1.aspx.vb" Inherits="VFMS_test2.AddLoan1" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <script lang="javascript" type="text/javascript">

        function OnName(cmd_Number) {
            cmd.PerformCallback(cmd_Number.GetValue());
        }

    </script>--%>
    <!-- Main content -->
    <section class="content-header ">
        <h1>เพิ่มรายชื่อผู้กู้บัญชี 1
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 1</a></li>
            <li class="active">เพิ่มรายชื่อผู้กู้</li>
        </ol>
    </section>

    <!-- Main content -->
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
                            CssClass="form-control" Width="27%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="15">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnName(e);}" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="lds_Member" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            Select="new (mem_name, mem_id)" TableName="members" EntityTypeName="">
                        </asp:LinqDataSource>
                        <script lang="javascript" type="text/javascript">

                            function OnName(e) {
                                var name = CIN_cmb_Number.GetValue();
                                CIN_txt_Name.SetValue(name);
                            }

                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-10">
                        <dx:ASPxLabel ID="txt_Name" runat="server" ClientInstanceName="CIN_txt_Name" Width="170px"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เลขที่ผู้กู้</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Font-Size="16"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">วันที่กู้</label>
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
                    <label for="inputPassword3" class="col-sm-2 control-label">ระยะเวลากู้</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_TimeLoan" runat="server" class="form-control" Width="80%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">เดือน</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_Interest" runat="server" class="form-control" Width="80%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">เปอร์เซ็น</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ผู้ค่ำคนที่ 1</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_con1" ClientInstanceName="CIN_cmb_con1" runat="server"
                            CssClass="form-control" Width="27%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="15">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnName1(e);}" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            Select="new (mem_name, mem_id)" TableName="members" EntityTypeName="">
                        </asp:LinqDataSource>
                        <script lang="javascript" type="text/javascript">

                            function OnName1(e) {
                                var name = CIN_cmb_con1.GetValue();
                                CIN_txt_Name1.SetValue(name);
                            }

                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-10">
                        <dx:ASPxLabel ID="txt_Name1" runat="server" ClientInstanceName="CIN_txt_Name1" Width="170px"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ผู้ค่ำคนที่ 2</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_con2" ClientInstanceName="CIN_cmb_con2" runat="server"
                            CssClass="form-control" Width="27%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="15">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnName2(e);}" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            Select="new (mem_name, mem_id)" TableName="members" EntityTypeName="">
                        </asp:LinqDataSource>
                        <script lang="javascript" type="text/javascript">

                            function OnName2(e) {
                                var name = CIN_cmb_con2.GetValue();
                                CIN_txt_Name2.SetValue(name);
                            }

                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-10">
                        <dx:ASPxLabel ID="txt_Name2" runat="server" ClientInstanceName="CIN_txt_Name2" Width="170px"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <dx:ASPxLabel ID="lbl_Error" runat="server" Text="" Visible="true" ForeColor="Red" Style="text-align: center">
                    </dx:ASPxLabel>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" id="btn_Save" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>
                        <button type="submit" id="btn_cancel" runat="server" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

                    </div>
                </div>
            </div>
        <!-- /.box-body -->
        <!-- /.box-footer -->
        </div>



        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายชื่อผู้กู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                 <dx:ASPxGridView ID="gv_showloan1" runat="server" CssClass="table" DataSourceID="sds_showloan1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" VisibleIndex="2"
                            Width="5%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memId" runat="server" Text='<%# Eval("mem_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="mem_name" VisibleIndex="4"
                            Width="15%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memName" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้เงิน" FieldName="lmem_id" VisibleIndex="9" Width="5%">
                            <EditItemTemplate>
                                <asp:TextBox ID="lbl_lmemId" runat="server" Text='<%# Eval("lmem_id")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินกู้" FieldName="cacc1_amount" VisibleIndex="10" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("cacc1_amount")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ระยะเวลากู้" FieldName="cacc1_period" VisibleIndex="11" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("cacc1_period")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ดอกเบี้ย" FieldName="cacc1_int_rate" VisibleIndex="12" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("cacc1_int_rate")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 1" FieldName="cacc1_person1" VisibleIndex="13" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("cacc1_person1")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 2" FieldName="cacc1_person2" VisibleIndex="14" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("cacc1_person2")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="15" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("booking_by")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsPager Visible="True">
                    </SettingsPager>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_showloan1" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT loan_member.mem_id, member.mem_name, loan_account1.lmem_id, cacc1_amount, cacc1_period, cacc1_int_rate, cacc1_person1, cacc1_person2, loan_account1.booking_by
                    FROM contract_acc1
                    INNER JOIN loan_account1 ON contract_acc1.la1_id = loan_account1.la1_id
                    INNER JOIN loan_member ON loan_account1.lmem_id = loan_member.lmem_id
                    INNER JOIN member ON loan_member.mem_id = member.mem_id">

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>

</asp:Content>
