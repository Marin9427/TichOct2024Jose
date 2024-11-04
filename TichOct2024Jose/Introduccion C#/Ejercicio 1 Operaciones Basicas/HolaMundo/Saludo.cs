using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HolaMundo
{
    public class Saludo
    {
        //Definir un metodo estatico
        public static string SaludarEstatico(String nombre)
        {
            return ("Hola.  ¿Como estas " + nombre + " ?" + " Saludo desde un metodo estatico");
        }
        //Definir metodo no estatico

        public String SaludarNoEstatico(String nombre)
        {
            return ("Hola.  ¿Como estas " + nombre + " ?" + " Saludo desde un metodo no estatico");
        }



    }
}
