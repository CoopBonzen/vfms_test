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
        If cmb_Number.Text.Trim = String.Empty Then
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
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")


        RunLoanID()
        gv_showloan1.DataBind()
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

    Public Sub RunLoanID()
        Using ctx As New vfmsDataContext
            Dim LoanID As String = String.Empty
            LoanID = "L1-" & CStr(FindNextLRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = LoanID
        End Using
    End Sub

    Public Function FindNextLRunningNo(ByVal ctx As vfmsDataContext)
        Dim lRunningNo As Integer

        lRunningNo = (From g In ctx.loan_account1s Select CType(g.la1_id, Integer?)).Max.GetValueOrDefault + 1

        Return lRunningNo
    End Function

    Public Function FindNextARunningNo(ByVal ctx As vfmsDataContext)
        Dim aRunningNo As Integer

        aRunningNo = (From g In ctx.loan_account1s Select CType(g.la1_id, Integer?)).Max.GetValueOrDefault + 1

        Return aRunningNo
    End Function

    Public Function FindNextCRunningNo(ByVal ctx As vfmsDataContext)
        Dim cRunningNo As Integer

        cRunningNo = (From g In ctx.contract_acc1s Select CType(g.contract1_no, Integer?)).Max.GetValueOrDefault + 1

        Return cRunningNo
    End Function

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim maxId = (From r In ctx.loan_members Select CType(r.lmem_runningNo, Integer?)).Max
                Dim nextId = If(maxId.HasValue, maxId + 1, 1)
                Dim loanNo As String = lbl_Number.Text.Trim
                Dim accNo As String = CStr(FindNextARunningNo(ctx)).PadLeft(3, "0")
                Dim conNO As String = CStr(FindNextCRunningNo(ctx)).PadLeft(3, "0")
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim TbLoan As New loan_member
                Dim TbAcc As New loan_account1
                Dim TbCon As New contract_acc1
                With TbLoan
                    .lmem_id = loanNo
                    .mem_id = memberNo
                    .lmem_reg_date = ASPxDate.Text.Trim
                    .lmem_runningNo = nextId

                End With
                ctx.loan_members.InsertOnSubmit(TbLoan)

                With TbAcc
                    .la1_id = accNo
                    .lmem_id = loanNo
                    .la1_balance = txt_Money.Text
                    .la1_period = txt_TimeLoan.Text.Trim
                End With
                ctx.loan_account1s.InsertOnSubmit(TbAcc)

                With TbCon
                    .contract1_no = conNO
                    .la1_id = accNo
                    .cacc1_amount = txt_Money.Text
                    .cacc1_period = txt_TimeLoan.Text.Trim
                    .cacc1_int_rate = txt_Interest.Text.Trim
                    .cacc1_person1 = cmb_con1.Text.Trim
                    .cacc1_person2 = cmb_con2.Text.Trim

                End With
                ctx.contract_acc1s.InsertOnSubmit(TbCon)
                ctx.SubmitChanges()
                gv_showloan1.DataBind()
            Catch ex As Exception
                Throw ex
            End Try

        End Using
    End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        cmb_Number.Text = ""
        txt_Name.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
        txt_TimeLoan.Text = ""
        txt_Interest.Text = ""
        cmb_con1.Text = ""
        cmb_con2.Text = ""

    End Sub

  
End Class