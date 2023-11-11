using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GalleryPage : System.Web.UI.Page
{
    private int PageSize = 21;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetCustomersPageWise(1);
        }
    }

    private void GetCustomersPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("usp_Tbl_Gallery_Paging", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptGallery.DataSource = idr;
                rptGallery.DataBind();
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
        this.GetCustomersPageWise(pageIndex);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataSet ds = Bind();

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
                lblNotFound.Text = "عبارت موردنظر یافت نشد";
            }
        }
    }

    public DataSet Bind()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM Tbl_Gallery WHERE Title LIKE N'%" + txtSearch.Text + "%' ORDER BY GalleryID DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptGallery.DataSource = ds.Tables[0];
                rptGallery.DataBind();
            }
        }
        return ds;
    }
}