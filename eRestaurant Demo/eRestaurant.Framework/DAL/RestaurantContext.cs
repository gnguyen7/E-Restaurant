using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using eRestaurant.Framework.Entities; //Need for Entity class
using System.Data.Entity; //Need for DbContext and other EF class

namespace eRestaurant.Framework.DAL
{
    //By making our DAL class internal, that mean outside projects can't directly
    //access our Data Access Layer (they have to go through our BLL to do stuff)
    internal class RestaurantContext : DbContext
    {
        public RestaurantContext()
            : base("DefaultConnection")
        { }
        //One property for each Table/Entity in the database
        public DbSet<Table> Tables { get; set; }
        public DbSet<SpecialEvent> SpecialEvents { get; set; }
        public DbSet<Reservation> Reservations { get; set; }

        //public DbSet<Bill> Bills { get; set; }
        //public DbSet<BillItem> BillItems { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<MenuCategory> MenuCategories { get; set; }
        //public DbSet<Waiter> Waiters { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<Reservation>().HasMany(r => r.Tables)
                .WithMany(t => t.Reservations)
                .Map(mapping =>
                {
                    mapping.ToTable("ReservationTables");
                    mapping.MapLeftKey("ReservationID");
                    mapping.MapRightKey("TableID");
                });
            base.OnModelCreating(modelBuilder);
        }
    }
}
