using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel; // for [DataObject] et.al attributes
using eRestaurant.Framework.DAL; // for RestaurantContext
using eRestaurant.Framework.Entities; //for DB Entity Classes

namespace eRestaurant.Framework.BLL
{
    [DataObject]
    public class MenuController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Item> ListMenuItem()
        {
            using (var context = new RestaurantContext())
            {
                return context.Items.ToList();
            }
        }
    }
}
