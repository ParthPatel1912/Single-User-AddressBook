<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="CityGridView.aspx.cs" Inherits="Master_Page_AdminPanel_CityGridView" %>

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

    <div style="padding-right: 15px; padding-left:15px;">
        <br />
        <h1>City  &nbsp; List</h1>
        <div class="row" style="padding-top: 10px">
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
        </div>
        <div class="text-right col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="gvCity" runat="server" CssClass="table table-bordered table-striped" OnRowCommand="gvCity_RowCommand" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="CityID" HeaderText="ID" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:BoundField DataField="CityName" HeaderText="Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:BoundField DataField="Pincode" HeaderText="Pincode" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:BoundField DataField="STDCode" HeaderText="STD Code" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:BoundField DataField="StateName" HeaderText="State Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:BoundField DataField="CountryName" HeaderText="Country Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown"/>
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" OnClientClick="javascript:return confirm('Are you sure you want to Delete record ?');" CommandName="DeleteID" CommandArgument='<%# Eval("CityID") %>' Text="Delete" CssClass="btn btn-danger" />&nbsp;&nbsp;&nbsp;&nbsp;
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlEdit" runat="server" CssClass="btn btn-info" Text="Edit" NavigateUrl='<%# "~/Master_Page/AdminPanel/CityAddList.aspx?CityID=" +Eval("CityID").ToString().Trim() %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
