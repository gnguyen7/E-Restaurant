using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eRestaurant.Framework.DAL;
using eRestaurant.Framework.Entities;
using System.ComponentModel; // Needed for [DataObject] and related attribute classes


namespace eRestaurant.Framework.BLL
{
    //Allows our class to be "discovered" by the ObjectDataSource controls in our website

    [DataObject]
    public class RestaurantAdminController
    {
        //The ObjectDataSource control will do back ground communication for CRUD
        //Allows the ObjectDataSource to see the method as something we can SELECT from

        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<SpecialEvent> ListAllSpecialEvents()
        {
            //This using statement ensures that our connection to the database is
            //properly "closed" once we are done "using" our DAL objects.
            //(context is our DAL object)

            using (RestaurantContext context = new RestaurantContext())
            {
                return context.SpecialEvents.ToList();
            }
        }
    }
}
