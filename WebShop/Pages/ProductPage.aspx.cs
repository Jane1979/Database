using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Pages
{
    public partial class ProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            FillPage();
        }

        private void FillPage()
        {
            //
            string queryString = Request.QueryString["id"];
            if (queryString != null)
            {
                //Get selected product's data
                int id = Convert.ToInt32(Request.QueryString["id"]);
                Models.ProductModel productModel = new Models.ProductModel();
                Product product = productModel.GetProduct(id);

                // Fill page with data
                lblPrice.Text = "DKK " + product.UnitPrice;
                lblTitle.Text = product.Name;
                lblDescription.Text = product.Description;
                lblItemNr.Text = id.ToString();
                imgProduct.ImageUrl = "~/Images/" + product.Url;

                //Fill the amount of available products from stock
                int stockFromDB = product.Stock; 
                int[] amount = Enumerable.Range(1, stockFromDB).ToArray();
                ddlAmount.DataSource = amount;
                ddlAmount.AppendDataBoundItems = true;
                ddlAmount.DataBind();

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string queryString = Request.QueryString["id"];
            if (queryString != null)
            {
                string customerID = Session["CustomerID"].ToString();
                int loginID = Convert.ToInt32(customerID);

                int productID = Convert.ToInt32(queryString);
                int amount = Convert.ToInt32(ddlAmount.SelectedValue);


            }
        }
    }
}