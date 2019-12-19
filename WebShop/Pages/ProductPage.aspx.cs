using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages
{
    public partial class ProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                btnAdd.Visible = true;
            }
            else
            {
                Label1.Visible = true;
            }
                FillPage();
        }

        private void FillPage()
        {
            //
            string queryString = Request.QueryString["id"];
            if (queryString != null)
            {
                ////Get selected product's data
                //int id = Convert.ToInt32(Request.QueryString["id"]);
                //Models.ProductModel ratingModel = new Models.ProductModel();
                //Product rating = ratingModel.GetProduct(id);

                //// Fill page with data
                //lblPrice.Text = "DKK " + rating.UnitPrice;
                //lblTitle.Text = rating.Name;
                //lblDescription.Text = rating.Description;
                //lblItemNr.Text = id.ToString();
                //imgProduct.ImageUrl = "~/Images/" + rating.Url;

                ////Fill the amount of available products from stock
                //int stockFromDB = rating.Stock; 
                //int[] amount = Enumerable.Range(1, stockFromDB).ToArray();
                //ddlAmount.DataSource = amount;
                //ddlAmount.AppendDataBoundItems = true;
                //ddlAmount.DataBind();

                //Get selected product's data
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var rating = ProductModel.Get_Product(id);

                // Fill page with data
                LiteralRating.Text = rating.Average_rating.ToString();

                lblPrice.Text = "DKK " + rating.UnitPrice;
                lblTitle.Text = rating.Name;
                lblDescription.Text = rating.Description;
                lblItemNr.Text = id.ToString();
                imgProduct.ImageUrl = "~/Images/" + rating.Url;

                //Fill the amount of available products from stock
                int stockFromDB = rating.Stock;
                int[] amount = Enumerable.Range(1, stockFromDB).ToArray();
                ddlAmount.DataSource = amount;
                ddlAmount.AppendDataBoundItems = true;
                ddlAmount.DataBind();

                if(Session["CustomerID"] != null)
                {
                    PanelRating.Visible = true;
                }
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

                var product = ProductModel.Get_Product(productID);

                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<CartModel>();
                }

                List<CartModel> cart = (List<CartModel>)Session["Cart"];

                cart.Add(new CartModel
                {
                    customerID = loginID,
                    ProductID = productID,
                    Quantity = amount,
                    Price = product.UnitPrice,
                    Name = product.Name
                });

                Session["Cart"] = cart;
            }
        }

        protected void ButtonSubmitRating_Click(object sender, EventArgs e)
        {
            string queryString = Request.QueryString["id"];

            if (queryString != null)
            {
                string customerID = Session["CustomerID"].ToString();
                int loginID = Convert.ToInt32(customerID);

                int productID = Convert.ToInt32(queryString);
                string comment = TextBoxComment.Text;
                int value = int.Parse(DropDownListRating.SelectedValue);

                Rating rating = new Rating
                {
                    FK_CustomerID = loginID,
                    FK_ProductID = productID,
                    Comment = comment,
                    Value = value
                };

                RatingModel ratingModel = new RatingModel();
                ratingModel.InsertRating(rating);
            }
        }
    }
}