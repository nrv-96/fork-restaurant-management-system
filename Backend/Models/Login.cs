using System.ComponentModel.DataAnnotations;

namespace RestaurentManagement.Models
{
    public class Login
    {
        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$", ErrorMessage = "Invalid email format")]
        public string email { get; set; }

        public string password { get; set; }
    }
}
