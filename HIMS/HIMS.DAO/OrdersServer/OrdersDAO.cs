
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace HIMS.DAO.OrdersServer
{
    public class OrdersDAO : IServer, IDAOReader<Data.OM_OrdersSet>
    {
        //Model.Entities1 _db = new Model.Entities1();
        #region OM_Orders

        public IEnumerable<Data.OM_OrdersSet> Get()
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet;
                return orders.ToList();
            }
        }

        public Data.OM_OrdersSet Get(long key)
        {
            using (var _db = new Data.Entities())
            {
                var order = _db.OM_OrdersSet.Find(key);
                return order;
            }
        }

        public IEnumerable<Data.OM_OrdersSet> Where(Func<Data.OM_OrdersSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet.Where(fun);
                return orders;
            }
        }

        public Data.OM_OrdersSet Single(Func<Data.OM_OrdersSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet.SingleOrDefault(fun);
                return orders;
            }
        }
        #endregion
    }
}
