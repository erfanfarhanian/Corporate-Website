using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (chkExpDate.Checked)
        {
            pnlExpiredDate.Visible = true;
        }
        else if (!chkExpDate.Checked)
        {
            pnlExpiredDate.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "select UserID, NewsID, TitleNews, STextNews, LTextNews, SaveDate, ExpiredDate, SaveTime, Pic, ShowStatus, CommentStatus from Tbl_News where NewsID = '" + Session["NewsIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_News");
            conn.Close();
            if (ViewNews.Tables["Tbl_News"].Rows.Count != 0)
            {
                pnlEditNews.Visible = true;

                txtTitleNews.Text = ViewNews.Tables["Tbl_News"].Rows[0]["TitleNews"].ToString();
                txtSTextNews.Text = ViewNews.Tables["Tbl_News"].Rows[0]["STextNews"].ToString();
                CKEditorLTextNews.Text = ViewNews.Tables["Tbl_News"].Rows[0]["LTextNews"].ToString();
                txtSaveDate.Text = ViewNews.Tables["Tbl_News"].Rows[0]["SaveDate"].ToString();
                txtExpDate.Text = ViewNews.Tables["Tbl_News"].Rows[0]["ExpiredDate"].ToString();
                txtSaveTime.Text = ViewNews.Tables["Tbl_News"].Rows[0]["SaveTime"].ToString();
                imgPreview.ImageUrl = "~/Images/NewsImage/" + ViewNews.Tables["Tbl_News"].Rows[0]["Pic"].ToString();
                if (Session["RegisterStatusS"].ToString() == "1")
                {
                    drpDnLstStatus.Enabled = true;
                }
                drpDnLstStatus.SelectedIndex = Convert.ToInt32(ViewNews.Tables["Tbl_News"].Rows[0]["ShowStatus"]);
                dropDownLstIsCM.SelectedIndex = Convert.ToInt32(ViewNews.Tables["Tbl_News"].Rows[0]["CommentStatus"]);

            }
        }

        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

        txtExpDate.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
    }

    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpTitle.Visible = false;
        lblEmpLTextNews.Visible = false;
        lblEmpSTextNews.Visible = false;

        if (txtTitleNews.Text != "")
        {
            if (txtSTextNews.Text != "")
            {
                if (CKEditorLTextNews.Text != "")
                {
                    //if (imgUpload.HasFile)
                    //{
                    string query = "UPDATE dbo.Tbl_News SET TitleNews = @TitleNews,STextNews = @STextNews,LTextNews = @LTextNews,SaveDate = @SaveDate, ExpiredDate = @ExpiredDate,SaveTime = @SaveTime,ShowStatus = @ShowStatus, CommentStatus = @CommentStatus WHERE NewsID = '" + Session["NewsIdS"].ToString() + "'";

                    SqlConnection conn = new SqlConnection(strConn);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    if (imgUpload.HasFile)
                    {
                        string picQuery = "UPDATE dbo.Tbl_News SET Pic = @Pic WHERE NewsID = '" + Session["NewsIdS"].ToString() + "'";
                        SqlConnection conn2 = new SqlConnection(strConn);
                        conn2.Open();
                        SqlCommand cmd2 = new SqlCommand(picQuery, conn2);
                        string str = imgUpload.FileName;
                        imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/NewsImage/" + str));
                        string image = str.ToString();
                        cmd2.Parameters.Add("@Pic", SqlDbType.NVarChar, 50).Value = image;
                        cmd2.ExecuteNonQuery();
                        conn2.Close();
                    }
                    cmd.Parameters.Add("@TitleNews", SqlDbType.NVarChar, 100).Value = txtTitleNews.Text;
                    cmd.Parameters.Add("@STextNews", SqlDbType.NVarChar, 350).Value = txtSTextNews.Text;
                    cmd.Parameters.Add("@LTextNews", SqlDbType.NVarChar).Value = CKEditorLTextNews.Text;
                    //cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserIdS"].ToString());
                    cmd.Parameters.Add("@SaveDate", SqlDbType.NVarChar, 10).Value = txtSaveDate.Text;
                    cmd.Parameters.Add("@ExpiredDate", SqlDbType.NVarChar, 10).Value = txtExpDate.Text;
                    cmd.Parameters.Add("@SaveTime", SqlDbType.NVarChar, 5).Value = txtSaveTime.Text;
                    cmd.Parameters.Add("@ShowStatus", SqlDbType.Int).Value = Convert.ToInt32(drpDnLstStatus.SelectedIndex);
                    cmd.Parameters.Add("@CommentStatus", SqlDbType.Int).Value = Convert.ToInt32(dropDownLstIsCM.SelectedIndex);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblSuccessMsg.Text = "1";
                    pnlEditNews.Visible = false;
                    txtTitleNews.Text = string.Empty;
                    txtSTextNews.Text = string.Empty;
                    CKEditorLTextNews.Text = string.Empty;
                //}
                    //else
                    //    lblEmpImg.Visible = true;
                }
                else
                    lblEmpLTextNews.Visible = true;
            }
            else
                lblEmpSTextNews.Visible = true;
        }
        else
            lblEmpTitle.Visible = true;
    }
}