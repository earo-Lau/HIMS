using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace HIMS.DAO
{
    public class DAOContainer
    {
        #region Singleton

        private static DAOContainer singleton;

        public static DAOContainer Singleton
        {
            get
            {
                if (singleton == null)
                    singleton = new DAOContainer();
                return singleton;
            }
        }
        private DAOContainer()
        {
            InitIoC();
        }

        #endregion

        #region IoC
        private IDictionary<string, IServer> ioCContainer;

        protected void InitIoC()
        {

        }
        #endregion

        #region Methods
        public IDAOReader<T> GetReader<T>(string key)
        {
            if(ioCContainer.ContainsKey(key))
            {
                throw new KeyNotFoundException("找不到该Server");
            }

            return ioCContainer[key] as IDAOReader<T>;
        }

        public IDAOWriter<T> GetWriter<T>(string key)
        {
            if (ioCContainer.ContainsKey(key))
            {
                throw new KeyNotFoundException("找不到该Server");
            }

            return ioCContainer[key] as IDAOWriter<T>;
        }
        #endregion
    }
}
