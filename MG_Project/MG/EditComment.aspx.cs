using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Session["RegisterStatusS"].ToString() != "1")
        {
            Response.Redirect("AdminPanel.aspx");
        }

        if (!Page.IsPostBack)
        {
            string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
            DataSet ViewComments = new DataSet();
            ViewComments.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT C.CommentID ,C.NewsID ,C.FullName ,C.Email ,C.CommentText ,C.CommentDate ,C.CommentTime ,C.ShowStatus ,N.NewsID ,N.TitleNews FROM dbo.Tbl_Comment C JOIN dbo.Tbl_News N ON N.NewsID = C.NewsID where CommentID = '" + Session["CommentIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewComments, "Tbl_Comment");
            conn.Close();
            if (ViewComments.Tables["Tbl_Comment"].Rows.Count != 0)
            {
                pnlEditComment.Visible = true;

                txtFullName.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["FullName"].ToString();
                txtEmail.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["Email"].ToString();
                txtTitleNews.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["TitleNews"].ToString();
                txtCommentText.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["CommentText"].ToString();
                txtCommentDate.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["CommentDate"].ToString();
                txtCommentTime.Text = ViewComments.Tables["Tbl_Comment"].Rows[0]["CommentTime"].ToString();
                drpDnLstStatus.SelectedIndex = Convert.ToInt32(ViewComments.Tables["Tbl_Comment"].Rows[0]["ShowStatus"]);

            }
        }
    }

    protected void btnEditComment_Click(object sender, EventArgs e)
    {
        btnReturn.Visible = false;
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strConn);
        string saveQuery = "update Tbl_Comment set ShowStatus = @ShowStatus where CommentID = '" + Session["CommentIdS"].ToString() + "' ";
        SqlCommand cmd = new SqlCommand(saveQuery, conn);
        cmd.Parameters.Add("@ShowStatus", SqlDbType.Int).Value = Convert.ToInt32(drpDnLstStatus.SelectedIndex);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        lblSuccessMsg.Text = "1";
        btnReturn.Visible = true;
        pnlEditComment.Visible = false;
    }
}