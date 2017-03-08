using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EntityClass;

namespace ProductForm
{
    public partial class OrderDetailsForm : Form
    {
        private const string COLUMN_ORDERID = "Order ID";
        private const string COLUMN_PROID = "Product ID";
        private const string COLUMN_PRONAME = "Product Name";
        private const string COLUMN_UNIT = "Unit Price";
        private const string COLUMN_QUANTITY = "Quantity";
        private const string COLUMN_DISCOUNT = "Discount";


        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        private int orderID;
        public OrderDetailsForm(int ID)
        {
            InitializeComponent();
            // set order ID
            orderID = ID;
            txtOrderID.Text = orderID + "";
            isAdd = true;
            //set data src
            dataTbl = new DataTable();
            dgOrderDetails.DataSource = dataTbl;
            RefreshForm();
        }

        private void RefreshForm()
        {
            LoadProductQueryForForm();
            LoadAllQuery(); 
            ResetForm();
        }

        private void ResetForm()
        {
            isAdd = true;
            btnReset.Enabled = true;

            cbProduct.Enabled = true;
            cbProduct.SelectedIndex = -1;
            mtbQTY.Clear();
            mtxdiscount.Clear();
            txtPrice.Clear();

            errDiscount.Clear();
            errProduct.Clear();
            errQuantity.Clear();

        }

        private OrderDetails FormToDetail()
        {
            OrderDetails ord = new OrderDetails();
            ord.ID = txtOrderID.Text;
            ord.ProductID = cbProduct.SelectedValue.ToString();
            int i = cbProduct.SelectedIndex;
            if (i >= 0)
            {
                DataRowView row = (DataRowView)cbProduct.SelectedItem;
                DataRow r = row.Row;
                string name = r.Field<string>("Name");
                ord.ProductName = name;
            }
            ord.UnitPrice = txtPrice.Text;
            ord.Qty = mtbQTY.Text;
            ord.Discount = mtxdiscount.Text;
            return ord;
        }

        #region ValidField
        private bool validProduct()
        {
            if (cbProduct.SelectedIndex < 0)
            {
                errProduct.SetError(cbProduct, "Choose a product");
                return false;
            }
            errProduct.Clear();
            return true;
        }

        private bool validQuantity()
        {
            string txt = mtbQTY.Text.Trim();
            if (txt.Length < 1)
            {
                errQuantity.SetError(mtbQTY, "Require quantity number");
                return false;
            }
            try
            {
                int.Parse(txt);
            }
            catch (FormatException)
            {
                errQuantity.SetError(mtbQTY, "Please input right number format");
                return false;
            }
            errQuantity.Clear();
            return true;
        }

        private bool validDiscount()
        {
            if (!mtxdiscount.MaskCompleted)
            {
                errDiscount.SetError(mtxdiscount, "Discount format number: x.xxx");
                return false;
            }
            float discount = float.Parse(mtxdiscount.Text);
            if(discount > 1.000f)
            {
                errDiscount.SetError(mtxdiscount, "Discount must <= 1");
                return false;
            }
            errDiscount.Clear();
            return true;
        }

        private bool validField()
        {
            bool pro = validProduct();
            bool quan = validQuantity();
            bool dis = validDiscount();
            return pro && quan && dis;
        } 
        #endregion

