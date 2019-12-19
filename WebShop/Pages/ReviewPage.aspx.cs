using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Models;

namespace WebShop.Pages
{
    public partial class ReviewPage : System.Web.UI.Page
    {
        private static List<Rating> ratingsList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                if (!Page.IsPostBack)
                    FillPage();
            }
            else
            {
                PanelReviews.Controls.Add(new Literal { Text = "Your not logged in, so there will be shown no reviews!!" });
            }
        }

        private void FillPage()
        {
            RatingModel ratingModel = new RatingModel();
            ratingsList = ratingModel.GetAllRatings(Convert.ToInt32(Session["CustomerID"]));

            ListViewRating.DataSource = ratingsList;
            ListViewRating.DataBind();

            return;


            //Geta list of all ratings in DB
            //RatingModel ratingModel = new RatingModel();
            //List<Rating> ratings = ratingModel.GetAllRatings();
            //List<Rating> ratingsList = new List<Rating>();
            //Geta list of all products in DB
            ProductModel productModel = new ProductModel();
            List<Product> products = productModel.GetAllProducts();
            //Select the ratings according to Session
            //foreach (Rating rating in ratings)
            //{
            //    if (rating.FK_CustomerID == Convert.ToInt32(Session["CustomerID"]))
            //    {
            //        ratingsList.Add(rating);
            //    }
            //}

            //List<Rating> ratingsList = ratingModel.GetAllRatings(Convert.ToInt32(Session["CustomerID"]));

            // Make sure products exist in the database
            if (ratingsList != null)
            {
                //Create a new Panel with an ImageButton and 2 labels(Product name and Price) for each Product
                foreach (Rating rating in ratingsList)
                {
                    Product ratingProduct = new Product();

                    //somehow need to match the product and rating in here!!!
                    foreach (Product product in products)
                    {
                        if (rating.FK_ProductID == product.ProductID)
                        {
                            ratingProduct = product;
                        }
                    }

                    Panel ratingPanel = new Panel();
                    Image GameImage = new Image();
                    ImageButton imageButton = new ImageButton();
                    Label lblName = new Label();
                    Label lblStars = new Label();
                    Label lblComments = new Label();

                    //Set childControls properties 
                    lblStars.Text = "rated with a: " + rating.Value.ToString();
                    lblStars.CssClass = "productRatingStars";

                    lblComments.Text = rating.Comment; 
                    lblComments.CssClass = "productRatingComment";

                    

                    GameImage.ImageUrl = "~/Images/" + ratingProduct.Url;
                    GameImage.CssClass = "productImageRating";
                    //lblName.Text = product.Name;
                    lblName.CssClass = "productNameRating";

                    //Add child controls to Panel
                    ratingPanel.Controls.Add(GameImage);
                    ratingPanel.Controls.Add(new Literal { Text = "<br />" });
                    ratingPanel.Controls.Add(lblName);
                    ratingPanel.Controls.Add(new Literal { Text = "<br />" });
                    ratingPanel.Controls.Add(lblStars);
                    ratingPanel.Controls.Add(lblComments);

                    PanelReviews.Controls.Add(ratingPanel);
                }
            }
            else
            {
                PanelReviews.Controls.Add(new Literal { Text = "No products found!" });
            }
        }

        private void BindListView()
        {
            ListViewRating.DataSource = ratingsList;
            ListViewRating.DataBind();
        }

        protected void ListViewRating_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ListViewRating.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void ListViewRating_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int index = e.ItemIndex;
            var item = ratingsList[index];

            RatingModel ratingModel = new RatingModel();
            ratingModel.DeleteRating(item.RatingID);

            FillPage();
        }

        protected void ListViewRating_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ListViewRating.EditIndex = -1;
            BindListView();
        }

        protected void ListViewRating_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int index = e.ItemIndex;
            var item = ratingsList[index];

            ListViewItem selected = ListViewRating.EditItem;
            TextBox textBox = (TextBox)selected.FindControl("TextBoxComment");
            DropDownList dropDownList = (DropDownList)selected.FindControl("DropDownListRating");

            item.Value = int.Parse(dropDownList.SelectedValue);
            item.Comment = textBox.Text;

            RatingModel ratingModel = new RatingModel();
            ratingModel.UpdateRating(item.RatingID, item);

            ListViewRating.EditIndex = -1;
            FillPage();
        }

        protected void ListViewRating_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (ListViewRating.EditIndex > -1)
            {
                int index = ListViewRating.EditIndex;
                var item = ratingsList[index];

                DropDownList dropDownList = (DropDownList)e.Item.FindControl("DropDownListRating");
                if(dropDownList != null)
                    dropDownList.SelectedValue = item.Value.ToString();
            }
        }
    }
}