using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageDocuments : System.Web.UI.Page
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
            this.GetAllDocumentsPageWise(1);
        }
    }

    private void GetAllDocumentsPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("[usp_Tbl_ManageDocuments_Paging]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptDocumentsList.DataSource = idr;
                rptDocumentsList.DataBind();
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
        this.GetAllDocumentsPageWise(pageIndex);
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as ImageButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile("~/Docs/" + filePath);
        Response.End();
    }

    public DataSet SearchDocuments()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT PDFD.PDFDocID ,PDFD.DDtID ,PDFD.Description ,PDFD.PDFFileName ,DDT.DDtID ,DDT.DocumentID ,DDT.DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE D.DocumentTitle LIKE N'%" + txtSearch.Text + "%' OR DT.DocumentTypeTitle LIKE N'%" + txtSearch.Text + "%' OR PDFD.Description LIKE N'%" + txtSearch.Text + "%'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptDocumentsList.DataSource = ds.Tables[0];
                rptDocumentsList.DataBind();
                pnlPager.Visible = false;
            }
        }
        return ds;
    }

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = SearchDocuments();
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
                lblNotFound.Text = "مستند مورد نظر یافت نشد.";
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnShowDocuments_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageDocuments.aspx");
    }

    protected void rptDocuemntsList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            DataSet ViewDocuments = new DataSet();
            ViewDocuments.Reset();
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select  PDFDocID, PDFFileName from Tbl_PDFDoc where PDFDocID = '" + ID + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewDocuments, "Tbl_PDFDoc");
            conn.Close();
            if (ViewDocuments.Tables["Tbl_PDFDoc"].Rows.Count != 0)
            {
                System.IO.File.Delete(Server.MapPath("~/Docs/" + ViewDocuments.Tables["Tbl_PDFDoc"].Rows[0]["PDFFileName"].ToString()));
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Tbl_PDFDoc where PDFDocID = @PDFDocID", con);
            cmd.Parameters.AddWithValue("PDFDocID", ID);

            con.Open();
            int id = cmd.ExecuteNonQuery();
            con.Close();
            this.GetAllDocumentsPageWise(1);
        }
        if (e.CommandName == "Edit")
        {
            Session.Add("PDFDocIdS", Convert.ToInt32(e.CommandArgument));
            Response.Redirect("EditDocument.aspx");
        }
    }

    protected void grdShowDocuments_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnInsertDoc_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertDocument.aspx");
    }
}