using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class Employees
    {
        string _ID;
        string _LastName;
        string _FirstName;
        string _Title;
        string _TitleOfCourtesy;
        string _BirthDate;
        string _HireDate;
        string _Address;
        string _City;
        string _Region;
        string _PostalCode;
        string _Country;
        string _Phone;
        string _MngID;
        string _MngName;

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

        public string LastName
        {
            get
            {
                return _LastName;
            }

            set
            {
                _LastName = value;
            }
        }

        public string FirstName
        {
            get
            {
                return _FirstName;
            }

            set
            {
                _FirstName = value;
            }
        }

        public string Title
        {
            get
            {
                return _Title;
            }

            set
            {
                _Title = value;
            }
        }

        public string TitleOfCourtesy
        {
            get
            {
                return _TitleOfCourtesy;
            }

            set
            {
                _TitleOfCourtesy = value;
            }
        }

        public string BirthDate
        {
            get
            {
                return _BirthDate;
            }

            set
            {
                _BirthDate = value;
            }
        }

        public string HireDate
        {
            get
            {
                return _HireDate;
            }

            set
            {
                _HireDate = value;
            }
        }

        public string Address
        {
            get
            {
                return _Address;
            }

            set
            {
                _Address = value;
            }
        }

        public string City
        {
            get
            {
                return _City;
            }

            set
            {
                _City = value;
            }
        }

        public string Region
        {
            get
            {
                return _Region;
            }

            set
            {
                _Region = value;
            }
        }

        public string PostalCode
        {
            get
            {
                return _PostalCode;
            }

            set
            {
                _PostalCode = value;
            }
        }

        public string Country
        {
            get
            {
                return _Country;
            }

            set
            {
                _Country = value;
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

        public string MngID
        {
            get
            {
                return _MngID;
            }

            set
            {
                _MngID = value;
            }
        }

        public string MngName
        {
            get
            {
                return _MngName;
            }

            set
            {
                _MngName = value;
            }
        }

        public Employees()
        {

        }

        public override bool Equals(object obj)
        {
            Employees emp = obj as Employees;
            return (emp != null) && emp.ID.Equals(ID);
        }
    }
}
