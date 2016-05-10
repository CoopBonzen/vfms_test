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
                    <label for="inputPassword3" class="col-sm-2 control-label">เลขที่ทำรายการ</label>
                    <div class="col-sm-10">
                        <dx:ASPxLabel ID="lbl_Numberloan" runat="server" Width="40%" Height="10px" Font-Size="10"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เลขที่สมาชิก</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_Number" ClientInstanceName="CIN_cmb_Number" runat="server"
                            CssClass="form-control" Width="20%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_id"
                            EnableCallbackMode="True" CallbackPageSize="20">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { CIN_cmb_Loan.PerformCallback(CIN_cmb_Number.GetValue()); btnNameClick(); }" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="lds_Member" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            Select="new (mem_id, lmem1_id)" TableName="loan_member_acc1s" EntityTypeName="">
                        </asp:LinqDataSource>
                        <script type="text/javascript">
                            function btnNameClick() {
                                var btn = document.getElementById('<%=btnName.ClientID%>');
                                btn.click();
                            }
                        </script>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="btnName" runat="server" Text="Check" Width="20px" Height="17px"
                            Style="visibility: hidden;" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">เลขที่ผู้กู้</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_Loan" ClientInstanceName="CIN_cmb_Loan" runat="server"
                            Width="20%" CssClass="form-control" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="ldr_Loan" TextField="lmem1_id" ValueField="lmem1_id" EnableCallbackMode="True" CallbackPageSize="20">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { btnCheckClick(); }" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="ldr_Loan" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                            TableName="loan_member_acc1s" Where="mem_id == @Name">
                            <WhereParameters>
                                <asp:ControlParameter Name="Name" Type="String" ControlID="cmb_Number" PropertyName="Value"
                                    DefaultValue="1" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <script type="text/javascript">
                            function btnCheckClick() {
                                var btn = document.getElementById('<%=btnCheck.ClientID %>');
                                btn.click();
                            }
                        </script>
                        <%--<script type="text/javascript">

                            function OnData(cmb_Loan) {
                                CIN_cmb_Loan.PerformCallback(cmb_Loan.GetValue());
                            }

                        </script>--%>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="btnCheck" runat="server" Text="Check" Width="20px" Height="17px"
                            Style="visibility: hidden;" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                    <div class="col-sm-6">
                        <dx:ASPxLabel ID="txt_Name" runat="server" ClientInstanceName="CIN_txt_Name" Width="170px" Font-Size="12"></dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                    <div class="col-sm-2">
                        <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="12"></asp:Label>
                    </div>
                    <div class="col-md-1">
                        <label for="inputPassword3" class="control-label ">บาท</label>
                    </div>
                </div>
                <%--<div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ระยะเวลากู้</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_TimeLoan" runat="server" class="form-control" Width="80%"></asp:TextBox>
                    </div>
                    <div class="col-md-2 ">
                        <label for="inputPassword3" class="control-label">เดือน</label>
                    </div>
                </div>--%>
                <div class="form-group">
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">เงินต้นคงค้าง</label>
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
                        <dx:ASPxLabel ID="lbl_Error" runat="server" Text="" Visible="true" ForeColor="Red" Style="text-align: center">
                        </dx:ASPxLabel>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-offset-2 col-xs-12 col-sm-6 col-md-8">

                        <button type="submit" id="btn_Save" runat="server" class="btn btn-info "><i class="fa fa-save">&nbsp;บันทึก</i></button>
                        <button type="button" id="btn_Uploan" runat="server" class="btn btn-danger">อัปเดต</button>
                        <button type="submit" id="btn_cancel" runat="server" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

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
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table" DataSourceID="sds_loan_acc1" KeyFieldName="la1_trans_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่รายการ" FieldName="la1_trans_id" VisibleIndex="1"
                            Width="8%">
                            <DataItemTemplate>
                                <asp:LinkButton ID="lnk_DId" runat="server" Text='<%# Eval("la1_trans_id")%>' CommandName="PaymentLoan1"
                                    CommandArgument='<%# Eval("la1_trans_id")%>' OnCommand="ListItem_Command">
                                </asp:LinkButton>
                            </DataItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Number" runat="server" Text='<%# Eval("la1_trans_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้" FieldName="lmem1_id" VisibleIndex="2"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Loan" runat="server" Text='<%# Eval("lmem1_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="mem_name" VisibleIndex="3"
                            Width="15%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่ฝาก" FieldName="la1_trans_timestamp" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("la1_trans_timestamp", "{0:d/MM/yyyy}")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="เงินต้น" FieldName="cacc1_amount" VisibleIndex="5"
                            Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Money" runat="server" Text='<%# Eval("cacc1_amount")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชำระเงินต้น" FieldName="la1_trans_amount" VisibleIndex="6" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_amount")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชำระดอกเบี้ย" FieldName="la1_trans_rate" VisibleIndex="7" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_rate")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ยอดคงเหลือ" FieldName="la1_trans_balance" VisibleIndex="8" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_balance")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="9" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("booking_by")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_loan_acc1" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT loan_acc1_transaction.la1_trans_id , loan_acc1_transaction.lmem1_id , loan_acc1_transaction.la1_trans_timestamp , loan_acc1_transaction.la1_trans_amount,
                                        loan_acc1_transaction.la1_trans_rate ,loan_acc1_transaction.la1_trans_balance ,loan_acc1_transaction.booking_by , loan_member_acc1.mem_id ,loan_member_acc1.cacc1_amount , member.mem_name  
                                        FROM loan_acc1_transaction
                                        INNER JOIN loan_member_acc1  ON loan_acc1_transaction.lmem1_id = loan_member_acc1.lmem1_id
                                        INNER JOIN member  ON loan_member_acc1.mem_id = member.mem_id"
                    UpdateCommand="UPDATE [loan_acc1_transaction] SET  [la1_trans_amount] = @la1_trans_amount WHERE [la1_trans_id] = @la1_trans_id"
                    DeleteCommand="DELETE FROM [loan_acc1_transaction] WHERE [la1_trans_id] = @la1_trans_id"
                    InsertCommand="INSERT INTO [loan_acc1_transaction] ([la1_trans_id], [lmem1_id], [la1_trans_timestamp], [la1_trans_amount], [la1_trans_rate], [la1_trans_balance], [booking_by], [mem_id], [cacc1_amount], [mem_name]) 
                        VALUES (@la1_trans_id, @lmem1_id, @la1_trans_timestamp, @la1_trans_amount, @la1_trans_rate, @la1_trans_balance, @booking_by, @mem_id, @cacc1_amount, @mem_name)">
                    <DeleteParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />
                        <asp:Parameter Name="lmem1_id" Type="String" />
                        <asp:Parameter Name="la1_trans_amount" Type="String" />
                        <asp:Parameter Name="la1_trans_rate" Type="String" />
                        <asp:Parameter Name="la1_trans_balance" Type="String" />
                        <asp:Parameter Name="booking_by" Type="String" />
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="mem_name" Type="String" />
                        <asp:Parameter Name="cacc1_amount" Type="String" />
                        <asp:Parameter DbType="Date" Name="la1_trans_timestamp" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />

                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
