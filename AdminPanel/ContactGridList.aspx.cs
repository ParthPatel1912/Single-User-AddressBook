using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using AddressBook.BAL;

public partial class Master_Page_AdminPanel_ContactGridList : System.Web.UI.Page
{
    #region Load method
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridViewList();
        }
    }
    #endregion Load method

    #region Fill Grid View From Database
    private void FillGridViewList()
    {
        ContactBAL balContact = new ContactBAL();
        DataTable dtContact = new DataTable();
        dtContact = balContact.SelectAll();
        if (dtContact != null && dtContact.Rows.Count > 0)
        {
            gvContact.DataSource = dtContact;
            gvContact.DataBind();
        }
    }
    #endregion Fill Grid View From Database

    #region Add Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/ContactAddEdit.aspx");
    }
    #endregion Add Button Event

    #region Delete Button Event
    protected void gvState_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteID")
        {
            if (e.CommandArgument != null)
            {
                DeleteID(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
            }
        }
    }
    #endregion Delete Button Event

    #region Delete By ID function
    private void DeleteID(Int32 ContactID)
    {
        ContactBAL balContact = new ContactBAL();
        if (balContact.Delete(ContactID))
        {
            FillGridViewList();
        }
        else
        {
            lblError.Text = balContact.Message;
        }
    }
    #endregion Delete By ID function
}