﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="ContactCategoryAddEditList.aspx.cs" Inherits="Master_Page_AdminPanel_ContactCategoryAddEditList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">

    <script src="JavaScript.js"></script>
    <script>
        function save() {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
            })
        }
    </script>

    <br />
    <div class="row">
        <h1>
            <asp:Label ID="lblTitle" runat="server" Text="" />
        </h1>
    </div>

    <div class="row" style="padding-top: 10px">
        <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
    </div>

    <div class="row text-right" style="padding-top: 60px; padding-left: 250px;">
        <div class="col-md-3 font-weight-bold">
            Contact &nbsp; Category &nbsp; Name
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox runat="server" ID="txtContactCategoryName" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvContactCategoryName" runat="server" ErrorMessage="Enter Contact Category Name" ControlToValidate="txtContactCategoryName" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-center" style="padding-top: 50px; padding-left: 435px;">
        <div class="col-md-3 font-weight-bold">
            <asp:Button ID="btnSave" runat="server" Text="    Save    " CssClass="btn btn-info" OnClick="btnSave_Click" EnableViewState="false" ValidationGroup="Save" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnCancel" runat="server" Text="    Cancel    " CssClass="btn btn-danger" OnClick="btnCancel_Click" />
        </div>
    </div>

</asp:Content>

