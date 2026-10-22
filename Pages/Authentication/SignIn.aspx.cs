using System;

namespace TravelPlans.Pages.Authentication
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Default saved credentials
                txtUserEmail.Text = "vamja801@gmail.com";
                txtUserPassword.Attributes["value"] = "vamja@801";

                txtAdminEmail.Text = "khushal801@gmail.com";
                txtAdminPassword.Attributes["value"] = "khushal@801";
            }
        }

        protected void btnUserSignIn_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Save user in session
            Session["DemoUser"] = "Khushal Vamja";
            Session["UserEmail"] = !string.IsNullOrEmpty(txtUserEmail.Text) ? txtUserEmail.Text.Trim() : "vamja801@gmail.com";

            // Demo: redirect to user dashboard
            Response.Redirect("~/Pages/User/Dashboard.aspx");
        }

        protected void btnAdminSignIn_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Save admin in session
            Session["AdminUser"] = "Administrator";
            Session["AdminEmail"] = !string.IsNullOrEmpty(txtAdminEmail.Text) ? txtAdminEmail.Text.Trim() : "khushal801@gmail.com";

            // Demo: redirect to admin dashboard
            Response.Redirect("~/Pages/Admin/Dashboard.aspx");
        }
    }
}
