using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Npgsql;
using ProductSale.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BuyerController : Controller
    {
        private readonly IConfiguration _configuration;
        public BuyerController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        /// <remarks>Get all records from the buyer table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpGet]
        public JsonResult Get()
        {
            string query = "SELECT \"Buyer\".id_buyer, \"Buyer\".\"name\", \"Buyer\".mas_id_sale, \"Buyer\".\"login\" FROM \"Buyer\"";
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult(table);
        }
        /// <remarks>Add record to the buyer table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPost]
        public JsonResult Post(Buyer buyer)
        {
            string query = "INSERT INTO \"Buyer\" (name, mas_id_sale, login) values(@Name, @Mas_Id_Sale, @Login)";
            
            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", buyer.Name);
                    command.Parameters.AddWithValue("@Mas_Id_Sale", buyer.Mas_Id_Sale);
                    command.Parameters.AddWithValue("@Login", buyer.Login);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();
                }
            }
            return new JsonResult("Added Successfully");
        }
        /// <remarks>Delete record from the buyer table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string query = "DELETE FROM \"Buyer\" WHERE \"Buyer\".id_buyer = @Id_Buyer ";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Buyer", id);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();

                }
            }
            return new JsonResult("Deleted Successfully");
        }
        /// <remarks>Change record from the buyer table</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPut]
        public JsonResult Put(Buyer buyer)
        {
            string query = "UPDATE \"Buyer\" SET (name, mas_id_sale, login) = (@Name, @Mas_Id_Sale, @Login) WHERE \"Buyer\".id_buyer = @Id_Buyer";

            DataTable table = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            NpgsqlDataReader reader;
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();
                using (NpgsqlCommand command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Buyer", buyer.Id_Buyer);
                    command.Parameters.AddWithValue("@Name", buyer.Name);
                    command.Parameters.AddWithValue("@Mas_Id_Sale", buyer.Mas_Id_Sale);
                    command.Parameters.AddWithValue("@Login", buyer.Login);
                    reader = command.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    connection.Close();

                }
            }
            return new JsonResult("Updated Successfully");
        }
    }
}
