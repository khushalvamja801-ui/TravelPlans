using System;
using System.Web.UI;

namespace TravelPlans
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Returns "active" CSS class if the given page name matches the current page.
        /// </summary>
        protected string GetActiveClass(string pageName)
        {
            string currentPage = System.IO.Path.GetFileNameWithoutExtension(Request.PhysicalPath);
            return string.Equals(currentPage, pageName, StringComparison.OrdinalIgnoreCase) ? "active" : string.Empty;
        }
    }
}
