<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="CityAddList.aspx.cs" Inherits="Master_Page_AdminPanel_CityAddList" %>

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
            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
        </h1>
    </div>

    <div class="row" style="padding-top: 10px">
        <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
    </div>

    <div class="row text-right" style="padding-top: 60px; padding-left: 250px;">
        <div class="col-md-2 font-weight-bold">
            City Name
        </div>
        <div class="col-md-4 text-center text-center">
            <asp:TextBox runat="server" ID="txtCityName" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ErrorMessage="Enter City Name" ControlToValidate="txtCityName" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 250px;">
        <div class="col-md-2 font-weight-bold">
            Pincode
        </div>
        <div class="col-md-4 text-center text-center">
            <asp:TextBox runat="server" ID="txtPincode" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ErrorMessage="Enter Your City Pincode" ControlToValidate="txtPincode" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPincode" runat="server" ErrorMessage="Enter 6 digit Pincode" ControlToValidate="txtPincode" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{6}" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 250px;">
        <div class="col-md-2 font-weight-bold">
            STD Code
        </div>
        <div class="col-md-4 text-center text-center">
            <asp:TextBox runat="server" ID="txtSTDCode" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvSTDCode" runat="server" ErrorMessage="Enter Your City STD Code" ValidationGroup="Save" ControlToValidate="txtSTDCode" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 250px;">
        <div class="col-md-2 font-weight-bold">
            State Name
        </div>
        <div class="col-md-4 text-center text-center text-center">
            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control text-center"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Select State" ControlToValidate="ddlState" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-center" style="padding-top: 50px; padding-left: 350px;">
        <div class="col-md-3 font-weight-bold">
            <asp:Button ID="btnSave" runat="server" Text="    Save    " CssClass="btn btn-info" OnClick="btnSave_Click" EnableViewState="false" ValidationGroup="Save" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnCancel" runat="server" Text="    Cancel    " CssClass="btn btn-danger" OnClick="btnCancel_Click" />
        </div>
    </div>

</asp:Content>

