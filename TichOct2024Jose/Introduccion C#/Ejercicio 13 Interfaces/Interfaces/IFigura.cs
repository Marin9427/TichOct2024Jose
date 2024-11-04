using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal interface IFigura
    {

         decimal baseFigura {get; set;}
         decimal alturaFigura { get; set; }

        decimal Perimetro();
        decimal Area();




    }
}
