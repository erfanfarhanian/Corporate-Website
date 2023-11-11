using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Session["RegisterStatusS"].ToString() != "1")
        {
            Response.Redirect("AdminPanel.aspx");
        }
    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        lblWrongRepeatedPass.Visible = false;
        lblEmpBirthDate.Visible = false;
        lblEmpMelliCode.Visible = false;
        lblEmpName.Visible = false;
        lblEmpFamily.Visible = false;
        lblEmpEmail.Visible = false;
        lblSuccessMsg.Visible = false;
        btnReturn.Visible = false;
        lblEmpUsername.Visible = false;
        lblEmpPassword.Visible = false;
        lblRepeatedPass.Visible = false;
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
                                        if (txtRepeatedPass.Text == txtPassword.Text)
                                        {
                                            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
                                            SqlConnection conn = new SqlConnection(strConn);
                                            string saveQuery = "INSERT INTO dbo.Tbl_User( Username ,Password ,FirstName ,LastName ,MelliCode ,Email ,BirthDate ,Degree ,Major ,RegisterStatus ,Mobile )VALUES  ( @Username ,@Password ,@FirstName , @LastName ,@MelliCode , @Email ,@BirthDate , @Degree , @Major , @RegisterStatus ,@Mobile )";
                                            SqlCommand cmd = new SqlCommand(saveQuery, conn);
                                            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = txtName.Text;
                                            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 100).Value = txtFamily.Text;
                                            cmd.Parameters.Add("@MelliCode", SqlDbType.NVarChar, 10).Value = txtMelliCode.Text;
                                            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
                                            cmd.Parameters.Add("@BirthDate", SqlDbType.NVarChar, 10).Value = txtBirthDate.Text;
                                            cmd.Parameters.Add("@Degree", SqlDbType.NVarChar, 50).Value = txtDegree.Text;
                                            cmd.Parameters.Add("@Major", SqlDbType.NVarChar, 50).Value = txtMajor.Text;
                                            cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 11).Value = txtMobile.Text;
                                            cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = txtUsername.Text;
                                            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 15).Value = txtPassword.Text;
                                            cmd.Parameters.Add("@RegisterStatus", SqlDbType.Int).Value = Convert.ToInt32(drpDnLstStatus.SelectedIndex);
                                            conn.Open();
                                            cmd.ExecuteNonQuery();
                                            conn.Close();
                                            lblSuccessMsg.Text = "1";
                                            btnReturn.Visible = true;
                                            pnlInsertUser.Visible = false;
                                        }
                                        else
                                            lblWrongRepeatedPass.Visible = true;
                                    }
                                    else
                                        lblEmpPassword.Visible = true;
                                }
                                else
                                    lblEmpUsername.Visible = true;
                            }
                            else
                                lblEmpBirthDate.Visible = true;
                        }
                        else
                            lblEmpMobile.Visible = true;
                    }
                    else
                        lblEmpEmail.Visible = true;
                }
                else
                    lblEmpMelliCode.Visible = true;
            }
            else
                lblEmpFamily.Visible = true;
        }
        else
            lblEmpName.Visible = true;
    }
}