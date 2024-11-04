using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas
{
    internal class Program
    {
        
        static void Main(string[] args)
        {
            int Opcion = 0;
            CrudAlumnos CRUD = new CrudAlumnos();
            

            do
            {
                Console.Clear();
                Console.WriteLine("Elija una delas siguientes opciones");
                Console.WriteLine($"funciones sobre la lista de Estatus Alumno: \n1.Consultar Todos  \n2.Consultar Solo uno \n3.Agregar  \n4.Actualizar   \n5.Eliminar  \n6.Terminar");
                Opcion = Convert.ToInt32(Console.ReadLine());


                switch (Opcion)
             {
                case 1:

                        List<EstatusAlumno> listado= CRUD.ListaCompleta();
                       foreach(var EstatusAlumnoin in listado)
                        {
                            Console.WriteLine($"Id : {EstatusAlumnoin.id} nombre: {EstatusAlumnoin.Nombre} Apellido {EstatusAlumnoin.Nombre} Estatus {EstatusAlumnoin.Estado} ");
                        }
                        break;
                case 2:
                        Console.WriteLine("Digite el identificador del alumno a buscar");
                        int id = Convert.ToInt16(Console.ReadLine());
                         EstatusAlumno estatusAlumno=CRUD.BusquedaIndividual(id);
                        Console.WriteLine($"Id : {estatusAlumno.id} nombre: {estatusAlumno.Nombre} Apellido {estatusAlumno.Nombre} Estatus {estatusAlumno.Estado} ");
                        break;
                case 3:

                    EstatusAlumno estatusAlumno2 = new EstatusAlumno();
                        Console.WriteLine("Escriba el id del Alumno");
                        estatusAlumno2.id = Convert.ToInt16(Console.ReadLine());
                        Console.WriteLine("Escriba el nombnre del Alumno");
                        estatusAlumno2.Nombre = Console.ReadLine();
                        Console.WriteLine("Escriba el apellido del Alumno");
                        estatusAlumno2.Apellido = Console.ReadLine();
                        Console.WriteLine("Escriba el Estatus del Alumno");
                        estatusAlumno2.Estado = Console.ReadLine();
                        CRUD.Agregar(estatusAlumno2);
                                
                        break;
                case 4:
                        EstatusAlumno estatusAlumno3 = new EstatusAlumno();
                        Console.WriteLine("Escriba el id del Alumno a actualizar");
                        estatusAlumno3.id = Convert.ToInt16(Console.ReadLine());
                        Console.WriteLine("Escriba el nombre del Alumno actualizado ");
                        estatusAlumno3.Nombre = Console.ReadLine();
                        Console.WriteLine("Escriba el apellido del Alumnoa ctualizado");
                        estatusAlumno3.Apellido = Console.ReadLine();
                        Console.WriteLine("Escriba el Estatus del Alumnoa ctualizado");
                        estatusAlumno3.Estado = Console.ReadLine();
                        CRUD.Actualizar(estatusAlumno3);


                        break;
                case 5:
                        Console.WriteLine("Escribe el id a eliminar");
                        id = 0;
                        id = Convert.ToInt16(Console.ReadLine());
                        CRUD.Eliminar(id);

                        break;
                        

                    default:                   
                    break;
              }
                Console.ReadKey();
            }
            while (Opcion != 6);   




        }
    }
}
