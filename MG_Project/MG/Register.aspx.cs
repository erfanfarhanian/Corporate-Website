using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

        txtBirthDate.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        lblEmpName.Visible = false;
        lblEmpFamily.Visible = false;
        lblEmpEmail.Visible = false;
        lblEmpMelliCode.Visible = false;
        lblEmpBirthDate.Visible = false;
        lblEmpUsername.Visible = false;
        lblEmpPassword.Visible = false;
        lblEmpPassword.Visible = false;
        lblEmpRepeatedPass.Visible = false;
        lblWrongRepeatedPass.Visible = false;
        lblSuccessMsg.Visible = false;
        if (txtName.Text != "")
        {
            if (txtFamily.Text != "")
            {
                if (txtMelliCode.Text != "")
                {
                    if (txtEmail.Text != "")
                    {
                        if (txtMobile.Text != "")
                        {
                            if (txtBirthDate.Text != "")
                            {
                                if (txtUsername.Text != "")
                                {
                                    if (txtPassword.Text != "")
                                    {
                                        if (txtRepeatedPass.Text != "")
                                        {
                                            if (txtPassword.Text == txtRepeatedPass.Text)
                                            {
                                                string saveQuery = "INSERT INTO dbo.Tbl_User( Username ,Password ,FirstName ,LastName ,MelliCode , Email ,BirthDate ,Degree ,Major ,Mobile ,RegisterStatus)VALUES( @Username ,@Password ,@FirstName ,@LastName ,@MelliCode ,@Email ,@BirthDate ,@Degree ,@Major ,@Mobile , @RegisterStatus)";
                                                conn.Open();
                                                SqlCommand cmd = new SqlCommand(saveQuery, conn);
                                                cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = txtUsername.Text;
                                                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 15).Value = txtPassword.Text;
                                                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = txtName.Text;
                                                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 100).Value = txtFamily.Text;
                                                cmd.Parameters.Add("@MelliCode", SqlDbType.NVarChar, 10).Value = txtMelliCode.Text;
                                                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
                                                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 11).Value = txtMobile.Text;
                                                cmd.Parameters.Add("@BirthDate", SqlDbType.NVarChar, 10).Value = txtBirthDate.Text;
                                                cmd.Parameters.Add("@Degree", SqlDbType.NVarChar, 50).Value = txtDegree.Text;
                                                cmd.Parameters.Add("@Major", SqlDbType.NVarChar, 50).Value = txtMajor.Text;
                                                cmd.Parameters.Add("@RegisterStatus", SqlDbType.Int).Value = 0;
                                                cmd.ExecuteNonQuery();
                                                lblSuccessMsg.Text = "1";
                                                conn.Close();

                                                txtName.Text = "";
                                                txtFamily.Text = "";
                                                txtMajor.Text = "";
                                                txtDegree.Text = "";
                                                txtEmail.Text = "";
                                                txtMobile.Text = "";
                                                txtBirthDate.Text = "";
                                                txtPassword.Text = "";
                                                txtRepeatedPass.Text = "";
                                                txtMelliCode.Text = "";
                                                txtUsername.Text = "";
                                            }
                                            else
                                            {
                                                lblWrongRepeatedPass.Visible = true;
                                            }
                                        }
                                        else
                                        {
                                            lblEmpRepeatedPass.Visible = true;
                                        }
                                    }
                                    else
                                    {
                                        lblEmpPassword.Visible = true;
                                    }
                                }
                                else
                                {
                                    lblEmpUsername.Visible = true;
                                }
                            }
                            else
                            {
                                lblEmpBirthDate.Visible = true;
                            }
                        }
                        else
                        {
                            lblEmpMobile.Visible = true;
                        }
                    }
                    else
                    {
                        lblEmpEmail.Visible = true;
                    }
                }
                else
                {
                    lblEmpMelliCode.Visible = true;
                }
            }
            else
            {
                lblEmpFamily.Visible = true;
            }
        }
        else
        {
            lblEmpName.Visible = true;
        }
    }
}