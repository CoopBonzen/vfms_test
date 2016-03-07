Public Class DataAccessModule

    Public Function Authenticate(ByVal username As String, ByVal password As String) As user
        Dim user As New user
        Using ctx = New vfmsDataContext
            user = (From u In ctx.users Where u.user_name.ToLower = username.ToLower _
                    And u.password = password).SingleOrDefault
        End Using
        Return user
    End Function

    Public Function GetUserByUsername(ByVal username As String) As user
        Dim user As New user
        Using ctx = New vfmsDataContext
            user = (From u In ctx.users Where u.user_name.ToLower = username.ToLower).SingleOrDefault
        End Using
        Return user
    End Function

End Class
