using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIdS"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select FirstName, LastName, MelliCode, Username, Email, Mobile, BirthDate, Degree, Major, RegisterStatus from Tbl_User where UserID = '" + Session["UserIdS"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("Username", Session["UsernameS"].ToString());
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();

            txtName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
            txtUsername.Text = Convert.ToString(ds.Tables[0].Rows[0]["Username"]);
            txtFamily.Text = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
            txtMelliCode.Text = Convert.ToString(ds.Tables[0].Rows[0]["MelliCode"]);
            txtBirthDate.Text = Convert.ToString(ds.Tables[0].Rows[0]["BirthDate"]);
            txtDegree.Text = Convert.ToString(ds.Tables[0].Rows[0]["Degree"]);
            txtMajor.Text = Convert.ToString(ds.Tables[0].Rows[0]["Major"]);
            txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
            txtMobile.Text = Convert.ToString(ds.Tables[0].Rows[0]["Mobile"]);
        }

        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        lblEmpMajor.Visible = false;
        lblEmpDegree.Visible = false;
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
                                if (txtDegree.Text != "")
                                {
                                    if (txtMajor.Text != "")
                                    {
                                        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
                                        SqlConnection conn = new SqlConnection(strConn);
                                        string saveQuery = "update Tbl_User set FirstName = @FirstName, LastName = @LastName, MelliCode = @MelliCode, Email = @Email, Mobile = @Mobile, BirthDate = @BirthDate, Degree = @Degree, Major = @Major where UserID = '" + Session["UserIdS"].ToString() + "' ";
                                        SqlCommand cmd = new SqlCommand(saveQuery, conn);
                                        cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = txtName.Text;
                                        cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 100).Value = txtFamily.Text;
                                        cmd.Parameters.Add("@MelliCode", SqlDbType.NVarChar, 10).Value = txtMelliCode.Text;
                                        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtEmail.Text;
                                        cmd.Parameters.Add("@BirthDate", SqlDbType.NVarChar, 10).Value = txtBirthDate.Text;
                                        cmd.Parameters.Add("@Degree", SqlDbType.NVarChar, 50).Value = txtDegree.Text;
                                        cmd.Parameters.Add("@Major", SqlDbType.NVarChar, 50).Value = txtMajor.Text;
                                        cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = txtMobile.Text;

                                        conn.Open();
                                        cmd.ExecuteNonQuery();
                                        conn.Close();
                                        lblSuccessMsg.Text = "1";
                                        btnReturn.Visible = true;
                                        pnlUpdateProfile.Visible = false;
                                    }
                                    else
                                    {
                                        lblEmpDegree.Visible = true;
                                    }
                                }
                                else
                                    lblEmpMajor.Visible = true;
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