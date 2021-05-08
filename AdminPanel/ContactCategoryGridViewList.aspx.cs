using AddressBook.BAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Page_AdminPanel_ContactCategoryGridViewList : System.Web.UI.Page
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
        ContactCategoryBAL balContactCategory = new ContactCategoryBAL();
        DataTable dtContactCategory= new DataTable();
        dtContactCategory = balContactCategory.SelectAll();
        if (dtContactCategory != null && dtContactCategory.Rows.Count > 0)
        {
            gvContactCategory.DataSource = dtContactCategory;
            gvContactCategory.DataBind();
        }
    }
    #endregion Fill Grid View From Database

    #region Add Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/ContactCategoryAddEditList.aspx");
    }
    #endregion Add Button Event

    #region Delete Button Event
    protected void gvContactCategory_RowCommand(object sender, GridViewCommandEventArgs e)
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
    private void DeleteID(Int32 ContactCategoryID)
    {
        ContactCategoryBAL balContactCategory = new ContactCategoryBAL();
        if (balContactCategory.Delete(ContactCategoryID))
        {
            FillGridViewList();
        }
        else
        {
            lblError.Text = balContactCategory.Message;
        }
    }
    #endregion Delete By ID function
}