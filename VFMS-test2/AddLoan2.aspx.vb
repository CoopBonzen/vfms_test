Public Class AddLoan2
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

    End Sub

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        'If Not CheckValidatedata() Then Exit Sub
        'Using ctx As New vfmsDataContext
        '    Try
        '        Dim maxId = (From r In ctx.members Select CType(r.mem_runningNo, Integer?)).Max
        '        Dim nextId = If(maxId.HasValue, maxId + 1, 1)
        '        Dim memberNo As String = cmb_Number.Text.Trim
        '        Dim memberName As String = txt_Name.Text.Trim
        '        'Dim memberAttn As String = ASPx_Address.Text.Trim
        '        Dim TbMenber As New member
        '        With TbMenber
        '            .mem_id = memberNo
        '            .mem_name = memberName
        '            .mem_address = memberAttn
        '            '.mem_id_card = txt_ID.Text.Trim
        '            '.mem_reg_date = ASPxDateEdit1.Text.Trim
        '            .mem_runningNo = nextId

        '        End With
        '        ctx.members.InsertOnSubmit(TbMenber)
        '        ctx.SubmitChanges()

        '    Catch ex As Exception
        '        Throw ex
        '    End Try

        'End Using
    End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        cmb_Number.Text = ""
        txt_Name.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
        txt_TimeLoan.Text = ""
        txt_Interest.Text = ""
    End Sub
End Class