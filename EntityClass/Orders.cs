using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class Orders
    {
        string _ID;
        string _CusID;
        string _CusName;
        string _EmpID;
        string _EmName;
        string _OrderDate;
        string _RequiredDate;
        string _ShippedDate;
        string _ShipperID;
        string _ShipComName;
        string _Freight;
        string _ShipName;
        string _ShipAddress;
        string _ShipCity;
        string _ShipRegion;
        string _ShipPostalCode;
        string _ShipCountry;

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

        public string CusID
        {
            get
            {
                return _CusID;
            }

            set
            {
                _CusID = value;
            }
        }

        public string CusName
        {
            get
            {
                return _CusName;
            }

            set
            {
                _CusName = value;
            }
        }

        public string EmpID
        {
            get
            {
                return _EmpID;
            }

            set
            {
                _EmpID = value;
            }
        }

        public string EmName
        {
            get
            {
                return _EmName;
            }

            set
            {
                _EmName = value;
            }
        }

        public string OrderDate
        {
            get
            {
                return _OrderDate;
            }

            set
            {
                _OrderDate = value;
            }
        }

        public string RequiredDate
        {
            get
            {
                return _RequiredDate;
            }

            set
            {
                _RequiredDate = value;
            }
        }

        public string ShippedDate
        {
            get
            {
                return _ShippedDate;
            }

            set
            {
                _ShippedDate = value;
            }
        }

        public string ShipperID
        {
            get
            {
                return _ShipperID;
            }

            set
            {
                _ShipperID = value;
            }
        }

        public string ShipComName
        {
            get
            {
                return _ShipComName;
            }

            set
            {
                _ShipComName = value;
            }
        }

        public string Freight
        {
            get
            {
                return _Freight;
            }

            set
            {
                _Freight = value;
            }
        }

        public string ShipName
        {
            get
            {
                return _ShipName;
            }

            set
            {
                _ShipName = value;
            }
        }

        public string ShipAddress
        {
            get
            {
                return _ShipAddress;
            }

            set
            {
                _ShipAddress = value;
            }
        }

        public string ShipCity
        {
            get
            {
                return _ShipCity;
            }

            set
            {
                _ShipCity = value;
            }
        }

        public string ShipRegion
        {
            get
            {
                return _ShipRegion;
            }

            set
            {
                _ShipRegion = value;
            }
        }

        public string ShipPostalCode
        {
            get
            {
                return _ShipPostalCode;
            }

            set
            {
                _ShipPostalCode = value;
            }
        }

        public string ShipCountry
        {
            get
            {
                return _ShipCountry;
            }

            set
            {
                _ShipCountry = value;
            }
        }

        public Orders()
        {

        }

        public override bool Equals(object obj)
        {
            Orders or = obj as Orders;
            return (or != null) && or.ID.Equals(ID);
        }
    }
}
