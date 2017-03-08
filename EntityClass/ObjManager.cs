using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class ObjManager<T>
    {
        List<T> myList = new List<T>();

        public ObjManager()
        {

        }

        public List<T> getDataList()
        {
            return myList;
        }

        public void setDataList(List<T> list)
        {
            this.myList = list;
        }

        public Boolean isEmpty()
        {
            return myList.Count == 0;
        }

        public Boolean AddElement(T obj)
        {
            if (!myList.Contains(obj))
            {
                myList.Add(obj);
                return true;
            }
            return false;
        }

        public void UpdateElement(T obj)
        {
            int pos = myList.IndexOf(obj);
            myList[pos] = obj;
        }

        public void DeleteElement(T obj)
        {
            myList.Remove(obj);
        }
    }
}
