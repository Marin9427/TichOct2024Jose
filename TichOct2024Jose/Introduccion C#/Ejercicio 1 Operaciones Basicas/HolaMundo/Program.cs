using System; 
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HolaMundo
{
    internal class Program
    {
        /*    FIRMA DEL METODO 
         * 1.-Modificaodr de acceso
         * 2.-Tipo de retorno
         * 3.-Nombre del metodo con nombrenclatura Pascal
         * 2.-Parametros de entrada entre (  )
         */

        static void Main(string[] args)
        {
            //1.- Tipo de dato y nombre de la variable
            String nombre;
            int numero;


            //2.-Metodo STATIC se usan llamando la clase
            //2.1-Agregar el nombr de la clase
            //2.2-Agregar el nombre del metodo
            //2.3-incluir los parametros
            Console.WriteLine("¿Cual es tu nombre?");

            //Opbtener el valore tipeado por el usuarioo
            nombre = Console.ReadLine();

            //Convirtiendo un valor numero a String para que lo pueda leer la consola
            Console.WriteLine("Ingresa tu dia de nacimiento");
            numero = int.Parse(Console.ReadLine());
            //numero= Convert.ToInt16(Console.ReadLine());



            //Invocar un metodo estatico con argumento
            String retornoMetodo=Saludo.SaludarEstatico(nombre);
            Console.WriteLine(retornoMetodo);

            //Invocar un metodo no estatico
            Saludo saludito = new Saludo();
            retornoMetodo = saludito.SaludarNoEstatico(nombre);
            Console.WriteLine(retornoMetodo);



            Console.ReadKey();

            //Console.WriteLine("Hola.  ¿Como estas " + nombre);
            //Console.ReadKey(); //Espera una entrada de teclado 



        }

    }
             
}
