using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Newtonsoft.Json;

namespace LINQ
{
    internal class LINQ
    {
        private static List<Estados> _lstEstados;
        private static List<Alumno> _lstAlumno;
        private static List<Estatus> _Estatus;
        private static List<ItemISR> _itemISRs;



        public void CargarLists()
        {

            
                string archivo = @"C:\Users\Tichs\Documents\BootCampJose\Semana2 C#\Archivos JSON\Alumnos.json";
                StreamReader jsonStream = new StreamReader(archivo);
                var json = jsonStream.ReadToEnd();
                jsonStream.Close();
                _lstAlumno = JsonConvert.DeserializeObject<List<Alumno>>(json);



                archivo = @"C:\Users\Tichs\Documents\BootCampJose\Semana2 C#\Archivos JSON\Estados.json";
                jsonStream = new StreamReader(archivo);
                json = jsonStream.ReadToEnd();
                jsonStream.Close();
                _lstEstados = JsonConvert.DeserializeObject<List<Estados>>(json);



                archivo = @"C:\Users\Tichs\Documents\BootCampJose\Semana2 C#\Archivos JSON\Estatus.json";
                jsonStream = new StreamReader(archivo);
                json = jsonStream.ReadToEnd();
                jsonStream.Close();
                _Estatus = JsonConvert.DeserializeObject<List<Estatus>>(json);


                archivo = @"C:\Users\Tichs\Documents\BootCampJose\Archivos\ArchivoISRf.csv";
                List<ItemISR> itemISRs = new List<ItemISR>();
                StreamReader csvStream = new StreamReader(archivo);

                int f = 1;
                while (!csvStream.EndOfStream)
                {
                    String Lineas = csvStream.ReadLine();
                    String[] LineaISR = Lineas.Split(',');

                    ItemISR item1 = new ItemISR();
                    {
                        item1.LimInf = Convert.ToDecimal(LineaISR[1]);

                        item1.LimSup = Convert.ToDecimal(LineaISR[2]);

                        item1.CuotaFija = Convert.ToDecimal(LineaISR[3]);

                        item1.PorExced = Convert.ToDecimal(LineaISR[4]);

                        item1.Subsidio = Convert.ToDecimal(LineaISR[5]);
                    }
                    itemISRs.Add(item1);

                }
                _itemISRs = itemISRs;
            
        }


