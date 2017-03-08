using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
    public class OrderDetails
    {
        string _ID;
        string _ProductID;
        string _ProductName;
        string _UnitPrice;
        string _Qty;
        string _Discount;

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

        public string ProductID
        {
            get
            {
                return _ProductID;
            }

            set
            {
                _ProductID = value;
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

        public string Qty
        {
            get
            {
                return _Qty;
            }

            set
            {
                _Qty = value;
            }
        }

        public string Discount
        {
            get
            {
                return _Discount;
            }

            set
            {
                _Discount = value;
            }
        }

        public OrderDetails()
        {

        }

        public override bool Equals(object obj)
        {
            OrderDetails ord = obj as OrderDetails;
            return (ord != null) && ord.ID.Equals(ID);
        }
    }

}
