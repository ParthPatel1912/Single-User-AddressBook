<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="BloodGroupGridList.aspx.cs" Inherits="Master_Page_AdminPanel_BloodGroupGridList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
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
        <h1>Blood  &nbsp; Group &nbsp;  List</h1>
        <div class="row" style="padding-top: 10px">
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
        </div>
        <div class="text-right col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="gvBloodGroup" runat="server" CssClass="table table-bordered table-striped table-condensed tablesorter" AutoGenerateColumns="false" OnRowCommand="gvBloodGroup_RowCommand">
            <Columns>
                <asp:BoundField DataField="BloodGroupId" HeaderText="ID" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" />
                <asp:BoundField DataField="BloodGroupName" HeaderText="Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" />
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClientClick="javascript:return confirm('Are you sure you want to Delete record ?');" CommandName="DeleteID" CommandArgument='<%# Eval("BloodGroupID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-info" NavigateUrl='<%# "~/Master_Page/AdminPanel/BloodGroupAddEditList.aspx?BloodGroupID=" +Eval("BloodGroupId").ToString().Trim() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



    <script>
        $(function () {
            $('#<%= gvBloodGroup.ClientID %>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                "autoWidth": false,
            });
        });
    </script>
</asp:Content>

