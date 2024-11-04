using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Program
    {
        static void Main(string[] args)
        {
            IFigura [] ArregloFiguras = new IFigura[2] ; 
            Cuadrado FiguraCuadrado = new Cuadrado(); 
            Triangulo Figuratriangulo = new Triangulo();
            ArregloFiguras[0] = FiguraCuadrado; 
            ArregloFiguras[1] = Figuratriangulo;  

            foreach (IFigura figuras in ArregloFiguras) 
                                                      
            {
                Console.WriteLine(figuras.ToString());  
                
            }
            Console.ReadKey();
        }
    }
}
