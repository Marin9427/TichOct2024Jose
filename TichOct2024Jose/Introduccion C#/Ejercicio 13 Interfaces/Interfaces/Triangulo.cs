using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Triangulo : IFigura
    {
        public decimal baseFigura { get; set; }
        public decimal alturaFigura { get; set; }

        public decimal Area()
        {
            alturaFigura = 6;
            baseFigura = 5;
            decimal alturaSinRaiz= (decimal)(Math.Pow((double)alturaFigura, 2)) - ((decimal)(Math.Pow((double)baseFigura, 2)) / 4);
            decimal altura = (decimal)Math.Sqrt((double)alturaSinRaiz);
            decimal resultadoSinFormatear = (baseFigura * altura) / 2;
            decimal resultadoFormateado = Math.Round(resultadoSinFormatear);
            return resultadoFormateado;
        }

        public decimal Perimetro()
        {
            baseFigura = 6;
            alturaFigura = 4;
            return (baseFigura)+alturaFigura * 2;
        }


        public override string ToString()
        {
            return $"Triangulo: perimetro = {Perimetro()}, Área = {Area()}";
        }
    }
}
