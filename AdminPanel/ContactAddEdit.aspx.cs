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
using System.IO;
using AddressBook;
using AddressBook.ENT;
using AddressBook.BAL;

public partial class Master_Page_AdminPanel_ContactAddEdit : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ContactID"] == null)
            {
                lblTitle.Text = "Contact &nbsp; List &nbsp; Add";
                FillDropDownListState();
                FillDropDownListBloodGroup();
                FillDropDownListCity();
                FillDropDownListCountry();
                FillCheckBoxListContactCategory();
            }
            else
            {
                lblTitle.Text = "Contact &nbsp; List &nbsp; Edit";
                FillDropDownListState();
                FillDropDownListBloodGroup();
                FillDropDownListCity();
                FillDropDownListCountry();
                FillCheckBoxListContactCategory();
                FillContactData(Convert.ToInt32(Request.QueryString["ContactID"].ToString().Trim()));
            }
        }
    }
    #endregion Page Load Event

    #region Fill DropDown List of BloodGroup
    private void FillDropDownListBloodGroup()
    {
        CommanFillMethod.FillBloodgroupDropDownListBloodGroup(ddlBloodGroup);
    }
    #endregion Fill DropDown List of BloodGroup

    #region Fill DropDown List of City
    private void FillDropDownListCity()
    {
        CommanFillMethod.FillCityDropDownListCity(ddlCity);
    }
    #endregion Fill DropDown List of City

    #region Fill DropDown List of Country
    private void FillDropDownListCountry()
    {
        CommanFillMethod.FillCountryDropDownListCountry(ddlCountry);
    }
    #endregion Fill DropDown List of Country

    #region Fill Check Box List of ContactCategory
    private void FillCheckBoxListContactCategory()
    {
        CommanFillMethod.FillContactcategoryDropDownListContactCategory(chkCategory);
    }
    #endregion Fill Check Box List of ContactCategory

    #region Fill DropDown List of state
    private void FillDropDownListState()
    {
        CommanFillMethod.FillStateDropDownListState(ddlState);
    }
    #endregion Fill DropDown List of state

    #region Save Button Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variable

        String strError = "";
        SqlInt32 StateID = SqlInt32.Null;
        SqlInt32 CityID = SqlInt32.Null;
        SqlInt32 CountryID = SqlInt32.Null;
        SqlInt32 BloodGroupID = SqlInt32.Null;
        SqlString ContactCategoryName = SqlString.Null;
        SqlString Address = SqlString.Null;
        SqlInt32 Age = SqlInt32.Null;
        SqlString Email = SqlString.Null;
        SqlString Gender = SqlString.Null;
        SqlString MobileNo = SqlString.Null;
        SqlString ContactName = SqlString.Null;
        SqlString PhoneNo = SqlString.Null;
        SqlString Pincode = SqlString.Null;
        SqlString Profession = SqlString.Null;
        SqlString PhotoPath = SqlString.Null;
        string chkselect = "";

        #endregion Local Variable

        #region Check for Error
        if (txtContactAddress.Text.Trim() == "")
        {
            strError += "Enter Address<br/>";
            txtContactAddress.Focus();
        }
        if (txtContactAge.Text.Trim() == "")
        {
            strError += "Enter Age<br/>";
            txtContactAge.Focus();
        }
        if (txtContactEmail.Text.Trim() == "")
        {
            strError += "Enter E-mail<br/>";
            txtContactEmail.Focus();
        }
        if (txtContactMobile.Text.Trim() == "")
        {
            strError += "Enter Mobile No.<br/>";
            txtContactMobile.Focus();
        }
        if (txtContactName.Text.Trim() == "")
        {
            strError += "Enter Name<br/>";
            txtContactName.Focus();
        }
        if (txtContactPhone.Text.Trim() == "")
        {
            strError += "Enter Phone No.<br/>";
            txtContactPhone.Focus();
        }
        if (txtContactPincode.Text.Trim() == "")
        {
            strError += "Enter City Pincode<br/>";
            txtContactPincode.Focus();
        }
        if (txtContactProfession.Text.Trim() == "")
        {
            strError += "Enter Profeession<br/>";
            txtContactProfession.Focus();
        }
        if (ddlBloodGroup.SelectedIndex == 0)
        {
            strError += "Select Blood Group<br/>";
            ddlBloodGroup.Focus();
        }
        if (ddlCity.SelectedIndex == 0)
        {
            strError += "Select City<br/>";
            ddlCity.Focus();
        }

        if (ddlCountry.SelectedIndex == 0)
        {
            strError += "Select Country<br/>";
            ddlCountry.Focus();
        }
        if (ddlState.SelectedIndex == 0)
        {
            strError += "Select State   <br/>";
            ddlState.Focus();
        }
        if (fuPhoto.HasFile == false)
        {
            strError += "Select File of Photo";
            fuPhoto.Focus();
        }
        if (strError.Trim() != "")
        {
            lblError.Text = strError;
            return;
        }
        #endregion Check for Error

        #region Assign value

        ContactENT entContact = new ContactENT();

        for (int i = 0; i < chkCategory.Items.Count; i++)
        {
            if (chkCategory.Items[i].Selected)
            {
                if (chkselect == "")
                {
                    chkselect = chkCategory.Items[i].Text;
                }
                else
                {
                    chkselect += "," + chkCategory.Items[i].Text;
                }
            }
        }

        if (ddlBloodGroup.SelectedIndex > 0)
        {
            entContact.BloodgroupID = Convert.ToInt32(ddlBloodGroup.SelectedValue);
        }
        if (ddlCity.SelectedIndex > 0)
        {
            entContact.CityID = Convert.ToInt32(ddlCity.SelectedValue);
        }

        if (chkselect != "")
        {
            entContact.ContactcategoryName = chkselect.ToString().Trim();
        }

        if (ddlCountry.SelectedIndex > 0)
        {
            entContact.CountryID = Convert.ToInt32(ddlCountry.SelectedValue);
        }
        if (ddlState.SelectedIndex > 0)
        {
            entContact.StateID = Convert.ToInt32(ddlState.SelectedValue);
        }
        if (txtContactAddress.Text.Trim() != "")
        {
            entContact.Address = txtContactAddress.Text.Trim();
        }
        if (txtContactAge.Text.Trim() != "")
        {
            entContact.Age = Convert.ToInt32(txtContactAge.Text.Trim());
        }
        if (txtContactEmail.Text.Trim() != "")
        {
            entContact.Email = txtContactEmail.Text.Trim();
        }
        if (rbMale.Checked)
        {
            entContact.Gender = rbMale.Text.Trim();
        }
        if (rbFemale.Checked)
        {
            entContact.Gender = rbFemale.Text.Trim();
        }
        if (txtContactMobile.Text.Trim() != "")
        {
            entContact.MobileNo = txtContactMobile.Text.Trim();
        }
        if (txtContactName.Text.Trim() != "")
        {
            entContact.ContactName = txtContactName.Text.Trim();
        }
        if (txtContactPhone.Text.Trim() != "")
        {
            entContact.PhoneNo = txtContactPhone.Text.Trim();
        }
        if (txtContactPincode.Text.Trim() != "")
        {
            entContact.Pincode = txtContactPincode.Text.Trim();
        }
        if (txtContactProfession.Text.Trim() != "")
        {
            entContact.Profession = txtContactProfession.Text.Trim();
        }
        if (fuPhoto.HasFile)
        {
            String location = "~/Master_Page/AdminPanel/Photo/";
            location += fuPhoto.FileName;

            String locationPhysical = Server.MapPath(location);

            if (File.Exists(locationPhysical))
            {
                File.Delete(locationPhysical);
            }

            fuPhoto.SaveAs(locationPhysical);

            entContact.PhotoPath = location;
        }
        #endregion Assign value

        #region Save OR Edit 
        ContactBAL balContact = new ContactBAL();
        if (Request.QueryString["ContactID"] == null)
        {
            if (balContact.Insert(entContact))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "save()", true);
                ClearControl();
            }
            else
            {
                lblError.Text = balContact.Message;
            }
        }
        else
        {
            entContact.ContactID = Convert.ToInt32(Request.QueryString["ContactID"]);
            if (balContact.Update(entContact))
            {
                ClearControl();
                Response.Redirect("~/Master_Page/AdminPanel/ContactGridList.aspx");
            }
            else
            {
                lblError.Text = balContact.Message;
            }
        }
        #endregion
    }
    #endregion Save Button Event

    #region Cancel Button Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Master_Page/AdminPanel/ContactGridList.aspx");
    }
    #endregion Cancel Button Event

    #region Fill data From Database
    private void FillContactData(SqlInt32 ContactID)
    {
        ContactBAL balContact = new ContactBAL();
        ContactENT entContact = new ContactENT();
        entContact = balContact.SelectByPK(ContactID);

        if (!entContact.ContactName.IsNull)
        {
            txtContactName.Text = entContact.ContactName.ToString();
        }
        if (!entContact.Address.IsNull)
        {
            txtContactAddress.Text = entContact.Address.ToString();
        }
        if (!entContact.Email.IsNull)
        {
            txtContactEmail.Text = entContact.Email.ToString();
        }
        if (!entContact.Profession.IsNull)
        {
            txtContactProfession.Text = entContact.Profession.ToString();
        }
        if (!entContact.MobileNo.IsNull)
        {
            txtContactMobile.Text = entContact.MobileNo.ToString();
        }
        if (!entContact.PhoneNo.IsNull)
        {
            txtContactPhone.Text = entContact.PhoneNo.ToString();
        }
        if (!entContact.Gender.IsNull)
        {
            if (entContact.Gender.ToString() == "Male")
                rbMale.Checked = true;
            if (entContact.Gender.ToString() == "Female")
                rbFemale.Checked = true;
        }

        if (!entContact.StateID.IsNull)
        {
            ddlState.SelectedValue = entContact.StateID.ToString();
        }
        if (!entContact.CityID.IsNull)
        {
            ddlCity.SelectedValue = entContact.CityID.ToString();
        }

        if (!entContact.CountryID.IsNull)
        {
            ddlCountry.SelectedValue = entContact.CountryID.ToString();
        }
        if (!entContact.BloodgroupID.IsNull)
        {
            ddlBloodGroup.SelectedValue = entContact.BloodgroupID.ToString();
        }
        if (!entContact.ContactcategoryName.IsNull)
        {
            string word = entContact.ContactcategoryName.ToString().Trim();
            string[] words = word.Split(',');

            foreach (ListItem finalitem in chkCategory.Items)
            {
                foreach (var final in words)
                {
                    if (finalitem.Text == final.ToString().Trim())
                    {
                        finalitem.Selected = true;
                    }
                        
                }
            }
        }
        if (!entContact.Age.IsNull)
        {
            txtContactAge.Text = entContact.Age.ToString();

        }
        if (!entContact.Pincode.IsNull)
        {
            txtContactPincode.Text = entContact.Pincode.ToString();

        }
    }
    #endregion Fill form data From Database

    #region Clear Control
    private void ClearControl()
    {
        txtContactName.Text = "";
        txtContactMobile.Text = "";
        txtContactPhone.Text = "";
        txtContactEmail.Text = "";
        ddlCity.Items.Clear();
        ddlState.Items.Clear();
        ddlCountry.SelectedIndex = 0;
        ddlBloodGroup.Items.Clear();
        chkCategory.ClearSelection();
        txtContactAddress.Text = "";
        txtContactAge.Text = "";
        txtContactProfession.Text = "";
        rbMale.Checked = true;
        txtContactName.Focus();
    }
    #endregion Clear Control
}