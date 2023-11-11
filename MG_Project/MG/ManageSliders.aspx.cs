using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageSliders : System.Web.UI.Page
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
            this.GetAllSlidersPageWise(1);
        }
    }

    private void GetAllSlidersPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageSliders_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptSlidersList.DataSource = idr;
                rptSlidersList.DataBind();
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
        this.GetAllSlidersPageWise(pageIndex);
    }

    protected void btnYourNews_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageSliders.aspx");
    }

    protected void rptSlidersList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            DataSet ViewSliders = new DataSet();
            ViewSliders.Reset();
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select  SliderID, SliderPic from Tbl_Slider where SliderID = '" + ID + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewSliders, "Tbl_Slider");
            conn.Close();
            if (ViewSliders.Tables["Tbl_Slider"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Images/Slider/" + ViewSliders.Tables["Tbl_Slider"].Rows[0]["SliderPic"].ToString()));
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_Slider where SliderID=@SliderID", con);
            cmd.Parameters.AddWithValue("SliderID", ID);
            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllSlidersPageWise(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("SliderIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditSlider.aspx");
        }
    }
}