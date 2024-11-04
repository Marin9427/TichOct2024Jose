using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diccionario
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int opcion = 0;
            CRUDEstadosCapitales objeto = new CRUDEstadosCapitales();
            do
            {
                Console.Clear();
                Console.WriteLine("Elija una delas siguientes opciones");
                Console.WriteLine($"funciones sobre la un Diccionario de Estados: \n1.Consultar Todos  \n2.Consultar Solo uno \n3.Agregar  \n4.Actualizar   \n5.Eliminar  \n6.Terminar");
                opcion = Convert.ToInt32(Console.ReadLine());
                switch (opcion)

                {
                    case 1:
                        Dictionary<int, Estados> diccio = objeto.ConsultarTodo();
                        foreach (KeyValuePair<int, Estados> kpv in diccio)
                        {
                            Console.WriteLine($"Id : {kpv.Key} nombre: {kpv.Value.nombre} capital {kpv.Value.Capital} ");
                        }
                        break;

                    case 2:
                        Console.WriteLine("Escribe el id a consultar");
                        int id = Convert.ToInt16(Console.ReadLine());
                        Estados estado = objeto.ConsultarSoloUni(id);
                        Console.WriteLine($"Id : {estado.id} nombre: {estado.nombre} capital {estado.Capital} ");
                        break;

                    case 3:
                        estado = new Estados();
                        Console.WriteLine("Escribe el id del estado a agregar");
                        estado.id = Convert.ToInt16(Console.ReadLine());
                        Console.WriteLine("Escribe el nombre del estado a agregar");
                        estado.nombre = Console.ReadLine();
                        Console.WriteLine("Escribe la capital del estado a agregar");
                        estado.Capital = Console.ReadLine();

                        objeto.Agregar(estado);
                        break;

                    case 4:
                        estado = new Estados();
                        Console.WriteLine("Escribe el id del estado a actualizar");
                        estado.id = Convert.ToInt16(Console.ReadLine());
                        Console.WriteLine("Escribe el nombre del estado  actualizado");
                        estado.nombre = Console.ReadLine();
                        Console.WriteLine("Escribe la capital del estado  actualizado");
                        estado.Capital = Console.ReadLine();
                        objeto.Actualizar(estado);

                        break;

                    case 5:
                        Console.WriteLine("Escribe el id a eliminar");
                        id = 0;
                        id = Convert.ToInt16(Console.ReadLine());
                        objeto.Eliminar(id);
                        break;

                    case 6:
                        break;
                }
                Console.ReadKey();
            }
            
            while (opcion != 6);
            {

            }
         


        }
    }
}
