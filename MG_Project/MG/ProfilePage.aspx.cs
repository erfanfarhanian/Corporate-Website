using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (true)
        {
            if (Session["UserIds"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        string strConn = "Data Source=.;Initial Catalog=MG_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string query = "select FirstName, LastName, MelliCode, Username, Email, Mobile, BirthDate, Degree, Major, RegisterStatus from Tbl_User where Username = '" + Session["UsernameS"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("Username", Session["UsernameS"].ToString());
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();

        lblUserName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Username"]);
        lblName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
        lblFamily.Text = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
        lblMelliCode.Text = Convert.ToString(ds.Tables[0].Rows[0]["MelliCode"]);
        lblBirthDate.Text = Convert.ToString(ds.Tables[0].Rows[0]["BirthDate"]);
        lblDegree.Text = Convert.ToString(ds.Tables[0].Rows[0]["Degree"]);
        lblMajor.Text = Convert.ToString(ds.Tables[0].Rows[0]["Major"]);
        lblEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
        lblMobile.Text = Convert.ToString(ds.Tables[0].Rows[0]["Mobile"]);
        if (Convert.ToString(ds.Tables[0].Rows[0]["RegisterStatus"]) == "1")
            lblRegisterStatus.Text = "مدیر";
        if (Convert.ToString(ds.Tables[0].Rows[0]["RegisterStatus"]) == "2")
            lblRegisterStatus.Text = "کاربر معمولی";

    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {

    }
}