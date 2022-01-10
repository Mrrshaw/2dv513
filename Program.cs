using System;

namespace _2DV513A3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool isValidMenuItem = false;

            Connect connect = new Connect();
            Console.WriteLine("Welcome to the Artist & Song compository!");
            Console.WriteLine("What do you want to do today? (Enter Setup or a number)");
            Console.WriteLine("Setup. Setup database (Tables)");
            Console.WriteLine("1: Artist, Label & Song" + "\n" + 
                "2: Artist, Label & Earnings (for the artist's label,  in 1000$'s)" + "\n" + 
                "3: See view for data from Artist, Label and Song tables" + "\n" + 
                "4: See a list of the most famous artists, from top to bottom!" + "\n" + 
                "5: See the sum of all earning of all the recording labels in the database (in 1000$'s)" + "\n" + 
                "6: All artists with famefactor 5 or higher, starting with the most famous" + "\n" +
                "Exit: ");

            while (!isValidMenuItem)
            {
                string readNum = Console.ReadLine();
                if (readNum == "1" || readNum == "2" || readNum == "3" || readNum == "4" || readNum == "5" || readNum == "6")
                {
                    if(readNum == "1")
                    {
                        connect.menuItem1();
                    }
                    if (readNum == "2")
                    {
                        connect.menuItem2();
                    }
                    if (readNum == "3")
                    {
                        connect.menuItem3();
                    }
                    if (readNum == "4")
                    {
                        connect.menuItem4();
                    }
                    if (readNum == "5")
                    {
                        connect.menuItem5();
                    }
                    if (readNum == "6")
                    {
                        connect.menuItem6();
                    }
                }
                else if(readNum == "Exit" || readNum == "exit")
                {
                    Console.WriteLine("Shutting down the system.");
                    isValidMenuItem = true;
                }
            }
            


        }
    }
}
