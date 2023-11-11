using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertSlider : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnInsertSlider_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpDecription.Visible = false;
        lblEmpPic.Visible = false;

        if (txtDescription.Text != "")
        {
            if (imgUpload.HasFile)
            {
                string query = "INSERT INTO dbo.Tbl_Slider ( SliderPic ,Description )VALUES ( @SliderPic ,@Description)";

                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);

                string str = imgUpload.FileName;
                imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/Slider/" + str));
                string image = str.ToString();

                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, 150).Value = txtDescription.Text;
                cmd.Parameters.Add("@SliderPic", SqlDbType.NVarChar, 50).Value = image;
                cmd.ExecuteNonQuery();
                conn.Close();

                lblSuccessMsg.Text = "1";
                pnlInsertSlider.Visible = false;
                txtDescription.Text = string.Empty;
            }
            else
                lblEmpPic.Visible = true;
        }
        else
            lblEmpDecription.Visible = true;
    }
}