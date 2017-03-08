using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ProductForm
{
    public class AppConfig
    {
        private static SqlConnection con = new SqlConnection();

        public static string ConnectionString = @"server=.\SQLEXPRESS;database=TSQLFundamentals2008;uid=sa;pwd=phuc@se61834";

        public static SqlConnection GetConnection()
        {
            con.ConnectionString = ConnectionString;
            return con;
        }
    }
}
