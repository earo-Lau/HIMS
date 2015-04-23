
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace HIMS.DAO.OrdersServer
{
    public class OrdersDAO : IServer, IDAOReader<Data.OM_OrdersSet>, IDAOWriter<Data.OM_OrdersSet>,
        IDAOReader<Data.RS_Order_RoomsSet>, IDAOWriter<Data.RS_Order_RoomsSet>
    {
        //Model.Entities1 _db = new Model.Entities1();
        #region OM_Orders

        #region Reader
        IEnumerable<Data.OM_OrdersSet> IDAOReader<Data.OM_OrdersSet>.Get()
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet.Include("AM_AccountsSet").Include("OM_StateSet").Include("RS_Order_RoomsSet");
                return orders.ToList();
            }
        }

        Data.OM_OrdersSet IDAOReader<Data.OM_OrdersSet>.Get(long key)
        {
            using (var _db = new Data.Entities())
            {
                var order = _db.OM_OrdersSet.Include("AM_AccountsSet").Include("OM_StateSet").Include("RS_Order_RoomsSet")
                    .SingleOrDefault(x => x.OrderId.Equals(key));
                return order;
            }
        }

        IEnumerable<Data.OM_OrdersSet> IDAOReader<Data.OM_OrdersSet>.Where(Func<Data.OM_OrdersSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet.Include("AM_AccountsSet").Include("OM_StateSet").Include("RS_Order_RoomsSet")
                    .Where(fun);
                return orders.ToList();
            }
        }

        Data.OM_OrdersSet IDAOReader<Data.OM_OrdersSet>.Single(Func<Data.OM_OrdersSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var orders = _db.OM_OrdersSet.Include("AM_AccountsSet").Include("OM_StateSet").Include("RS_Order_RoomsSet").SingleOrDefault(fun);
                return orders;
            }
        }
        #endregion

        #region Writer

        int IDAOWriter<Data.OM_OrdersSet>.Create(Data.OM_OrdersSet model)
        {
            using (var _db = new Data.Entities())
            {
                _db.OM_OrdersSet.Add(model);
                var result = _db.SaveChanges();

                return result;
            }
        }

        int IDAOWriter<Data.OM_OrdersSet>.Update(long id, Data.OM_OrdersSet model)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.OM_OrdersSet.Find(id);
                if (entity != null)
                {
                    entity.SID = model.SID;
                }

                var result= _db.SaveChanges();
                return result;
            }
        }

        int IDAOWriter<Data.OM_OrdersSet>.Delete(long id)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.OM_OrdersSet.Find(id);
                if (entity != null)
                {
                    //_db.OM_OrdersSet.Remove(entity);
                    entity.SID = 3;
                }

                var result = _db.SaveChanges();
                return result;
            }
        }
        #endregion
        #endregion

        #region RS_Order_Rooms
        #region Reader
        IEnumerable<Data.RS_Order_RoomsSet> IDAOReader<Data.RS_Order_RoomsSet>.Get()
        {
            throw new NotImplementedException();
        }

        Data.RS_Order_RoomsSet IDAOReader<Data.RS_Order_RoomsSet>.Get(long key)
        {
            throw new NotImplementedException();
        }

        IEnumerable<Data.RS_Order_RoomsSet> IDAOReader<Data.RS_Order_RoomsSet>.Where(Func<Data.RS_Order_RoomsSet, bool> fun)
        {
            throw new NotImplementedException();
        }

        Data.RS_Order_RoomsSet IDAOReader<Data.RS_Order_RoomsSet>.Single(Func<Data.RS_Order_RoomsSet, bool> fun)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Writer

        int IDAOWriter<Data.RS_Order_RoomsSet>.Create(Data.RS_Order_RoomsSet model)
        {
            using (var _db = new Data.Entities())
            {
                _db.RS_Order_RoomsSet.Add(model);
                var result = _db.SaveChanges();

                return result;
            }
        }

        int IDAOWriter<Data.RS_Order_RoomsSet>.Update(long id, Data.RS_Order_RoomsSet model)
        {
            throw new NotImplementedException();
        }

        int IDAOWriter<Data.RS_Order_RoomsSet>.Delete(long id)
        {
            throw new NotImplementedException();
        }
        #endregion
        #endregion


    }
}
