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

public partial class Master_Page_AdminPanel_BloodGroupAddEditList : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["BloodGroupID"] == null)
            {
                lblTitle.Text = "Blood &nbsp; Group &nbsp; List &nbsp; Add";
            }
            else
            {
                lblTitle.Text = "Blood &nbsp; Group &nbsp; List &nbsp; Edit";
                FillBlooDGroupBox(Convert.ToInt32(Request.QueryString["BloodGroupID"].ToString().Trim()));
            }
        }
    }
    #endregion Page Load Event

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable
        SqlString BloodGroupName = SqlString.Null;
        String error = "";
        #endregion Local Variable

        #region Check For Error
        if (txtBloodGroupName.Text.Trim() == "")
        {
            error += "Enter Blood Group Name";
            txtBloodGroupName.Focus();
        }
        if (error != "")
        {
            lblError.Text = error;
            return;
        }
        #endregion Check For Error

        #region Assign Value
        BloodGroupENT entBloodGroup = new BloodGroupENT();
        if (txtBloodGroupName.Text.Trim() != "")
        {
            entBloodGroup.BloodGroupName = txtBloodGroupName.Text.Trim();
        }
        #endregion Assign Value

        #region Save or Edit

        BloodGroupBAL balBloodGroup = new BloodGroupBAL();

        if(Request.QueryString["BloodGroupID"] == null)
        {
            if(balBloodGroup.Insert(entBloodGroup))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                txtBloodGroupName.Text = "";
                txtBloodGroupName.Focus();
            }
            else
            {
                lblError.Text = balBloodGroup.Message;
            }
        }

        else
        {
            entBloodGroup.BloodGroupID = Convert.ToInt32(Request.QueryString["BloodGroupID"]);

            if(balBloodGroup.Update(entBloodGroup))
            {
                Response.Redirect("~/Master_Page/AdminPanel/BloodGroupGridList.aspx");
            }
            else
            {
                lblError.Text = balBloodGroup.Message;
            }
        }

        #endregion Save or Edit

    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/BloodGroupGridList.aspx");
    }
    #endregion Cancel Button Event

    #region Fill form data From Database
    private void FillBlooDGroupBox(SqlInt32 BloodGroupID)
    {
        BloodGroupBAL balBloodGroup = new BloodGroupBAL();
        BloodGroupENT entBloodGroup = new BloodGroupENT();
        entBloodGroup = balBloodGroup.SelectByPK(BloodGroupID);
        if (!entBloodGroup.BloodGroupName.IsNull)
            txtBloodGroupName.Text = entBloodGroup.BloodGroupName.ToString();
    }
    #endregion Fill form data From Database
}