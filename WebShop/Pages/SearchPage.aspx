<%@ Page Title="" Language="C#" MasterPageFile="~/MaterPage.Master" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="WebShop.Pages.SearchPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
    <asp:Panel ID="panelProducts" runat="server"></asp:Panel>
</asp:Content>
