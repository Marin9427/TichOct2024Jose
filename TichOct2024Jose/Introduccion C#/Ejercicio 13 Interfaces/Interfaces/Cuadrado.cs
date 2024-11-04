using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Cuadrado : IFigura
    {
        public decimal baseFigura { get; set; }
        public decimal alturaFigura { get; set; }

        public decimal Area()
        {
            baseFigura = 6;
            return (decimal)Math.Pow((double)baseFigura,2);
        }

        public decimal Perimetro()
        {
            baseFigura = 6;
            return baseFigura + baseFigura + baseFigura + baseFigura;
        }

        public override string ToString()
        {
            return $"Cuadrado: perimetro = {Perimetro()}, Área = {Area()}";
        }

    }
}
