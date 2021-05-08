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

public partial class Master_Page_AdminPanel_CountyGridList : System.Web.UI.Page
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
        CountryBAL balCountry = new CountryBAL();
        DataTable dtCountry = new DataTable();
        dtCountry = balCountry.SelectAll();
        if (dtCountry != null && dtCountry.Rows.Count > 0)
        {
            gvCountry.DataSource = dtCountry;
            gvCountry.DataBind();
        }
    }
    #endregion Fill Grid View From Database

    #region Add Button Event
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/CountryAddEditList.aspx");
    }
    #endregion Add Button Event

    #region Delete Button Event
    protected void gvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
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
    private void DeleteID(Int32 CountryID)
    {
        CountryBAL balCountry = new CountryBAL();
        if (!balCountry.Delete(CountryID))
        {
            lblError.Text = balCountry.Message;
        }
    }
    #endregion Delete By ID function
}