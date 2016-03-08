Public Class Login1
    Inherits System.Web.UI.Page

    Private Sub btn_Login_Click(sender As Object, e As EventArgs) Handles btn_Login.Click
        Dim Username As String = ""
        Dim Password As String = ""
        Username = User_tb.Text
        Password = Password_tb.Text
        Dim authen As New vfmsDataContext
        Dim user As New user
        user = Authenticate(Username, Password)
        If user IsNot Nothing Then
            Session("UserFullname") = user.full_name
            Session("Username") = user.user_name
            Response.Redirect("Home.aspx")
        Else
            lbl_Validate.Text = "ไม่สามารถเข้าสู่ระบบได้ กรุณาลองใหม่อีกครั้ง"
        End If


    End Sub

    Public Function Authenticate(ByVal username As String, ByVal password As String) As user
        Dim user As New user
        Using ctx = New vfmsDataContext
            user = (From u In ctx.users Where u.user_name.ToLower = username.ToLower _
                    And u.password = password).SingleOrDefault
        End Using
        Return user
    End Function
End Class