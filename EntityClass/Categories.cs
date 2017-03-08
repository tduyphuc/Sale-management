using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityClass
{
        public class Categories
        {
        string _ID;
        string _CategoriesName;
        string _Description;

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

        public string CategoriesName
        {
            get
            {
                return _CategoriesName;
            }

            set
            {
                _CategoriesName = value;
            }
        }

        public string Description
        {
            get
            {
                return _Description;
            }

            set
            {
                _Description = value;
            }
        }

        public Categories()
            {

            }

            public override bool Equals(object obj)
            {
                Categories ca = obj as Categories;
                return (ca != null) && ca.ID.Equals(ID);
            }
        }
    
        
}
