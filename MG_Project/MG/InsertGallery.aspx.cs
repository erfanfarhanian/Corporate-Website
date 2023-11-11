using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class InsertGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            bindImages();
        }

        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

        txtSaveDate.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
    }

    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {


        string fileName = e.FileName;
        AjaxFileUpload1.SaveAs(Server.MapPath("~/Images/ImageGallery/") + fileName);

        //===== Generate thumbnail
        //GenerateThumbNail(e.FileName, "UploadedThumbs", 100);


        //---- Store image and image thumbnail information to database.
        //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);

        //======= Insert Query.
        //string cmdText = "INSERT INTO Tbl_Image (ImageName,GalleryID) VALUES (@ImageName,@GalleryID)";

        //====== Providning information to SQL command object about which query to 
        //====== execute and from where to get database connection information.
        //SqlCommand cmd = new SqlCommand(cmdText, con);

        //===== Adding parameters/Values.
        //cmd.Parameters.AddWithValue("@ImageName", fileName);
        //cmd.Parameters.AddWithValue("@GalleryID", Convert.ToInt32(lblGalleryID.Text));

        //===== To check current state of the connection object.If it is closed open the connection
        //===== to execute the insert query.
        //if (con.State == ConnectionState.Closed)
        //{
        //    con.Open();
        //}

        //===== Execute Query.
        //cmd.ExecuteNonQuery();

        //===== close the connection.
        //con.Close();
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        string query = "INSERT INTO Tbl_Image (ImageName,GalleryID) VALUES (@ImageName,@GalleryID)";

        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.Add("@GalleryID", SqlDbType.Int).Value = Session["GalleryIdS"];
        cmd.Parameters.Add("@ImageName", SqlDbType.NVarChar, 250).Value = fileName;

        cmd.ExecuteNonQuery();
        conn.Close();

    }

    void bindImages()
    {
        //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString);

        //======= Select Query.
        string cmdText = "SELECT * FROM Tbl_Image";

        //====== Providning information to SQL command object about which query to 
        //====== execute and from where to get database connection information.
        SqlCommand cmd = new SqlCommand(cmdText, con);

        //===== To check current state of the connection object. If it is closed open the connection
        //===== to execute the insert query.
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

    }

    protected void btnInsertGallery_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";

        lblEmpTitle.Visible = false;
        lblEmpPic.Visible = false;
        lblEmpSaveDate.Visible = false;

        if (txtTitle.Text != "")
        {
            if (txtSaveDate.Text != "")
            {
                if (imgUpload.HasFile)
                {
                    string query = "INSERT INTO dbo.Tbl_Gallery ( Title, SaveDate, Pic )VALUES ( @Title, @SaveDate,@Pic )";

                    SqlConnection conn = new SqlConnection(strConn);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);

                    string str = imgUpload.FileName;
                    imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/ImageGallery/" + str));
                    string image = str.ToString();

                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 150).Value = txtTitle.Text;
                    cmd.Parameters.Add("@SaveDate", SqlDbType.NVarChar, 10).Value = txtSaveDate.Text;
                    cmd.Parameters.Add("@Pic", SqlDbType.NVarChar, 100).Value = image;

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    SqlConnection conn2 = new SqlConnection(strConn);
                    DataSet ViewGallery = new DataSet();
                    ViewGallery.Reset();
                    string selectIdQuery = "SELECT TOP 1 GalleryID FROM dbo.Tbl_Gallery ORDER BY GalleryID DESC";

                    conn2.Open();
                    SqlDataAdapter da = new SqlDataAdapter(selectIdQuery, conn2);
                    da.Fill(ViewGallery, "Tbl_Gallery");
                    conn2.Close();
                    if (ViewGallery.Tables["Tbl_Gallery"].Rows.Count != 0)
                    {
                        Session.Add("GalleryIdS", Convert.ToInt32(ViewGallery.Tables["Tbl_Gallery"].Rows[0]["GalleryID"]));
                    }

                    pnlGalleryInfo.Visible = false;
                    btnInsertGallery.Visible = false;
                    pnlUploadImg.Visible = true;
                    txtTitle.Text = string.Empty;
                    txtSaveDate.Text = string.Empty;
                }
                else
                    lblEmpImg.Visible = true;
            }
            else
                lblEmpSaveDate.Visible = true;
        }
        else
            lblEmpTitle.Visible = true;

    }
}