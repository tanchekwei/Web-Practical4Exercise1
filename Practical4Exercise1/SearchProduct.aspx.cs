using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4Exercise1
{
    public partial class SearchProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            string strCountProd = "Select count(*) from Products p, " +
                "Categories c WHERE c.CategoryID = p.CategoryID " +
                @"AND c.CategoryName = @CategoryName";
            con.Open();
            SqlCommand cmdCount = new SqlCommand(strCountProd, con);

            if (String.IsNullOrEmpty(ddlCategory.SelectedValue))
            {
                cmdCount.Parameters.Add(new SqlParameter("CategoryName", "Beverages"));
            }
            else
            {
                cmdCount.Parameters.Add(new SqlParameter("CategoryName", ddlCategory.SelectedValue));
            }
            //cmdCount.Parameters.Add(new SqlParameter("CategoryName", ddlCategory.SelectedValue));
            int count = (int)cmdCount.ExecuteScalar();
            con.Close();

            lblResult.Text = count.ToString();
        }
    }
}