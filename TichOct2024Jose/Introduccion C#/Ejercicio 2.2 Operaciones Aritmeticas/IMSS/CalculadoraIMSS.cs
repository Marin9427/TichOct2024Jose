using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSS
{
    internal class CalculadoraIMSS
    {
        private static Decimal Enfer_Maternidad(Decimal SBC, Decimal UMAS)
        {
            Decimal C;
            return C =  (.4m  * (SBC - (UMAS*3)))/100   ; 
        }

        private static Decimal Inval_Vida(Decimal SBC)
        {
            Decimal C;
            return C = (.624m * SBC  )/100;
        }

        private static Decimal Retiro(Decimal SBC)
        {
            Decimal C;
            return C = 0 ;
        }

        private static Decimal Cesantia(Decimal SBC)
        {
            Decimal C;
            return C = (1.125m*SBC)/100 ;
        }

        private static Decimal Credito_Infovit(Decimal SBC)
        {
            Decimal C;
            return C = 0 ;
        }

        private static Decimal Enfer_Maternidadp(Decimal SBC, Decimal UMAS)
        {
            Decimal C;
            return C = (1.1m * (SBC - (UMAS * 3))) / 100;
        }

        private static Decimal Inval_Vidap(Decimal SBC)
        {
            Decimal C;
            return C = (1.75m * SBC) / 100;
        }

        private static Decimal Retirop(Decimal SBC)
        {
            Decimal C;
            return C = (2m * SBC) / 100;  
        }

        private static Decimal Cesantiap(Decimal SBC)
        {
            Decimal C;
            return C = (3.150m * SBC) / 100;
        }

        private static Decimal Credito_Infovitp(Decimal SBC)
        {
            Decimal C;
            return C = (5 * SBC) / 100;
        }




        static AportacionesEstructura Calcular(decimal sbc, decimal UMA, decimal Patron)
        {
            AportacionesEstructura calcular = new AportacionesEstructura();

            if (Patron==1)
            {
                calcular.EnfermedadMaternidad = Enfer_Maternidad(sbc, UMA);
                calcular.InvalidezVida = Inval_Vida(sbc);
                calcular.Retiro = Retiro(sbc);
                calcular.Cesantia = Cesantia(sbc);
                calcular.Infonavit = Credito_Infovit(sbc);
            }
            else
            {
                calcular.EnfermedadMaternidad = Enfer_Maternidadp(sbc, UMA);
                calcular.InvalidezVida = Inval_Vidap(sbc);
                calcular.Retiro = Retirop(sbc);
                calcular.Cesantia = Cesantiap(sbc);
                calcular.Infonavit = Credito_Infovitp(sbc); 
            }
            

            return calcular;
        }
        
       public static void Presentacion()
        {
            Console.WriteLine("Porfavor brinde la siguiente informacion ");
            Console.WriteLine("Escribir salario Base de cotizacion");
            String SBCStrin=Console.ReadLine();
            Console.WriteLine("Escriba la unidad de Medida de Actualizacion ");
            String UMAString=Console.ReadLine();
            Console.WriteLine("Es usted: \n 1.-Trabajador \n 2.-Patron");
            String desicionString=Console.ReadLine();
            decimal SBC = decimal.Parse(SBCStrin);
            decimal UMA = decimal.Parse(UMAString);
            decimal desicion = decimal.Parse(desicionString);

            if(desicion==1)
            { 
            AportacionesEstructura calculadora = CalculadoraIMSS.Calcular(SBC,UMA,desicion);
            Console.WriteLine($"Su prestacion por: \n" +
                $"Enfermedades y Maternidad: {calculadora.EnfermedadMaternidad.ToString()}\n" +
                 $"Invalidez y vida: {calculadora.InvalidezVida.ToString()}\n" +
                   $"Retiro: {calculadora.Retiro.ToString()}\n" +
                     $"Cesantia: {calculadora.Cesantia.ToString()}\n" +
                       $"Credito Infonavit: {calculadora.Infonavit.ToString()} ");

            }
            else if(desicion==2)
            {
                AportacionesEstructura calculadora2 = CalculadoraIMSS.Calcular(SBC, UMA, desicion);
                Console.WriteLine($"Su prestacion por: \n" +
                    $"Enfermedades y Maternidad: {calculadora2.EnfermedadMaternidad.ToString()}\n" +
                     $"Invalidez y vida: {calculadora2.InvalidezVida.ToString()}\n" +
                       $"Retiro: {calculadora2.Retiro.ToString()}\n" +
                         $"Cesantia: {calculadora2.Cesantia.ToString()}\n" +
                           $"Credito Infonavit: {calculadora2.Infonavit.ToString()} ");
            }

            else
            {
                Console.WriteLine("Error Ingresando su identidad ");
            }

        }


    }
}
