using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Listas
{
    public class EstatusAlumno
    {
        public EstatusAlumno() 
        {
        }

        public EstatusAlumno(int id, string nombre, string apellido, string estado)
        {
            this.id = id;
            Nombre = nombre;
            Apellido = apellido;
            Estado = estado;
        }

        public int id { get; set; }

    public String Nombre { get; set; }

    public String Apellido { get; set; }

    public String Estado { get; set; }


    }

}
