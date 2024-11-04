using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{
    public abstract class ItemBase
    {
       
        protected ItemBase()
        {
            
        }

        protected ItemBase(Articulo articulos,  decimal cantidad )
        {
            this.Id = articulos.Id;
            this.Nombre = articulos.Nombre;
            this.Precio = articulos.Precio;
            this.Cantidad = cantidad;
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public decimal Cantidad { get; set; }



        public abstract  string imprimir();


       internal virtual decimal SubTotal() => Precio * Cantidad;

        internal virtual decimal Total() => Precio * Cantidad;

        

    }
}
