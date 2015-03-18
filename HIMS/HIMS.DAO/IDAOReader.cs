using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HIMS.DAO
{
    public interface IDAOReader<T>
    {
        IQueryable<T> Get();
        T Get(long key);

        IQueryable<T> Where(Func<T, bool> fun);
        T Single(Func<T, bool> fun);
    }
}
