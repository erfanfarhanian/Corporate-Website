using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditSlider : System.Web.UI.Page
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
            DataSet ViewNews = new DataSet();
            ViewNews.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT SliderID , SliderPic ,Description FROM dbo.Tbl_Slider where SliderID = '" + Session["SliderIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNews, "Tbl_Slider");
            conn.Close();
            if (ViewNews.Tables["Tbl_Slider"].Rows.Count != 0)
            {
                pnlEditSlider.Visible = true;

                txtDescription.Text = ViewNews.Tables["Tbl_Slider"].Rows[0]["Description"].ToString();
                imgPreview.ImageUrl = "~/Images/Slider/" + ViewNews.Tables["Tbl_Slider"].Rows[0]["SliderPic"].ToString();
            }
        }
    }

    protected void btnUpdateSlider_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpDecription.Visible = false;

        if (txtDescription.Text != "")
        {
            string query = "UPDATE dbo.Tbl_Slider SET Description = @Description WHERE SliderID = '" + Session["SliderIdS"].ToString() + "'";

            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            if (imgUpload.HasFile)
            {
                string picQuery = "UPDATE dbo.Tbl_Slider SET SliderPic = @SliderPic WHERE SliderID = '" + Session["SliderIdS"].ToString() + "'";
                SqlConnection conn2 = new SqlConnection(strConn);
                conn2.Open();
                SqlCommand cmd2 = new SqlCommand(picQuery, conn2);
                string str = imgUpload.FileName;
                imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/Slider/" + str));
                string image = str.ToString();
                cmd2.Parameters.Add("@SliderPic", SqlDbType.NVarChar, 50).Value = image;
                cmd2.ExecuteNonQuery();
                conn2.Close();
            }
            cmd.Parameters.Add("@Description", SqlDbType.NVarChar, 150).Value = txtDescription.Text;
            cmd.ExecuteNonQuery();
            conn.Close();

            lblSuccessMsg.Text = "1";
            pnlEditSlider.Visible = false;
            txtDescription.Text = string.Empty;
        }
        else
            lblEmpDecription.Visible = true;
    }
}