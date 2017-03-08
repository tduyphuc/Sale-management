using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class Products
    {
        string _ID;
        string _ProductName;
        string _SupplierID;
        string _SupplierName;
        string _CategoryID;
        string _CategoryName;
        string _UnitPrice;
        string _Discontinued;

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

        public string ProductName
        {
            get
            {
                return _ProductName;
            }

            set
            {
                _ProductName = value;
            }
        }

        public string SupplierID
        {
            get
            {
                return _SupplierID;
            }

            set
            {
                _SupplierID = value;
            }
        }

        public string SupplierName
        {
            get
            {
                return _SupplierName;
            }

            set
            {
                _SupplierName = value;
            }
        }

        public string CategoryID
        {
            get
            {
                return _CategoryID;
            }

            set
            {
                _CategoryID = value;
            }
        }

        public string CategoryName
        {
            get
            {
                return _CategoryName;
            }

            set
            {
                _CategoryName = value;
            }
        }

        public string UnitPrice
        {
            get
            {
                return _UnitPrice;
            }

            set
            {
                _UnitPrice = value;
            }
        }

        public string Discontinued
        {
            get
            {
                return _Discontinued;
            }

            set
            {
                _Discontinued = value;
            }
        }

        public Products()
        {

        }

        public override bool Equals(object obj)
        {
            Products pr = obj as Products;
            return (pr != null) && pr.ID.Equals(ID);
        }
    }
}
