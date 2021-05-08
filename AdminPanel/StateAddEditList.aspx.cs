using AddressBook;
using AddressBook.BAL;
using AddressBook.ENT;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Page_AdminPanel_StateAddEditList : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["StateID"] == null)
            {
                lblTitle.Text = "State &nbsp; List &nbsp; Add";
                FillgridView();
            }
            else
            {
                lblTitle.Text = "State &nbsp; List &nbsp; Edit";
                FillgridView();
                FillStateData(Convert.ToInt32(Request.QueryString["StateID"].ToString().Trim()));

            }
        }
    }
    #endregion Page Load Event

    #region Fill DropDown List of Country
    private void FillgridView()
    {
        CommanFillMethod.FillCountryDropDownListCountry(ddlCountry);
    }
    #endregion Fill DropDown List of Country

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable
        String error = "";
        SqlString StateName = SqlString.Null;
        SqlInt32 CountryId = SqlInt32.Null;
        #endregion Local Variable

        #region Check for Error
        if (txtStateName.Text.Trim() == "")
        {
            error += "Enter State Name";
            txtStateName.Focus();
        }
        if (ddlCountry.SelectedIndex == 0)
        {
            error += "Select State   <br/>";
            ddlCountry.Focus();
        }
        if (error != "")
        {
            lblError.Text = error;
            return;
        }
        #endregion Check for Error

        #region Assign value
        StateENT entState = new StateENT();
        if (txtStateName.Text.Trim() != "")
            entState.StateName = txtStateName.Text.Trim();

        if (ddlCountry.SelectedIndex > 0)
            entState.CountryID = Convert.ToInt32(ddlCountry.SelectedValue);
        #endregion Assign value

        #region Save OR Edit 
        StateBAL balState = new StateBAL();
        if (Request.QueryString["StateID"] == null)
        {
            if (balState.Insert(entState))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                ClearControl();
            }
            else
            {
                lblError.Text = balState.Message;
            }
        }
        else
        {
            entState.StateID = Convert.ToInt32(Request.QueryString["StateID"]);
            if (balState.Update(entState))
            {
                ClearControl();
                Response.Redirect("~/Master_Page/AdminPanel/StateGridList.aspx");
            }
            else
            {
                lblError.Text = balState.Message;
            }
        }
        #endregion
    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/StateGridList.aspx");
    }
    #endregion Cancel Button Event

    #region Fill form data from database
    private void FillStateData(SqlInt32 StateID)
    {
        StateBAL balState = new StateBAL();
        StateENT entState = new StateENT();

        entState = balState.SelectByPK(StateID);

        if (!entState.StateName.IsNull)
            txtStateName.Text = entState.StateName.ToString();
        if (!entState.CountryID.IsNull)
            ddlCountry.SelectedValue = entState.CountryID.ToString();
    }
    #endregion Fill form data from database

    #region Clear Control
    public void ClearControl()
    {
        txtStateName.Text = "";
        ddlCountry.SelectedIndex = 0;
        txtStateName.Focus();
        ddlCountry.Focus();
    }
    #endregion
}