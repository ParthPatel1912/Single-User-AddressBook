<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="ContactCategoryGridViewList.aspx.cs" Inherits="Master_Page_AdminPanel_ContactCategoryGridViewList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--<style>
        .btnDelete {
            display: inline-block;
            cursor: pointer;
            text-align: center;
            outline: 1px;
            color: #fff;
            background-color: #ff0000;
            border: none;
            border-radius: 10px;
            box-shadow: 0 7px #ff8f8f;
        }

            .btnDelete:hover {
                background-color: #ff3061
            }

            .btnDelete:active {
                background-color: #ff3061;
                box-shadow: 0 4px #666;
                transform: translateY(5px);
            }

        .btnEdit {
            border: 2px solid #b8e03f;
            padding: 5px 20px;
            background: #0073ff;
            width: 70px;
            border-radius: 25px;
            -moz-border-radius: 35px;
            color: white;
        }
    </style>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">

    <%--<script src="JavaScript.js"></script>
    <script>
        function alert() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                }
            })
        }
    </script>--%>

    <div style="padding-right: 100px">
        <br />
        <h1>Contact &nbsp;  Categoty &nbsp;  List</h1>
        <div class="row" style="padding-top: 10px">
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
        </div>
        <div class="text-right col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="gvContactCategory" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" OnRowCommand="gvContactCategory_RowCommand">
            <Columns>
                <asp:BoundField DataField="ContactCategoryID" HeaderText="ID" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" />
                <asp:BoundField DataField="ContactCategoryName" HeaderText="Contact Category Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" />
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClientClick="javascript:return confirm('Are you sure you want to Delete record ?');" CommandName="DeleteID" CommandArgument='<%# Eval("ContactCategoryID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-info" NavigateUrl='<%# "~/Master_Page/AdminPanel/ContactCategoryAddEditList.aspx?ContactCategoryID=" + Eval("ContactCategoryID").ToString().Trim() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

