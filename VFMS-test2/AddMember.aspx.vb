Imports System.Data
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Configuration


Public Class AddMember
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If txt_Name.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก ชื่อ-สกุล"
            lbl_Error.Visible = True
            Return False
        ElseIf ASPx_Address.Text.Trim = String.Empty Then
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
            Return True
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login.aspx")


        RunMemberID()

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
        txt_Name.Text = ""
        txt_ID.Text = ""
        ASPx_Address.Text = ""
        ASPxDateEdit1.Text = ""

    End Sub

    Private Sub btn_Save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Save.Click
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim maxId = (From r In ctx.members Select CType(r.mem_runningNo, Integer?)).Max
                Dim nextId = If(maxId.HasValue, maxId + 1, 1)
                Dim memberNo As String = lbl_Number.Text.Trim
                Dim memberName As String = txt_Name.Text.Trim
                Dim memberAttn As String = ASPx_Address.Text.Trim
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
    End Sub

    Private Sub gv_addmember_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs) Handles gv_addmember.CustomCallback
        gv_addmember.DataBind()
    End Sub

End Class