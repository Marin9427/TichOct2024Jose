using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu_General
{
    internal class ISR
    {
      

        

        public decimal [,]  CargarTable(String ruta )
        {
            decimal[,] TablaISR = new decimal[21, 5];
            decimal valorAgregado;
            //using
            StreamReader reader = new StreamReader(ruta);
            
                int f = 0;
                while (!reader.EndOfStream)
                {
                    String Lineas = reader.ReadLine();
                    String[] LineaISR = Lineas.Split(',');

                    for (int c = 0; c < TablaISR.GetLength(1); c++)
                    {

                        TablaISR[f, c] = decimal.Parse(LineaISR[c + 1]);

                    }

                    f++;
                }
                reader.Close();
            return TablaISR;
        }


        public decimal Calcular(decimal sueldoMensual)
        {

            ISR iSR = new ISR();
          decimal [,] TablaISR = iSR.CargarTable(@"C:\Users\Tichs\Documents\BootCampJose\Archivos\ArchivoISR.csv");
          decimal  sueldoQuincenal = sueldoMensual / 2;
            decimal LimiteInferior = 0;
            decimal ExedenteLim = 0;
            decimal CuotaF = 0;
            decimal Subsidio = 0;

            for (int i = 0; i < TablaISR.GetLength(0); i++)
            {
                

                if ( sueldoQuincenal >= TablaISR[i,0] && sueldoQuincenal<= TablaISR[i,1]  )
                {
                    
                    LimiteInferior = TablaISR[i,0];
                    ExedenteLim=TablaISR[i,3];
                    Subsidio=TablaISR[i,4];
                    CuotaF = TablaISR[i,2];

                }
            }

            decimal SuelQuin_LmtInf = sueldoQuincenal - LimiteInferior;

             decimal Resultado_Exedente=(SuelQuin_LmtInf * ExedenteLim) / 100;

            decimal Resultado_Final = Resultado_Exedente + CuotaF - Subsidio;



            return Resultado_Final;
        }

        public void Presentacion()
        {
            Console.WriteLine("Nombre del archivo que contiene la tabla ISR");
            String ubicacion = Console.ReadLine();

            ISR objeto = new ISR();
            objeto.CargarTable(ubicacion);

            Console.WriteLine("Escribir el sueldo mensual");
            String Mensual = Console.ReadLine();
            decimal MensualDecimal = decimal.Parse(Mensual);
            
            decimal retorno = objeto.Calcular(MensualDecimal); //

            Console.WriteLine(retorno.ToString("C2")); 





        }


    }


}




