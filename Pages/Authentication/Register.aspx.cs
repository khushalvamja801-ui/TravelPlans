using System;

namespace TravelPlans.Pages.Authentication
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            // Demo: redirect to user dashboard after registration
            Session["DemoUser"] = txtFirstName.Text + " " + txtLastName.Text;
            Response.Redirect("~/Pages/User/Dashboard.aspx");
        }
    }
}
