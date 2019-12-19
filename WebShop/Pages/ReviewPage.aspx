<%@ Page Title="" Language="C#" MasterPageFile="~/MaterPage.Master" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="WebShop.Pages.ReviewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ListView ID="ListViewRating" runat="server" OnItemEditing="ListViewRating_ItemEditing" OnItemDeleting="ListViewRating_ItemDeleting" 
        OnItemCanceling="ListViewRating_ItemCanceling" OnItemUpdating="ListViewRating_ItemUpdating" OnItemDataBound="ListViewRating_ItemDataBound">
        <ItemTemplate>
            <table>
                <tr>
                    <td rowspan="4">
                        <asp:Image ID="ImageRating" runat="server" ImageUrl='<%# "~/Images/" + Eval("Product.Url") %>' />
                    </td>
                    <td>
                        Rating: <asp:Literal ID="LiteralRating" runat="server" Text='<%# Eval("Value") %>'></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Literal ID="LiteralComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Literal>
                    </td>
                </tr>
            </table>
            <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" Text="Edit" Width="50px" />
            <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete" Text="Delete" Width="50px" />
        </ItemTemplate>
        <EditItemTemplate>
            <table>
                <tr>
                    <td rowspan="4">
                        <asp:Image ID="ImageRating" runat="server" ImageUrl='<%# "~/Images/" + Eval("Product.Url") %>' />
                    </td>
                    <td>
                        Rating: 
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
                        <asp:TextBox ID="TextBoxComment" runat="server" Text='<%# Eval("Comment") %>' TextMode="MultiLine" Rows="5" Width="400"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="ButtonSave" runat="server" CommandName="Update" Text="Save" Width="50px" />
            <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="50px" />
        </EditItemTemplate>
    </asp:ListView>
    <asp:Panel ID="PanelReviews" runat="server">
    </asp:Panel>
</asp:Content>
