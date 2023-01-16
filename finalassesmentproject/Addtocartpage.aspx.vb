Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class Addtocartpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try

           
            MultiView1.ActiveViewIndex = 0
            Dim name As String = Session("username")
            Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
            Dim con As SqlConnection = New SqlConnection(cs)
            Dim quantity As Integer = CInt(Request.QueryString("ddlqauntity"))
            Dim id As Integer = CInt(Request.QueryString("pid"))
            Dim insertquery As String = "insert into arjuncartdetails(quantity,new_id,username) values(@quan,@id,@username)"
            Dim cmd As SqlCommand = New SqlCommand(insertquery, con)
            con.Open()
            cmd.Parameters.AddWithValue("@quan", quantity)
            cmd.Parameters.AddWithValue("@id", id)
            cmd.Parameters.AddWithValue("@username", name)
            cmd.ExecuteNonQuery()
                con.Close()
            Catch ex As SqlException
                Response.Write("Something Went Wrong Please Try Again!!")
            End Try
        End If
         
    End Sub

    Protected Sub viewcartbutton_Click(sender As Object, e As EventArgs) Handles viewcartbutton.Click
        BindGrind()
    End Sub 

    Protected Sub gvlogincart_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvlogincart.RowDeleting
        Dim name As String = Session("username")
        Dim productuserid As Integer = Convert.ToInt32(gvlogincart.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("DELETE FROM arjuncartdetails WHERE userid = @product_id and username=@username", con)
                cmd.Parameters.AddWithValue("@product_id", productuserid)
                cmd.Parameters.AddWithValue("@username", name)
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        BindGrind()
    End Sub
    Public Sub BindGrind()
        Dim name As String = Session("username")
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Dim con As SqlConnection = New SqlConnection(cs)
        Dim da As SqlDataAdapter = New SqlDataAdapter("sp_finalcart", con)
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.Parameters.AddWithValue("@sessionname", name)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        gvlogincart.DataSource = ds
        gvlogincart.DataBind()
        Dim dt As DataTable = New DataTable()
        dt = ds.Tables(0)
        If gvlogincart.Rows.Count > 0 Then
            Dim nrow As Integer = dt.Rows.Count
            Dim i As Integer = 0
            Dim totalamount As Integer = 0
            While (i < nrow)
                totalamount = totalamount + CInt(dt.Rows(i)("Total_Price").ToString())
                i = i + 1
            End While
            gvlogincart.FooterRow.Cells(5).Text = "Total Amount"
            gvlogincart.FooterRow.Cells(6).Text = totalamount.ToString()
        End If
    End Sub

    Protected Sub updatebutton_Click(sender As Object, e As EventArgs) Handles updatebutton.Click
        Dim name As String = Session("username")
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Dim con As SqlConnection = New SqlConnection(cs)
        Dim cmd As SqlCommand = New SqlCommand("sp_updatequantity", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@quantity", txtquantity.Text)
        cmd.Parameters.AddWithValue("@userid", txtuserid.Text)
        cmd.Parameters.AddWithValue("@username", name)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        BindGrind()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub gvlogincart_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvlogincart.SelectedIndexChanged
        Dim row As GridViewRow = gvlogincart.SelectedRow
        txtproductname.Text = row.Cells(2).Text
        txtprice.Text = row.Cells(5).Text
        txtquantity.Text = row.Cells(4).Text
        txtuserid.Text = row.Cells(1).Text
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub clearcartbutton_Click(sender As Object, e As EventArgs) Handles clearcartbutton.Click
        Dim name As String = Session("username")
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Dim con As SqlConnection = New SqlConnection(cs)
        Dim cmd As SqlCommand = New SqlCommand("sp_clearcart", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@username", name)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        BindGrind()
    End Sub

    Protected Sub gvlogincart_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvlogincart.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex <> gvlogincart.EditIndex Then
            CType(e.Row.Cells(0).Controls(0), LinkButton).Attributes("onclick") = "return confirm('Do you want to Remove this Product?')"
        End If
    End Sub
End Class