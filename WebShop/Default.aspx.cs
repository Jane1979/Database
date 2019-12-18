using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillPage();
        }

        private void FillPage()
        {
            //Geta list of all products in DB
            ProductModel productModel = new ProductModel();
            List<Product> products = productModel.GetAllProducts();

            // Make sure products exist in the database
            if(products != null)
            {
                //Create a new Panel with an ImageButton and 2 labels(Product name and Price) for each Product
                foreach (Product product in products)
                {
                    Panel productPanel = new Panel();
                    ImageButton imageButton = new ImageButton();
                    Label lblName = new Label();
                    Label lblPrice = new Label();

                    //Set childControls properties
                    imageButton.ImageUrl = "~/Images/" + product.Url;
                    imageButton.CssClass = "productImage";
                    imageButton.PostBackUrl = "~/Pages/ProductPage.aspx?id=" + product.ProductID;

                    lblName.Text = product.Name;
                    lblName.CssClass = "productName";

                    lblPrice.Text = "DKK " + product.UnitPrice;
                    lblPrice.CssClass = "productPrice";

                    //Add child controls to Panel
                    productPanel.Controls.Add(imageButton);
                    productPanel.Controls.Add(new Literal { Text = "<br />" });
                    productPanel.Controls.Add(lblName);
                    productPanel.Controls.Add(new Literal { Text = "<br />" });
                    productPanel.Controls.Add(lblPrice);

                    panelProducts.Controls.Add(productPanel);
                }
            }
            else
            {
                panelProducts.Controls.Add(new Literal { Text = "No products found!" });
            }
        }
    }
}