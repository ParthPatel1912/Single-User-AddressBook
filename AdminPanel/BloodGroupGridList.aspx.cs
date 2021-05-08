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

public partial class Master_Page_AdminPanel_BloodGroupGridList : System.Web.UI.Page
{
    #region Page Load method
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridViewList();
        }
    }
    #endregion Page Load method

    #region Fill Grid View From Database
    private void FillGridViewList()
    {
        BloodGroupBAL balBloodGroup = new BloodGroupBAL();
        DataTable dtCountry = new DataTable();
        dtCountry = balBloodGroup.SelectAll();
        if (dtCountry != null && dtCountry.Rows.Count > 0)
        {
            gvBloodGroup.DataSource = dtCountry;
            gvBloodGroup.DataBind();
        }
    }
    #endregion Fill Grid View From Database

    #region Add Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/BloodGroupAddEditList.aspx");
    }
    #endregion Add Button Event

    #region Delete Button Event
    protected void gvBloodGroup_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteID")
        {
            if (e.CommandArgument != null)
            {
                DeleteID(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                FillGridViewList();
            }
        }
    }
    #endregion Delete Button Event

    #region Delete By ID function
    private void DeleteID(Int32 BloodGroupID)
    {
        BloodGroupBAL balBloodGroup = new BloodGroupBAL();
        if (balBloodGroup.Delete(BloodGroupID))
        {
            FillGridViewList();
        }
        else
        {
            lblError.Text = balBloodGroup.Message;
        }
    }
    #endregion Delete By ID function
}