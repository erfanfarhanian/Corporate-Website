using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stimulsoft;
using Stimulsoft.Report;

public partial class NewsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtCommentTime.Text = Convert.ToString(DateTime.Now.Hour) + ":" + Convert.ToString(DateTime.Now.Minute);
        txtCommentDate.Text = GetDate();
        int temp_Comment = Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("CommentStatusLabel")).Text);
        if (temp_Comment == 0)
        {
            pnlComment.Visible = false;
        }

        if (!IsPostBack)
        {
            BindLikeAndDislike();
        }
    }

    protected void btnSendCm_Click(object sender, EventArgs e)
    {
        lblEmpCommentText.Visible = false;
        lblEmpEmail.Visible = false;
        lblEmpFullName.Visible = false;

        if (txtFullName.Text != "")
        {
            if (txtEmail.Text != "")
            {
                if (txtCommentText.Text != "")
                {
                    string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
                    DataSet ViewUser = new DataSet();
                    SqlDataAdapter da;
                    SqlConnection conn = new SqlConnection(strConn);

                    string query = "INSERT INTO dbo.Tbl_Comment( FullName ,Email ,CommentText ,CommentDate ,CommentTime ,ShowStatus ,NewsID)VALUES  ( @FullName ,@Email ,@CommentText ,@CommentDate ,@CommentTime ,@ShowStatus ,@NewsID)";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 150).Value = txtFullName.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = txtEmail.Text;
                    cmd.Parameters.Add("@CommentText", SqlDbType.NVarChar, 500).Value = txtCommentText.Text;
                    cmd.Parameters.Add("@CommentDate", SqlDbType.NVarChar, 10).Value = txtCommentDate.Text;
                    cmd.Parameters.Add("@CommentTime", SqlDbType.NVarChar, 5).Value = txtCommentTime.Text;
                    cmd.Parameters.Add("@ShowStatus", SqlDbType.Int).Value = 0;
                    cmd.Parameters.Add("@NewsID", SqlDbType.BigInt).Value = Convert.ToInt64(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    txtFullName.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtCommentText.Text = string.Empty;
                    txtCommentDate.Text = GetDate();
                    txtCommentTime.Text = Convert.ToString(DateTime.Now.Hour) + ":" + Convert.ToString(DateTime.Now.Minute);
                    lblAcceptComment.Visible = true;
                }
                else
                    lblEmpCommentText.Visible = true;
            }
            else
                lblEmpEmail.Visible = true;
        }
        else
            lblEmpFullName.Visible = true;

    }

    protected void imgBtnLike_Click(object sender, ImageClickEventArgs e)
    {
        lblUserValidation.Visible = false;
        if (!User_Validate(Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text)))
        {
            lblUserValidation.Visible = true;
            return;
        }
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string saveQuery = "update Tbl_News set [Like] = [Like] + 1 where NewsID = " + Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text);
        SqlCommand cmd = new SqlCommand(saveQuery, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        BindLikeAndDislike();

        InsertIP();
    }

    protected void imgBtnDislike_Click(object sender, ImageClickEventArgs e)
    {
        lblUserValidation.Visible = false;

        if (!User_Validate(Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text)))
        {
            lblUserValidation.Visible = true;
            return;
        }
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string saveQuery = "update Tbl_News set Dislike = Dislike + 1 where NewsID = " + Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text);
        SqlCommand cmd = new SqlCommand(saveQuery, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        BindLikeAndDislike();

        InsertIP();
    }

    private void BindLikeAndDislike()
    {
        lblUserValidation.Visible = false;
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewNews = new DataSet();
        ViewNews.Reset();
        SqlConnection conn = new SqlConnection(strConn);
        string query = "SELECT NewsID, [Like], Dislike, Pic FROM Tbl_News WHERE (NewsID = " + Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text) + ") AND (ShowStatus != 0)";
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        da.Fill(ViewNews, "Tbl_News");
        conn.Close();
        if (ViewNews.Tables["Tbl_News"].Rows.Count != 0)
        {
            lblLikeNo.Text = ViewNews.Tables["Tbl_News"].Rows[0]["Like"].ToString();
            lblDislikeNo.Text = ViewNews.Tables["Tbl_News"].Rows[0]["Dislike"].ToString();
        }
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

    private void InsertIP()
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string saveQuery = "INSERT INTO dbo.Tbl_IP ( NewsID ,IP ,Date )VALUES  ( @NewsID ,@IP ,@Date )";
        SqlCommand cmd = new SqlCommand(saveQuery, conn);
        cmd.Parameters.Add("@NewsID", SqlDbType.BigInt).Value = Convert.ToInt32(((Label)DataListTitle.Controls[0].FindControl("NewsIDLabel")).Text);
        cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 100).Value = GetUserIp();
        cmd.Parameters.Add("@Date", SqlDbType.NVarChar, 10).Value = GetDate();
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }

    private bool User_Validate(int id)
    {
        return (GetUserIpDb(id) == GetUserIp()) ? false : true;
    }

    private string GetUserIp()
    {
        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            return Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else
        {
            return Request.ServerVariables["REMOTE_ADDR"];

        }
    }

    private string GetUserIpDb(int id)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        string query = "SELECT IP FROM Tbl_IP WHERE NewsID={0}";
        query = string.Format(query, id);
        string ip = "";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.CommandText = query;
        object ob = cmd.ExecuteScalar();
        if (ob == DBNull.Value)
        {
            ip = "";
        }
        else
        {
            ip = Convert.ToString(ob);
        }
        conn.Close();
        return ip;
    }
}