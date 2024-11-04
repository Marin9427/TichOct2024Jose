using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Item itemm = new Item();
            ItemDescuento itemDescuento = new ItemDescuento();
            CargarDatos cargarDatos = new CargarDatos();
            List<ItemBase> carrito = new List<ItemBase>();
            
            
            cargarDatos.CargarDatoo();

            string respuesta;

            Console.WriteLine("Iniciar una nueva venta(V) terminar (T)");

            while (true)
            {
                respuesta = Console.ReadLine().Trim();

                if (respuesta == "T")
                {
                    Console.WriteLine("Venta terminada.");
                    break;
                }

                if (respuesta == "TV")
                {
                    Console.WriteLine("Venta terminada.");
                    break;
                }
                Console.WriteLine($"1.-Lapiz \n2.-Pluma \n3.-Precio \n4.-.-Libreta \n5.-Libro \n6.-Folder \n7.-Marcador \n8.-Tiempo Aire \n  ");   
                Console.WriteLine($"Ingrese el id del Articulo y cantiad del articulo, para terminar venta TV");
                String ArticuloSeleccionadoString = (Console.ReadLine());
                Console.WriteLine($"Cantidad de productos a comprar");
                int CantidadArticuloSeleccionado = Convert.ToInt16(Console.ReadLine());
                int ArticuloID = Convert.ToInt16(ArticuloSeleccionadoString);
                
                Articulo articulos= cargarDatos.SeleccionarDato(ArticuloID);
                

                switch (articulos.Tipo)
                { 
                    case 1 :
                        Item item = new Item(articulos,CantidadArticuloSeleccionado);
                        carrito.Add(item);
                       
                        break;

                    case 2:
                        Console.WriteLine( "procentajee desucento");
                        decimal descuento= Convert.ToDecimal(Console.ReadLine());
                        ItemDescuento ObjetoItemdescuento =  new ItemDescuento(articulos, CantidadArticuloSeleccionado,descuento);
                        carrito.Add(ObjetoItemdescuento);
                        break;
                    case 3:
                        Console.WriteLine("numero");
                        string Numero=Console.ReadLine();
                        Console.WriteLine("compañia");
                        string Compañia = Console.ReadLine();
                        Console.WriteLine("comision");
                        decimal comision = Convert.ToDecimal(Console.ReadLine());
                        itemTA objetoItemTiempoAire = new itemTA(articulos, CantidadArticuloSeleccionado, Numero, Compañia, comision);
                        carrito.Add(objetoItemTiempoAire);
                        break;

                    default:
                        break;

                }
                Console.WriteLine(carrito.Sum(x => x.Total()));
               
                Console.WriteLine("Empresa TICH");
                foreach(var carr in carrito)
                     {
                    Console.WriteLine(carr.imprimir());
                     }


            }

            










        }
    }
}
