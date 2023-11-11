using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditPortal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT PortalID , PortalTitle ,PortalUrl, PortalPic FROM dbo.Tbl_Portal where PortalID = '" + Session["PortalIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_Portal");
            conn.Close();
            if (ViewNews.Tables["Tbl_Portal"].Rows.Count != 0)
            {
                pnlEditPortal.Visible = true;

                txtPortalTitle.Text = ViewNews.Tables["Tbl_Portal"].Rows[0]["PortalTitle"].ToString();
                txtURL.Text = ViewNews.Tables["Tbl_Portal"].Rows[0]["PortalUrl"].ToString();
                imgPreview.ImageUrl = "~/Images/PortalWebImg/" + ViewNews.Tables["Tbl_Portal"].Rows[0]["PortalPic"].ToString();
            }
        }
    }

    protected void btnEditPortal_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpPortalTitle.Visible = false;
        lblEmpURL.Visible = false;
        lblEmpPic.Visible = false;

        if (txtPortalTitle.Text != "")
        {
            if (txtURL.Text != "")
            {
                string query = "UPDATE dbo.Tbl_Portal SET PortalTitle = @PortalTitle, PortalUrl = @PortalUrl WHERE PortalID = '" + Session["PortalIdS"].ToString() + "'";

                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                if (imgUpload.HasFile)
                {
                    string picQuery = "UPDATE dbo.Tbl_Portal SET PortalPic = @PortalPic WHERE PortalID = '" + Session["PortalIdS"].ToString() + "'";
                    SqlConnection conn2 = new SqlConnection(strConn);
                    conn2.Open();
                    SqlCommand cmd2 = new SqlCommand(picQuery, conn2);
                    string str = imgUpload.FileName;
                    imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/PortalWebImg/" + str));
                    string image = str.ToString();
                    cmd2.Parameters.Add("@PortalPic", SqlDbType.NVarChar, 50).Value = image;
                    cmd2.ExecuteNonQuery();
                    conn2.Close();
                }
                cmd.Parameters.Add("@PortalTitle", SqlDbType.NVarChar, 100).Value = txtPortalTitle.Text;
                cmd.Parameters.Add("@PortalUrl", SqlDbType.NVarChar, 100).Value = txtURL.Text;
                cmd.ExecuteNonQuery();
                conn.Close();

                lblSuccessMsg.Text = "1";
                pnlEditPortal.Visible = false;
                txtPortalTitle.Text = string.Empty;
                txtURL.Text = string.Empty;
            }
            else
                lblEmpURL.Visible = true;
        }
        else
            lblEmpPortalTitle.Visible = true;
    }
}