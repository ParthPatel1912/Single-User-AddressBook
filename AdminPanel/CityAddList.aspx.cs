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
using AddressBook;
using AddressBook.ENT;
using AddressBook.BAL;

public partial class Master_Page_AdminPanel_CityAddList : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if(Request.QueryString["CityID"] == null)
            {
                lblTitle.Text = "City &nbsp; List &nbsp; Add";
                FillDropDownList();
            }
            else
            {
                lblTitle.Text = "City &nbsp; List &nbsp; Edit";
                FillDropDownList();
                FillCityDate(Convert.ToInt32(Request.QueryString["CityID"].ToString().Trim()));
            }
        }
    }
    #endregion Page Load Event

    #region Fill DropDown List of state
    private void FillDropDownList()
    {
        CommanFillMethod.FillStateDropDownListState(ddlState);
    }
    #endregion Fill DropDown List of state

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable

        String strError = "";
        SqlInt32 StateId = SqlInt32.Null;
        SqlString CityName = SqlString.Null;
        SqlString Pincode = SqlString.Null;
        SqlString STDCode = SqlString.Null;

        #endregion Local Variable

        #region Check for Error

        if (txtCityName.Text.Trim() == "")
        {
            strError += "Enter City Name<br/>";
            txtCityName.Focus();
        }
        if (txtPincode.Text.Trim() == "")
        {
            strError += "Enter Pincode<br/>";
            txtPincode.Focus();
        }
        if (txtSTDCode.Text.Trim() == "")
        {
            strError += "Enter STD Code<br/>";
            txtSTDCode.Focus();
        }
        if (ddlState.SelectedIndex == 0)
        {
            strError += "Select State   <br/>";
            ddlState.Focus();
        }
        if (strError.Trim() != "")
        {
            lblError.Text = strError;
            return;
        }

        #endregion Check for Error

        #region Assign value

        CityENT entCity = new CityENT();

        if (ddlState.SelectedIndex>0)
        {
            entCity.StateID = Convert.ToInt32(ddlState.SelectedValue);
        }
        if(txtCityName.Text.Trim()!="")
        {
            entCity.CityName = txtCityName.Text.Trim();
        }
        if (txtPincode.Text.Trim() != "")
        {
            entCity.Pincode = txtPincode.Text.Trim();
        }
        if (txtSTDCode.Text.Trim()!= "")
        {
            entCity.STDCode = txtSTDCode.Text.Trim();
        }
        #endregion Assign value

        #region Save OR Edit 

        CityBAL balCity = new CityBAL();
        if (Request.QueryString["CityID"] == null)
        {
            if (balCity.Insert(entCity))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                ClearControl();
            }
            else
            {
                lblError.Text = balCity.Message;
            }
        }
        else
        {
            entCity.CityID = Convert.ToInt32(Request.QueryString["CityID"]);
            if (balCity.Update(entCity))
            {
                ClearControl();
                Response.Redirect("~/Master_Page/AdminPanel/CityGridView.aspx");
            }
            else
            {
                lblError.Text = balCity.Message;
            }
        }

        #endregion Save OR Edit 
    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/CityGridView.aspx");
    }
    #endregion Cancel Button Event

    #region Fill form data From Database
    private void FillCityDate(SqlInt32 CityID)
    {
        CityBAL balCity = new CityBAL();
        CityENT entCity = new CityENT();
        entCity = balCity.SelectByPK(CityID);
        if (!entCity.CityName.IsNull)
            txtCityName.Text = entCity.CityName.ToString();
        if (!entCity.Pincode.IsNull)
            txtPincode.Text = entCity.Pincode.ToString();
        if (!entCity.STDCode.IsNull)
            txtSTDCode.Text = entCity.STDCode.ToString();
        if (Convert.ToInt32(entCity.StateID.Value) > 0)
            ddlState.SelectedValue = entCity.StateID.ToString();
    }
    #endregion Fill form data From Database

    #region Clear Control
    public void ClearControl()
    {
        txtCityName.Text = "";
        txtPincode.Text = "";
        txtSTDCode.Text = "";
        ddlState.SelectedIndex = 0;
    }
    #endregion
}