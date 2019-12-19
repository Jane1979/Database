using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WebShop.Models
{
    public class RatingModel
    {
        public string InsertRating(Rating rating) 
        {
            try 
            {
                ProductEntities db = new ProductEntities();
                db.Ratings.Add(rating);
                db.SaveChanges();

                return "You have rated this product with " + rating.Value + " stars";
            }
            catch(Exception e)
            {
                return "Error: " + e;
            }
        }



        public string UpdateRating(int id, Rating rating)
        {
            try
            {
                ProductEntities db = new ProductEntities();

                //Fetch object from db
                Rating r = db.Ratings.Find(id);

                r.Value = rating.Value;
                r.Comment = rating.Comment;

                db.SaveChanges();

                return "You have updated this product with " + rating.Value + " stars";

            }
            catch (Exception e)
            {
                return "Error: " + e;
            }
        }

        public string DeleteRating(int id)
        {
            try
            {
                ProductEntities db = new ProductEntities();
                Rating rating = db.Ratings.Find(id);

                db.Ratings.Attach(rating);
                db.Ratings.Remove(rating);

                db.SaveChanges();

                return "You have deleted this product";
            }
            catch (Exception e)
            {
                return "Error: " + e;
            }
        }

        public Rating GetRating(int id)
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    Rating rating = db.Ratings.Find(id);
                    return rating;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Rating> GetAllRatings()
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    List<Rating> rating = (from x in db.Ratings select x).ToList();

                    return rating;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Rating> GetAllRatings(int id)
        {
            try
            {
                ProductEntities db = new ProductEntities();

                    List<Rating> rating = (from x in db.Ratings.Include(x => x.Product)
                                           where x.FK_CustomerID == id
                                           select x).ToList();

                    return rating;

            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}