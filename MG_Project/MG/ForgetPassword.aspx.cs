using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text != "")
        {
            string conn = ConfigurationManager.ConnectionStrings["Mg_DBConnectionString"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(conn);
            string query = "select Username, Password from Tbl_User where Email = @Email";
            SqlCommand sqlCmd = new SqlCommand(query, sqlConn);
            sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            sqlConn.Open();
            SqlDataReader dr = sqlCmd.ExecuteReader();
            if (dr.Read())
            {
                string username = dr["Username"].ToString();
                string password = dr["Password"].ToString();
                MailMessage mm = new MailMessage("azadlearn1@gmail.com", txtEmail.Text);
                mm.Subject = "شرکت مهاب قدس / کلمه عبور شما";
                mm.Body = string.Format("<div dir='rtl'> <h2>باسلام</h2> <br/> نام کاربری و کلمه عبور شما به صورت زیر می باشد: <br/> نام کاربری: {0} <br/> کلمه عبور: {1} <br/> باتشکر <br/> <p>اینترانت شرکت مهاب قدس</p></div>", username, password);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "azadlearn1@gmail.com";
                nc.Password = "Erfan1377azadlearngmail";
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = nc;
                smtp.Port = 587;
                mm.To.Add(txtEmail.Text);
                string fromAddress = "اینترانت شرکت مهاب قدس <azadlearn1@gmail.com>";
                mm.From = new MailAddress(fromAddress);
                smtp.Send(mm);
                txtEmail.Text = string.Empty;
                lblSuccessSend.Visible = true;
                lblWrongEmail.Visible = false;
                lblEmpEmail.Visible = false;
            }
            else
            {
                lblSuccessSend.Visible = false;
                lblWrongEmail.Visible = true;
            }
        }
        else
            lblEmpEmail.Visible = true;
        
    }
}