using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Menu_General
{
    internal struct PolizaResultado
    {
        public PolizaResultado(DateTime fechaTermino, decimal prima)
        {

            FechaTermino = fechaTermino;
            Prima = prima;
        }

        public DateTime FechaTermino { get; set; }
        public decimal Prima { get; set; }

    }
}
