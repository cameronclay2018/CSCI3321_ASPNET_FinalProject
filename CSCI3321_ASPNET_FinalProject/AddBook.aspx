<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="CSCI3321_ASPNET_FinalProject.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Add New Book</h3>

    <div class="row">
        <div class="col-md-3">
            Book Title:
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtBookTitle" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col-md-3">
            Price:
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col-md-3">
            Publish Date:
        </div>
        <div class="col-md-9">
            <asp:TextBox ID="txtPublishDate" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col-md-3">
            Author:
        </div>
        <div class="col-md-9">
            <asp:DropDownList ID="ddlAuthor" runat="server" DataSourceID="sdsAuthor" DataTextField="FullName" DataValueField="AuthorID">

            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT AuthorID, FirstName, LastName, FirstName + ' ' + LastName AS FullName FROM Authors"></asp:SqlDataSource>
        </div>

        <div class="col-md-3">
            Publisher:
        </div>
        <div class="col-md-9">
            <asp:DropDownList ID="ddlPublisher" runat="server" DataSourceID="sdsPublisher" DataTextField="PublisherName" DataValueField="PublisherID">

            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsPublisher" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT PublisherID, PublisherName FROM Publishers"></asp:SqlDataSource>
        </div>

        <div class="col-md-3">
            Genre:
        </div>
        <div class="col-md-9">
            <asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="sdsGenre" DataTextField="GenreName" DataValueField="GenreID">

            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsGenre" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT GenreID, GenreName FROM Genres"></asp:SqlDataSource>
        </div>

        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-9">
            <asp:Button ID="btnSubmit" runat="server" Text="Add Book" CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
            <asp:Label ID="lblResults" runat="server" CssClass="alert alert-danger" Text="All fields are required." Visible="False"></asp:Label>
        </div>
    </div>
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
