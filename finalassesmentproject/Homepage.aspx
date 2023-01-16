<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Homepage.aspx.vb" Inherits="finalassesmentproject.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 365px;
        }
        .auto-style3 {
            width: 208px;
        }
        .auto-style4 {
            width: 104px;
        }
        #navigationtable{
            background-color:burlywood;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style6 {
            text-align: center;
        }
        #navigationtable{
            margin-left:170px;
        }
        #datalistview{
            margin-left:210px;
        }
        #footertable{
            margin-left:170px;
        }
        body{
            background-image:url("Logo Image/shoppingbackground.jpg");
            background-repeat:no-repeat;
            background-size:100% 100%;
            background-attachment:fixed;
        }
        .auto-style7 {
            width: 207px;
        }
        #welcomeguest{
            background-color:red;
            margin-left:300px;
        }
        #LINKBUTTONTABLE{
            background-color:yellow;
            margin-left:180px;
        }
    </style>
     <script>
function guestalert()
  {
  return alert('To Buy Products You Need To Login!!');
  }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id="navigationtable" style="text-align:center">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" Height="50px" ImageAlign="Left" ImageUrl="~/Logo Image/welcome.jfif" Width="85px" />
            </td>
            <td>
                <asp:Label ID="lblwelcome" runat="server" Text="Shopping Site" Font-Italic="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#0033CC"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:HyperLink ID="HyperLinkLogin" runat="server" style="text-align: center" Font-Size="Medium" NavigateUrl="~/Loginpage.aspx">Login</asp:HyperLink>
               
            &nbsp;</td>
            <td class="auto-style3">
            <asp:HyperLink ID="HyperLinkRegister" runat="server" style="text-align: center" NavigateUrl="~/Registrationpage.aspx">Sign-Up</asp:HyperLink>       </td>
            <td class="auto-style2">
                 <asp:HyperLink ID="HyperLinkAdmin" runat="server" NavigateUrl="~/Adminpage.aspx" style="text-align: center">Admin login</asp:HyperLink>
            </td>
        </tr>
    </table>
        <table id="welcomeguest">
            <tr>
                <td class="auto-style7" style="text-align: center">
                    <asp:Label ID="lblguest" runat="server" Text="Welcome Guest!!" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="To Buy Product You need To Login or Sign-Up" Font-Bold="True" Font-Italic="True" Font-Overline="True" Font-Size="Smaller" ForeColor="White" 
                        style="text-align:right"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width: 677px" id="LINKBUTTONTABLE">
            <tr>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="MOBILES"></asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton2" runat="server" Text="PERFUMES"></asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton3" runat="server" Text="BAGS"></asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton4" runat="server" Text="ALL CATEGORIES"></asp:LinkButton>
                </td>

            </tr>
        </table>
    </div>
        <div id="datalistview">
            <asp:DataList ID="DataListguest" runat="server" DataSourceID="SqlDataSource1" Height="362px" RepeatColumns="3" RepeatDirection="Horizontal" Width="565px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingItemStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <ItemTemplate>
                    <table class="auto-style5">
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="#0066FF" style="text-align: center" Text="Shopping "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="Label2" runat="server" Text="Product Name"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("product_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("product_image") %>' Height="250px" Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True">Price</asp:Label>
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:ImageButton ID="addtocartbutton" runat="server"  Height="50px" Width="100px"  ImageUrl="~/Logo Image/newaddtocartlogo.jfif" CommandName="guestaddtocart"/>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
        </div>
        <div id="footer">
            <table id="footertable" style="background-color:black; width: 696px;">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblfooter" runat="server" Text="@All Rights Reserved !!" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [product_name], [product_price], [product_image] FROM [product_detials]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [product_name], [product_price], [product_image] FROM [product_detials] WHERE ([catogory_id] = @catogory_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="catogory_id" QueryStringField="catid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
