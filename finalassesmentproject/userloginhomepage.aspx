<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="userloginhomepage.aspx.vb" Inherits="finalassesmentproject.userloginhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 665px;
        }
        .auto-style2 {
            width: 818px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style5 {
            width: 344px;
            text-align: center;
        }
        #logouttable{
            margin-left:200px;
        }
        .auto-style6 {
            width: 595px;
        }
        #datalistdiv{
            margin-left:190px;
        }
         body{
            background-image:url("Logo Image/shoppingbackground.jpg");
            background-repeat:no-repeat;
            background-size:100% 100%;
            background-attachment:fixed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="navigation">
        <table>
            <tr>
                <td style="text-align:center" class="auto-style2" colspan="2">
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl="~/Logo Image/userlogo.png" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="text-align:right">
 <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large">Welcome:</asp:Label>
                </td>
                <td style="text-align:left" class="auto-style1">
                    <asp:Label ID="lblloginusername" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>         
        </table> 
        <table id="logouttable">
            <tr>
                <td class="auto-style5">
                    <asp:LinkButton ID="linklogoutbutton" runat="server" Text="Logout"></asp:LinkButton>
                </td>
                <td>
<asp:LinkButton ID="LinkButton1" runat="server" Text="Back To Categories"></asp:LinkButton>
                </td>              
            </tr>
        </table> 
    </div>
       <div id="datalistdiv">
            <asp:DataList ID="loginuserdatalist" runat="server" DataSourceID="SqlDataSource1" Height="406px" RepeatColumns="3" RepeatDirection="Horizontal" Width="629px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataKeyField="product_id">
                <AlternatingItemStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <ItemTemplate>
                    <table class="auto-style3">
                        <tr>
                            <td style="text-align: center">Product ID:
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">Product Name:
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("product_image") %>'  Height="200px" Width="150px"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">Price
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">Qauntity:
                                <asp:DropDownList ID="ddlqauntity" runat="server">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                     <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                    <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                     <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                    <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                    <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="addtocart" Height="30px" ImageUrl="~/Logo Image/newaddtocartlogo.jfif" CommandArgument='<%# Eval("product_id") %>' />
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [product_name], [product_price], [product_image], [product_id] FROM [product_detials]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [product_id], [product_name], [product_price], [product_image] FROM [product_detials] WHERE ([catogory_id] = @catogory_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="catogory_id" QueryStringField="cat_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />

    </form>
</body>
</html>
