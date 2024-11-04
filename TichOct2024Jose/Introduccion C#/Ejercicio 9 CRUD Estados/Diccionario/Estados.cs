using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diccionario
{
    public class Estados
    {
        public Estados()
        {
        }

        public Estados(int id, string nombre, string capital)
        {
            this.id = id;
            this.nombre = nombre;
            Capital = capital;
        }

        public int id { get; set; }
        public String nombre { get; set; }

        public String Capital { get; set; }

    }
}
