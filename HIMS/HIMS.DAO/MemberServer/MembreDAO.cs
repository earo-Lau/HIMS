using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HIMS.DAO.MemberServer
{
    public class MembreDAO:IServer, IDAOReader<Data.AM_AccountsSet>, IDAOWriter<Data.AM_AccountsSet>
    {
        #region Accounts
        #region Reader

        IEnumerable<Data.AM_AccountsSet> IDAOReader<Data.AM_AccountsSet>.Get()
        {
            using (var _db = new Data.Entities())
            {
                var members = _db.AM_AccountsSet.Include("AM_RoleSet");

                return members.ToList();
            }
        }

        Data.AM_AccountsSet IDAOReader<Data.AM_AccountsSet>.Get(long key)
        {
            throw new NotImplementedException();
        }

        IEnumerable<Data.AM_AccountsSet> IDAOReader<Data.AM_AccountsSet>.Where(Func<Data.AM_AccountsSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var accountList = _db.AM_AccountsSet.Include("AM_RoleSet").Where(fun);

                return accountList.ToList();
            }
        }

        Data.AM_AccountsSet IDAOReader<Data.AM_AccountsSet>.Single(Func<Data.AM_AccountsSet, bool> fun)
        {
            using (var _db = new Data.Entities())
            {
                var account = _db.AM_AccountsSet.SingleOrDefault(fun);

                return account;
            }
        }

        #endregion

        #region Writer

        int IDAOWriter<Data.AM_AccountsSet>.Create(Data.AM_AccountsSet model)
        {
            using (var _db = new Data.Entities())
            {
                _db.AM_AccountsSet.Add(model);
                try
                {
                    var result = _db.SaveChanges();
                }
                catch (Exception ex)
                {

                    throw;
                }
                

                return 0;
            }
        }

        int IDAOWriter<Data.AM_AccountsSet>.Update(long id, Data.AM_AccountsSet model)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.AM_AccountsSet.Find(id);
                if (entity != null)
                {
                    entity.Mobile = model.Mobile;
                    entity.Name= model.Name;
                    entity.Password= model.Password;
                    entity.AM_Role_RoleId= model.AM_Role_RoleId;
                }

                var result = _db.SaveChanges();
                return result;
            }
        }

        int IDAOWriter<Data.AM_AccountsSet>.Delete(long id)
        {
            using (var _db = new Data.Entities())
            {
                var entity = _db.AM_AccountsSet.Find(id);
                if (entity != null)
                {
                    entity.IsDeleted = true;
                }

                var result = _db.SaveChanges();
                return result;
            }
        }
        #endregion
        #endregion

    }
}
