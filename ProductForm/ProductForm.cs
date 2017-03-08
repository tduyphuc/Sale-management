using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using EntityClass;

namespace ProductForm
{
    public partial class ProductForm : Form
    {
        
        private const string COLUMN_PRODUCT_ID = "ID";
        private const string COLUMN_PRODUCT_NAME = "Product Name";
        private const string COLUMN_SUPPLIER_ID = "Supplier ID";
        private const string COLUMN_SUPPLIER_NAME = "Supplier Name";
        private const string COLUMN_CATEGORY_ID = "Category ID";
        private const string COLUMN_CATEGORY_NAME = "Category Name";
        private const string COLUMN_UNITPRICE = "Unit price";
        private const string COLUMN_DISCONTINUED = "Discontinue";
        
        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        private DataTable dataCategory;
        private DataTable dataSupplier;
        public ProductForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dataCategory = new DataTable();
            dataSupplier = new DataTable();
            dgvProduct.DataSource = dataTbl;

            cbbCategoryID.DataSource = dataCategory;
            cbbSupplierID.DataSource = dataSupplier;

            isAdd = true;
            LoadAllQuery();
            SQLLoadCategory();
            SQLLoadSupplier();
            LoadCategories();
            LoadSupplier();
        }

        private Products FormToProduct()
        {
            // we have some field can be null
            Products pro = new Products();
            pro.ID = txtProductID.Text.Trim();
            pro.ProductName = txtProductName.Text.Trim();
            pro.SupplierID = cbbSupplierID.SelectedValue.ToString().Trim();
            pro.SupplierName = cbbSupplierID.Text.ToString();
            pro.CategoryID = cbbCategoryID.SelectedValue.ToString().Trim();
            pro.CategoryName = cbbCategoryID.Text.ToString();
            pro.UnitPrice = txtPrice.Text.Trim();
            pro.Discontinued = cbxDiscontinued.Checked.ToString();
            
            return pro;
        }

