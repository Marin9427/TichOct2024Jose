using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu_General
{
    public class Arreglos
    {

        public static void Cedenas()
        {
            Console.WriteLine("Proporciona tu nombre completo ");
            String NombreCompleto = Console.ReadLine();
            Console.WriteLine(" ");
            //Se separa cadena por espacios, se cuenta cuantos espacios hay y se itera mostrando cada uno
            string[] partesNombre = NombreCompleto.Split(' ');
            Console.WriteLine("Hola");
            for (int i = 0; i < partesNombre.Length; i++)
            {
                Console.WriteLine(partesNombre[i]);
            }
            Console.WriteLine(" ");
            //Se iteratura sobre el array
            Console.WriteLine("Apellido Verical");
            char[] letras = partesNombre[partesNombre.Length - 2].ToCharArray();
            foreach (char c in letras) {
                Console.WriteLine(c);
            }

        }

        public static void Enteros()
        {
            Console.WriteLine("Introducir el Primer numero");
            String numeroA=Console.ReadLine();
            Console.WriteLine("Introducir el segundo numero");
            String numeroB = Console.ReadLine();
            Console.WriteLine("Introducir el tercera numero");
            String numeroC = Console.ReadLine();
            Console.WriteLine("Introducir el cuarta numero");
            String numeroD = Console.ReadLine();
            Console.WriteLine("Introducir el quinto numero");
            String numeroE = Console.ReadLine();
            int a = Int16.Parse(numeroA);
            int b = Int16.Parse(numeroB);
            int c = Int16.Parse(numeroC);
            int d = Int16.Parse(numeroD);
            int e = Int16.Parse(numeroE);
            int max = 0;
            int[] ArregloNumero = new int[] { a, b, c, d, e };

                    for(int z=0; z<ArregloNumero.Length; z++)
                    {
                        if (max > ArregloNumero[z])
                        {
                        max = max;
                        }
                        else
                        {
                        max = ArregloNumero[z];
                    }
                    
                }
            Console.WriteLine("El valor mas alto es: "+max);
        }

        public static String ConvierteATipoOracion(String parmetro)
        {
            string[] partesNombre = parmetro.Split(' ');
            for (int i = 0; i < partesNombre.Length; i++)
            {
                partesNombre[i] = (partesNombre[i].Substring(0,1).ToUpper() + partesNombre[i].Substring(1));
            }
            String palabral= string.Join(" ", partesNombre);
            Console.WriteLine("Cadena convertida");
            System.Console.WriteLine(palabral);
            return palabral;
        
        }
    }
}
