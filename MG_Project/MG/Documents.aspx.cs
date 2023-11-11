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

public partial class Documents : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        lblNotFound.Visible = false;
        
        if (!IsPostBack)
        {
            BindgrdShowDocuments();
            string strSqlCmd = "SELECT DocumentID ,DocumentTitle FROM dbo.Tbl_Document";
            SqlCommand cmd = new SqlCommand(strSqlCmd, con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            SqlDataReader dr = cmd.ExecuteReader();

            DropDownLstDocs.DataSource = dr;
            DropDownLstDocs.DataTextField = "DocumentTitle";
            DropDownLstDocs.DataValueField = "DocumentID";
            DropDownLstDocs.DataBind();
            DropDownLstDocs.Items.Insert(0, new ListItem("-انتخاب کنید-", "0"));
            if (con.State != ConnectionState.Closed)
                con.Close();
        }
    }

    void BindDropDownDocType()
    {
        int id = Convert.ToInt32(DropDownLstDocs.SelectedValue);
        string strSqlCmd = "SELECT DDT.DDtID ,D.DocumentID as DocumentID ,D.DocumentTitle as DocumentTitle ,DT.DocumentTypeID as DocumentTypeID ,DT.DocumentTypeTitle as DocumentTypeTitle FROM dbo.Tbl_DocAndDocType DDT JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE D.DocumentID = " + id;
        SqlCommand cmd = new SqlCommand(strSqlCmd, con);
        if (con.State != ConnectionState.Open)
        {
            con.Open();
        }
        SqlDataReader dr = cmd.ExecuteReader();

        DropDownLstDocTypes.DataSource = dr;
        DropDownLstDocTypes.DataTextField = "DocumentTypeTitle";
        DropDownLstDocTypes.DataValueField = "DocumentTypeID";
        DropDownLstDocTypes.DataBind();

        if (con.State != ConnectionState.Closed)
            con.Close();
    }

    private void BindgrdShowDocuments()
    {
        string constr = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter da = new SqlDataAdapter("SELECT PDFD.PDFDocID ,PDFD.Description ,PDFD.PDFFileName ,D.DocumentTitle ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grdShowDocuments.DataSource = ds;
        grdShowDocuments.DataBind();
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as ImageButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile("~/Docs/" + filePath);
        Response.End();
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {

    }

    protected void imgBtnDownload_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void grdShowDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
    }

    protected void DropDownLstDoc_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownLstDoc_TextChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownLstDocType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownLstDoc_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }


    protected void DropDownLstDocTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnChooseDoc_Click(object sender, EventArgs e)
    {
    }

    protected void DropDownLstDocs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
    }

    protected void DropDownLstDocs_SelectedIndexChanged1(object sender, EventArgs e)
    {
        BindDropDownDocType();

        System.Threading.Thread.Sleep(3000);

        string constr = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter da = new SqlDataAdapter("SELECT PDFD.PDFDocID ,PDFD.DDtID ,PDFD.Description ,PDFD.PDFFileName ,DDT.DDtID ,DDT.DocumentID ,DDT.DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE (D.DocumentID = '" + DropDownLstDocs.SelectedValue + "' and DT.DocumentTypeID = '" + DropDownLstDocTypes.SelectedValue + "')", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grdShowDocuments.DataSource = ds;
        grdShowDocuments.DataBind();
    }

    protected void txtSearchFilter_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void DropDownLstDocTypes_SelectedIndexChanged1(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);

        string constr = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter da = new SqlDataAdapter("SELECT PDFD.PDFDocID ,PDFD.DDtID ,PDFD.Description ,PDFD.PDFFileName ,DDT.DDtID ,DDT.DocumentID ,DDT.DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE (D.DocumentID = '" + DropDownLstDocs.SelectedValue + "' and DT.DocumentTypeID = '" + DropDownLstDocTypes.SelectedValue + "')", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grdShowDocuments.DataSource = ds;
        grdShowDocuments.DataBind();
    }

    protected void btnFilter_Click1(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        if (DropDownLstDocs.SelectedIndex != 0)
        {
            string constr = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("SELECT PDFD.PDFDocID ,PDFD.DDtID ,PDFD.Description ,PDFD.PDFFileName ,DDT.DDtID ,DDT.DocumentID ,DDT.DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE (D.DocumentTitle LIKE N'%" + txtSearchFilter.Text + "%' OR DT.DocumentTypeTitle LIKE N'%" + txtSearchFilter.Text + "%' OR PDFD.Description LIKE N'%" + txtSearchFilter.Text + "%') and (D.DocumentID = '" + DropDownLstDocs.SelectedValue + "' and DT.DocumentTypeID = '" + DropDownLstDocTypes.SelectedValue + "')", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdShowDocuments.DataSource = ds;
            grdShowDocuments.DataBind();
            txtSearchFilter.Text = string.Empty;
            if (grdShowDocuments.Rows.Count == 0)
            {
                grdShowDocuments.Visible = false;
                lblNotFound.Visible = true;
                lblNotFound.Text = "متن موردنظر یافت نشد";
            }
        }
        else if (DropDownLstDocs.SelectedIndex == 0)
        {
            string constr = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("SELECT PDFD.PDFDocID ,PDFD.DDtID ,PDFD.Description ,PDFD.PDFFileName ,DDT.DDtID ,DDT.DocumentID ,DDT.DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE (D.DocumentTitle LIKE N'%" + txtSearchFilter.Text + "%' OR DT.DocumentTypeTitle LIKE N'%" + txtSearchFilter.Text + "%' OR PDFD.Description LIKE N'%" + txtSearchFilter.Text + "%')", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdShowDocuments.DataSource = ds;
            grdShowDocuments.DataBind();
            txtSearchFilter.Text = string.Empty;
            if (grdShowDocuments.Rows.Count == 0)
            {
                grdShowDocuments.Visible = false;
                lblNotFound.Visible = true;
                lblNotFound.Text = "متن موردنظر یافت نشد";
            }
        }
    }
}