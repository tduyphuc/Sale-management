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
    public partial class OrdersForm : Form
    {
        private const int COLUMN_ORDERID = 0;
        private const int COLUMN_CUSID = 1;
        private const int COLUMN_CUSNAME = 2;
        private const int COLUMN_EMID = 3;
        private const int COLUMN_EMNAME = 4;
        private const int COLUMN_ORDER_DATE = 5;
        private const int COLUMN_REQUIRED_DATE = 6;
        private const int COLUMN_SHIPPED_DATE = 7;
        private const int COLUMN_SHIPPER_ID = 8;
        private const int COLUMN_SHIPPER_COM_NAME = 9;
        private const int COLUMN_FREIGHT = 10;
        private const int COLUMN_SHIPNAME = 11;
        private const int COLUMN_SHIP_ADDRESS = 12;
        private const int COLUMN_SHIP_CITY = 13;
        private const int COLUMN_SHIP_REGION = 14;
        private const int COLUMN_POSTAL = 15;
        private const int COLUMN_COUNTRY = 16;

        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        private DataTable dataCBCus;
        private DataTable dataCBEm;
        private DataTable dataCBShip;
        public OrdersForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dgOrders.DataSource = dataTbl;
            isAdd = true;
            LoadAllQuery();

            dataCBCus = new DataTable();
            cbCustomerID.DataSource = dataCBCus;
            loadCustomer();

            dataCBEm = new DataTable();
            cbEmployeeID.DataSource = dataCBEm;
            loadEmployee();

            dataCBShip = new DataTable();
            cbShippedID.DataSource = dataCBShip;
            loadShipper();
            loadCustomerforFilter();
            loadProducForFilter();
            
        }

        // check
        private void loadShipper()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadShipperForOrder]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataCBShip.Clear();
                dataCBShip.Load(reader);
                cbShippedID.DisplayMember = "companyname";
                cbShippedID.ValueMember = "shipperid";
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadship: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_loadship: " + ex.Message);
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

        // check
        private void loadEmployee()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadEmployeeForOrder]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataCBEm.Clear();
                dataCBEm.Load(reader);
                cbEmployeeID.DisplayMember = "display";
                cbEmployeeID.ValueMember = "empid";
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadEmployee: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_loadEmployee: " + ex.Message);
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

        // check
        private void loadCustomer()
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadCustomerForOrder]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataCBCus.Clear();
                dataCBCus.Load(reader);
                cbCustomerID.DisplayMember = "display";
                cbCustomerID.ValueMember = "custid";
                cbCustomerID.SelectedIndex = 0;
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadCustomer: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_loadCustomer: " + ex.Message);
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
        private void loadCustomerforFilter()
        {
            DataTable data = new DataTable();
            cbFilter.DataSource = data;
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadCustomerForOrder]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                data.Load(reader);
                cbFilter.DisplayMember = "display";
                cbFilter.ValueMember = "custid";               
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadCustomer: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_loadCustomer: " + ex.Message);
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

        private void loadProducForFilter()
        {
            DataTable data = new DataTable();
            cbProductFilter.DataSource = data;
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[LoadProductForOrders]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                data.Load(reader);
                cbProductFilter.DisplayMember = "Name";
                cbProductFilter.ValueMember = "ID";
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadProduct: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_loadProduct: " + ex.Message);
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

        private EntityClass.Orders FormToOrders()
        {
            EntityClass.Orders ord = new EntityClass.Orders();
            ord.ID = txtOrderID.Text.Trim();
            ord.EmpID = cbEmployeeID.SelectedValue.ToString();
            ord.EmName = cbEmployeeID.Text.Trim();
            ord.OrderDate = dpkOrderDate.Value.ToShortDateString();
            if (ckShipped.Checked)
            {
                ord.ShippedDate = null;
            }
            else
            {
                ord.ShippedDate = dpkShippedDate.Value.ToShortDateString();
            }
            ord.RequiredDate = dpkRequiredDate.Value.ToShortDateString();
            ord.ShipperID = cbShippedID.SelectedValue.ToString();
            ord.ShipComName = cbShippedID.Text.Trim();
            ord.Freight = txtFreight.Text.Trim();
            ord.ShipName = txtShipName.Text.Trim();
            ord.ShipAddress = txtShipAddress.Text.Trim();
            ord.ShipCity = cbCity.Text.Trim();
            ord.ShipCountry = cbCountry.Text.Trim();
            if (ckCus.Checked)
            {
                ord.CusID = null;
                ord.CusName = null;
            }
            else
            {
                ord.CusID = cbCustomerID.SelectedValue.ToString();
                ord.CusName = cbCustomerID.Text.Trim();
            }
            if (cbRegion.SelectedIndex > 0)
            {
                ord.ShipRegion = cbRegion.Text.Trim();
            }
            if (mtxtPostal.Text.Trim().Length > 0)
            {
                ord.ShipPostalCode = mtxtPostal.Text.Trim();
            }
            return ord;
        }

        private void ResetForm()
        {
            isAdd = true;
            btnReset.Enabled = true;
            // clear field
            cbCustomerID.ResetText();
            cbEmployeeID.ResetText();
            txtFreight.Clear();
            txtOrderID.Clear();
            txtShipAddress.Clear();
            txtShipName.Clear();
            cbShippedID.ResetText();
            dpkOrderDate.ResetText();
            dpkRequiredDate.ResetText();
            dpkShippedDate.ResetText();
            mtxtPostal.Clear();
            cbCity.ResetText();
            cbCountry.ResetText();
            cbRegion.ResetText();


            // clear err
            errCountry.Clear();
            errCusName.Clear();
            errEmName.Clear();
            errFreight.Clear();
            errID.Clear();
            errOrderDate.Clear();
            errPostal.Clear();
            errRegion.Clear();
            errRequireDate.Clear();
            errShipAddress.Clear();
            errShipCity.Clear();
            errShipCom.Clear();
            errShipDate.Clear();
            errShipName.Clear();
        }

        #region NonQuery
        private int SQLAdd(EntityClass.Orders ord)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertOrder]";
                cmd.CommandType = CommandType.StoredProcedure;
                if (ckCus.Checked)
                {
                    cmd.Parameters.Add("custid", SqlDbType.Int).Value = (object)DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("custid", SqlDbType.Int).Value = int.Parse(ord.CusID);
                }
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = ord.EmpID;
                cmd.Parameters.Add("orderdate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.OrderDate);
                cmd.Parameters.Add("requireddate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.RequiredDate);
                if (ckShipped.Checked)
                {
                    cmd.Parameters.Add("shippeddate", SqlDbType.DateTime).Value = (object)DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("shippeddate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.ShippedDate);
                }
                cmd.Parameters.Add("shipperid", SqlDbType.Int).Value = ord.ShipperID;
                cmd.Parameters.Add("freight", SqlDbType.Money).Value = Convert.ToDecimal(ord.Freight);
                cmd.Parameters.Add("shipname", SqlDbType.NVarChar).Value = ord.ShipName;
                cmd.Parameters.Add("shipaddress", SqlDbType.NVarChar).Value = ord.ShipAddress;
                cmd.Parameters.Add("shipcity", SqlDbType.NVarChar).Value = ord.ShipCity;
                cmd.Parameters.Add("shipregion", SqlDbType.NVarChar).Value = ord.ShipRegion != null ? ord.ShipRegion : (object)DBNull.Value;
                cmd.Parameters.Add("shippostalcode", SqlDbType.NVarChar).Value = ord.ShipPostalCode != null ? ord.ShipPostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("shipcountry", SqlDbType.NVarChar).Value = ord.ShipCountry;
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

        private int SQLUpdate(EntityClass.Orders ord)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateOrder]";
                cmd.CommandType = CommandType.StoredProcedure;

                if (ckCus.Checked)
                {
                    cmd.Parameters.Add("custid", SqlDbType.Int).Value = (object)DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("custid", SqlDbType.Int).Value = int.Parse(ord.CusID);
                }
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = ord.EmpID;
                cmd.Parameters.Add("orderdate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.OrderDate);
                cmd.Parameters.Add("requireddate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.RequiredDate);
                if (ckShipped.Checked)
                {
                    cmd.Parameters.Add("shippeddate", SqlDbType.DateTime).Value = (object)DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("shippeddate", SqlDbType.DateTime).Value = Convert.ToDateTime(ord.ShippedDate);
                }
                cmd.Parameters.Add("shipperid", SqlDbType.Int).Value = ord.ShipperID;
                cmd.Parameters.Add("freight", SqlDbType.Money).Value = Convert.ToDecimal(ord.Freight);
                cmd.Parameters.Add("shipname", SqlDbType.NVarChar).Value = ord.ShipName;
                cmd.Parameters.Add("shipaddress", SqlDbType.NVarChar).Value = ord.ShipAddress;
                cmd.Parameters.Add("shipcity", SqlDbType.NVarChar).Value = ord.ShipCity;
                cmd.Parameters.Add("shipregion", SqlDbType.NVarChar).Value = ord.ShipRegion != null ? ord.ShipRegion : (object)DBNull.Value;
                cmd.Parameters.Add("shippostalcode", SqlDbType.NVarChar).Value = ord.ShipPostalCode != null ? ord.ShipPostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("shipcountry", SqlDbType.NVarChar).Value = ord.ShipCountry;
                cmd.Parameters.Add("orderid", SqlDbType.NVarChar).Value = ord.ID;

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
                cmd.CommandText = "[DeleteOrder]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = id;

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

        // check
        public void searchByOrderDate()
        {
            // check
            //dgOrders.DataSource = dataTbl;
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchOrderByOrderDate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("From", SqlDbType.DateTime).Value = dpkFrom.Value;
                cmd.Parameters.Add("To", SqlDbType.DateTime).Value = dpkTo.Value;
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
            }
            catch (Exception)
            {
                MessageBox.Show("Something wrong in database loading!");
                return;
            }
            finally
            {
                if (dr != null)
                    dr.Close();
                if (con != null)
                {
                    con.Close();
                }
            }
        }

        // check
        public void searchByRequiredDate()
        {
            dataTbl = new DataTable();
            dgOrders.DataSource = dataTbl;
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchOrderByReqiredDate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("From", SqlDbType.DateTime).Value = dpkFrom.Value;
                cmd.Parameters.Add("To", SqlDbType.DateTime).Value = dpkTo.Value;
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
            }
            catch (Exception)
            {
                MessageBox.Show("Something wrong in database loading!");
                return;
            }
            finally
            {
                if (dr != null)
                    dr.Close();
                if (con != null)
                {
                    con.Close();
                }
            }
        }

        // check
        public void searchByShippedDate()
        {
            //dataTbl = new DataTable();
            //dgOrders.DataSource = dataTbl;
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchOrderByShippedDate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("From", SqlDbType.DateTime).Value = dpkFrom.Value;
                cmd.Parameters.Add("To", SqlDbType.DateTime).Value = dpkTo.Value;
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
            }
            catch (Exception)
            {
                MessageBox.Show("Something wrong in database loading!");
                return;
            }
            finally
            {
                if (dr != null)
                    dr.Close();
                if (con != null)
                {
                    con.Close();
                }
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
                cmd.CommandText = "[getAllSales.Orders]";
                cmd.CommandType = CommandType.StoredProcedure;
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_loadAllQuery: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("SqlException_loadAllQuery: " + ex.Message);
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

        #region Event
        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dgOrders.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }

            DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                                "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (drs == DialogResult.Yes)
            {

                DataGridViewRow row = dgOrders.SelectedRows[0];
                try
                {
                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    if (constrainorderdetail(id))
                    {
                        int rs = SQLDelete(id);
                        if (rs > 0)
                        {
                            dgOrders.Rows.RemoveAt(row.Index);

                            if (!isAdd)
                            {
                                ResetForm();
                            }
                        }
                        else if (rs == 0)
                        {
                            MessageBox.Show("No row was deleted. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
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

        // check
        private bool constrainorderdetail(int id)
        {

            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKOrdersOrderDetails]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("orderid", SqlDbType.Int).Value = id;
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    return true;
                }
                else
                {
                    MessageBox.Show("Cannot delete because this order constrain to orderdetail. " +
                        "Please make sure you must delete all constrain in orderdetail");
                }
            }
            catch (SqlException)
            {
                MessageBox.Show("Something wrong in database loading!");
                return false;
            }
            catch (Exception)
            {
                MessageBox.Show("Something wrong in database loading!");
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

        private void btnReset_Click(object sender, EventArgs e)
        {
            ResetForm();
        }

        private void dgOrders_SelectionChanged(object sender, EventArgs e)
        {
            if (dgOrders.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            DataGridViewRow row = dgOrders.SelectedRows[0];
            txtOrderID.Text = row.Cells[COLUMN_ORDERID].Value.ToString();
            if (row.Cells[COLUMN_CUSNAME].Value.ToString() == "")
            {
                ckCus.Checked = true;
                cbCustomerID.Enabled = false;
            }
            else
            {
                cbCustomerID.SelectedValue = row.Cells[COLUMN_CUSID].Value.ToString();
                ckCus.Checked = false;
                cbCustomerID.Enabled = true;
            }
            //cbCustomerID.SelectedIndex = cbCustomerID.FindString(row.Cells[COLUMN_CUSID].Value.ToString()); 
            cbEmployeeID.SelectedValue = row.Cells[COLUMN_EMID].Value.ToString();
            dpkOrderDate.Value = Convert.ToDateTime(row.Cells[COLUMN_ORDER_DATE].Value.ToString());
            dpkRequiredDate.Value = Convert.ToDateTime(row.Cells[COLUMN_REQUIRED_DATE].Value.ToString());
            if (row.Cells[COLUMN_SHIPPED_DATE].Value.ToString() == "")
            {
                ckShipped.Checked = true;
                dpkShippedDate.Enabled = false;
            }
            else
            {
                dpkShippedDate.Value = Convert.ToDateTime(row.Cells[COLUMN_SHIPPED_DATE].Value.ToString());
                ckShipped.Checked = false;
                dpkShippedDate.Enabled = true;
            }
            cbShippedID.SelectedValue = row.Cells[COLUMN_SHIPPER_ID].Value.ToString();
            txtFreight.Text = row.Cells[COLUMN_FREIGHT].Value.ToString();
            txtShipName.Text = row.Cells[COLUMN_SHIPNAME].Value.ToString();
            txtShipAddress.Text = row.Cells[COLUMN_SHIP_ADDRESS].Value.ToString();
            cbCity.Text = row.Cells[COLUMN_SHIP_CITY].Value.ToString();
            cbRegion.Text = row.Cells[COLUMN_SHIP_REGION].Value.ToString() != null ? row.Cells[COLUMN_SHIP_REGION].Value.ToString() : "";
            mtxtPostal.Text = row.Cells[COLUMN_POSTAL].Value.ToString() != null ? row.Cells[COLUMN_POSTAL].Value.ToString() : "";
            cbCountry.Text = row.Cells[COLUMN_COUNTRY].Value.ToString();

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!validField())
            {
                return;
            }
            EntityClass.Orders ord = FormToOrders();
            if (isAdd)
            {
                int rs = SQLAdd(ord);
                if (rs > 0) // success
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
                int rs = SQLUpdate(ord);
                if (rs > 0)
                {
                    // update UI
                    DataGridViewRow row = dgOrders.SelectedRows[0];
                    int index = row.Index;
                    //dgOrders.DataSource = dataTbl;
                    dataTbl.Rows.RemoveAt(index);
                    DataRow r = dataTbl.NewRow();
                    r.SetField<string>(COLUMN_ORDERID, ord.ID);
                    r.SetField<string>(COLUMN_CUSID, ord.CusID);
                    r.SetField<string>(COLUMN_CUSNAME, ord.CusName);
                    r.SetField<string>(COLUMN_EMID, ord.EmpID);
                    r.SetField<string>(COLUMN_EMNAME, ord.EmName);
                    r.SetField<string>(COLUMN_ORDER_DATE, ord.OrderDate);
                    r.SetField<string>(COLUMN_REQUIRED_DATE, ord.RequiredDate);
                    r.SetField<string>(COLUMN_SHIPPED_DATE, ord.ShippedDate);
                    r.SetField<string>(COLUMN_SHIPPER_ID, ord.ShipperID);
                    r.SetField<string>(COLUMN_SHIPPER_COM_NAME, ord.ShipComName);
                    r.SetField<string>(COLUMN_FREIGHT, ord.Freight);
                    r.SetField<string>(COLUMN_SHIPNAME, ord.ShipName);
                    r.SetField<string>(COLUMN_SHIP_ADDRESS, ord.ShipAddress);
                    r.SetField<string>(COLUMN_SHIP_CITY, ord.ShipCity);
                    r.SetField<string>(COLUMN_SHIP_REGION, ord.ShipRegion);
                    r.SetField<string>(COLUMN_POSTAL, ord.ShipPostalCode);
                    r.SetField<string>(COLUMN_COUNTRY, ord.ShipCountry);
                    dataTbl.Rows.InsertAt(r, index);
                }
                else
                {
                    MessageBox.Show("No row was updated. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void btnShowAll_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
            loadCustomer();
            loadEmployee();
            loadShipper();
            loadCustomerforFilter();
            loadProducForFilter();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
            loadCustomer();
            loadEmployee();
            loadShipper();
            loadCustomerforFilter();
            loadProducForFilter();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (validateFromTo())
            {
                int index = cbSearchby.SelectedIndex;
                switch (index)
                {
                    case 0:
                        searchByOrderDate();
                        break;
                    case 1:
                        searchByRequiredDate();
                        break;
                    case 2:
                        searchByShippedDate();
                        break;
                    default:
                        MessageBox.Show("Please make sure you have already choosen search by !!!");
                        break;
                }
            }
        }

        // check
        private void cbFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[FilterOrderByCustomerName]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("CusID", SqlDbType.Int).Value = int.Parse(cbFilter.SelectedValue.ToString());
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_FilterIndexChange: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_FilterIndexChange: " + ex.Message);
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

        private void btnOrderDetail_Click(object sender, EventArgs e)
        {
            if (dgOrders.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }
            DataGridViewRow row = dgOrders.SelectedRows[0];
            string orderID = row.Cells[0].Value.ToString();
            OrderDetailsForm form = new OrderDetailsForm(int.Parse(orderID));
            form.Owner = this;
            form.ShowDialog();
        }

        private void ckShipped_CheckedChanged(object sender, EventArgs e)
        {
            if (ckShipped.Checked)
            {
                dpkShippedDate.Enabled = false;
            }
            else
            {
                dpkShippedDate.Enabled = true;
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (ckCus.Checked)
            {
                cbCustomerID.SelectedIndex = -1;
                cbCustomerID.Enabled = false;

            }
            else
            {
                cbCustomerID.Enabled = true;
                cbCustomerID.SelectedIndex = 0;
            }



        }

        // check
        private void btnCheck_Click(object sender, EventArgs e)
        {
            if (!validMoney())
            {
                MessageBox.Show("Wrong input!!!");
                return;
            }


            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchOrderByPrice]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("From", SqlDbType.Money).Value = Convert.ToDecimal(txtFromMoney.Text.Trim());
                cmd.Parameters.Add("To", SqlDbType.Money).Value = Convert.ToDecimal(txtToMoney.Text.Trim());
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_Check: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_Check: " + ex.Message);
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
        private bool validEmployeeName()
        {
            if (cbEmployeeID.SelectedIndex < 0)
            {
                errEmName.SetError(cbCountry, "Please pick a Employee");
                return false;
            }
            errEmName.Clear();
            return true;
        }

        private bool validShipComName()
        {

            if (cbShippedID.SelectedIndex < 0)
            {
                errShipCom.SetError(cbCountry, "Please pick a Shipper Company");
                return false;
            }
            errShipCom.Clear();
            return true;
        }

        private bool validFreight()
        {
            string txt = txtFreight.Text.Trim();
            if (txt.Length == 0)
            {
                errFreight.SetError(txtFreight, "Empty field");
                return false;
            }
            try
            {
                float a = float.Parse(txt);
                if(a < 0)
                {
                    errFreight.SetError(txtFreight, "Must be bigger or equal 0");
                    return false;
                }
            }
            catch (Exception)
            {
                errFreight.SetError(txtFreight, "Wrong input");
                return false;
            }
            errFreight.Clear();
            return true;
        }

        private bool validshipName()
        {
            string txt = txtShipName.Text.Trim();
            if (txt.Length == 0)
            {
                errShipName.SetError(txtShipName, "Empty field");
                return false;
            }
            errShipName.Clear();
            return true;
        }

        private bool validAddress()
        {
            string txt = txtShipName.Text.Trim();
            if (txt.Length == 0)
            {
                errShipAddress.SetError(txtShipAddress, "Empty field");
                return false;
            }
            errShipAddress.Clear();
            return true;
        }

        private bool validCountry()
        {
            if (cbCountry.SelectedIndex < 0)
            {
                errCountry.SetError(cbCountry, "Please pick a Country");
                return false;
            }
            errCountry.Clear();
            return true;
        }

        private bool validCity()
        {
            if (cbCity.SelectedIndex < 0)
            {
                errShipCity.SetError(cbCity, "Please pick a City");
                return false;
            }
            errShipCity.Clear();
            return true;
        }

        private bool validShippesDate()
        {
            if (!ckShipped.Checked)
            {
                DateTime orderdate = dpkOrderDate.Value;
                DateTime required = dpkRequiredDate.Value;
                DateTime shippedDate = dpkShippedDate.Value;
                if (orderdate.CompareTo(shippedDate) > 0)
                {
                    errShipDate.SetError(dpkShippedDate, "Shippeddate < orderDate");
                    return false;
                }
                errShipDate.Clear();
                return true;
            }
            return true;
        }

        private bool validRequiredDate()
        {
            DateTime orderdate = dpkOrderDate.Value;
            DateTime required = dpkRequiredDate.Value;

            if (orderdate.CompareTo(required) > 0)
            {
                errRequireDate.SetError(dpkRequiredDate, "requireDate < orderDate");
                return false;
            }
            errRequireDate.Clear();
            return true;
        }

        private bool validateFromTo()
        {
            DateTime from = dpkFrom.Value;
            DateTime to = dpkTo.Value;
            if (from.CompareTo(to) >= 0)
            {
                MessageBox.Show("Fromdate must be earlier than Todate");
                return false;
            }
            return true;
        }

        private bool validPostal()
        {
            // Postal can be null
            if (String.IsNullOrEmpty(mtxtPostal.Text.Trim()))
            {
                errPostal.Clear();
                return true;
            }
            if (!mtxtPostal.MaskCompleted)
            {
                errPostal.SetError(mtxtPostal, "Postal number: xxxxx");
                return false;
            }
            errPostal.Clear();
            return true;
        }

        private bool validField()
        {
            bool emp = validEmployeeName();
            bool shipcom = validShipComName();
            bool freight = validFreight();
            bool address = validAddress();
            bool city = validCity();
            bool shipname = validshipName();
            bool country = validCountry();
            bool shippeddate = validShippesDate();
            bool requireDate = validRequiredDate();
            bool postal = validPostal();
            return emp && shipcom && freight && address && city && shipname && country && shippeddate && requireDate && postal;
        }
        #endregion

        private bool validMoney()
        {
            try
            {
                float from = float.Parse(txtFromMoney.Text.Trim());
                float to = float.Parse(txtToMoney.Text.Trim());
                if(from < 0 || to < 0)
                {
                    return false;
                }
                if(from.CompareTo(to) < 0)
                {
                    return true;
                }
            }
            catch (Exception e)
            {
           
                return false;
            }
      
            return false;
        }

        private void cbProductFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByProductForOrders]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("proid", SqlDbType.Int).Value = int.Parse(cbProductFilter.SelectedValue.ToString());
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_FilterProductIndexChange: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception_FilterProductIndexChange: " + ex.Message);
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

        private void dgOrders_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgOrders.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            DataGridViewRow row = dgOrders.SelectedRows[0];
            txtOrderID.Text = row.Cells[COLUMN_ORDERID].Value.ToString();
            if (row.Cells[COLUMN_CUSNAME].Value.ToString() == "")
            {
                ckCus.Checked = true;
                cbCustomerID.Enabled = false;
            }
            else
            {
                cbCustomerID.SelectedValue = row.Cells[COLUMN_CUSID].Value.ToString();
                ckCus.Checked = false;
                cbCustomerID.Enabled = true;
            }
            //cbCustomerID.SelectedIndex = cbCustomerID.FindString(row.Cells[COLUMN_CUSID].Value.ToString()); 
            cbEmployeeID.SelectedValue = row.Cells[COLUMN_EMID].Value.ToString();
            dpkOrderDate.Value = Convert.ToDateTime(row.Cells[COLUMN_ORDER_DATE].Value.ToString());
            dpkRequiredDate.Value = Convert.ToDateTime(row.Cells[COLUMN_REQUIRED_DATE].Value.ToString());
            if (row.Cells[COLUMN_SHIPPED_DATE].Value.ToString() == "")
            {
                ckShipped.Checked = true;
                dpkShippedDate.Enabled = false;
            }
            else
            {
                dpkShippedDate.Value = Convert.ToDateTime(row.Cells[COLUMN_SHIPPED_DATE].Value.ToString());
                ckShipped.Checked = false;
                dpkShippedDate.Enabled = true;
            }
            cbShippedID.SelectedValue = row.Cells[COLUMN_SHIPPER_ID].Value.ToString();
            txtFreight.Text = row.Cells[COLUMN_FREIGHT].Value.ToString();
            txtShipName.Text = row.Cells[COLUMN_SHIPNAME].Value.ToString();
            txtShipAddress.Text = row.Cells[COLUMN_SHIP_ADDRESS].Value.ToString();
            cbCity.Text = row.Cells[COLUMN_SHIP_CITY].Value.ToString();
            cbRegion.Text = row.Cells[COLUMN_SHIP_REGION].Value.ToString() != null ? row.Cells[COLUMN_SHIP_REGION].Value.ToString() : "";
            mtxtPostal.Text = row.Cells[COLUMN_POSTAL].Value.ToString() != null ? row.Cells[COLUMN_POSTAL].Value.ToString() : "";
            cbCountry.Text = row.Cells[COLUMN_COUNTRY].Value.ToString();
        }
    }
}
