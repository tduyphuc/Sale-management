using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class Shippers
    {
        string _ID;
        string _CompanyName;
        string _Phone;

        public string ID
        {
            get
            {
                return _ID;
            }

            set
            {
                _ID = value;
            }
        }

        public string CompanyName
        {
            get
            {
                return _CompanyName;
            }

            set
            {
                _CompanyName = value;
            }
        }

        public string Phone
        {
            get
            {
                return _Phone;
            }

            set
            {
                _Phone = value;
            }
        }

        public Shippers()
        {

        }

        public override bool Equals(object obj)
        {
            Shippers sh = obj as Shippers;
            return (sh != null) && sh.ID.Equals(ID);
        }
    }
}
