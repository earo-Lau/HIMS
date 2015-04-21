using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HIMS.DAO.RoomServer
{
    public class RoomsDAO : IServer, IDAOReader<Data.RM_RoomsSet>, IDAOWriter<Data.RM_RoomsSet>, IDAOReader<Data.RM_StateSet>, IDAOWriter<Data.RM_StateSet>
    {
        #region RM_Rooms

        #region Reader
        IEnumerable<Data.RM_RoomsSet> IDAOReader<Data.RM_RoomsSet>.Get()
        {
            using (var _db = new Data.Entities())
            {
                var rooms = _db.RM_RoomsSet.Include("RM_StateSet").Include("RS_Order_RoomsSet");

                return rooms.ToList();
            }
        }

        Data.RM_RoomsSet IDAOReader<Data.RM_RoomsSet>.Get(long key)
        {
            using (var _db = new Data.Entities())
            {
                var room = _db.RM_RoomsSet.Include("RM_StateSet").Include("RS_Order_RoomsSet")
                    .SingleOrDefault(x => x.RoomId.Equals(key));

                return room;
            }
        }

        IEnumerable<Data.RM_RoomsSet> IDAOReader<Data.RM_RoomsSet>.Where(Func<Data.RM_RoomsSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var rooms = _db.RM_RoomsSet.Include("RM_StateSet").Include("RS_Order_RoomsSet")
                    .Where(fun);

                return rooms.ToList();
            }
        }

        Data.RM_RoomsSet IDAOReader<Data.RM_RoomsSet>.Single(Func<Data.RM_RoomsSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var room = _db.RM_RoomsSet.Include("RM_StateSet").Include("RS_Order_RoomsSet")
                    .SingleOrDefault(fun);

                return room;
            }
        }

        #endregion

        #region Writer
        int IDAOWriter<Data.RM_RoomsSet>.Create(Data.RM_RoomsSet model)
        {
            using (var _db = new Data.Entities())
            {
                _db.RM_RoomsSet.Add(model);
                var result = _db.SaveChanges();

                return result;
            }
        }

        int IDAOWriter<Data.RM_RoomsSet>.Update(long id, Data.RM_RoomsSet model)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.RM_RoomsSet.Find(id);
                if (entity != null)
                {
                    entity.Num = model.Num;
                    entity.Type = model.Type;
                    entity.Price = model.Price;
                    entity.Remark = model.Remark;
                    entity.RM_State_SID = model.RM_State_SID;
                    entity.Operator = model.Operator;
                    entity.UpdateTime = DateTime.Now.ToLongDateString();
                }

                var result = _db.SaveChanges();
                return result;
            }
        }
        int IDAOWriter<Data.RM_RoomsSet>.Delete(long id)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.RM_RoomsSet.Find(id);
                if (entity != null)
                {
                    _db.RM_RoomsSet.Remove(entity);
                }

                var result = _db.SaveChanges();
                return result;
            }
        }

        #endregion

        #endregion

        #region RM_State
        #region Reader

        IEnumerable<Data.RM_StateSet> IDAOReader<Data.RM_StateSet>.Get()
        {
            using (var _db = new Data.Entities())
            {
                var state = _db.RM_StateSet;

                return state.ToList();
            }
        }

        Data.RM_StateSet IDAOReader<Data.RM_StateSet>.Get(long key)
        {
            using (var _db = new Data.Entities())
            {
                var room = _db.RM_StateSet.Find(key);

                return room;
            }
        }

        IEnumerable<Data.RM_StateSet> IDAOReader<Data.RM_StateSet>.Where(Func<Data.RM_StateSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var rooms = _db.RM_StateSet.Where(fun);

                return rooms.ToList();
            }
        }

        Data.RM_StateSet IDAOReader<Data.RM_StateSet>.Single(Func<Data.RM_StateSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var room = _db.RM_StateSet.SingleOrDefault(fun);

                return room;
            }
        }
        #endregion

        #region Writer
        int IDAOWriter<Data.RM_StateSet>.Create(Data.RM_StateSet model)
        {
            using (var _db = new Data.Entities())
            {
                _db.RM_StateSet.Add(model);
                var result = _db.SaveChanges();

                return result;
            }
        }

        int IDAOWriter<Data.RM_StateSet>.Update(long id, Data.RM_StateSet model)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.RM_StateSet.Find(id);
                if (entity != null)
                {
                    entity.Name = model.Name;
                    entity.Value = model.Value;
                }

                var result = _db.SaveChanges();
                return result;
            }
        }

        int IDAOWriter<Data.RM_StateSet>.Delete(long id)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.RM_StateSet.Find(id);
                if (entity != null)
                {
                    _db.RM_StateSet.Remove(entity);
                }

                var result = _db.SaveChanges();
                return result;
            }
        }
        #endregion

        #endregion
    }
}
