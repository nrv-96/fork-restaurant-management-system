using System.ComponentModel.DataAnnotations;

namespace RestaurentManagement.Models
{
    public class Signup
    {
        public string userid { get; set; }

        [Required(ErrorMessage = "Username is required")]
        public string username { get; set; }

       

        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$", ErrorMessage = "Invalid email format")]
        public string email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string password { get; set; }

        

        [Required(ErrorMessage = "User Type is required")]
        public string user_type_id { get; set; }

    }
}