        #region Event
        private void btnSave_Click(object sender, EventArgs e)
        {
            // valid field and constraint
            if (CheckShippedOrder())
            {
                MessageBox.Show("This order was shipped, you can't modify it !",
                            "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (!validField())
            {
                return;
            }
            OrderDetails ord = FormToDetail();
            if (isAdd)
            {
                if (CheckExistOrderDetails(int.Parse(ord.ProductID)))
                {
                    MessageBox.Show("This detail existed !",
                            "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (!CheckContinueProduct(int.Parse(ord.ProductID)))
                {
                    MessageBox.Show("This product no more distribute !",
                            "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                int rs = SQLAdd(ord);
                if (rs > 0) // success
                {
                    RefreshForm();
                }
                else // failed
                {
                    MessageBox.Show("No row was added. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                int rs = SQLUpdate(ord);
                if (rs > 0)
                {
                    // update UI
                    DataGridViewRow slRow = dgOrderDetails.SelectedRows[0];
                    int index = slRow.Index;
                    dataTbl.Rows.RemoveAt(index); 
                    DataRow r = dataTbl.NewRow(); 
                    r.SetField<string>(COLUMN_ORDERID, ord.ID);
                    r.SetField<string>(COLUMN_PROID, ord.ProductID);
                    r.SetField<string>(COLUMN_PRONAME, ord.ProductName);
                    r.SetField<string>(COLUMN_UNIT, ord.UnitPrice);
                    r.SetField<string>(COLUMN_QUANTITY, ord.Qty);
                    r.SetField<string>(COLUMN_DISCOUNT, ord.Discount);
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
        }
        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadProductQueryForForm();
            cbProduct.SelectedIndex = -1;
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dgOrderDetails.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }
            DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                                "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (drs == DialogResult.Yes)
            {
                // 4. get select row
                DataGridViewRow row = dgOrderDetails.SelectedRows[0];
                try
                {
                    // 5.get ID
                    int id = Int32.Parse(row.Cells[COLUMN_PROID].Value.ToString());
                    // 6. Call Delete and see result
                    int rs = SQLDelete(id);
                    if (rs > 0) // success
                    {
                        // delete row on View
                        dataTbl.Rows.RemoveAt(row.Index);
                        // if in update mode, reset form
                        isAdd = true;
                        LoadProductQueryForForm();  // load for cbProduct  
                        ResetForm();
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
                catch (Exception)
                {
                    //
                }
            }
        }
        private void btnShowAll_Click(object sender, EventArgs e)
        {
            RefreshForm();
        }
        private void btnSync_Click(object sender, EventArgs e)
        {
            RefreshForm();
        }
        #endregion

        #region NonQuery
        private int SQLAdd(OrderDetails ord)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertOrderdetail]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                //@orderid,@productid,@unitprice,@qty,@discount
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = orderID;
                cmd.Parameters.Add("productid", SqlDbType.Int).Value = int.Parse(ord.ProductID);
                cmd.Parameters.Add("unitprice", SqlDbType.Money).Value = decimal.Parse(ord.UnitPrice);
                cmd.Parameters.Add("qty", SqlDbType.SmallInt).Value = int.Parse(ord.Qty);
                cmd.Parameters.Add("discount", SqlDbType.Float).Value = double.Parse(ord.Discount);

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
                Console.WriteLine("Add_SqlException: " + e.Message);
                return -1;
            }
            catch (Exception e)
            {
                Console.WriteLine("Add_Exception: " + e.Message);
                return -1;
            }
            finally
            {
                con.Close();
            }
        }
        private int SQLUpdate(OrderDetails ord)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateOrderDetail]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = orderID;
                cmd.Parameters.Add("productid", SqlDbType.Int).Value = int.Parse(ord.ProductID);
                cmd.Parameters.Add("unitprice", SqlDbType.Money).Value = decimal.Parse(ord.UnitPrice);
                cmd.Parameters.Add("qty", SqlDbType.SmallInt).Value = int.Parse(ord.Qty);
                cmd.Parameters.Add("discount", SqlDbType.Decimal).Value = decimal.Parse(ord.Discount);

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
                Console.WriteLine("Update_SqlException: " + e.Message);
                return -1;
            }
            catch (Exception e)
            {
                Console.WriteLine("Update_Exception: " + e.Message);
                return -1;
            }
            finally
            {
                con.Close();
            }
        }
        private int SQLDelete(int proid)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[DeleteOrderDetails]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("ordid", SqlDbType.Int).Value = orderID;
                cmd.Parameters.Add("proid", SqlDbType.Int).Value = proid;

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
        #endregion

        #region Query
        private bool CheckContinueProduct(int proid)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckContinueProduct]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // Add param
                cmd.Parameters.Add("proid", SqlDbType.Int).Value = proid;

                reader = cmd.ExecuteReader();
                return reader.HasRows;
            }
            catch (SqlException)
            {
                return false;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }
        private bool CheckShippedOrder()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckShippedOrder]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // Add param
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = this.orderID;

                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    return true;
                }
                return false;
            }
            catch (SqlException)
            {
                return true;
            }
            catch (Exception)
            {
                return true;
            }
            finally
            {
                con.Close();
            }
        }
        private bool CheckExistOrderDetails(int proid)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckExistOrderDetails]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // Add param
                cmd.Parameters.Add("ordid", SqlDbType.Int).Value = this.orderID;
                cmd.Parameters.Add("proid", SqlDbType.Int).Value = proid;

                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    return true;
                }
                return false;
            }
            catch (SqlException)
            {
                return true;
            }
            catch (Exception)
            {
                return true;
            }
            finally
            {
                con.Close();
            }
        }
        private void SearchQuery(int proid)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByIDOrderDetail]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // Add param
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = this.orderID;
                cmd.Parameters.Add("productid", SqlDbType.Int).Value = proid;

                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    dataTbl.Clear();
                    dataTbl.Load(reader);
                }
                else
                {
                    MessageBox.Show("Not found !",
                            "Result", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }   
            catch (SqlException e)
            {
                Console.WriteLine("SqlException:" + e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("SqlException:" + e.Message);
            }
            finally
            {
                con.Close();
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
                cmd.CommandText = "[getAllSales.orderDetail]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // Add param
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = orderID;
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
            }
            catch (SqlException e)
            {
                Console.WriteLine("LoadAllQuery_SqlException: " + e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("LoadAllQuery_Exception: " + e.Message);
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
        }
        private void LoadProductQueryForSearch()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadProductForOrderDetails]"; // ten procedure [ProductForOrderDetailCont]
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
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
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
        }
        private void LoadProductQueryForForm()
        {
            DataTable data = new DataTable();
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[LoadProductForOrderDetails]";
                //cbProduct
                reader = cmd.ExecuteReader();
                data.Clear();
                data.Load(reader);
                cbProduct.DataSource = data;
                cbProduct.DisplayMember = "Name";
                cbProduct.ValueMember = "ID";
            }
            catch (SqlException e)
            {
                Console.WriteLine("LoadProductQueryForForm_SqlException: " + e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("LoadProductQueryForForm_Exception: " + e.Message);
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

        private void cbProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (isAdd)
            {
                int i = cbProduct.SelectedIndex;
                if (i >= 0)
                {
                    DataRowView row = (DataRowView)cbProduct.SelectedItem;
                    DataRow r = row.Row;
                    decimal unit = r.Field<decimal>("Unitprice");
                    txtPrice.Text = unit + "";
                }
            }
        }

        private void dgOrderDetails_SelectionChanged(object sender, EventArgs e)
        {
            if (dgOrderDetails.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            cbProduct.Enabled = false;
            DataGridViewRow row = dgOrderDetails.SelectedRows[0];
            cbProduct.SelectedValue = row.Cells[COLUMN_PROID].Value;
            txtPrice.Text = row.Cells[COLUMN_UNIT].Value.ToString();
            mtbQTY.Text = row.Cells[COLUMN_QUANTITY].Value.ToString();
            mtxdiscount.Text = row.Cells[COLUMN_DISCOUNT].Value.ToString();
        }

        private void dgOrderDetails_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgOrderDetails.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            cbProduct.Enabled = false;
            DataGridViewRow row = dgOrderDetails.SelectedRows[0];
            cbProduct.SelectedValue = row.Cells[COLUMN_PROID].Value;
            txtPrice.Text = row.Cells[COLUMN_UNIT].Value.ToString();
            mtbQTY.Text = row.Cells[COLUMN_QUANTITY].Value.ToString();
            mtxdiscount.Text = row.Cells[COLUMN_DISCOUNT].Value.ToString();
        }
    }
}
