Public Class PaymentLoan1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")

    End Sub

    Private Sub CIN_cmb_Loan_Callback(ByVal sender As Object, e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Loan.Callback
        cmb_Loan.DataBind()
        'ShowData(e.Parameter)
    End Sub


    'Public Function GetCompanyData(ByVal companyId As Integer) As vw_Company
    '    'แก้ให้ดึงข้อมูลจาก DB ของ Salesapp
    '    Using ctx As New DlmsDataContext
    '        Dim companyList = (From c In ctx.vw_Companies Where c.prospect_id = companyId).SingleOrDefault
    '        Return companyList
    '    End Using
    'End Function


    Public Function chkMemberByNO(ByVal lno As String) As member
        Dim loan As New member
        Using ctx = New vfmsDataContext
            loan = (From q In ctx.members Where q.mem_id = lno).SingleOrDefault
        End Using
        Return loan
    End Function

    'Public Sub ShowData(ByVal lno As String)
    '    Using ctx As New vfmsDataContext
    '        Dim loan As New member
    '        loan = chkMemberByNO(lno)
    '        If loan IsNot Nothing Then
    '            btn_Save.Visible = False
    '            'btn_Uploan.Visible = True
    '            With loan

    '                txt_Name.Text = .mem_name

    '            End With

    '        Else

    '            btn_Save.Visible = True
    '            'btn_Uploan.Visible = False
    '            btn_cancel.Visible = True
    '        End If
    '    End Using
    'End Sub

    
End Class