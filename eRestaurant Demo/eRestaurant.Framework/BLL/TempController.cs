using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eRestaurant.Framework.Entities; //Access the namespace for my entity classes
using eRestaurant.Framework.DAL; //Access DAL classes


namespace eRestaurant.Framework.BLL
{
    public class TempController
    {
        public List<MenuCategory> ListMenuCategories()
        {
            using (var context = new RestaurantContext())
            {
                var data = from category in context.MenuCategories
                           select category;
                return data.ToList();
            }
        }
    }
}
