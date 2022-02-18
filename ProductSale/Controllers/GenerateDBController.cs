using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSale.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GenerateDBController : Controller
    {
        private readonly IConfiguration _configuration;
        public GenerateDBController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        List<string> buyer_name = new List<string>() { "Никита", "Вадим", "Вацлав", "Платон", "Ерофей", "Вениамин", "Юлиан", "Осип", "Адриан", "Всеволод" };
        List<string> sales_point_name = new List<string>() { "Будённовский", "Калининский", "Кировский", "Куйбышевский", "Ворошиловский", "Киевский", "Ленинский", "Петровский", "Пролетарский" };
        List<string> product_name = new List<string>() { "Молоко", "Сметана", "Кефир", "Сыр", "Хлеб", "Картофель", "Морковь", "Свекла", "Яблоко", "Груша", "Рыба", "Кофеты", "Печенье", "Вода", "Кукуруза" };
        List<string> login = new List<string>() { "Пользователь_1", "Пользователь_2", "Пользователь_3", "Пользователь_4", "Пользователь_5", "Пользователь_6", "Пользователь_7", "Пользователь_8", "Пользователь_9", "Пользователь_10" };
        int id_provided = 1, id_product = 1, id_sales_point = 1, id_buyer = 1, id_sales_data = 1;
        /// <remarks>Generate</remarks>
        /// <response code="200">That's all right</response>
        /// <response code="500">Oops! Something went wrong</response>
        [HttpPut]
        public JsonResult Put()
        {
            var random = new Random();
            string sqlDataSource = _configuration.GetConnectionString("DefaultConnection");
            using (NpgsqlConnection connection = new NpgsqlConnection(sqlDataSource))
            {
                connection.Open();

                for (int i = 0; i < buyer_name.Count; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"Buyer\" (name, mas_id_sale, login) VALUES('" + buyer_name[i] + "', ' { " + (i + 1) + " } ', '" + login[i] + "');", connection);
                    sqlCommand.ExecuteNonQuery();
                }

                for (int i = 0; i < product_name.Count; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"Product\" (name, price) VALUES('" + product_name[i] + "', " + random.Next(10, 1000) + ");", connection);
                    sqlCommand.ExecuteNonQuery();
                }

                for (int i = 0; i < 20; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"ProvidedProduct\" (id_product, quantity) VALUES(" + id_product + ", " + random.Next(10, 100) + ");", connection);
                    sqlCommand.ExecuteNonQuery();
                    id_product++; if (id_product == 16) { id_product = 1; }
                }

                for (int i = 0; i < sales_point_name.Count; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"SalesPoint\" (name, id_provided) VALUES('" + sales_point_name[i] + "', " + id_provided + ");", connection);
                    sqlCommand.ExecuteNonQuery();
                    id_provided++;
                }

                for (int i = 0; i < 20; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"SalesData\" (id_product, quantity, product_amount) VALUES(" + id_product + ", " + random.Next(1, 10) + ", " + random.Next(100, 1000) + ");", connection);
                    sqlCommand.ExecuteNonQuery();
                    id_product++; if (id_product == 16) { id_product = 1; }
                }

                for (int i = 0; i < 30; i++)
                {
                    NpgsqlCommand sqlCommand = new NpgsqlCommand("INSERT INTO \"Sale\" (date, time, id_sales_point, id_buyer, id_sales_data, total_amount) " +
                        "VALUES('" + DateTime.Now.ToString("dd/MM/yyyy")+ "','" + DateTime.Now.ToString("hh:mm:ss") + "', " + id_sales_point + ", " + id_buyer + ", " + id_sales_data + ", " + random.Next(1000, 5000) + ");", connection);
                    sqlCommand.ExecuteNonQuery();
                    id_sales_point++; if (id_sales_point == 10) { id_sales_point = 1; }
                    id_buyer++; if (id_buyer == 11) { id_buyer = 1; }
                    id_sales_data++; if (id_sales_data == 21) { id_sales_data = 1; }
                }

                connection.Close();
            }
            return new JsonResult("The database is filled with data");
        }
    }
}
