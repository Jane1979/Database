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
                <asp:Label ID="lblDescription" runat="server" CssClass="detailsDescription"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblPrice" runat="server" CssClass="detailsPrice"></asp:Label>
                Quantity: 
                <asp:DropDownList ID="ddlAmount" runat="server"></asp:DropDownList><br/>
                <asp:Button ID="btnAdd" runat="server" Text="Add to cart" CssClass="button" OnClick="btnAdd_Click"/>
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
</asp:Content>
