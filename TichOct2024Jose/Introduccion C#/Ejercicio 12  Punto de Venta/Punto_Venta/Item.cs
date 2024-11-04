using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{
    internal class Item : ItemBase
    {
        public Item()
        {
        }

        public Item(Articulo articulo , decimal cantidad) : base(articulo , cantidad)
        {
        }

        public override string imprimir()
        {
            return $"{Id} {Nombre} precio: {Precio} cantidad:  {Cantidad} subtotal: {SubTotal()} \n  Total: {Total()} "; 
                 
        }
    }
}
