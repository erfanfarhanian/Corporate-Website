using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditNotification : System.Web.UI.Page
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
            DataSet ViewNotifications = new DataSet();
            ViewNotifications.Reset();
            SqlConnection conn = new SqlConnection(strConn);
            string query = "SELECT NotifID ,NotifTitle ,NotifDescription ,NotifDate ,NotifTime FROM dbo.Tbl_Notification where NotifID = '" + Session["NotifIdS"].ToString() + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ViewNotifications, "Tbl_Notification");
            conn.Close();
            if (ViewNotifications.Tables["Tbl_Notification"].Rows.Count != 0)
            {
                pnlEditNotification.Visible = true;
                
                txtNotifTitle.Text = ViewNotifications.Tables["Tbl_Notification"].Rows[0]["NotifTitle"].ToString();
                txtNotifDescription.Text = ViewNotifications.Tables["Tbl_Notification"].Rows[0]["NotifDescription"].ToString();
                txtNotifDate.Text = ViewNotifications.Tables["Tbl_Notification"].Rows[0]["NotifDate"].ToString();
                txtNotifTime.Text = ViewNotifications.Tables["Tbl_Notification"].Rows[0]["NotifTime"].ToString();
            }
        }
    }

    protected void btnEditNotification_Click(object sender, EventArgs e)
    {
        lblNotifDescription.Visible = false;
        lblNotifTitle.Visible = false;
        btnReturn.Visible = false;

        if (txtNotifTitle.Text != "")
        {
            if (txtNotifDescription.Text != "")
            {
                string strConn = "Data Source=.;Initial Catalog=Mg_DB;Integrated Security=True";
                SqlConnection conn = new SqlConnection(strConn);
                string saveQuery = "update Tbl_Notification set NotifTitle = @NotifTitle, NotifDescription = @NotifDescription where NotifID = '" + Session["NotifIdS"].ToString() + "' ";
                SqlCommand cmd = new SqlCommand(saveQuery, conn);
                cmd.Parameters.Add("@NotifTitle", SqlDbType.NVarChar, 100).Value = txtNotifTitle.Text;
                cmd.Parameters.Add("@NotifDescription", SqlDbType.NVarChar).Value = txtNotifDescription.Text;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                lblSuccessMsg.Text = "1";
                btnReturn.Visible = true;
                pnlEditNotification.Visible = false;
            }
            else
                lblNotifDescription.Visible = true;
        }
        else
            lblNotifTitle.Visible = true;
    }
}