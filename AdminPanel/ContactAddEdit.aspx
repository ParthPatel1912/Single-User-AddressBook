﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="ContactAddEdit.aspx.cs" Inherits="Master_Page_AdminPanel_ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">

    <style>
        .radio-toolbar input[type="radio"] {
            display: none;
        }

        .radio-toolbar label {
            display: inline-block;
            background-color: none;
            padding: 4px 11px;
            font-family: Arial;
            font-size: 16px;
            border-radius: 7px;
        }

        .radio-toolbar input[type="radio"]:checked + label {
            background-color: dimgray;
        }
    </style>


    <style>
        /* hide the checkbox  */
        input[type="checkbox"] {
            display: none;
        }
            /* Styling the checkbox when not checked */
            input[type="checkbox"] + label:before {
                font-family: FontAwesome;
                display: inline-block;
                content: "\f10c";
                letter-spacing: 10px;
                color: #49a6db;
            }
            /* Styling the checkbox when checked */
            input[type="checkbox"]:checked + label:before {
                content: "\2714";
                color: #49a6db;
                letter-spacing: 10px;
            }
    </style>

    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=chkCategory.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
    </script>

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

    <div class="row text-right" style="padding-top: 60px; padding-left: 30px;">
        <div class="col-md-2 ">
            Contact Name
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox runat="server" ID="txtContactName" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ErrorMessage="Enter Contact Name" ControlToValidate="txtContactName" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-1">
            Address
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactAddress" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvContactAddress" runat="server" ErrorMessage="Enter Contact Address" ControlToValidate="txtContactAddress" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            Pincode
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactPincode" runat="server" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvContactPincode" runat="server" ErrorMessage="Enter Contact Pincode" ControlToValidate="txtContactPincode" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPincode" runat="server" ErrorMessage="Enter 6 digit Pincode" ControlToValidate="txtContactPincode" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{6}" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>

        <div class="col-md-1">
            City
        </div>
        <div class="col-md-4 text-center">
            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control text-center"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ErrorMessage="Select City" ControlToValidate="ddlCity" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            State
        </div>
        <div class="col-md-4 text-center">
            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control text-center"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSateName" runat="server" ErrorMessage="Select State" ControlToValidate="ddlState" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-1 ">
            Country
        </div>
        <div class="col-md-4 text-center">
            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control text-center"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCountyName" runat="server" ErrorMessage="Select Country" ControlToValidate="ddlCountry" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            Mobile No
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactMobile" runat="server" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Enter Mobile No." ControlToValidate="txtContactMobile" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Enter 10 digit Mobile No." ControlToValidate="txtContactMobile" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>

        <div class="col-md-1 ">
            Phone No
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactPhone" runat="server" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Enter Mobile No." ControlToValidate="txtContactPhone" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Enter 10 digit Phone No." ControlToValidate="txtContactPhone" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            E-mail
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Enter E-mail Address" ControlToValidate="txtContactEmail" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter proper Email" ControlToValidate="txtContactEmail" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>

        <div class="col-md-1">
            Gender
        </div>
        <div class="col-md-4 text-left radio-toolbar">
            <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" Checked="True" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" />
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            Age
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactAge" runat="server" CssClass="form-control" TextMode="Number"/>
            <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="Enter Age" ControlToValidate="txtContactAge" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revAge" runat="server" ErrorMessage="Enter 2 or 3 digit Age" ControlToValidate="txtContactAge" CssClass="alert-danger" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{2,3}" ValidationGroup="Save"></asp:RegularExpressionValidator>
        </div>

        <div class="col-md-1 ">
            Profession
        </div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="txtContactProfession" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvProfession" runat="server" ErrorMessage="Enter Profession" ControlToValidate="txtContactProfession" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            Blood Group
        </div>
        <div class="col-md-4 text-center">
            <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-control text-center"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBolldGroup" runat="server" ErrorMessage="Select BloodGroup" ControlToValidate="ddlBloodGroup" CssClass="alert-danger" ForeColor="Red" Display="Dynamic" ValidationGroup="Save" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="col-md-1 ">
            Contact Category
        </div>
        <div class="col-md-4 text-left">
            <asp:CheckBoxList ID="chkCategory" runat="server"></asp:CheckBoxList>
            <%--<asp:CustomValidator ID="cmvContactCaategory" ErrorMessage="Select at least one Category." ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="true" CssClass="alert-danger"></asp:CustomValidator>--%>
        </div>
    </div>

    <div class="row text-right" style="padding-top: 15px; padding-left: 30px;">
        <div class="col-md-2 ">
            Photo
        </div>
        <div class="col-md-4 text-center">
            <asp:FileUpload ID="fuPhoto" runat="server" />
            <asp:RequiredFieldValidator ID="rfvPhoto" runat="server" ErrorMessage="Upload Photo" ControlToValidate="fuPhoto" ValidationGroup="Save" SetFocusOnError="true" ForeColor="Red" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row text-center" style="padding-top: 30px; padding-left: 420px;">
        <div class="col-md-3 ">
            <asp:Button ID="btnSave" runat="server" Text=" Save " CssClass="btn btn-info" EnableViewState="false" ValidationGroup="Save" OnClick="btnSave_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnCancel" runat="server" Text="  Cancel  " CssClass="btn btn-danger" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>

