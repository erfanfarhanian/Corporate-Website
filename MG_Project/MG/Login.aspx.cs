using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lblUsername.Visible = false;
        lblPassword.Visible = false;
        lblNotAccepted.Visible = false;

        string strConn = "Data Source=.;Initial Catalog=MG_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();
        string query = "";
        SqlDataAdapter da;

        ViewUser.Reset();
        SqlConnection conn = new SqlConnection(strConn);
        query = "select UserID, FirstName + ' ' + LastName as FullName, Username, Password, RegisterStatus from Tbl_User where Username = '" + txtUsername.Text + "'";
        conn.Open();
        da = new SqlDataAdapter(query, conn);
        da.Fill(ViewUser, "Tbl_User");
        conn.Close();
        if (ViewUser.Tables["Tbl_User"].Rows.Count != 0)
        {
            String pass = ViewUser.Tables["Tbl_User"].Rows[0]["Password"].ToString();
            if (pass == txtPassword.Text)
            {
                Session.Add("UsernameS", ViewUser.Tables["Tbl_User"].Rows[0]["Username"].ToString());
                Session.Add("FullNameS", ViewUser.Tables["Tbl_User"].Rows[0]["FullName"].ToString());
                Session.Add("UserIdS", ViewUser.Tables["Tbl_User"].Rows[0]["UserID"].ToString());
                Session.Add("RegisterStatusS", ViewUser.Tables["Tbl_User"].Rows[0]["RegisterStatus"].ToString());
                lblUsername.Visible = false;
                lblPassword.Visible = false;
                if (Session["RegisterStatusS"].ToString() == "1" || Session["RegisterStatusS"].ToString() == "2")
                {
                    Response.Redirect("AdminPanel.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                    lblNotAccepted.Visible = true;
                }
            }
            else
            {
                lblPassword.Visible = true;
                lblPassword.Text = "لطفا کلمه عبور را به درستی وارد نمایید";
            }
        }
        else
        {
            lblUsername.Visible = true;
            lblUsername.Text = "لطفا نام کاربری را به درستی وارد نمایید";
        }
    }
}