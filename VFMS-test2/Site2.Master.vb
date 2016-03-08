Public Class Site2
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim username As String = Session("Username")
        Dim fullname As String = Session("UserFullname")
        If username <> "" And fullname <> "" Then
            Label_User1.Text = "" & username & "(" & fullname.ToUpper & ")"
            Label_User2.Text = "" & fullname.ToUpper & ""
        Else
            Label_User1.Text = ""
            Label_User2.Text = ""
        End If

    End Sub

    Private Sub btn_Logout_Click(sender As Object, e As EventArgs) Handles btn_Logout.Click
        Session("UserFullname") = ""
        Session("Username") = ""
        Session.Clear()
        Response.Redirect("~/Login1.aspx")
    End Sub

End Class