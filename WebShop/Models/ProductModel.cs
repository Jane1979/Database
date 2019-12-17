using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Models
{
    public class ProductModel
    {
        public Product GetProduct(int id)
        {
            try 
            { 
                using(ProductEntities db = new ProductEntities()) 
                {
                    Product product = db.Products.Find(id);
                    return product;
                }
            }
            catch(Exception) 
            {
                return null;
            }
        }

        public List<Product>GetAllProducts()
        {
            try
            {
                using(ProductEntities db = new ProductEntities())
                {
                    List<Product> products = (from x in db.Products select x).ToList();

                    return products;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}