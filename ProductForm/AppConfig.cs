using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
namespace ProductForm
{
    public class AppConfig
    {
        private static SqlConnection con = new SqlConnection();

        public static string ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            con.ConnectionString = ConnectionString;
            return con;
        }
    }
}
