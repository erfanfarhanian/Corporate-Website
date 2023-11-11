using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertNotification : System.Web.UI.Page
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

        txtNotifTime.Text = Convert.ToString(DateTime.Now.Hour) + ":" + Convert.ToString(DateTime.Now.Minute);
        txtNotifDate.Text = GetDate();
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

    protected void btnInsertNotification_Click(object sender, EventArgs e)
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
                string saveQuery = "INSERT INTO dbo.Tbl_Notification( NotifTitle ,NotifDescription ,NotifDate ,NotifTime )VALUES  ( @NotifTitle ,@NotifDescription ,@NotifDate , @NotifTime )";
                SqlCommand cmd = new SqlCommand(saveQuery, conn);
                cmd.Parameters.Add("@NotifTitle", SqlDbType.NVarChar, 100).Value = txtNotifTitle.Text;
                cmd.Parameters.Add("@NotifDescription", SqlDbType.NVarChar).Value = txtNotifDescription.Text;
                cmd.Parameters.Add("@NotifDate", SqlDbType.NVarChar, 10).Value = txtNotifDate.Text;
                cmd.Parameters.Add("@NotifTime", SqlDbType.VarChar, 5).Value = txtNotifTime.Text;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                lblSuccessMsg.Text = "1";
                btnReturn.Visible = true;
                pnlInsertNotification.Visible = false;
            }
            else
                lblNotifDescription.Visible = true;
        }
        else
            lblNotifTitle.Visible = true;
    }
}