using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HIMS.DAO
{
    public interface IDAOWriter<T>
    {
        int Create(T model);

        int Update(long id, T model);

        int Delete(long id);
    }
}
