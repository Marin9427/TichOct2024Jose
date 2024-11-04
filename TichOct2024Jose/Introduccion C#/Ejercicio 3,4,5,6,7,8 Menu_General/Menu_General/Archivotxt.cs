using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Menu_General
{
    internal class Archivotxt
    {

        public static void MostrarTxt(string nombreArchivo)
        {
            if (File.Exists(nombreArchivo))
            {
                StreamReader archivoLeer = new StreamReader(nombreArchivo);
                Console.WriteLine("Contenido del archivo TXT:");
                String leer = archivoLeer.ReadToEnd();
                Console.WriteLine(leer);
            }
            else
            {
                Console.WriteLine("El archivo no existe.");
            }
        }
        public static void MostrarCSV(string nombreArchivo)
        {
            if (File.Exists(nombreArchivo))
            {
                using (var reader = new StreamReader(nombreArchivo))
                {
                    Console.WriteLine("Contenido del archivo CSV:");
                    while (!reader.EndOfStream)
                    {
                        var linea = reader.ReadLine();
                        var campos = linea.Split(',');
                        Console.WriteLine(string.Join(", ", campos));
                    }
                }
            }
            else
            {
                Console.WriteLine("El archivo no existe.");
            }
        }
        public static void Presentacion()
        {
            Console.WriteLine("\nIngrese el nombre del archivo TXT que desea mostrar:");
            string archivoTxt = Console.ReadLine();
            MostrarTxt(archivoTxt);

            Console.WriteLine("\nIngrese el nombre del archivo CSV que desea mostrar:");
            string archivoCsv = Console.ReadLine();
            MostrarCSV(archivoCsv);
        }
        public static void EscribirTxt(string nombreArchivo, bool nuevo, Encoding encoding)
        {
            StreamWriter writer = new StreamWriter(nombreArchivo, nuevo, encoding);

            do
            {
                Console.Write("Ingrese el nombre del alumno: ");
                string nombre = Console.ReadLine();

                Console.Write("Ingrese el primer apellido: ");
                string primerApellido = Console.ReadLine();

                Console.Write("Ingrese el segundo apellido: ");
                string segundoApellido = Console.ReadLine();

                Console.Write("Ingrese la edad: ");
                string edad = Console.ReadLine();

                Console.Write("Ingrese el estado: ");
                string estado = Console.ReadLine();

                string linea = $"{nombre},{primerApellido},{segundoApellido},{edad},{estado}\n";
                writer.Write(linea);


                Console.Write("¿Quiere agregar a un alumno nuevo? (s/n): ");
            } while (Console.ReadLine().ToLower() == "s");
            writer.Close();

        }
        public static void IniciarTxt()
        {
            Console.WriteLine("Ingrese la ruta del archivo :");
            string nombreArchivo = Console.ReadLine();

            Console.WriteLine("¿Es un nuevo archivo? (s/n): ");
            bool nuevo = Console.ReadLine().ToLower() == "s";

            Console.WriteLine("Seleccione la codificación: ");
            Console.WriteLine("1.- UTF7");
            Console.WriteLine("2.- UTF8");
            Console.WriteLine("3.- Unicode");
            Console.WriteLine("4.- UTF32");
            Console.WriteLine("5.- ASCII");
            int codificacion = Convert.ToInt32(Console.ReadLine());

            Encoding encoding;
            switch (codificacion)
            {
                case 1:
                    encoding = Encoding.UTF7;
                    break;
                case 2:
                    encoding = Encoding.UTF8;
                    break;
                case 3:
                    encoding = Encoding.Unicode;
                    break;
                case 4:
                    encoding = Encoding.UTF32;
                    break;
                case 5:
                    encoding = Encoding.ASCII;
                    break;
                default:
                    encoding = Encoding.UTF8;
                    break;
            }
            EscribirTxt(nombreArchivo, nuevo, encoding);
        }

    }
}
