using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewGallery = new DataSet();
            ViewGallery.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT GalleryID ,Title ,SaveDate ,Pic FROM dbo.Tbl_Gallery where GalleryID = '" + Session["GalleryIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewGallery, "Tbl_Gallery");
            conn.Close();
            if (ViewGallery.Tables["Tbl_Gallery"].Rows.Count != 0)
            {
                pnlEditGallery.Visible = true;

                txtTitle.Text = ViewGallery.Tables["Tbl_Gallery"].Rows[0]["Title"].ToString();
                txtSaveDate.Text = ViewGallery.Tables["Tbl_Gallery"].Rows[0]["SaveDate"].ToString();
                imgPreview.ImageUrl = "~/Images/ImageGallery/" + ViewGallery.Tables["Tbl_Gallery"].Rows[0]["Pic"].ToString();
            }
        }

        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

        txtSaveDate.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
    }

    protected void btnEditGallery_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpImg.Visible = false;
        lblEmpTitle.Visible = false;
        lblEmpSaveDate.Visible = false;

        if (txtTitle.Text != "")
        {
            if (txtSaveDate.Text != "")
            {
                string query = "UPDATE dbo.Tbl_Gallery SET Title = @Title, SaveDate = @SaveDate WHERE GalleryID = '" + Session["GalleryIdS"].ToString() + "'";

                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                if (imgUpload.HasFile)
                {
                    string picQuery = "UPDATE dbo.Tbl_Gallery SET Pic = @Pic WHERE GalleryID = '" + Session["GalleryIdS"].ToString() + "'";
                    SqlConnection conn2 = new SqlConnection(strConn);
                    conn2.Open();
                    SqlCommand cmd2 = new SqlCommand(picQuery, conn2);
                    string str = imgUpload.FileName;
                    imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/ImageGallery/" + str));
                    string image = str.ToString();
                    cmd2.Parameters.Add("@Pic", SqlDbType.NVarChar, 250).Value = image;
                    cmd2.ExecuteNonQuery();
                    conn2.Close();
                }
                cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 100).Value = txtTitle.Text;
                cmd.Parameters.Add("@SaveDate", SqlDbType.NVarChar, 100).Value = txtSaveDate.Text;
                cmd.ExecuteNonQuery();
                conn.Close();

                lblSuccessMsg.Text = "1";
                pnlEditGallery.Visible = false;
                txtTitle.Text = string.Empty;
                txtSaveDate.Text = string.Empty;
            }
            else
                lblEmpSaveDate.Visible = true;
        }
        else
            lblEmpTitle.Visible = true;
    }
}