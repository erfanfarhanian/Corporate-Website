using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;

public partial class EditNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        txtSaveTime.Text = Convert.ToString(DateTime.Now.Hour) + ":" + Convert.ToString(DateTime.Now.Minute);
        txtSaveDate.Text = GetDate();

        if (chkExpDate.Checked)
        {
            pnlExpiredDate.Visible = true;
        }
        else if (!chkExpDate.Checked)
        {
            pnlExpiredDate.Visible = false;
        }

        var now = PersianDateTime.Now;
        var today = now.ToString(PersianDateTimeFormat.Date);

        txtExpDate.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
    }

    private string GetDate()
    {
        PersianCalendar pc = new PersianCalendar();
        DateTime dt = DateTime.Now;
        string Year = pc.GetYear(dt).ToString();
        string Month = pc.GetMonth(dt).ToString().Length == 1 ? "0" + pc.GetMonth(dt).ToString() : pc.GetMonth(dt).ToString();
        string Day = pc.GetDayOfMonth(dt).ToString().Length == 1 ? "0" + pc.GetDayOfMonth(dt).ToString() : pc.GetDayOfMonth(dt).ToString();
        return string.Format("{0}/{1}/{2}", Year, Month, Day);
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
                    if (imgUpload.HasFile)
                    {
                        string query = "INSERT INTO dbo.Tbl_News( TitleNews ,STextNews ,LTextNews ,UserID ,SaveDate , ExpiredDate, SaveTime ,ShowStatus ,Pic, CommentStatus, Like, Dislike)VALUES  ( @TitleNews ,@STextNews ,@LTextNews ,@UserID ,@SaveDate, @ExpiredDate ,@SaveTime ,@ShowStatus ,@Pic, @CommentStatus, @Like, @Dislike)";

                        SqlConnection conn = new SqlConnection(strConn);
                        conn.Open();
                        SqlCommand cmd = new SqlCommand(query, conn);

                        string str = imgUpload.FileName;
                        imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/NewsImage/" + str));
                        string image = str.ToString();

                        cmd.Parameters.Add("@TitleNews", SqlDbType.NVarChar, 100).Value = txtTitleNews.Text;
                        cmd.Parameters.Add("@STextNews", SqlDbType.NVarChar, 350).Value = txtSTextNews.Text;
                        cmd.Parameters.Add("@LTextNews", SqlDbType.NVarChar).Value = CKEditorLTextNews.Text;
                        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Convert.ToInt32(Session["UserIdS"].ToString());
                        cmd.Parameters.Add("@SaveDate", SqlDbType.NVarChar, 10).Value = txtSaveDate.Text;
                        cmd.Parameters.Add("@ExpiredDate", SqlDbType.NVarChar, 10).Value = txtExpDate.Text;
                        cmd.Parameters.Add("@SaveTime", SqlDbType.NVarChar, 5).Value = txtSaveTime.Text;
                        cmd.Parameters.Add("@Pic", SqlDbType.NVarChar, 50).Value = image;
                        cmd.Parameters.Add("@CommentStatus", SqlDbType.Int).Value = Convert.ToInt32(dropDownLstIsCM.SelectedIndex);
                        cmd.Parameters.Add("@Like", SqlDbType.Int).Value = 0;
                        cmd.Parameters.Add("@Dislike", SqlDbType.Int).Value = 0;

                        if (Session["RegisterStatusS"].ToString() == "1")
                        {
                            cmd.Parameters.Add("@ShowStatus", SqlDbType.Int).Value = 1;
                        }
                        else
                            cmd.Parameters.Add("@ShowStatus", SqlDbType.Int).Value = 0;
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        lblSuccessMsg.Text = "1";

                        txtTitleNews.Text = string.Empty;
                        txtSTextNews.Text = string.Empty;
                        CKEditorLTextNews.Text = string.Empty;
                    }
                    else
                        lblEmpImg.Visible = true;
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