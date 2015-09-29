using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace eRestaurant.Framework.Entities
{
    public class Waiter
    {
        public int WaiterID { get; set; }
        [Required]

        [StringLength(25)]
        public string FirstName { get; set; }

        [StringLength(35)]
        public string LastName { get; set; }

        [Required, StringLength(15, MinimumLength = 4)]
        public string Phone { get; set; }

        [Required, StringLength(30, MinimumLength = 8]
        public string Address { get; set; }

        public DateTime HireDate {get;set;}

        public DateTime ReleaseDate {get;set;}

        public virtual ICollection<Bill> Bills { get; set; }

    }
}
