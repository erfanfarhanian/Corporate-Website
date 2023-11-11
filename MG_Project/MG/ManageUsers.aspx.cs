using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageUsers : System.Web.UI.Page
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
            Response.Redirect("AdminPanel.aspx");
        }
        if (!IsPostBack)
        {
            this.GetAllUsersPageWise(1);
        }
    }

    private void GetAllUsersPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageUsers_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptUsersList.DataSource = idr;
                rptUsersList.DataBind();
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
        this.GetAllUsersPageWise(pageIndex);
    }

    public DataSet SearchUsers()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT UserID ,Username ,Password ,FirstName ,LastName ,MelliCode ,Email ,BirthDate ,Degree ,Major ,CASE WHEN RegisterStatus = 0 THEN N'مجوز ندارد' WHEN RegisterStatus = 1 THEN N'مدیر سایت' WHEN RegisterStatus = 2 THEN N'کاربر معمولی' END AS Status,Mobile FROM dbo.Tbl_User WHERE FirstName LIKE N'%" + txtSearch.Text + "%' OR LastName LIKE N'%" + txtSearch.Text + "%' OR MelliCode LIKE N'%" + txtSearch.Text + "%' OR Username LIKE N'%" + txtSearch.Text + "%'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptUsersList.DataSource = ds.Tables[0];
                rptUsersList.DataBind();
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
                lblNotFound.Text = "کاربر مورد نظر یافت نشد.";
            }
        }
    }

    protected void btnYourNews_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageUsers.aspx");
    }
    protected void rptUsersList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_User where UserID = @UserID", con);
            cmd.Parameters.AddWithValue("UserID", ID);

            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllUsersPageWise(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("SelectedUserIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditUser.aspx");
        }
    }

    protected void btnInsertNews_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertUser.aspx");
    }
}