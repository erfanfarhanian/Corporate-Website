using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertPortal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserIds"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }



    protected void btnInsertPortal_Click(object sender, EventArgs e)
    {
        string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
        DataSet ViewUser = new DataSet();

        lblEmpURL.Visible = false;
        lblEmpPortalTitle.Visible = false;
        lblEmpPic.Visible = false;

        if (txtPortalTitle.Text != "")
        {
            if (txtURL.Text != "")
            {
                if (imgUpload.HasFile)
                {
                    string query = "INSERT INTO dbo.Tbl_Portal ( PortalTitle ,PortalUrl, PortalPic )VALUES ( @PortalTitle ,@PortalUrl, @PortalPic)";

                    SqlConnection conn = new SqlConnection(strConn);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);

                    string str = imgUpload.FileName;
                    imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/PortalWebImg/" + str));
                    string image = str.ToString();

                    cmd.Parameters.Add("@PortalTitle", SqlDbType.NVarChar, 150).Value = txtPortalTitle.Text;
                    cmd.Parameters.Add("@PortalUrl", SqlDbType.NVarChar).Value = txtURL.Text;
                    cmd.Parameters.Add("@PortalPic", SqlDbType.NVarChar, 50).Value = image;
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblSuccessMsg.Text = "1";
                    pnlInsertPortal.Visible = false;
                    txtPortalTitle.Text = string.Empty;
                    txtURL.Text = string.Empty;
                }
                else
                    lblEmpPic.Visible = true;
            }
            else
                lblEmpURL.Visible = true;
        }
        else
            lblEmpPortalTitle.Visible = true;
        
    }
}