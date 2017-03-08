﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class Suppliers
    {
        string _ID;
        string _CompanyName;
        string _ContactName;
        string _ContactTitle;
        string _Address;
        string _City;
        string _Region;
        string _PostalCode;
        string _Country;
        string _Phone;
        string _Fax;

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

        public string ContactName
        {
            get
            {
                return _ContactName;
            }

            set
            {
                _ContactName = value;
            }
        }

        public string ContactTitle
        {
            get
            {
                return _ContactTitle;
            }

            set
            {
                _ContactTitle = value;
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

        public string Fax
        {
            get
            {
                return _Fax;
            }

            set
            {
                _Fax = value;
            }
        }

        public Suppliers()
        {

        }

        public override bool Equals(object obj)
        {
            Suppliers sup = obj as Suppliers;
            return (sup != null) && sup.ID.Equals(ID);
        }
    }
}
