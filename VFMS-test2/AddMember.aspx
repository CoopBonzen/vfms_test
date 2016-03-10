<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AddMember.aspx.vb" Inherits="VFMS_test2.AddMember" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>สมัครสมาชิก/เปิดบัญชี
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-home"></i>หน้าแรก</a></li>
            <li><a href="#">สมาชิก</a></li>
            <li class="active">สมัครสมาชิก</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-info">
            <div class="form-horizontal" runat="server">
                <div class="box-header with-border">
                    <h3 class="box-title">กรอกข้อมูล</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">เลขที่สมาชิก</label>
                        <div class="col-sm-10">
                            <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="" Font-Size="16"></asp:Label>
                            <%--<dx:ASPxLabel ID="lbl_Number" runat="server" Class="col-sm-2" ></dx:ASPxLabel>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txt_Name" runat="server" class="form-control" Width="40%"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">ที่อยู่</label>
                        <div class="col-sm-10">
                            <%--<textarea id="txt_Address" runat="server" class="form-control" rows="3">บ้านเลขที่    หมู่ที่ 4 ตำบลมาโมง อำเภอสุคิริน จังหวัดนราธิวาส</textarea>--%>
                            <dx:ASPxMemo ID="ASPx_Address" runat="server" cssclass="form-control" Height="80px" Width="200px" Text="บ้านเลขที่    หมู่ที่ 4 ตำบลมาโมง อำเภอสุคิริน จังหวัดนราธิวาส"></dx:ASPxMemo>
                        </div>
                    </div>
                    <div class="form-group">    
                        <label for="inputPassword3" class="col-sm-2 control-label">เลขที่บัตรประชาชน</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txt_ID" runat="server" class="form-control" placeholder="0-0000-00000-00-0" Width="30%"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">วันที่สมัคร</label>
                        <div class="col-sm-10">
                            <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" CssClass="form-control" Width="20%"></dx:ASPxDateEdit>
                        </div>
                    </div>
                    <div class="form-group">
                        <dx:ASPxLabel ID="lbl_Error" runat="server" Text="" Visible="true" ForeColor="Red" Style="text-align: center">
                        </dx:ASPxLabel>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                           <asp:Button id="btn_Save" runat="server" class="btn btn-info" Text="บันทึก" ></asp:Button>
                            <button type="submit" id="btn_cancel" runat="server" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.box -->

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงสมาชิก</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
               <dx:ASPxGridView ID="gv_addmember" ClientInstanceName="gv_addmember" runat="server" CssClass="table"
                    DataSourceID="sds_addmember" KeyFieldName="mem_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" ReadOnly="True"
                            VisibleIndex="0" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_mem_id" runat="server" Text='<%# Eval("mem_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ-สกุล" FieldName="mem_name" VisibleIndex="1" Width="20%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("mem_name")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ที่อยู่" FieldName="mem_address" VisibleIndex="2"
                            Width="20%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_ContactCompany" runat="server" Text='<%# Bind("mem_address")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขบัตรประชาชน" FieldName="mem_id_card" VisibleIndex="3"
                            Width="20%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_memcard" runat="server" Text='<%# Bind("mem_id_card")%>'>

                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่สมัคร" FieldName="mem_reg_date" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("mem_reg_date", "{0:d/MM/yyyy}")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="5" ShowInCustomizationForm="True"
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
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_addmember" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT mem_id, mem_name, mem_address, mem_id_card, mem_reg_date FROM member"
                    UpdateCommand="UPDATE [member] SET [mem_name] = @mem_name, [mem_address] = @mem_address, [mem_id_card] = @mem_id_card WHERE [mem_id] = @mem_id"
                    DeleteCommand="DELETE FROM [member] WHERE [mem_id] = @mem_id"
                    InsertCommand="INSERT INTO [member] ([mem_id], [mem_name], [mem_address], [mem_id_card], [mem_reg_date]) 
                    VALUES (@mem_id, @mem_name, @mem_address, @mem_id_card, @mem_reg_date)">
                    <DeleteParameters>
                        <asp:Parameter Name="mem_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="mem_name" Type="String" />
                        <asp:Parameter Name="mem_address" Type="String" />
                        <asp:Parameter Name="mem_id_card" Type="String" />
                        <asp:Parameter DbType="Date" Name="mem_reg_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mem_name" Type="String" />
                        <asp:Parameter Name="mem_address" Type="String" />
                        <asp:Parameter Name="mem_id_card" Type="String" />
                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>

</asp:Content>
