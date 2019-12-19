using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CustomerModel customerModel = new CustomerModel();
            List<Customer> customers = customerModel.GetAllCustomer();
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            Customer customer = CustomerModel.GetCustomer(username, password);

            if(customer != null)
            {
                Session["Email"] = customer.Email;
                Session.Add("CustomerID", customer.CustomerID);
                Response.Redirect("~/Default.aspx");

            }
            else 
            {
                Label1.Text = "Your username or password is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}