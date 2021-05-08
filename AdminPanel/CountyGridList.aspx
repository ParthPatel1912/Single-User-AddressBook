<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="CountyGridList.aspx.cs" Inherits="Master_Page_AdminPanel_CountyGridList" %>

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

    <div>
        <br />
        <h1>Country&nbsp;   List</h1>
        <div class="row" style="padding-top: 10px">
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
        </div>
        <div class="text-right col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="gvCountry" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="false"  CssClass="table table-bordered table-striped" OnRowCommand="gvCountry_RowCommand">

             <Columns>
                <asp:BoundField DataField="CountryId" HeaderText="ID" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true" />
                <asp:BoundField DataField="CountryName" HeaderText="Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true" />
                <asp:BoundField DataField="CountryCode" HeaderText="Code" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true" />

                  <asp:TemplateField HeaderStyle-BackColor="RosyBrown" HeaderStyle-BorderColor="#ff00ff"  ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClientClick="javascript:return confirm('Are you sure you want to Delete record ?');" CommandName="DeleteID" CommandArgument='<%# Eval("CountryId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-BackColor="RosyBrown" HeaderStyle-BorderColor="#ff00ff" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-info" NavigateUrl='<%# "~/Master_Page/AdminPanel/CountryAddEditList.aspx?CountryID=" + Eval("CountryId").ToString().Trim() %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>

</asp:Content>

