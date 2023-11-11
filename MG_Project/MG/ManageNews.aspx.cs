using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageNews : System.Web.UI.Page
{
    private int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIdS"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Session["RegisterStatusS"].ToString() != "1")
        {
            btnAllNews.Visible = false;
        }
        if (!IsPostBack)
        {
            this.GetAllNewsPageWise(1);
            this.GetAllNewsPageWiseByUserID(1);
        }
    }

    private void GetAllNewsPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageNews_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptNewsList.DataSource = idr;
                rptNewsList.DataBind();
                idr.Close();
                con.Close();
                int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                this.PopulatePager(recordCount, pageIndex);
            }
        }
    }

    private void GetAllNewsPageWiseByUserID(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageNewsByUserID_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.AddWithValue("@UserID", Session["UserIdS"]);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptNewsListByID.DataSource = idr;
                rptNewsListByID.DataBind();
                idr.Close();
                con.Close();
                int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                this.PopulatePager(recordCount, pageIndex);
            }
        }
    }

    private void PopulatePager(int recordCount, int currentPage)
    {
        double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
        int pageCount = (int)Math.Ceiling(dblPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 0)
        {
            for (int i = 1; i <= pageCount; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
            }
        }
        rptPager.DataSource = pages;
        rptPager.DataBind();
    }

    protected void Page_Changed(object sender, EventArgs e)
    {
        int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
        this.GetAllNewsPageWise(pageIndex);
        this.GetAllNewsPageWiseByUserID(pageIndex);
    }

    public DataSet SearchNews()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT NewsID ,TitleNews ,STextNews ,LTextNews ,UserID ,SaveDate ,SaveTime ,CASE WHEN ShowStatus = 0 THEN N'درحال بررسی' WHEN ShowStatus = 1 THEN N'تایید شده' WHEN ShowStatus = 2 THEN N'رد شده' END AS Status, CASE WHEN CommentStatus = 0 THEN N'عدم نمایش' WHEN CommentStatus = 1 THEN N'نمایش' END AS CommentStatus, Pic FROM Tbl_News WHERE TitleNews LIKE N'%" + txtSearch.Text + "%' OR STextNews LIKE N'%" + txtSearch.Text + "%' OR LTextNews LIKE N'%" + txtSearch.Text + "%'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptNewsList.DataSource = ds.Tables[0];
                rptNewsList.DataBind();
                pnlPager.Visible = false;
            }
        }
        return ds;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = SearchNews();
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNotFound.Visible = true;
                rptPager.Visible = true;
                txtSearch.Text = "";
                lblNotFound.Text = "";
            }
            else
            {
                lblNotFound.Visible = true;
                lblNotFound.Text = "خبر موردنظر یافت نشد.";
            }
        }
    }

    protected void btnAllNews_Click(object sender, EventArgs e)
    {
        pnlNewsListByUserID.Visible = false;
        pnlNewsList.Visible = true;
        pnlPager.Visible = true;
        this.GetAllNewsPageWise(1);


    }

    protected void btnYourNews_Click(object sender, EventArgs e)
    {
        pnlNewsListByUserID.Visible = true;
        pnlNewsList.Visible = false;
        pnlPager2.Visible = true;
        this.GetAllNewsPageWiseByUserID(1);
    }

    public DataSet SearchNewsByUserID()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT NewsID ,TitleNews ,STextNews ,LTextNews ,UserID ,SaveDate ,SaveTime ,CASE WHEN ShowStatus = 0 THEN N'درحال بررسی' WHEN ShowStatus = 1 THEN N'تایید شده' WHEN ShowStatus = 2 THEN N'رد شده' END AS Status, CASE WHEN CommentStatus = 0 THEN N'عدم نمایش' WHEN CommentStatus = 1 THEN N'نمایش' END AS CommentStatus, Pic FROM Tbl_News WHERE (TitleNews LIKE N'%" + txtSearch2.Text + "%' OR STextNews LIKE N'%" + txtSearch2.Text + "%' OR LTextNews LIKE N'%" + txtSearch2.Text + "%') AND UserID ='" + Session["UserIdS"] + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptNewsListByID.DataSource = ds.Tables[0];
                rptNewsListByID.DataBind();
                pnlPager2.Visible = false;
            }
        }
        return ds;
    }

    protected void imgBtnSearch2_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = SearchNewsByUserID();
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNotFound2.Visible = true;
                rptPager2.Visible = true;
                txtSearch2.Text = "";
                lblNotFound2.Text = "";
            }
            else
            {
                lblNotFound2.Visible = true;
                lblNotFound2.Text = "خبر موردنظر یافت نشد.";
            }
        }
    }



    protected void rptNewsList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            
            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select  NewsID, Pic from Tbl_News where NewsID = '" + ID + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_News");
            conn.Close();
            if (ViewNews.Tables["Tbl_News"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Images/NewsImage/" + ViewNews.Tables["Tbl_News"].Rows[0]["Pic"].ToString()));
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_News where NewsID = @NewsID", con);
            cmd.Parameters.AddWithValue("NewsID", ID);

            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllNewsPageWise(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("NewsIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditNews.aspx");
        }
    }

    protected void rptNewsListByID_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select NewsID, Pic from Tbl_News where NewsID = '" + ID + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_News");
            conn.Close();
            if (ViewNews.Tables["Tbl_News"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Images/NewsImage/" + ViewNews.Tables["Tbl_News"].Rows[0]["Pic"].ToString()));
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_News where NewsID=@NewsID", con);
            cmd.Parameters.AddWithValue("NewsID", ID);
            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllNewsPageWiseByUserID(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("NewsIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditNews.aspx");
        }
    }
}