        #region EventMethod
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!validField())
            {
                return;
            }
            Products pro = FormToProduct();
            if (isAdd)
            {
                int rs = SQLAdd(pro);
                if(rs > 0) // success
                {
                    ResetForm();
                    LoadAllQuery();
                }
                else // failed
                {
                    MessageBox.Show("No row was added. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else // update
            {
                int rs = SQLUpdate(pro);
                if(rs > 0)
                {
                    // update UI
                    DataGridViewRow row = dgvProduct.SelectedRows[0];
                    int index = row.Index;
                    dataTbl.Rows.RemoveAt(index);
                    DataRow r = dataTbl.NewRow();
                    r.SetField<string>(COLUMN_PRODUCT_ID, pro.ID);
                    r.SetField<string>(COLUMN_PRODUCT_NAME, pro.ProductName);
                    r.SetField<string>(COLUMN_SUPPLIER_ID, pro.SupplierID);
                    r.SetField<string>(COLUMN_SUPPLIER_NAME, pro.SupplierName);
                    r.SetField<string>(COLUMN_CATEGORY_ID, pro.CategoryID);
                    r.SetField<string>(COLUMN_CATEGORY_NAME, pro.CategoryName);
                    r.SetField<string>(COLUMN_UNITPRICE, pro.UnitPrice);
                    r.SetField<string>(COLUMN_DISCONTINUED, pro.Discontinued);
                    dataTbl.Rows.InsertAt(r, index);                
                }
                else
                {
                    MessageBox.Show("No row was updated. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            ResetForm();

            SQLLoadCategory();
            SQLLoadSupplier();
            LoadCategories();
            LoadSupplier();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            // 1. check if user select a row
            if (dgvProduct.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }
            // 2. show confirm box
            DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                                "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            // 3. if Yes
            if (drs == DialogResult.Yes)
            {
            // 4. get select row
                DataGridViewRow row = dgvProduct.SelectedRows[0];
                try
                {
            // 5.get ID
                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    // 6. Call Delete and see result
                    if (ConstrainForProduct(id))
                    {
                        int rs = SQLDelete(id);
                        if (rs > 0) // success
                        {
                            // delete row on View
                            dataTbl.Rows.RemoveAt(row.Index);
                            // if in update mode, reset form
                            if (!isAdd)
                            {
                                ResetForm();
                            }
                        }
                        else if (rs == 0) // no row affect
                        {
                            MessageBox.Show("No row was deleted. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else // exception
                        {
                            MessageBox.Show("Some error has occur. Please try again later",
                                   "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception)
                {
                    //
                }
            }
        }

        private bool ConstrainForProduct(int id)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKProductOrderDetails]";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("proid", SqlDbType.Int).Value = id;
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    return true;
                }
                MessageBox.Show("Please make sure no constrain in OrderDetail table!!!");
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_constrain" + ex.Message);
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_constrain" + ex.Message);
                return false;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
            return false;
        }

        private void btnShowAll_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {

        }

        private void btnSync_Click(object sender, EventArgs e)
        {
            ResetForm();
            SQLLoadCategory();
            SQLLoadSupplier();
            LoadCategories();
            LoadSupplier();
            LoadAllQuery();
        }

        private void dgvProduct_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvProduct.SelectedRows.Count > 0)
            {
                DataGridViewRow r = dgvProduct.SelectedRows[0];

                if (r != null)
                {
                    txtProductID.Text = r.Cells[COLUMN_PRODUCT_ID].Value.ToString();
                    txtProductName.Text = r.Cells[COLUMN_PRODUCT_NAME].Value.ToString();
                    cbbSupplierID.SelectedValue = r.Cells[COLUMN_SUPPLIER_ID].Value.ToString();
                    cbbCategoryID.SelectedValue = r.Cells[COLUMN_CATEGORY_ID].Value.ToString();
                    txtPrice.Text = r.Cells[COLUMN_UNITPRICE].Value.ToString();
                    cbxDiscontinued.Checked = Boolean.Parse(r.Cells[COLUMN_DISCONTINUED].Value.ToString());
                    
                }
            }
        }

        private void ProductForm_Load(object sender, EventArgs e)
        {

        }

        private void dgvProduct_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvProduct.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            DataGridViewRow r = dgvProduct.SelectedRows[0];
            txtProductID.Text = r.Cells[COLUMN_PRODUCT_ID].Value.ToString();
            txtProductName.Text = r.Cells[COLUMN_PRODUCT_NAME].Value.ToString();
            cbbSupplierID.SelectedValue = r.Cells[COLUMN_SUPPLIER_ID].Value.ToString();
            cbbCategoryID.SelectedValue = r.Cells[COLUMN_CATEGORY_ID].Value.ToString();
            txtPrice.Text = r.Cells[COLUMN_UNITPRICE].Value.ToString();
            cbxDiscontinued.Checked = Boolean.Parse(r.Cells[COLUMN_DISCONTINUED].Value.ToString());
        }

        private void btnSearchByName_Click(object sender, EventArgs e)
        {
            if (validSearchByName())
            {
                SqlCommand cmd;
                SqlDataReader reader = null;
                try
                {
                    con = AppConfig.GetConnection();
                    con.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "[SearchByNameProduct]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("productname", SqlDbType.NVarChar).Value = txtSearchByName.Text.ToString().Trim();
                    reader = cmd.ExecuteReader();
                    dataTbl.Clear();
                    dataTbl.Load(reader);

                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SqlException_SearchbyName" + ex.Message);
                    return;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Exception_SearchbyName" + ex.Message);
                    return;
                }
                finally
                {
                    if (reader != null)
                        reader.Close();
                    if (con != null)
                        con.Close();
                }
            }
        }

        private void btnSearchByPrice_Click(object sender, EventArgs e)
        {
            if (validFromTo())
            {
                SqlCommand cmd;
                SqlDataReader reader = null;
                try
                {
                    con = AppConfig.GetConnection();
                    con.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "[SearchByPriceProduct]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("fromPrice", SqlDbType.Money).Value = Convert.ToDecimal(txtFrom.Text.ToString().Trim());
                    cmd.Parameters.Add("toPrice", SqlDbType.Money).Value = Convert.ToDecimal(txtTo.Text.ToString().Trim());
                    reader = cmd.ExecuteReader();
                    dataTbl.Clear();
                    dataTbl.Load(reader);

                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SqlException_SearchbyPrice" + ex.Message);
                    return;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Exception_SearchbyPrice" + ex.Message);
                    return;
                }
                finally
                {
                    if (reader != null)
                        reader.Close();
                    if (con != null)
                        con.Close();
                }
            }
        }

        private void cbSupplierFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchBySupplierProduct]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("supid", SqlDbType.Int).Value = int.Parse(cbSupplierFilter.SelectedValue.ToString().Trim());
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_FilterSupClick" + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_FilterSupClick" + ex.Message);
                return;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
        }

        private void cbCateFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByCateProduct]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("cateid", SqlDbType.Int).Value = int.Parse(cbCateFilter.SelectedValue.ToString().Trim());
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_FilterCateClick" + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_FilterCateClick" + ex.Message);
                return;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
        }
        #endregion

        #region ValidField
        private bool validProductName()
        {
            string txt = txtProductName.Text.Trim();
            if (txt.Length == 0)
            {
                errProductName.SetError(txtProductName, "Product Name can not be Empty!!!");
                return false;
            }
            errProductName.Clear();
            return true;
        }

        private bool validFrom()
        {
            string txt = txtFrom.Text.Trim();
            if (txt.Length == 0)
            {
                errFrom.SetError(txtFrom, "From Range can not be Empty!!!");
                return false;
            }
            errFrom.Clear();
            return true;
        }

        private bool validTo()
        {
            string txt = txtTo.Text.Trim();
            if (txt.Length == 0)
            {
                errTo.SetError(txtTo, "To Range can not be Empty!!!");
                return false;
            }
            errTo.Clear();
            return true;
        }

        private bool validFromTo()
        {
            bool va = true;
            try
            {
                float from = float.Parse(txtFrom.Text.ToString().Trim());
                float to = float.Parse(txtTo.Text.ToString().Trim());
                if (from > to) {
                    MessageBox.Show("FromPrice must be smaller than ToPrice",
                     "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    va = false;
                }else if(from <= -1)
                {
                    MessageBox.Show("Price must be bigger than 0",
                     "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    va = false;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Wrong input format", 
                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return validFrom() && validTo() && va;
        }

        private bool validSearchByName()
        {
            string txt = txtSearchByName.Text.Trim();
            if (txt.Length == 0)
            {
                errSearchByName.SetError(txtSearchByName, "Product Name can not be Empty!!!");
                return false;
            }
            errSearchByName.Clear();
            return true;
        }

        private bool validUnitPrice()
        {
            string txt = txtPrice.Text.Trim();
            if (txt.Length == 0)
            {
                errUnitPrice.SetError(txtPrice, "Unit Price can not be Empty!!!");
                return false;
            }
            try
            {
                float price = float.Parse(txt);
                if(price < 0)
                {
                    errUnitPrice.SetError(txtPrice, "Price can't be smaller than zero !!!");
                    return false;
                }
            }
            catch (FormatException)
            {
                errUnitPrice.SetError(txtPrice, "Wrong fomat !!!");
                return false;
            }
            errUnitPrice.Clear();
            return true;
        }

        private bool validCategory()
        {
            if (cbbCategoryID.SelectedIndex < 0)
            {
                errCategory.SetError(cbbCategoryID, "Please pick a Category");
                return false;
            }
            errCategory.Clear();
            return true;
        }

        private bool validSupplier()
        {
            if (cbbSupplierID.SelectedIndex < 0)
            {
                errSupplier.SetError(cbbSupplierID, "Please pick a Supplier");
                return false;
            }
            errSupplier.Clear();
            return true;
        }

        private bool validField()
        {
            bool proName = validProductName();
            bool supplierID = validSupplier();
            bool categoryID = validCategory();
            bool unitPrice = validUnitPrice();
            return proName && supplierID && categoryID && unitPrice;
        }
        #endregion

        #region NonQuery
        private int SQLAdd(Products pro)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertProduct]";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("productname", SqlDbType.NVarChar).Value = pro.ProductName;
                cmd.Parameters.Add("supplierid", SqlDbType.Int).Value = int.Parse(pro.SupplierID.ToString());
                cmd.Parameters.Add("categoryid", SqlDbType.Int).Value = int.Parse(pro.CategoryID.ToString());
                cmd.Parameters.Add("unitprice", SqlDbType.Money).Value = Convert.ToDecimal(pro.UnitPrice.ToString());
                cmd.Parameters.Add("discontinued", SqlDbType.Bit).Value =Convert.ToBoolean(pro.Discontinued.ToString());

                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    return rs;
                }
                else
                {
                 
                    return 0;
                }
            }
            catch (SqlException e)
            {
              
                return -1;
            }
            catch (Exception e)
            {
               
                return -1;
            }
            finally
            {
                con.Close();
                
            }
        }

        private int SQLUpdate(Products pro)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateProduct]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("productid", SqlDbType.NVarChar).Value = pro.ID;
                cmd.Parameters.Add("productname", SqlDbType.NVarChar).Value = pro.ProductName;
                cmd.Parameters.Add("supplierid", SqlDbType.Int).Value = int.Parse(pro.SupplierID.ToString());
                cmd.Parameters.Add("categoryid", SqlDbType.Int).Value = int.Parse(pro.CategoryID.ToString());
                cmd.Parameters.Add("unitprice", SqlDbType.Money).Value = Convert.ToDecimal(pro.UnitPrice.ToString());
                cmd.Parameters.Add("discontinued", SqlDbType.Bit).Value = Convert.ToBoolean(pro.Discontinued.ToString());

                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    return rs;
                }
                else
                {
                    return 0;
                }
            }
            catch (SqlException)
            {
                return -1;
            }
            catch (Exception)
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        }

        private int SQLDelete(int id)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[DeleteProduct]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("productid", SqlDbType.VarChar).Value = id;

                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    return rs;
                }
                else
                {
                    return 0;
                }
            }
            catch (SqlException e)
            {
                return -1;
            }
            catch (Exception e)
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        }

        private void SQLLoadCategory()
        {
            SqlCommand cmd;
            IDataReader r = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadCategoryForProduct]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                dataCategory.Clear();
                dataCategory.Load(r);
                cbbCategoryID.DisplayMember = "Name";
                cbbCategoryID.ValueMember = "ID";
                cbbCategoryID.SelectedIndex = -1;
            }
            catch (SqlException e)
            {
                Console.WriteLine("SqlException_SQLLoadCategories" + e.Message);
                return;
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception_SQLLoadCategories" + e.Message);
                return;
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (r != null)
                {
                    r.Close();
                }
            }
        }

        private void SQLLoadSupplier()
        {
            SqlCommand cmd;
            IDataReader r = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadSupplierForProduct]";
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                dataSupplier.Clear();
                dataSupplier.Load(r);
                cbbSupplierID.DisplayMember = "ComName";
                cbbSupplierID.ValueMember = "ID";
                cbbSupplierID.SelectedIndex = -1;

            }
            catch (SqlException e)
            {
                Console.WriteLine("SqlException_SQLLoadSupplier" + e.Message);
                return;
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception_SQLLoadSupplier" + e.Message);
                return;
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (r != null)
                {
                    r.Close();
                }
            }
        }
        #endregion

        #region UIMethod
        private void ResetForm()
        {
            txtProductID.Clear();
            txtProductName.Clear();
            cbbSupplierID.SelectedIndex = -1;
            cbbCategoryID.SelectedIndex = -1;
            txtPrice.Clear();
            cbxDiscontinued.Checked = false;
            isAdd = true;
            btnReset.Enabled = true;

            // clear err
            errProductName.Clear();
            errSupplier.Clear();
            errUnitPrice.Clear();
            errCategory.Clear();
            errFrom.Clear();
            errTo.Clear();
            errSearchByName.Clear();
        }
        #endregion

        #region Query
       
        private void LoadAllQuery()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[getAllPro.Product]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);                
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_LoadAllQuery" + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_LoadAllQuery" + ex.Message);
                return;
            }
            finally
            {
                if(reader != null)
                    reader.Close();
                if(con != null)
                    con.Close();
            }
        } 

        private void LoadCategories()
        {
            DataTable data = new DataTable();
            cbCateFilter.DataSource = data;
            SqlDataReader r = null;
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadCategoryForProduct]";
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                data.Load(r);
                cbCateFilter.DisplayMember = "Name";
                cbCateFilter.ValueMember = "ID";
            }
            catch (SqlException e)
            {
                Console.WriteLine("SqlException_FilterCategory" + e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception_FilterCategory" + e.Message);
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (r != null)
                {
                    r.Close();
                }
            }
        }

        private void LoadSupplier()
        {
            DataTable data = new DataTable();
            cbSupplierFilter.DataSource = data;
            SqlDataReader r = null;
            SqlCommand cmd;          
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadSupplierForProduct]";
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                data.Load(r);
                cbSupplierFilter.DisplayMember = "ComName";
                cbSupplierFilter.ValueMember = "ID";               
            }
            catch (SqlException e)
            {
                Console.WriteLine("SqlException_FilterSupplier"+e.Message);
                return;
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception_FilterSupplier" + e.Message);
                return;
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (r != null)
                {
                    r.Close();
                }
            }
        }

        #endregion
     
    }
}