        public void Consultas()
        {

            //Consulta 1
            var oEstado =
                    from estado in _lstEstados
                    where estado.Id == 2
                    select estado;
            Console.WriteLine("Estados con el id=2");
            foreach (var oEstados in oEstado) { Console.WriteLine($"{oEstados.Id} {oEstados.Nombre}"); }
            Console.WriteLine(" ");
            //Consulta2
            var oAlumnos =
                    from alumnos in _lstAlumno
                    where alumnos.IdEstado == 29 || alumnos.IdEstado == 13
                    select alumnos;
            Console.WriteLine("Alumnos cuyo id sea 29 o 13");
            foreach (var oAlumno in oAlumnos) { Console.WriteLine($"{oAlumno.Id} {oAlumno.Nombre}"); }
            Console.WriteLine(" ");
            //Consulta3 problemita
            oAlumnos =
                    from alumnos in _lstAlumno
                    where (alumnos.IdEstado == 19 || alumnos.IdEstado == 20) && (alumnos.IdEstatus == 4 || alumnos.IdEstatus == 5)
                    select alumnos;
            Console.WriteLine("Alumnos cuyo id sea 19 o 20 , o deas status 4 o 5");
            foreach (var oAlumno in oAlumnos) { Console.WriteLine($"{oAlumno.Id} {oAlumno.Nombre}"); }
            Console.WriteLine(" ");
            //Consulta4
            Console.WriteLine(" ");
            oAlumnos =
                from alumnos in _lstAlumno
                where (alumnos.Calificacion >= 6)
                orderby alumnos.Calificacion descending
                select alumnos;
            Console.WriteLine("Alumnos que aprobaron la materia");
            foreach (var oAlumno in oAlumnos) { Console.WriteLine($"{oAlumno.Nombre} {oAlumno.Calificacion}"); }
            Console.WriteLine(" ");
            //Consulta 5
            Console.WriteLine($"Sueldo Promedio: {_lstAlumno.Average(e => e.Calificacion)}");
            Console.WriteLine(" ");
            //Consulta 6
            bool algunEstado = _lstAlumno.All(x => x.Calificacion != 10);
            if (algunEstado)
            {
                foreach (var oAlumno in _lstAlumno)
                {
                    oAlumno.Calificacion = oAlumno.Calificacion + 1;
                }
            }
            else if (algunEstado = _lstAlumno.All(x => x.Calificacion == 6 || x.Calificacion == 7))
            {
                foreach (var oAlumno in _lstAlumno)
                {
                    oAlumno.Calificacion = oAlumno.Calificacion + 2;
                }
            }
            Console.WriteLine(" ");
            Console.WriteLine("Alumnos  modificados");
            foreach (var oAlumno in oAlumnos) { Console.WriteLine($"{oAlumno.Nombre} {oAlumno.Calificacion}"); }
            Console.WriteLine(" ");
            //Consulta 6
            var oAlumnosxEstado =
                  from alumnos in _lstAlumno
                  join estados in _lstEstados on alumnos.IdEstado equals estados.Id
                  where alumnos.IdEstatus == 3
                  select new { IdAlumno = alumnos.Id, NombreAlumno = alumnos.Nombre, NombreEstado = estados.Nombre };
            Console.WriteLine("Alumnos con Estatus 3");
            foreach (var oAlumno in oAlumnosxEstado)
            {
                Console.WriteLine($"{oAlumno.IdAlumno} {oAlumno.NombreAlumno} {oAlumno.NombreEstado}");
            }
            Console.WriteLine(" ");
            //Consulta 7
            Console.WriteLine("ejercicio 7 ");
            var AlumnoxEstatus =
                from alumno in _lstAlumno
                join estatus in _Estatus on alumno.IdEstatus equals estatus.Id
                where alumno.IdEstatus == 2
                orderby alumno.Nombre
                select new { IdAlumno = alumno.Id, NombreAlumno = alumno.Nombre, NombreEstatus = estatus.Nombre };
            foreach (var oAlumnosxEstatus in AlumnoxEstatus)
            {
                Console.WriteLine($"{oAlumnosxEstatus.IdAlumno} {oAlumnosxEstatus.NombreAlumno} {oAlumnosxEstatus.NombreEstatus}");
            }

            //Consulta 8
            Console.WriteLine(" ");
            Console.WriteLine("ejercicio 8 ");
            var EstadoxAlumnoxEsta =
                from estado in _lstEstados
                join Alumno in _lstAlumno on estado.Id equals Alumno.IdEstado
                join estatus in _Estatus on Alumno.IdEstatus equals estatus.Id
                where Alumno.IdEstatus == 3
                orderby estatus.Nombre
                select new { IdAlumno = Alumno.Id, NombreAlumno = Alumno.Nombre, EstadoNombre = estado.Nombre, EstatusNombre = estatus.Nombre };
            foreach (var EstadoxAlumnoxEstas in EstadoxAlumnoxEsta)
            {
                Console.WriteLine($"{EstadoxAlumnoxEstas.IdAlumno} {EstadoxAlumnoxEstas.NombreAlumno}  {EstadoxAlumnoxEstas.EstadoNombre}   {EstadoxAlumnoxEstas.EstatusNombre}");
            }

            //Consulto 9
            Console.WriteLine(" ");
            var xa =
                    from isr in _itemISRs
                    where isr.LimInf < 15000 && isr.LimSup > 15000
                    select isr;
            Console.WriteLine("todos los datos");
            foreach (var x in xa)
            {
                decimal resulta = ((15000 + x.LimInf) * x.PorExced) / 100;
                decimal resulta2 = (resulta + x.CuotaFija) - x.Subsidio;

                Console.WriteLine(" El resultado es " + resulta2.ToString("C2"));
                Console.WriteLine(" ");

            }
        }
    }
}
