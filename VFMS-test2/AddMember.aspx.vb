Imports System.Data
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Configuration
Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxClasses.Internal

Public Class AddMember
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If txt_Name.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก ชื่อ-สกุล"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Address.Text.Trim = "บ้านเลขที่    หมู่ที่ 4 ตำบลมาโมง อำเภอสุคิริน จังหวัดนราธิวาส" Then
            lbl_Error.Text = "กรุณากรอก ที่อยู่"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_ID.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก เลขบัตรประชาชน"
            lbl_Error.Visible = True
            Return False
        ElseIf ASPxDateEdit1.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก วันที่"
            lbl_Error.Visible = True
            Return False
        Else : lbl_Error.Text = ""
            lbl_Error.Visible = True
            'CheckID()
            Return True
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
        Dim RequestMId = Request.QueryString("mId")

        If Not IsPostBack Then
            AddDataInForm(RequestMId)
        End If
    End Sub

    Public Sub RunMemberID()
        Using ctx As New vfmsDataContext
            Dim MemberID As String = String.Empty
            MemberID = "M" & CStr(FindNextMRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = MemberID
        End Using
    End Sub

    Public Function FindNextMRunningNo(ByVal ctx As vfmsDataContext)
        Dim mRunningNo As Integer
        mRunningNo = (From g In ctx.members Select CType(g.mem_runningNo, Integer?)).Max.GetValueOrDefault + 1

        Return mRunningNo
    End Function

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        clean()
        RunMemberID()
        btn_Save.Visible = True
        btn_Uploan.Visible = False
    End Sub

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim maxId = (From r In ctx.members Select CType(r.mem_runningNo, Integer?)).Max
                Dim nextId = If(maxId.HasValue, maxId + 1, 1)
                Dim memberNo As String = lbl_Number.Text.Trim
                Dim memberName As String = txt_Name.Text.Trim
                Dim memberAttn As String = txt_Address.Text.Trim
                Dim TbMenber As New member
                With TbMenber
                    .mem_id = memberNo
                    .mem_name = memberName
                    .mem_address = memberAttn
                    .mem_id_card = txt_ID.Text.Trim
                    .mem_reg_date = ASPxDateEdit1.Text.Trim
                    .mem_runningNo = nextId

                End With
                ctx.members.InsertOnSubmit(TbMenber)
                ctx.SubmitChanges()
                Dim addAccont As New deposit_account
                With addAccont
                    .mem_id = memberNo
                    .depo_total = "0"
                End With
                ctx.deposit_accounts.InsertOnSubmit(addAccont)
                ctx.SubmitChanges()
            Catch ex As Exception
                Throw ex
            End Try
        End Using
        gv_addmember.DataBind()
        RunMemberID()
        clean()
    End Sub

    Private Sub btn_Uploan_ServerClick(sender As Object, e As EventArgs) Handles btn_Uploan.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Dim memberNo As String = lbl_Number.Text.Trim
            Dim memberName As String = txt_Name.Text.Trim
            Dim memberAttn As String = txt_Address.Text.Trim
            'Dim TbMenber As New member
            Dim TbMenber = (From M In ctx.members Where M.mem_id = memberNo).SingleOrDefault
            With TbMenber
                '.mem_id = memberNo
                .mem_name = memberName
                .mem_address = memberAttn
                .mem_id_card = txt_ID.Text.Trim
                .mem_reg_date = ASPxDateEdit1.Text.Trim

            End With
            ctx.SubmitChanges()
            MsgBox("อัปเดตข้อมูลแล้ว")
        End Using
        Response.Redirect("AddMember.aspx")
        'RunMemberID()
        'clean()
        'gv_addmember.DataBind()
        'btn_Save.Visible = True
        'btn_Uploan.Visible = False
    End Sub

    Private Sub gv_addmember_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs) Handles gv_addmember.CustomCallback
        gv_addmember.DataBind()
    End Sub

    'Private Function CheckID() As Boolean

    '    Dim idc As String
    '    Dim num As Integer = 0
    '    Dim i As Integer
    '    Try
    '        idc = txt_ID.Text.Trim.Replace("-", "")
    '        For i = 0 To 11
    '            num += idc.Substring(i, 1) * (13 - i)
    '        Next
    '        num = num Mod (11)
    '        If num = 0 Or num = 1 Then
    '            If num = 0 Then
    '                num = 1
    '            Else
    '                num = 0
    '            End If
    '        Else
    '            num = 11 - num
    '        End If
    '        If num = idc.Substring(12, 1) Then
    '            Return True
    '        End If
    '    Catch ex As Exception
    '        lbl_Error.Text = "Eror"
    '        lbl_Error.Visible = True
    '        Return False
    '    End Try
    'End Function

    Sub clean()
        txt_Name.Text = ""
        txt_ID.Text = ""
        txt_Address.Text = "บ้านเลขที่    หมู่ที่ 4 ตำบลมาโมง อำเภอสุคิริน จังหวัดนราธิวาส"
        ASPxDateEdit1.Text = ""
    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddMember"
                Response.Redirect("AddMember.aspx?mId=" & e.CommandArgument)
        End Select
    End Sub

    Public Sub AddDataInForm(ByVal M_No)
        lbl_Number.Text = M_No
        ShowData(M_No)
    End Sub

    Public Function chkMemberByNO(ByVal mno As String) As member
        Dim member As New member
        Using ctx = New vfmsDataContext
            member = (From q In ctx.members Where q.mem_id = mno).SingleOrDefault
        End Using
        Return member
    End Function

    Public Sub ShowData(ByVal mno As String)
        Dim mem As New member
        mem = chkMemberByNO(mno)
        If mem IsNot Nothing Then
            btn_Save.Visible = False
            btn_Uploan.Visible = True
            btn_cancel.Visible = True
            With mem

                lbl_Number.Text = .mem_id
                txt_Name.Text = .mem_name
                txt_Address.Text = .mem_address
                txt_ID.Text = .mem_id_card
                ASPxDateEdit1.Text = .mem_reg_date

            End With
        Else
            RunMemberID()
            btn_Save.Visible = True
            btn_Uploan.Visible = False
            btn_cancel.Visible = True
        End If
    End Sub

    'Private Function GetQuotationDate(ByVal mId As String) As String
    '    Using ctx As New vfmsDataContext
    '        Dim Member As String = (From q In ctx.members _
    '                                    Where q.mem_id = mId Select q.mem_reg_date).SingleOrDefault
    '        Return Member
    '    End Using
    'End Function

 
End Class