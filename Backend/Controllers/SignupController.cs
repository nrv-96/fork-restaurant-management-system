using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using RestaurentManagement.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
namespace RestaurentManagement.Controllers
{
    [EnableCors("AllowAll")]
    [Route("api/[controller]")]
    [ApiController]
    public class SignupController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public SignupController(IConfiguration configuration)
        {
            _configuration = configuration;

        }
        [HttpPost]
        [Route("Signup")]
        public string Signup(Signup signup)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(_configuration.GetConnectionString("restomgmt")))
                {
                    con.Open();

                    using (SqlCommand checkCmd = new SqlCommand(" SELECT COUNT(*) FROM users WHERE email = @email", con))
                    {
                        checkCmd.Parameters.AddWithValue("@email", signup.email);
                        int userCount = (int)checkCmd.ExecuteScalar();

                        if(userCount > 0)
                        {
                            return "User Already Registered !";
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand("INSERT INTO users(userid, username, email, PasswordHash, user_type_id, CreatedAt, UpdatedAt) VALUES(@userid, @username, @email, @PasswordHash, @user_type_id, @CreatedAt, @UpdatedAt);",con))
                    {
                        

                        cmd.Parameters.AddWithValue("@userid", signup.userid);
                        cmd.Parameters.AddWithValue("@username", signup.username);
                        cmd.Parameters.AddWithValue("@email", signup.email);
                        cmd.Parameters.AddWithValue("@PasswordHash",signup.password );
                        cmd.Parameters.AddWithValue("@user_type_id", signup.user_type_id); // Assuming signup.UserTypeId is provided
                        cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                        cmd.Parameters.AddWithValue("@UpdatedAt", DateTime.Now);

                        int i = cmd.ExecuteNonQuery();  

                        if(i > 0)
                        {
                            return "Registration Successfully";
                        }
                        else
                        {
                            return "Error";
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in Signup method: {ex.Message}");
                return "Error";
            }
        }

        [HttpPost]
        [Route("Login")]
        public string Login(Login login)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(_configuration.GetConnectionString("restomgmt").ToString()))
                {
                    string query = "SELECT * FROM users WHERE email = @email AND PasswordHash = @PasswordHash";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@email", login.email);
                        cmd.Parameters.AddWithValue("@PasswordHash", login.password);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            return "Valid User";
                        }
                        else
                        {
                            return "Invalid User";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in login method: {ex.Message}");
                return "Error";
            }
        }

    }
}
