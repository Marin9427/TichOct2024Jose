using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Punto_Venta
{

    internal class CargarDatos
    {
        private static List<Articulo> _Articulos;
        private static List<Articulo> _ArticulosSeleccionados = new List<Articulo>();

        public void CargarDatoo()
        {

            string name = @"C:\Users\Tichs\Documents\BootCamp Jose\Semana2 C#\dia 1\Punto_Venta\Punto_Venta\Json\Articulos.json";
            StreamReader jsonStream = new StreamReader(name);
            string json = jsonStream.ReadToEnd();
            jsonStream.Close();

            _Articulos = JsonConvert.DeserializeObject<List<Articulo>>(json);

        }

        public Articulo SeleccionarDato(int buscarId )
        {
            Articulo oArticulo = new Articulo();
             oArticulo =
               ( from articulos in _Articulos
                where articulos.Id == buscarId
                select articulos).ToList()[0];      
             return oArticulo;
            
        }
        
    }
}

