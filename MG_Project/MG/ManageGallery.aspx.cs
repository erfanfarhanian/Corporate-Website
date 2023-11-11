using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageGallery : System.Web.UI.Page
{
    private int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIdS"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            this.GetAllGalleryPageWise(1);
        }
    }

    private void GetAllGalleryPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageGallery_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptGalleryList.DataSource = idr;
                rptGalleryList.DataBind();
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
        this.GetAllGalleryPageWise(pageIndex);
    }

    protected void btnShowGallery_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageGallery.aspx");
    }

    protected void rptGalleryList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";

            DataSet ViewImg = new DataSet();
            ViewImg.Reset();
            SqlConnection conn2 = new SqlConnection(strConn);
            string query2 = "select GalleryID, ImageName from Tbl_Image where GalleryID = " + ID;
            conn2.Open();
            SqlDataAdapter da2 = new SqlDataAdapter(query2, conn2);
            da2.Fill(ViewImg, "Tbl_Image");
            conn2.Close();
            if (ViewImg.Tables["Tbl_Image"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Images/ImageGallery/" + ViewImg.Tables["Tbl_Image"].Rows[0]["ImageName"].ToString()));
            }

            DataSet ViewGallery = new DataSet();
            ViewGallery.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select  GalleryID, Pic from Tbl_Gallery where GalleryID = " + ID;
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewGallery, "Tbl_Gallery");
            conn.Close();
            if (ViewGallery.Tables["Tbl_Gallery"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Images/ImageGallery/" + ViewGallery.Tables["Tbl_Gallery"].Rows[0]["Pic"].ToString()));
            }

            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_Gallery where GalleryID = @GalleryID", con);
            cmd.Parameters.AddWithValue("GalleryID", ID);
            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllGalleryPageWise(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("GalleryIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditGallery.aspx");
        }
    }

    public DataSet SearchUsers()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT GalleryID ,Title ,SaveDate, Pic FROM dbo.Tbl_Gallery WHERE Title LIKE N'%" + txtSearch.Text + "%' ORDER BY GalleryID Desc", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptGalleryList.DataSource = ds.Tables[0];
                rptGalleryList.DataBind();
                pnlPager.Visible = false;
            }
        }
        return ds;
    }

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = SearchUsers();
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
                lblNotFound.Text = "گالری مورد نظر یافت نشد.";
            }
        }
    }
}