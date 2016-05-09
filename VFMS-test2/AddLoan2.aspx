<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AddLoan2.aspx.vb" Inherits="VFMS_test2.AddLoan2" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script lang="javascript" type="text/javascript">
        function OnFileUploadComplete(s, e) {
            btnUpdate.DoClick();
        }
    </script>
    <!-- Main content -->
    <section class="content-header ">
        <h1>เพิ่มรายชื่อผู้กู้บัญชี 2
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 2</a></li>
            <li class="active">เพิ่มรายชื่อผู้กู้</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <%--<div class="row">--%>
        <%--<div class="col-md-6">--%>

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
                            CssClass="form-control" Width="20%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="10">
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
                        <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="14"></asp:Label>
                        <%--<dx:ASPxLabel ID="lbl_Number" runat="server" Class="col-sm-2" ></dx:ASPxLabel>--%>
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
                        <asp:TextBox ID="txt_Money" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">บาท</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ระยะเวลากู้</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_TimeLoan" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">เดือน</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txt_Interest" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                        <label for="inputPassword3" class="col-sm-2 control-label">%</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">ผู้ค่ำคนที่ 1</label>
                    <div class="col-sm-10">
                        <dx:ASPxComboBox ID="cmb_con1" ClientInstanceName="CIN_cmb_con1" runat="server"
                            CssClass="form-control" Width="20%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member1" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="10">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnName1(e);}" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="lds_Member1" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
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
                            CssClass="form-control" Width="20%" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                            DataSourceID="lds_Member2" TextField="mem_id" ValueField="mem_name"
                            EnableCallbackMode="True" CallbackPageSize="20" Font-Size="10">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { OnName2(e);}" />
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="lds_Member2" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
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
                        <button type="button" id="btn_Uploan" runat="server" class="btn btn-danger">อัปเดต</button>
                        <button type="submit" id="btn_cancel" runat="server" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

                    </div>
                </div>
            </div>
        </div>
        <%-- </div>--%>
        <!-- /.col (left) -->
        <%-- <div class="col-md-6">

                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">อับโหลดเอกสาร</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body form-horizontal ">
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">อับโหลด</label>
                            <div class="col-sm-2">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

                                <dx:ASPxUploadControl ID="ulc_GeneralFile" runat="server" ShowUploadButton="True"
                                    ShowProgressPanel="True" OnFileUploadComplete="UploadControl_FileUploadComplete"
                                    Width="280px">
                                    <ValidationSettings AllowedFileExtensions=".pdf,.doc,.docx,.xlsx,.xls" ShowErrors="false" />
                                    <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
                                </dx:ASPxUploadControl>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">เอกสารทั้งหมด</label>
                            <div class="col-sm-10">
                                <dx:ASPxGridView ID="gv_GFile" runat="server" Width="100%" KeyFieldName="G_FileID">
                                    <Settings ShowColumnHeaders="false" />
                                    <Columns>
                                        <dx:GridViewDataColumn>
                                            <DataItemTemplate>
                                                <asp:HyperLink ID="Link" runat="server" NavigateUrl='<%#Eval("link") %>' ForeColor="#6798de"
                                                    ToolTip='<%#Eval("filename")%>'><%#Eval("filename")%>
                                                </asp:HyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>
                                        <dx:GridViewDataDateColumn FieldName="G_FileDate" Visible="false" SortOrder="Descending">
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <!-- /.box-footer -->
                </div>
            </div>--%>
        <!-- /.col (right) -->

        <%--</div>
        <!-- /.row -->--%>

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายชื่อผู้กู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="gv_showloan2" ClientInstanceName="gv_showloan2" runat="server" CssClass="table" DataSourceID="sds_showloan1" KeyFieldName="lmem2_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้เงิน" FieldName="lmem2_id" VisibleIndex="1" Width="5%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <DataItemTemplate>
                                <asp:LinkButton ID="lnk_MId" runat="server" Text='<%# Eval("lmem2_id")%>' CommandName="AddLoanMember2"
                                    CommandArgument='<%# Eval("lmem2_id")%>' OnCommand="ListItem_Command">
                                </asp:LinkButton>
                            </DataItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="lbl_lmemId" runat="server" Text='<%# Eval("lmem1_id")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" VisibleIndex="2"
                            Width="5%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memId" runat="server" Text='<%# Eval("mem_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="mem_name" VisibleIndex="3"
                            Width="15%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memName" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินกู้" FieldName="cacc2_amount" VisibleIndex="4" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("cacc2_amount")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ระยะเวลากู้" FieldName="cacc2_period" VisibleIndex="5" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("cacc2_period")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ดอกเบี้ย" FieldName="cacc2_int_rate" VisibleIndex="6" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("cacc2_int_rate")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 1" FieldName="cacc2_person1" VisibleIndex="7" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("cacc2_person1")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 2" FieldName="cacc2_person2" VisibleIndex="8" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("cacc2_person2")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="9" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("booking_by")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="10" ShowInCustomizationForm="True"
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
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" />
                    <SettingsPager Visible="True">
                    </SettingsPager>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_showloan1" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT  loan_member_acc2.lmem2_id ,loan_member_acc2.mem_id ,loan_member_acc2.lmem2_reg_date ,loan_member_acc2.cacc2_amount,
                                            loan_member_acc2.cacc2_period ,loan_member_acc2.cacc2_int_rate ,loan_member_acc2.cacc2_person1 ,loan_member_acc2.cacc2_person2,
                                            loan_member_acc2.booking_by ,member.mem_name  
                                            FROM loan_member_acc2 
                                            INNER JOIN member ON loan_member_acc2.mem_id = member.mem_id"
                    UpdateCommand="UPDATE [loan_member_acc2] SET  [cacc2_amount] = @cacc2_amount ,[cacc2_period] = @cacc2_period ,[cacc2_int_rate] = @cacc2_int_rate ,[cacc2_person1] = @cacc2_person1,
                                            [cacc2_person2] = @cacc2_person2 WHERE [lmem2_id] = @lmem2_id"
                    DeleteCommand="DELETE FROM [loan_member_acc2] WHERE [lmem2_id] = @lmem2_id"
                    InsertCommand="INSERT INTO [loan_member_acc2] ([lmem2_id], [mem_id], [cacc2_amount], [cacc2_period], [cacc2_int_rate], [cacc2_person1], [cacc2_person2], [booking_by]) 
                                            VALUES (@lmem2_id, @mem_id, @cacc2_amount, @cacc2_period, @cacc2_int_rate, @cacc2_person1, @cacc2_person2, @booking_by)">
                    <DeleteParameters>
                        <asp:Parameter Name="lmem2_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="lmem2_id" Type="String" />
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="cacc2_amount" Type="String" />
                        <asp:Parameter Name="cacc2_period" Type="String" />
                        <asp:Parameter Name="cacc2_int_rate" Type="String" />
                        <asp:Parameter Name="cacc2_person1" Type="String" />
                        <asp:Parameter Name="cacc2_person2" Type="String" />
                        <asp:Parameter Name="booking_by" Type="String" />
                        <asp:Parameter DbType="Date" Name="lmem1_reg_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cacc2_amount" Type="String" />
                        <asp:Parameter Name="cacc2_period" Type="String" />
                        <asp:Parameter Name="cacc2_int_rate" Type="String" />
                        <asp:Parameter Name="cacc2_person1" Type="String" />
                        <asp:Parameter Name="cacc2_person2" Type="String" />
                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
