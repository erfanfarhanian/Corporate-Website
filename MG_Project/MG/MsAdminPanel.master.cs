using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MsAdminPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIdS"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Session["RegisterStatusS"].ToString() == "0")
        {
            Response.Redirect("Login.aspx");
        }
        if (Session["RegisterStatusS"].ToString() == "1")
        {
            pnlAdmin.Visible = true;
        }
        lblFullName.Text = Session["FullNameS"].ToString();

        DataSet ViewNews = new DataSet();
        ViewNews.Reset();
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string query = "select  NewsID, Pic from Tbl_News where ExpiredDate = N'" + GetDate() + "'";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.Fill(ViewNews, "Tbl_News");
        conn.Close();
        if (ViewNews.Tables["Tbl_News"].Rows.Count != 0)
        {
            System.IO.File.Delete(Server.MapPath("~/Images/NewsImage/" + ViewNews.Tables["Tbl_News"].Rows[0]["Pic"].ToString()));
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("delete from Tbl_News where ExpiredDate = N'" + GetDate() + "'", con);

        con.Open();
        int id = cmd.ExecuteNonQuery();
        con.Close();
    }

    private string GetDate()
    {
        PersianCalendar pc = new PersianCalendar();
        DateTime dt = DateTime.Now;
        string Year = pc.GetYear(dt).ToString();
        string Month = pc.GetMonth(dt).ToString().Length == 1 ? "0" + pc.GetMonth(dt).ToString() : pc.GetMonth(dt).ToString();
        string Day = pc.GetDayOfMonth(dt).ToString().Length == 1 ? "0" + pc.GetDayOfMonth(dt).ToString() : pc.GetDayOfMonth(dt).ToString();
        return string.Format("{0}/{1}/{2}", Year, Month, Day);
    }

    protected void btnExitPanel_Click(object sender, EventArgs e)
    {
        Session.Remove("UserIdS");
        Session.Remove("FullNameS");
        Response.Redirect("Login.aspx");
    }
}
