Public Class PaymentLoan1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub CIN_cmb_Loan_Callback(ByVal sender As Object, e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Loan.Callback
        'FillAttnCombo(e.Parameter)
        'cmb_Loan.DataBind()

        'If IsNumeric(cmb_Loan.Value) Then
        '    Dim LoanId As Integer = CInt(cmb_Loan.Value)
        '    Dim companyData As  = GetLoanData(LoanId)
        '    txt_tel.Text = companyData.tel_number
        '    txt_fax.Text = companyData.fax
        '    txt_email.Text = companyData.mail
        'End If
    End Sub

    Protected Sub FillAttnCombo(ByVal name As String)
        If String.IsNullOrEmpty(name) Then
            Return
        End If
        Session("Name_ID") = name
    End Sub

    'Public Function GetCompanyData(ByVal companyId As Integer) As vw_Company
    '    'แก้ให้ดึงข้อมูลจาก DB ของ Salesapp
    '    Using ctx As New DlmsDataContext
    '        Dim companyList = (From c In ctx.vw_Companies Where c.prospect_id = companyId).SingleOrDefault
    '        Return companyList
    '    End Using
    'End Function
End Class