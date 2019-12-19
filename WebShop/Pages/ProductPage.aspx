<%@ Page Title="" Language="C#" MasterPageFile="~/MaterPage.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="WebShop.Pages.ProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <table>
        <tr>
            <td rowspan="4">
                <asp:Image ID="imgProduct" runat="server" CssClass="detailsImage"></asp:Image></td>
            <td>
                <h2>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </h2>
            </td>
        </tr>
         <tr>
                
            <td>
                <h2>
                    <asp:Label ID="LabelRating" runat="server" Text="Rating"></asp:Label>
                    <asp:Literal ID="LiteralRating" runat="server"></asp:Literal>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDescription" runat="server" CssClass="detailsDescription"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblPrice" runat="server" CssClass="detailsPrice"></asp:Label>
                Quantity: 
                <asp:DropDownList ID="ddlAmount" runat="server"></asp:DropDownList><br/>
                <asp:Button ID="btnAdd" Visible="false" runat="server" Text="Add to cart" CssClass="button" OnClick="btnAdd_Click"/>
                <asp:Label ID="Label1" Text="Login to buy" Visible="false" runat="server"></asp:Label>
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Product Number:<asp:Label ID="lblItemNr" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
    </table>

    <asp:Panel ID="PanelRating" runat="server" Visible="false">
        <table>
            <tr>
                <td>Add rating</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownListRating" runat="server">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBoxComment" runat="server" TextMode="MultiLine" Rows="5" Width="400"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="ButtonSubmitRating" runat="server" Text="Submit Rating" OnClick="ButtonSubmitRating_Click" />
    </asp:Panel>
</asp:Content>
