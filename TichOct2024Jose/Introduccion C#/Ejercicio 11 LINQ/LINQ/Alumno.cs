using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQ
{
    internal class Alumno
    {


        public Alumno()
        {
        }

        public Alumno(int id, string nombre, decimal calificacion, int idEstado, int idEstatus)
        {
            Id = id;
            Nombre = nombre;
            Calificacion = calificacion;
            IdEstado = idEstado;
            IdEstatus = idEstatus;
        }

        public int Id { get; set; }
        public String Nombre { get; set; }
        public decimal Calificacion { get; set; }
        public int IdEstado { get; set; }
        public int IdEstatus  { get; set; }



    }
}
