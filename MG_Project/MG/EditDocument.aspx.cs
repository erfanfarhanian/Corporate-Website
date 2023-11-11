using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditDocument : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!Page.IsPostBack)
        {
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

            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewDocs = new DataSet();
            ViewDocs.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT PDFD.PDFDocID as PDFDocID ,PDFD.DDtID ,PDFD.Description as Description ,PDFD.PDFFileName as PDFFileName ,DDT.DDtID ,DDT.DocumentID as DocumentID ,DDT.DocumentTypeID as DocumentTypeID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID ,DT.DocumentTypeTitle FROM dbo.Tbl_PDFDoc PDFD JOIN dbo.Tbl_DocAndDocType DDT ON DDT.DDtID = PDFD.DDtID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID where PDFDocID = '" + Session["PDFDocIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewDocs, "Tbl_PDFDoc");
            conn.Close();
            if (ViewDocs.Tables["Tbl_PDFDoc"].Rows.Count != 0)
            {
                pnlEditDocument.Visible = true;

                DropDownLstDocs.SelectedValue = ViewDocs.Tables["Tbl_PDFDoc"].Rows[0]["DocumentID"].ToString();
                BindDropDownDocType();
                DropDownLstDocTypes.SelectedValue = ViewDocs.Tables["Tbl_PDFDoc"].Rows[0]["DocumentTypeID"].ToString();

                txtDescription.Text = ViewDocs.Tables["Tbl_PDFDoc"].Rows[0]["Description"].ToString();
                lblFile.Text = ViewDocs.Tables["Tbl_PDFDoc"].Rows[0]["PDFFileName"].ToString();
            }
        }
    }

    void BindDropDownDocType()
    {
        int id = Convert.ToInt32(DropDownLstDocs.SelectedValue);
        string strSqlCmd = "SELECT DDT.DDtID ,D.DocumentID ,D.DocumentTitle ,DT.DocumentTypeID as DocumentTypeID ,DT.DocumentTypeTitle as DocumentTypeTitle FROM dbo.Tbl_DocAndDocType DDT JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID WHERE D.DocumentID = " + id;
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

    protected void DropDownLstDocs_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDropDownDocType();
    }

    protected void btnEditDocument_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpFileUpload.Visible = false;
        lblEmpDocument.Visible = false;


        if (DropDownLstDocs.SelectedIndex != 0)
        {
            SqlConnection conn3 = new SqlConnection(strConn);
            DataSet ViewDocType = new DataSet();
            ViewDocType.Reset();
            string selectQuery = "SELECT DDT.DDtID as DDtID , D.DocumentTitle , DT.DocumentTypeTitle FROM dbo.Tbl_DocAndDocType DDT JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID where DDT.DocumentID = " + DropDownLstDocs.SelectedValue + " and DT.DocumentTypeID = " + DropDownLstDocTypes.SelectedValue;
            conn3.Open();
            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn3);
            da.Fill(ViewDocType, "Tbl_DocAndDocType");
            conn3.Close();
            if (ViewDocType.Tables["Tbl_DocAndDocType"].Rows.Count != 0)
            {
                //Session.Add("DDtIdS", Convert.ToInt64(ViewDocType.Tables["Tbl_DocAndDocType"].Rows[0]["DDtID"]));
                lblDDtID.Text = ViewDocType.Tables["Tbl_DocAndDocType"].Rows[0]["DDtID"].ToString();
            }

            string query = "UPDATE dbo.Tbl_PDFDoc SET DDtID = @DDtID, Description = @Description WHERE PDFDocID = '" + Session["PDFDocIdS"].ToString() + "'";

            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            if (fileUpload.HasFile)
            {
                string picQuery = "UPDATE dbo.Tbl_PDFDoc SET PDFFileName = @PDFFileName WHERE PDFDocID = '" + Session["PDFDocIdS"].ToString() + "'";
                SqlConnection conn2 = new SqlConnection(strConn);
                conn2.Open();
                SqlCommand cmd2 = new SqlCommand(picQuery, conn2);
                string str = fileUpload.FileName;
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/Docs/" + str));
                string file = str.ToString();
                cmd2.Parameters.Add("@PDFFileName", SqlDbType.NVarChar, 50).Value = file;
                cmd2.ExecuteNonQuery();
                conn2.Close();
            }
            cmd.Parameters.Add("@DDtID", SqlDbType.BigInt).Value = Convert.ToInt64(lblDDtID.Text);
            cmd.Parameters.Add("@Description", SqlDbType.NVarChar, 150).Value = txtDescription.Text;
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSuccessMsg.Text = "1";
            pnlEditDocument.Visible = false;
            txtDescription.Text = string.Empty;
            DropDownLstDocs.SelectedIndex = 0;
        }
        else
            lblEmpDocument.Visible = true;

    }
}