using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertDocument : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIdS"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
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

    protected void btnInsertDocument_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        
        DataSet ViewUser = new DataSet();

        lblEmpDocument.Visible = false;
        lblEmpFileUpload.Visible = false;

        if (DropDownLstDocs.SelectedIndex != 0)
        {
            if (fileUpload.HasFile)
            {
                SqlConnection conn2 = new SqlConnection(strConn);
                DataSet ViewDocType = new DataSet();
                ViewDocType.Reset();
                string selectQuery = "SELECT DDT.DDtID as DDtID , D.DocumentTitle , DT.DocumentTypeTitle FROM dbo.Tbl_DocAndDocType DDT JOIN dbo.Tbl_DocumentType DT ON DT.DocumentTypeID = DDT.DocumentTypeID JOIN dbo.Tbl_Document D ON D.DocumentID = DDT.DocumentID where DDT.DocumentID = " + DropDownLstDocs.SelectedValue + " and DT.DocumentTypeID = " + DropDownLstDocTypes.SelectedValue;
                conn2.Open();
                SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn2);
                da.Fill(ViewDocType, "Tbl_DocAndDocType");
                conn2.Close();
                if (ViewDocType.Tables["Tbl_DocAndDocType"].Rows.Count != 0)
                {
                    //Session.Add("DDtIdS", Convert.ToInt64(ViewDocType.Tables["Tbl_DocAndDocType"].Rows[0]["DDtID"]));
                    lblDDtID.Text = ViewDocType.Tables["Tbl_DocAndDocType"].Rows[0]["DDtID"].ToString();
                }


                string query = "INSERT INTO dbo.Tbl_PDFDoc( DDtID ,Description ,PDFFileName) VALUES ( @DDtID ,@Description ,@PDFFileName )";

                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);

                string str = fileUpload.FileName;
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/Docs/" + str));
                string file = str.ToString();

                cmd.Parameters.Add("@DDtID", SqlDbType.BigInt).Value = Convert.ToInt64(lblDDtID.Text);
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, 150).Value = txtDescription.Text;
                cmd.Parameters.Add("@PDFFileName", SqlDbType.NVarChar).Value = file;
                cmd.ExecuteNonQuery();
                conn.Close();

                lblSuccessMsg.Text = "1";

                txtDescription.Text = string.Empty;
                DropDownLstDocTypes.SelectedIndex = 0;
            }
            else
                lblEmpFileUpload.Visible = true;
        }
        else
            lblEmpDocument.Visible = true;
    }
}