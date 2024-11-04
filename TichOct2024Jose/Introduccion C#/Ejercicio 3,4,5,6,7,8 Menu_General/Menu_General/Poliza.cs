using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu_General
{
    internal class Poliza
    { 
        static PolizaResultado Calcular(DateTime VigenciaInicio, String tipoPeriodoCompleto, 
            decimal SumaAsegurada, DateTime FechaNacimiento, String GenerAsegurador)
        {
            PolizaResultado ObjetoResultado = new PolizaResultado();
         
            String cadena = tipoPeriodoCompleto;
            string[] strings = cadena.Split(' ');
            String CantidadPeriodoo = (strings[0]);
            String TipoPeriodo = (strings[1]);

            DateTime fechaFin = new DateTime();
            DateTime fecha = VigenciaInicio;



            int edad = DateTime.Now.Year - FechaNacimiento.Year;

           



            int CantidadPeriodoInt = Int16.Parse(CantidadPeriodoo);
            switch (TipoPeriodo)
            {
                case "dias":
                    fechaFin = VigenciaInicio.AddDays(CantidadPeriodoInt);
                    break;
                case "meses":
                    fechaFin = VigenciaInicio.AddMonths(CantidadPeriodoInt);
                    break;
                case "años":
                    fechaFin = VigenciaInicio.AddYears(CantidadPeriodoInt);
                    break;
                    ;
            }
          
            TimeSpan DuracionPoliza = fechaFin.Subtract(VigenciaInicio);
            Console.WriteLine(DuracionPoliza.Days);


            decimal aux = 0;

            decimal[,] arreglo2D = new decimal[12, 4];

            arreglo2D[0, 0] = 0;
            arreglo2D[0, 1] = 20;
            arreglo2D[0, 2] = 1;
            arreglo2D[0, 3] = .05m;

            arreglo2D[1, 0] = 21;
            arreglo2D[1, 1] = 30;
            arreglo2D[1, 2] = 1;
            arreglo2D[1, 3] = .1m;

            arreglo2D[2, 0] = 31;
            arreglo2D[2, 1] = 40;
            arreglo2D[2, 2] = 1;
            arreglo2D[2, 3] = .4m;

            arreglo2D[3, 0] = 41;
            arreglo2D[3, 1] = 50;
            arreglo2D[3, 2] = 1;
            arreglo2D[3, 3] = .5m;

            arreglo2D[4, 0] = 51;
            arreglo2D[4, 1] = 60;
            arreglo2D[4, 2] = 1;
            arreglo2D[4, 3] = .65m;

            arreglo2D[5, 0] = 61;
            arreglo2D[5, 1] = 99;
            arreglo2D[5, 2] = 1;
            arreglo2D[5, 3] = .85m;

            arreglo2D[6, 0] = 0;
            arreglo2D[6, 1] = 20;
            arreglo2D[6, 2] = 2;
            arreglo2D[6, 3] = .05m;

            arreglo2D[7, 0] = 21;
            arreglo2D[7, 1] = 30;
            arreglo2D[7, 2] = 2;
            arreglo2D[7, 3] = .1m;

            arreglo2D[8, 0] = 31;
            arreglo2D[8, 1] = 40;
            arreglo2D[8, 2] = 2;
            arreglo2D[8, 3] = .4m;

            arreglo2D[9, 0] = 41;
            arreglo2D[9, 1] = 50;
            arreglo2D[9, 2] = 2;
            arreglo2D[9, 3] = .55m;

            arreglo2D[10, 0] = 51;
            arreglo2D[10, 1] = 60;
            arreglo2D[10, 2] = 2;
            arreglo2D[10, 3] = .7m;

            arreglo2D[11, 0] = 61;
            arreglo2D[11, 1] = 99;
            arreglo2D[11, 2] = 2;
            arreglo2D[11, 3] = .9m;
           decimal genero= (GenerAsegurador == "masculino" ? 2 : 1);

            for (int i = 0; i < 12; i++)
            {
       
                if (arreglo2D[i, 0] <= edad && arreglo2D[i, 1] >= edad)
                {
                    if (arreglo2D[i, 2] == genero)
                    {
                        aux = arreglo2D[i, 3];
                    }
                }
            }
            
            decimal Prim = (SumaAsegurada* aux)*(DuracionPoliza.Days/ 360m);
            ObjetoResultado.Prima = Prim;
            ObjetoResultado.FechaTermino = fechaFin;

            return ObjetoResultado;
        }


        public static void Presentacion()
        {

            Console.WriteLine("Proporciona la fecha de inicio de Vigencia");
            String StringFechaVigencia = Console.ReadLine();
            Console.WriteLine("Proporciona para cuanto tiempo requieres la póliza (ejemplo x años , x mese , x dias)");
            String TiempoPolizaCompuesto = Console.ReadLine();
            Console.WriteLine("Proporciona la suma asegurada:");
            String sumaAseguradaS = Console.ReadLine(); 
            Console.WriteLine("Proporciona la fecha de Nacimiento del  asegurado: ");
            String FechaNac = Console.ReadLine();
            Console.WriteLine("Proporciona el género del asegurado; siendo Femenino = 1 ó Masculino =2 ");
            String SexoAsegurado = Console.ReadLine();

            DateTime fechaInicioPoliza = DateTime.Parse(StringFechaVigencia);

            decimal sumaAsegurada = decimal.Parse(sumaAseguradaS); 
            DateTime FechaNacimiento = DateTime.Parse(FechaNac);

            PolizaResultado polizaResultado = Poliza.Calcular(fechaInicioPoliza, TiempoPolizaCompuesto, sumaAsegurada, FechaNacimiento, SexoAsegurado);


            Console.WriteLine($"La poliza vencera el: {polizaResultado.FechaTermino.ToString("dd/MM/yyyy")} \n"  +
                $"La prima a pagar es de: {polizaResultado.Prima.ToString("C2")}") ;


        }


    }
}
