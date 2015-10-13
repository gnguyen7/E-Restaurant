using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel; // for [DataObject] et.al attributes
using eRestaurant.Framework.DAL; // for RestaurantContext
using eRestaurant.Framework.Entities; //for DB Entity Classes
using System.Data.Entity;
using eRestaurant.Framework.Entities.DTOs;

namespace eRestaurant.Framework.BLL
{
    [DataObject]
    public class MenuController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<CategoryDTO> ListMenuItem()
        {
            using (var context = new RestaurantContext())
            {
                var data = from cat in context.MenuCategories
                           orderby cat.Description
                           select new CategoryDTO() //use the DTO
                           {
                               Description = cat.Description,
                               MenuItems = from item in cat.MenuItems
                                           where item.Active
                                           orderby item.Description
                                           select new MenuItemDTO
                                           {
                                               Description = item.Description,
                                               Price = item.CurrentPrice,
                                               Calories = item.Calories,
                                               Comment = item.Comment
                                           }

                           };
                return data.ToList();
                //Note: To use Lamda or Method style of Include(),
                //you need to have the following namspace reference:
                //use System.Data.Entity;
                //The .Include() method on DbSet<T> class performs
                //"eager loading" of the data
                //return context.Items.Include(it => it.MenuCategory).ToList();
            }
        }
    }
}
