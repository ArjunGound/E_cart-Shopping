Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class Loginpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub loginbutton_Click(sender As Object, e As ImageClickEventArgs) Handles loginbutton.Click
        If String.IsNullOrWhiteSpace(txtusername.Text) And String.IsNullOrWhiteSpace(txtuserpassword.Text) Then
            lblusernamecheck.Text = "*"
            lblpasswordcheck.Text = "*"

        Else
            Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
            Dim con As SqlConnection = New SqlConnection(cs)
            Dim cmd As SqlCommand = New SqlCommand("sp_usercheck", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@username", txtusername.Text)
            cmd.Parameters.AddWithValue("@password", txtuserpassword.Text)
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim dt As DataTable = New DataTable()
            da.Fill(dt)
            If dt.Rows.Count = 1 Then
                Session("username") = txtusername.Text
                Response.Redirect("~/userlogincategorypage.aspx")
            Else
                lblvalidation.Text = "User Not Exits Please Register !!"
            End If
        End If
    End Sub
End Class