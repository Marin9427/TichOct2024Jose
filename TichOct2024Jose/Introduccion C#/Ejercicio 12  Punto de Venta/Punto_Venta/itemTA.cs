using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{
    internal class itemTA : ItemBase
    {
       
        public itemTA()
        {
        }

        public itemTA(Articulo articulos, decimal cantidad, string telefono , string compañia , decimal comision ) : base(articulos, cantidad)
        {
            Telefono = telefono;
            Compañia = compañia;
            Comision = comision;
        }

        public string Telefono { get; set; }
        public string Compañia { get; set; }
        public decimal Comision { get; set; }

        internal override decimal Total() => (Precio * Cantidad) + Comision; 
      


        public override string imprimir()
        {
        string descripcion1 = ($"Tiempo Aire: {Precio} cantidad {Cantidad} Subtotal{SubTotal()}");
        string descripcion2=($"Telefono: {Telefono} compañia: {Compañia} Comision {Comision} \n Total: {Total()}");

            return descripcion2;
        }
    }
}
