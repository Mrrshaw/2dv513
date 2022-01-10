using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using DocumentFormat.OpenXml.Wordprocessing;

namespace _2DV513A3
{
    public class Connect
    {
        public void menuItem1()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"Select name, label, title FROM [Assignment3].[dbo].[Artist] AS art INNER JOIN [Assignment3].[dbo].[Song] AS song ON art.name = song.artist";

            command  = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + " - " + dataReader.GetValue(1) + " - " +  dataReader.GetValue(2) + "\n";
            } 
            
            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }

        public void menuItem2()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"Select name, label, earnings FROM [Assignment3].[dbo].[Artist] AS art INNER JOIN [Assignment3].[dbo].[Label] AS label ON label.organisation = art.label";

            command = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + " - " + dataReader.GetValue(1) + " - " + dataReader.GetValue(2) + "\n";
            }

            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }

        public void menuItem3()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"SELECT name, label, title,FameFactor FROM [Assignment3].[dbo].[artistdata]";

            command = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + " - " + dataReader.GetValue(1) + " - " + dataReader.GetValue(2) + " - " + dataReader.GetValue(3) + "\n";
            }

            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }

        public void menuItem4()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"SELECT name, famefactor, MAX(famefactor) AS max_famefactor FROM [Assignment3].[dbo].[Artist] GROUP BY famefactor, name ORDER BY famefactor DESC";
            command = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + "\n";
            }

            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }

        public void menuItem5()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"SELECT SUM(earnings) AS sumOfEarnings FROM [Assignment3].[dbo].[Label] ORDER BY sumOfEarnings DESC";
            command = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + "\n";
            }

            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }

        public void menuItem6()
        {
            string connectString;
            SqlConnection sqlConn;
            connectString = @"Data Source=localhost;Database=Assignment3;Initial catalog = ;User ID=usera3;Password=hemligt";
            sqlConn = new SqlConnection(connectString);
            sqlConn.Open();
            Console.WriteLine("");

            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";

            sql = @"SELECT * FROM [Assignment3].[dbo].[Artist] WHERE famefactor >= 5 ORDER BY famefactor DESC";
            command = new SqlCommand(sql, sqlConn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                output = output + dataReader.GetValue(0) + "\n";
            }

            Console.WriteLine(output);
            Console.WriteLine();

            sqlConn.Close();
        }
    }
}
