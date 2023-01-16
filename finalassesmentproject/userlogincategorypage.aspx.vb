Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class userlogincategorypage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("username") <> Nothing Then
                lblloginusername.Text = Session("username").ToString()             
                cartcount()
            End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("~/userloginhomepage.aspx?cat_id=" + "1")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("~/userloginhomepage.aspx?cat_id=" + "2")
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        Response.Redirect("~/userloginhomepage.aspx?cat_id=" + "3")
    End Sub

    Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        Response.Redirect("~/userloginhomepage.aspx?cat_id=" + "0")
    End Sub
    Public Sub cartcount()
        If Session("username") <> Nothing Then
            Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
            Dim con As SqlConnection = New SqlConnection(cs)
            Dim cart As String = "select * from arjuncartdetails where username=@username"
            Dim cmd As SqlCommand = New SqlCommand(cart, con)
            cmd.Parameters.AddWithValue("@username", Session("username").ToString())
            con.Open()
            cmd.ExecuteNonQuery()
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim dt As DataTable = New DataTable()
            da.Fill(dt)
            If dt.Rows.Count > 0 Then
                Label3.Text = dt.Rows.Count.ToString()
            Else
                Label3.Text = "0"
            End If
            con.Close()
        End If
       
    End Sub

    Protected Sub LinkButton5_Click(sender As Object, e As EventArgs) Handles LinkButton5.Click
        Session.Abandon()
        Response.Redirect("~/Loginpage.aspx")
    End Sub
End Class