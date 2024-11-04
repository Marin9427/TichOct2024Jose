using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{
    public class Articulo
    {
        public Articulo()
        {
        }

        public Articulo(int Id, String Nombre, decimal Precio, decimal Tipo)
        {
            this.Id = Id;
            this.Nombre = Nombre;
            this.Precio = Precio;
            this.Tipo = Tipo;
        }

        public int Id { get; set; }
        public String Nombre { get; set; }
        public decimal Precio { get; set; }
        public decimal Tipo { get; set; }


    }
}
