using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditUser : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT UserID ,Username ,Password ,FirstName ,LastName ,MelliCode ,Email ,BirthDate ,Degree ,Major ,RegisterStatus ,Mobile FROM dbo.Tbl_User where UserID = '" + Session["SelectedUserIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_User");
            conn.Close();
            if (ViewNews.Tables["Tbl_User"].Rows.Count != 0)
            {
                pnlEditUser.Visible = true;

                txtName.Text = ViewNews.Tables["Tbl_User"].Rows[0]["FirstName"].ToString();
                txtFamily.Text = ViewNews.Tables["Tbl_User"].Rows[0]["LastName"].ToString();
                txtMelliCode.Text = ViewNews.Tables["Tbl_User"].Rows[0]["MelliCode"].ToString();
                txtEmail.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Email"].ToString();
                txtMobile.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Mobile"].ToString();
                txtUsername.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Username"].ToString();
                txtPassword.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Password"].ToString();
                txtBirthDate.Text = ViewNews.Tables["Tbl_User"].Rows[0]["BirthDate"].ToString();
                txtMajor.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Major"].ToString();
                txtDegree.Text = ViewNews.Tables["Tbl_User"].Rows[0]["Degree"].ToString();
                drpDnLstStatus.SelectedIndex = Convert.ToInt32(ViewNews.Tables["Tbl_User"].Rows[0]["RegisterStatus"]);
            }
        }
    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        lblEmpUsername.Visible = false;
        lblEmpPassword.Visible = false;
        lblEmpBirthDate.Visible = false;
        lblEmpMelliCode.Visible = false;
        lblEmpName.Visible = false;
        lblEmpFamily.Visible = false;
        lblEmpEmail.Visible = false;
        lblSuccessMsg.Visible = false;
        btnReturn.Visible = false;
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
                                        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
                                        SqlConnection conn = new SqlConnection(strConn);
                                        string saveQuery = "update Tbl_User set Username = @Username, Password = @Password, FirstName = @FirstName, LastName = @LastName, MelliCode = @MelliCode, Email = @Email, Mobile = @Mobile, BirthDate = @BirthDate, Degree = @Degree, Major = @Major, RegisterStatus = @RegisterStatus where UserID = '" + Session["SelectedUserIdS"].ToString() + "' ";
                                        SqlCommand cmd = new SqlCommand(saveQuery, conn);
                                        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = txtName.Text;
                                        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 100).Value = txtFamily.Text;
                                        cmd.Parameters.Add("@MelliCode", SqlDbType.NVarChar, 10).Value = txtMelliCode.Text;
                                        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
                                        cmd.Parameters.Add("@BirthDate", SqlDbType.NVarChar, 10).Value = txtBirthDate.Text;
                                        cmd.Parameters.Add("@Degree", SqlDbType.NVarChar, 50).Value = txtDegree.Text;
                                        cmd.Parameters.Add("@Major", SqlDbType.NVarChar, 50).Value = txtMajor.Text;
                                        cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = txtMobile.Text;
                                        cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = txtUsername.Text;
                                        cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = txtPassword.Text;
                                        cmd.Parameters.Add("@RegisterStatus", SqlDbType.Int).Value = Convert.ToInt32(drpDnLstStatus.SelectedIndex);
                                        conn.Open();
                                        cmd.ExecuteNonQuery();
                                        conn.Close();
                                        lblSuccessMsg.Text = "1";
                                        btnReturn.Visible = true;
                                        pnlEditUser.Visible = false;
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