using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlTypes;
using System.Data;
using AddressBook.ENT;
using AddressBook.BAL;

public partial class Master_Page_AdminPanel_ContactCategoryAddEditList : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ContactCategoryID"] == null)
            {
                lblTitle.Text = "Contact &nbsp; Category &nbsp; List &nbsp; Add";
            }
            else
            {
                lblTitle.Text = "Contact &nbsp; Category &nbsp; List &nbsp; Edit";
                FillContactcategoryForm(Convert.ToInt32(Request.QueryString["ContactCategoryID"].ToString().Trim()));
            }
        }
    }
    #endregion Page Load Event

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable
        SqlString ContactCategoryName = SqlString.Null;
        String error = "";
        #endregion Local Variable

        #region Check for Error
        if (txtContactCategoryName.Text.Trim() == "")
        {
            error += "Enter Contact Category Name";
        }
        if (error != "")
        {
            lblError.Text = error;
            return;
        }
        #endregion Check for Error

        #region Assign value
        ContactCategoryENT entContactCategory = new ContactCategoryENT();
        if (txtContactCategoryName.Text.Trim() != "")
            entContactCategory.ContactCategoryName = txtContactCategoryName.Text.Trim();
        #endregion Assign value

        #region Save OR Edit 
        ContactCategoryBAL balContactCategory = new ContactCategoryBAL();
        if (Request.QueryString["ContactCategoryID"] == null)
        {
            if (balContactCategory.Insert(entContactCategory))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                txtContactCategoryName.Text = "";
                txtContactCategoryName.Focus();
            }
            else
            {
                lblError.Text = balContactCategory.Message;
            }
        }
        else
        {
            entContactCategory.ContactCategoryID = Convert.ToInt32(Request.QueryString["ContactCategoryID"]);
            if (balContactCategory.Update(entContactCategory))
            {

                Response.Redirect("~/Master_Page/AdminPanel/ContactCategoryGridViewList.aspx");
            }
            else
            {
                lblError.Text = balContactCategory.Message;
            }
        }
        #endregion save of edit
    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/ContactCategoryGridViewList.aspx");
    }
    #endregion Cancel Button Event

    #region Fill form data From Database
    private void FillContactcategoryForm(SqlInt32 ContactCategoryID)
    {
        ContactCategoryBAL balContactCategory = new ContactCategoryBAL();
        ContactCategoryENT entContactCategory = new ContactCategoryENT();
        entContactCategory = balContactCategory.SelectByPK(ContactCategoryID);
        if (!entContactCategory.ContactCategoryName.IsNull)
            txtContactCategoryName.Text = entContactCategory.ContactCategoryName.ToString();
    }
    #endregion Fill form data From Database
}