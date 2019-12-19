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

        public static List<v_Product> SearchProducts(string searchString)
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    List<v_Product> products = db.v_Product
                        .Where(p => p.Name.ToLower().Contains(searchString.ToLower()) || 
                                    p.Description.Contains(searchString) ||
                                    p.Url.ToLower().Contains(searchString.ToLower()) ||
                                    p.UnitPrice.ToString() == searchString ||
                                    p.Stock.ToString() == searchString)
                        .ToList();

                    return products;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static v_Product Get_Product(int id)
        {
            try
            {
                using (ProductEntities db = new ProductEntities())
                {
                    v_Product product = db.v_Product.FirstOrDefault(p => p.ProductID == id);

                    return product;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}