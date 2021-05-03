<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBooks.aspx.cs" Inherits="CSCI3321_ASPNET_FinalProject.MyBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Build a table to list your book collection -->
    <!-- What server control should you use? -->

    <asp:Panel runat="server" ID="pnlBookList" CssClass="row">
        <asp:Table ID="tblBookList" runat="server" CssClass="table table-striped">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Book Title</asp:TableHeaderCell>
                <asp:TableHeaderCell>Author First Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Author Last Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                <asp:TableHeaderCell>Publish Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>PublisherID</asp:TableHeaderCell>
                <asp:TableHeaderCell>GenreID</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </asp:Panel>
</asp:Content>
