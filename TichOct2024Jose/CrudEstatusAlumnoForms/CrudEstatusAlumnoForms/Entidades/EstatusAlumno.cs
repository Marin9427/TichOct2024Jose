using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CrudEstatusAlumnoForms.Entidades
{
    public class EstatusAlumno
    {
        public EstatusAlumno()
        {
        }

        public EstatusAlumno(int id)
        {
            this.id = id;
        }

        public EstatusAlumno(string clave, string nombre)
        {
            this.clave = clave;
            this.nombre = nombre;
        }

        public EstatusAlumno(int id, string clave, string nobre)
        {
            this.id = id;
            this.clave = clave;
            this.nombre = nobre;
        }

        public int id { get; set; }
        public string clave { get; set; }
        public string nombre { get; set; }
    }
}
