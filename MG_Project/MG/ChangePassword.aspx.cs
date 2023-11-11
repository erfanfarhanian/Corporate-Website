using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();
        string query = "";
        SqlDataAdapter da;

        ViewUser.Reset();
        SqlConnection conn = new SqlConnection(strConn);
        query = "select * from Tbl_User where UserID = '" + Session["UserIdS"].ToString() + "'";
        conn.Open();
        da = new SqlDataAdapter(query, conn);
        da.Fill(ViewUser, "Tbl_User");
        conn.Close();
        lblEmpRepeatPass.Visible = false;
        lblEmpNewPass.Visible = false;
        lblEmpPrevPass.Visible = false;
        if (txtPrevPass.Text != "")
        {
            if (txtPrevPass.Text == ViewUser.Tables["Tbl_User"].Rows[0]["Password"].ToString())
            {
                if (txtNewPass.Text != "")
                {
                    if (txtRepeatPass.Text != "")
                    {

                        if (txtNewPass.Text == txtRepeatPass.Text)
                        {
                            string saveQuery = "update Tbl_User set Password = @Password where UserID = '" + Session["UserIdS"].ToString() + "' ";
                            conn.Open();
                            SqlCommand cmd = new SqlCommand(saveQuery, conn);
                            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 15).Value = txtNewPass.Text;
                            cmd.ExecuteNonQuery();
                            lblSuccessMsg.Text = "1";
                            conn.Close();
                            pnlChangePassword.Visible = false;
                            btnReturn.Visible = true;
                        }
                        else
                            lblWrongPassAndRptPass.Visible = true;

                    }
                    else
                        lblEmpRepeatPass.Visible = true;
                }
                else
                    lblEmpNewPass.Visible = true;
            }
            else
                lblWrongPrevPass.Visible = true;
        }
        else
            lblEmpPrevPass.Visible = true;
    }
}