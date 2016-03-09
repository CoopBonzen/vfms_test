Imports System.Data
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxClasses
Imports System.Globalization
Imports System.IO
Imports System.Web.Configuration

Public Class AddLoan1
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If txt_Name.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณาเลือกรหัสสมาชิก"
            lbl_Error.Visible = True
            Return False
        ElseIf ASPxDate.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก วันที่"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Money.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก จำนวนเงินกู้"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_TimeLoan.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก ระยะเวลากู้"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Interest.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก อัตราดอกเบี้ย"
            lbl_Error.Visible = True
            Return False
        Else : lbl_Error.Text = ""
            lbl_Error.Visible = True
            Return True
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login.aspx")


        'RunMemberID()

        'If (Not IsCallback) Then
        '    FillAttnCombo(Session("mem_id"))
        'End If
    End Sub
    'Public Sub RunMemberID()
    '    Using ctx As New vfmsDataContext
    '        Dim MemberID As String = String.Empty
    '        MemberID = "M" & CStr(FindNextMRunningNo(ctx)).PadLeft(3, "0")
    '        lbl_Number.Text = MemberID
    '    End Using
    'End Sub


    'Public Function FindNextMRunningNo(ByVal ctx As vfmsDataContext)
    '    Dim mRunningNo As Integer

    '    mRunningNo = (From g In ctx.members Select CType(g.mem_runningNo, Integer?)).Max.GetValueOrDefault + 1

    '    Return mRunningNo
    'End Function

    'Private Sub cbp_name_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cbp_name.Callback
    '    FillAttnCombo(e.Parameter)

    '    If IsNumeric(cmb_Number.Value) Then
    '        Dim nameId As Integer = CInt(cmb_Number.Value)
    '        Dim nameData As member = GetNameData(nameId)
    '        txt_Name.Text = nameData.mem_name
    '    End If
    'End Sub

    'Private Sub FillAttnCombo(ByRef name As String)
    '    If String.IsNullOrEmpty(name) Then
    '        Return
    '    End If
    '    Session("mem_id") = name
    'End Sub

    'Public Function GetNameData(ByVal nameId As Integer) As member
    '    'แก้ให้ดึงข้อมูลจาก DB ของ Salesapp
    '    Using ctx As New vfmsDataContext
    '        Dim nameList = (From c In ctx.members Where c.mem_id = nameId).SingleOrDefault
    '        Return nameList
    '    End Using
    'End Function


    'Private Sub CIN_cmb_Number_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Number.Callback
    '    FillAttnCombo(e.Parameter)

    '    If IsNumeric(cmb_Number.Value) Then
    '        Dim nameId As Integer = CInt(cmb_Number.Value)
    '        Dim nameData As member = GetNameData(nameId)
    '        cmd_Name.Text = nameData.mem_name
    '    End If
    'End Sub

    'Private Sub cmb_Number_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Number.Callback
    '    FillAttnCombo(e.Parameter)

    '    If IsNumeric(cmb_Number.Value) Then
    '        Dim nameId As Integer = CInt(cmb_Number.Value)
    '        Dim nameData As member = GetNameData(nameId)
    '        txt_Name.Text = nameData.mem_name
    '    End If
    'End Sub

    Public Sub RunMemberID()
        Using ctx As New vfmsDataContext
            Dim MemberID As String = String.Empty
            MemberID = "L-1." & CStr(FindNextMRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = MemberID
        End Using
    End Sub

    Public Function FindNextMRunningNo(ByVal ctx As vfmsDataContext)
        Dim mRunningNo As Integer

        mRunningNo = (From g In ctx.members Select CType(g.mem_runningNo, Integer?)).Max.GetValueOrDefault + 1

        Return mRunningNo
    End Function

    'Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
    '    If Not CheckValidatedata() Then Exit Sub
    '    Using ctx As New vfmsDataContext
    '        Try
    '            'Dim maxId = (From r In ctx.members Select CType(r.mem_runningNo, Integer?)).Max
    '            'Dim nextId = If(maxId.HasValue, maxId + 1, 1)
    '            'Dim memberNo As String = cmb_Number.Text.Trim
    '            'Dim memberName As String = txt_Name.Text.Trim
    '            ''Dim memberAttn As String = ASPx_Address.Text.Trim
    '            'Dim TbMenber As New member
    '            'With TbMenber
    '            '    .mem_id = memberNo
    '            '    .mem_name = memberName
    '            '    .mem_address = memberAttn
    '            '    '.mem_id_card = txt_ID.Text.Trim
    '            '    '.mem_reg_date = ASPxDateEdit1.Text.Trim
    '            '    .mem_runningNo = nextId

    '            End With
    '            ctx.members.InsertOnSubmit(TbMenber)
    '            ctx.SubmitChanges()

    '        Catch ex As Exception
    '            Throw ex
    '        End Try

    '    End Using
    'End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        cmb_Number.Text = ""
        txt_Name.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
        txt_TimeLoan.Text = ""
        txt_Interest.Text = ""

    End Sub
End Class