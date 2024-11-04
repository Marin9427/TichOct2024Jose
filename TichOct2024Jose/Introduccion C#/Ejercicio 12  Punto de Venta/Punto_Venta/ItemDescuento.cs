using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Punto_Venta
{ 
    internal class ItemDescuento : ItemBase
    {




        public ItemDescuento( Articulo articulo, decimal cantidad ,  decimal descuento) : base(articulo,cantidad)
        {
            
            this.Descuento = descuento;
        }

        public ItemDescuento()
        {
        }

        public decimal ImpDescuento
        { get {
                return SubTotal() * Descuento;
            } }

        public decimal Descuento { get; set; }


        public decimal Total()
        {
            decimal t = base.SubTotal() - ((10/100)* base.SubTotal()) ;
            return t;
        }
        


        public override string imprimir()
        {
            return $"{Id} {Nombre} precio: {Precio} cantidad:  {Cantidad} subtotal: {SubTotal()} \n  Total: {Total()}";

        }
    }
}
