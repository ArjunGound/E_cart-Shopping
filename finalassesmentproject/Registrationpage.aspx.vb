Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class Registrationpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Try
            Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
            Dim con As SqlConnection = New SqlConnection(cs)
            Dim cmd As SqlCommand = New SqlCommand("sp_userRegister", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@firstname", txtfirstname.Text)
            cmd.Parameters.AddWithValue("@lastname", txtlastname.Text)
            cmd.Parameters.AddWithValue("@age", txtage.Text)
            cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@gmail", txtgmail.Text)
            cmd.Parameters.AddWithValue("@username", txtusername.Text)
            cmd.Parameters.AddWithValue("@password", txtpassword.Text)
            cmd.ExecuteNonQuery()
            con.Close()
            Label1.ForeColor = System.Drawing.Color.Green
            Label1.Text = "Registration Successfull"           
        Catch ex As SqlException
            Label1.ForeColor = System.Drawing.Color.Red
            Label1.Text = "Username or EmailId already exits please try different username or EmailId"
        Catch ex As Exception
            Label1.ForeColor = System.Drawing.Color.Red
            Label1.Text = "Something Went Wrong Please try Later"
        End Try
        Response.Redirect("~/Loginpage.aspx")
    End Sub
End Class