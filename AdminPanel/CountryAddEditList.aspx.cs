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
using AddressBook.BAL;
using AddressBook.ENT;

public partial class Master_Page_AdminPanel_CountryAddEditList : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["CountryID"] == null)
            {
                lblTitle.Text = "Country &nbsp; List &nbsp; Add";
            }
            else
            {
                lblTitle.Text = "Contact &nbsp; List &nbsp; Edit";
                FillCountryForm(Convert.ToInt32(Request.QueryString["CountryID"].ToString().Trim()));
            }
        }
    }
    #endregion Page Load Event

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable
        SqlString CountryName = SqlString.Null;
        SqlString CountryCode = SqlString.Null;
        String error = "";
        #endregion Local Variable

        #region Check for Error
        if (txtCountryName.Text.Trim() == "")
        {
            error += "Enter Country Name<br/>";
            txtCountryName.Focus();
        }
        if(txtCountryCode.Text.Trim() == "")
        {
            error += "Enter Country Code";
            txtCountryCode.Focus();
        }
        if (error != "")
        {
            lblError.Text = error;
            return;
        }
        #endregion Check for Error

        #region Assign value
        CountryENT entCountry = new CountryENT();
        if (txtCountryName.Text.Trim() != "")
        {
            entCountry.CountryName= txtCountryName.Text.Trim();
        }
        if(txtCountryCode.Text.Trim() != "")
        {
            entCountry.CountryCode = txtCountryCode.Text.Trim();
        }
        #endregion Assign value

        #region Save OR Edit
        CountryBAL balCountry = new CountryBAL();
        if (Request.QueryString["CountryID"] == null)
        {
            if (balCountry.Insert(entCountry))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                ClearControl();
            }
            else
            {
                lblError.Text = balCountry.Message;
            }
        }
        else
        {
            entCountry.CountryID = Convert.ToInt32(Request.QueryString["CountryID"]);
            if (balCountry.Update(entCountry))
            {
                ClearControl();
                Response.Redirect("~/Content/AdminPanel/Country/CountryList.aspx");
            }
            else
            {
                lblError.Text = balCountry.Message;
            }
        }
        #endregion Save OR Edit
    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/CountyGridList.aspx");
    }
    #endregion Cancel Button Event

    #region Fill form data From Database
    private void FillCountryForm(SqlInt32 CountryID)
    {
        CountryBAL balCountry = new CountryBAL();
        CountryENT entCountry = new CountryENT();
        entCountry = balCountry.SelectByPK(CountryID);
        if (!entCountry.CountryName.IsNull)
            txtCountryName.Text = entCountry.CountryName.ToString();
        if (!entCountry.CountryCode.IsNull)
            txtCountryCode.Text = entCountry.CountryCode.ToString();
    }
    #endregion Fill form data From Database

    #region Clear Control
    public void ClearControl()
    {
        txtCountryCode.Text = "";
        txtCountryName.Text = "";
        txtCountryName.Focus();
        txtCountryCode.Focus();
    }
    #endregion Clear Control
}