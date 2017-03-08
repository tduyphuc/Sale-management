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
        private ListBox listBox1;
        private DataTable dataSupplier;
        public ProductForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dataCategory = new DataTable();
            dataSupplier = new DataTable();
            dgvProduct.DataSource = dataTbl;

            cbbCategoryID.DataSource = dataCategory;
            cbbCategoryFilter.DataSource = dataCategory;

            cbbSupplierID.DataSource = dataSupplier;
            cbbSupplierFilter.DataSource = dataSupplier;

            isAdd = true;
            LoadAllQuery();
            SQLLoadCategory();
            SQLLoadSupplier();
        }

        private Products FormToProduct()
        {
            // we have some field can be null
            Products pro = new Products();
            pro.ID = txtProductID.Text.Trim();
            pro.ProductName = txtProductName.Text.Trim();
            pro.SupplierID = cbbSupplierID.Text.Trim();
            pro.CategoryID = cbbCategoryID.Text.Trim();
            pro.UnitPrice = txtPrice.Text.Trim();
            pro.Discontinued = cbxDiscontinued.Checked+"";
            
            return pro;
        }

        public void UpdateContent()
        {
            throw new NotImplementedException();
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
                    row.Cells[COLUMN_PRODUCT_ID].Value = pro.ID;
                    row.Cells[COLUMN_PRODUCT_NAME].Value = pro.ProductName;
                    row.Cells[COLUMN_SUPPLIER_ID].Value = pro.SupplierID;
                    row.Cells[COLUMN_SUPPLIER_NAME].Value = pro.SupplierName;
                    row.Cells[COLUMN_CATEGORY_ID].Value = pro.CategoryID;
                    row.Cells[COLUMN_CATEGORY_NAME].Value = pro.CategoryName;
                    row.Cells[COLUMN_UNITPRICE].Value = pro.UnitPrice;
                    row.Cells[COLUMN_DISCONTINUED].Value = pro.Discontinued;
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
                    int rs = SQLDelete(id);
                    if (rs > 0) // success
                    {
                        // delete row on View
                        dgvProduct.Rows.RemoveAt(row.Index);
                        // if in update mode, reset form
                        if (!isAdd)
                        {
                            ResetForm();
                        }
                    }
                    else if(rs == 0) // no row affect
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
                catch (Exception)
                {
                    //
                }
            }
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
                    cbxDiscontinued.Checked = r.Cells[COLUMN_DISCONTINUED].Selected;
                    
                    errCategory.Clear();
                    errProductName.Clear();
                    errSupplier.Clear();
                    errUnitPrice.Clear();
                }
            }
        }

        private void cbbSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbSearchBy.SelectedIndex == 0)
            {
                lblName.Visible = true;
                txtSearchByName.Visible = true;
                btnSearchByName.Visible = true;

                lblForm.Visible = false;
                lblTo.Visible = false;
                txtFrom.Visible = false;
                txtTo.Visible = false;
                btnSearchByPrice.Visible = false;
            }
            if (cbbSearchBy.SelectedIndex == 1)
            {
                lblForm.Visible = true;
                lblTo.Visible = true;
                txtFrom.Visible = true;
                txtTo.Visible = true;
                btnSearchByPrice.Visible = true;

                lblName.Visible = false;
                txtSearchByName.Visible = false;
                btnSearchByName.Visible = false;
            }
        }

        private void cbbFilterBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbFilter.SelectedIndex == 0)
            {
                lblSupplier.Visible = true;
                cbbSupplierFilter.Visible = true;
                btnFilterSupplier.Visible = true;

                lblCategory.Visible = false;
                cbbCategoryFilter.Visible = false;
                btnFilterCategory.Visible = false;
            }

            if (cbbFilter.SelectedIndex == 1)
            {
                lblSupplier.Visible = false;
                cbbSupplierFilter.Visible = false;
                btnFilterSupplier.Visible = false;

                lblCategory.Visible = true;
                cbbCategoryFilter.Visible = true;
                btnFilterCategory.Visible = true;
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
                cmd.CommandText = "[InsertProduct]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("productname", SqlDbType.NVarChar).Value = pro.ProductName;
                cmd.Parameters.Add("supplierid", SqlDbType.NVarChar).Value = pro.SupplierID;
                cmd.Parameters.Add("categoryid", SqlDbType.NVarChar).Value = pro.CategoryID;
                cmd.Parameters.Add("unitprice", SqlDbType.NVarChar).Value = pro.UnitPrice;
                cmd.Parameters.Add("discontinued", SqlDbType.NVarChar).Value = pro.Discontinued;

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
                cmd.Parameters.Add("supplierid", SqlDbType.NVarChar).Value = pro.SupplierID;
                cmd.Parameters.Add("categoryid", SqlDbType.NVarChar).Value = pro.CategoryID;
                cmd.Parameters.Add("unitprice", SqlDbType.NVarChar).Value = pro.UnitPrice;
                cmd.Parameters.Add("discontinued", SqlDbType.NVarChar).Value = pro.Discontinued;

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
                cmd.CommandText = "[getAllName.Categories]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                dataCategory.Load(r);
                cbbCategoryID.DisplayMember = "Category Name";
                cbbCategoryID.ValueMember = "Category ID";
                cbbCategoryID.SelectedIndex = -1;

                cbbCategoryFilter.DisplayMember = "Category Name";
                cbbCategoryFilter.ValueMember = "Category ID";
                cbbCategoryFilter.SelectedIndex = -1;
            }
            catch (SqlException e)
            {
                Console.WriteLine("co loi Category!!!");
            }
            catch (Exception e)
            {
                Console.WriteLine("co loi Category!!!");
            }
            finally
            {
                con.Close();
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
                cmd.CommandText = "[getAllName.Supplier]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                r = cmd.ExecuteReader();
                dataSupplier.Load(r);
                cbbSupplierID.DisplayMember = "Supplier Name";
                cbbSupplierID.ValueMember = "Supplier ID";
                cbbSupplierID.SelectedIndex = -1;

                cbbSupplierFilter.DisplayMember = "Supplier Name";
                cbbSupplierFilter.ValueMember = "Supplier ID";
                cbbSupplierFilter.SelectedIndex = -1;
            }
            catch (SqlException e)
            {
                Console.WriteLine("co loi Supplier!!!");
            }
            catch (Exception e)
            {
                Console.WriteLine("co loi Supplier!!!");
            }
            finally
            {
                con.Close();
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
        private void SearchQuery()
        {
            string txt = txtSearchByName.Text.Trim();
            if (txt.Length > 0)
            {
                SqlCommand cmd;
                try
                {
                    con = AppConfig.GetConnection();
                    con.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = ""; // ten procedure
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add param
                    //cmd.Parameters.Add("sss", SqlDbType.VarChar).Value = "ss";

                    int rs = cmd.ExecuteNonQuery();
                    if (rs > 0)
                    {
                        //
                    }
                    else
                    {
                        //
                    }
                }
                catch (SqlException)
                {
                    //
                }
                catch (Exception)
                {
                    //
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                MessageBox.Show("Please fill in search bar",
               "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

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
                cmd.CommandText = "[getAllPro.Product]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
                // Add param
                //cmd.Parameters.Add("sss", SqlDbType.VarChar).Value = "ss";

            }
            catch (SqlException)
            {
                //
            }
            catch (Exception)
            {
                //
            }
            finally
            {
                if(reader != null)
                    reader.Close();
                if(con != null)
                    con.Close();
            }
        } 
        #endregion

        private void ProductForm_Load(object sender, EventArgs e)
        {
            
        }

        private void InitializeComponent()
        {
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 16;
            this.listBox1.Location = new System.Drawing.Point(134, 113);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(120, 84);
            this.listBox1.TabIndex = 0;
            // 
            // ProductForm
            // 
            this.ClientSize = new System.Drawing.Size(282, 253);
            this.Controls.Add(this.listBox1);
            this.Name = "ProductForm";
            this.ResumeLayout(false);

        }
    }
}
