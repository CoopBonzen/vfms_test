Public Class Dividend2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
        RunLoanID()
    End Sub

    Public Sub RunLoanID()
        Using ctx As New vfmsDataContext
            Dim total = (From q In ctx.loan_acc1_transactions Select q.la1_trans_rate).Sum
            lbl_MoneyLoan1.Text = total
            Dim total1 = (From q In ctx.loan_acc2_transactions Select q.la2_trans_rate).Sum
            lbl_MoneyLoan2.Text = total1

            Dim total3 = (From q In ctx.deposit_accounts Select q.depo_total).Sum
            txt_total.Text = total3
        End Using
    End Sub

   
    Private Sub btn_Dividend1_ServerClick(sender As Object, e As EventArgs) Handles btn_Dividend1.ServerClick
        Dim total As String = lbl_MoneyLoan1.Text.Trim

        Dim dividend As String = txt_dividend1.Text.Trim
        Dim return1 As String = txt_return1.Text.Trim
        Dim board As String = txt_board1.Text.Trim
        Dim public1 As String = txt_public1.Text.Trim
        Dim other As String = txt_other1.Text.Trim
        Dim risk As String = txt_risk1.Text.Trim
        Dim join As String = txt_risk1.Text.Trim
        Dim welfare As String = txt_welfare1.Text.Trim

        lbl_dividend1.Text = (dividend / 100) * total
        lbl_return1.Text = ((return1 / 100) * total).ToString("#,##0.00")
        lbl_board1.Text = ((board / 100) * total).ToString("#,##0.00")
        lbl_public1.Text = ((public1 / 100) * total).ToString("#,##0.00")
        lbl_other1.Text = ((other / 100) * total).ToString("#,##0.00")
        lbl_risk1.Text = ((risk / 100) * total).ToString("#,##0.00")
        lbl_join1.Text = ((join / 100) * total).ToString("#,##0.00")
        lbl_welfare1.Text = ((welfare / 100) * total).ToString("#,##0.00")

        TotalAll()
    End Sub

    Private Sub btn_Dividend2_ServerClick(sender As Object, e As EventArgs) Handles btn_Dividend2.ServerClick
        Dim total As String = lbl_MoneyLoan2.Text.Trim

        Dim dividend As String = txt_dividend2.Text.Trim
        Dim return1 As String = txt_return2.Text.Trim
        Dim board As String = txt_board2.Text.Trim
        Dim public1 As String = txt_public2.Text.Trim
        Dim other As String = txt_other2.Text.Trim
        Dim risk As String = txt_risk2.Text.Trim
        Dim join As String = txt_risk2.Text.Trim
        Dim welfare As String = txt_welfare2.Text.Trim

        lbl_dividend2.Text = (dividend / 100) * total
        lbl_return2.Text = ((return1 / 100) * total).ToString("#,##0.00")
        lbl_board2.Text = ((board / 100) * total).ToString("#,##0.00")
        lbl_public2.Text = ((public1 / 100) * total).ToString("#,##0.00")
        lbl_other2.Text = ((other / 100) * total).ToString("#,##0.00")
        lbl_risk2.Text = ((risk / 100) * total).ToString("#,##0.00")
        lbl_join2.Text = ((join / 100) * total).ToString("#,##0.00")
        lbl_welfare2.Text = ((welfare * 100) / total).ToString("#,##0.00")

        TotalAll()
    End Sub

    Public Sub TotalAll()
        Dim dividend As String = lbl_dividend1.Text.Trim
        Dim dividend1 As String = lbl_dividend2.Text.Trim

        Dim total = dividend + dividend1
        txt_rum.Text = total
    End Sub

    Private Sub btn_cal_ServerClick(sender As Object, e As EventArgs) Handles btn_cal.ServerClick
        Dim allTotal As String = txt_total.Text.Trim
        Dim allRum As String = txt_rum.Text.Trim

        txt_ban.Text = allTotal / allRum
    End Sub
End Class