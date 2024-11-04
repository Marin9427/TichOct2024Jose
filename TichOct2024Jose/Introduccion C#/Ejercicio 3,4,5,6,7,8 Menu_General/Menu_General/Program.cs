using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu_General
{
    internal class Program
    {
        static void Main(string[] args)
        {


            Console.WriteLine("1.-Arreglos tipo Cadena");
            Console.WriteLine("2.-Arreglos Numericos");
            Console.WriteLine("3.-Convertir en Mayuscula la primera palabra de una cadena de palabras");
            Console.WriteLine("4.-Polizas");
            Console.WriteLine("5.- Busqueda de Archivos");
            Console.WriteLine("6.-Creacion de archivo");
            Console.WriteLine("7.-Calculo de Impuestos");
            Console.WriteLine("F.-Termina");
            String EleccionString = Console.ReadLine();
            do
            {
                switch (EleccionString)
                {
                    case "1":
                       Arreglos.Cedenas();
                       Console.ReadLine();
                       break;
                    case  "2":
                       Arreglos.Enteros();
                       Console.ReadLine();
                       break;
                    case "3":
                       Console.WriteLine("Escriba el nombre de la cadena");
                       String cadenaEnviar=Console.ReadLine();
                       Arreglos.ConvierteATipoOracion(cadenaEnviar);
                       Console.ReadLine();
                       break;
                    case "4":

                       Poliza.Presentacion();
                        break;
                    case "5":
                       Archivotxt.Presentacion();
                        break;
                    case "6":
                       Archivotxt.IniciarTxt();
                        break;
                    case "7":
                        ISR iSR = new ISR();
                        iSR.Presentacion();
                        break;
                  

                    default:
                        Console.WriteLine("Saliendo del Menu");
                        break;
                }
                Console.WriteLine("Elija otra opcion");
                String NuevaEleecion=Console.ReadLine();
            } while (EleccionString =="F");  





           


        }
    }


}

