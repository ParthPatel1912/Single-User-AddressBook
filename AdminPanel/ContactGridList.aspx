<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Content/susan.master" AutoEventWireup="true" CodeFile="ContactGridList.aspx.cs" Inherits="Master_Page_AdminPanel_ContactGridList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

    <link href="~/bootstrap-4.5.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/bootstrap-4.5.2-dist/css/bootstrap-theme.min.css" rel="stylesheet" /> 
    <script src="~/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>

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
        <h1>Contact &nbsp;   List</h1>
        <div class="row" style="padding-top: 10px">
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
        </div>
        <div class="text-right col-md-10">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="gvContact" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCommand="gvState_RowCommand">

            <Columns>
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown">
                     <ItemTemplate>
                        <asp:Image ID="photo" runat="server" ImageUrl='<%# Eval("PhotoPath") %>'  Height="100"/>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ContactName" HeaderText="Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Pincode" HeaderText="Pincode" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="CityName" HeaderText="City Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="StateName" HeaderText="State Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="CountryName" HeaderText="Country Name" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="MobileNo" HeaderText="Mobile" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="PhoneNo" HeaderText="Phone" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Age" HeaderText="Age" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="Profession" HeaderText="Profession" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="BloodgroupName" HeaderText="BloodgroupName" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <asp:BoundField DataField="ContactcategoryName" HeaderText="ContactcategoryName" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />
                <%--<asp:BoundField DataField="PhotoPath" HeaderText="Path" HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" HeaderStyle-Font-Bold="true"  />--%>

                
                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClientClick="javascript:return confirm('Are you sure you want to Delete record ?');" CommandName="DeleteID" CommandArgument='<%# Eval("ContactID") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderStyle-BorderColor="#ff00ff" HeaderStyle-BackColor="RosyBrown" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:HyperLink ID="hledit" runat="server" Text="Edit" CssClass="btn btn-info" NavigateUrl='<%# "~/Master_Page/AdminPanel/ContactAddEdit.aspx?ContactID=" + Eval("ContactId").ToString().Trim() %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>

</asp:Content>