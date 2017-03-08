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
    public partial class ShipperForm : Form
    {
        private const int COLUMN_ID = 0;
        private const int COLUMN_COMPANY_NAME = 1;
        private const int COLUMN_PHONE = 2;

        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;

        public ShipperForm()
        {

            InitializeComponent();
            dataTbl = new DataTable();
            dgShippers.DataSource = dataTbl;
            isAdd = true;
            LoadAllQuery();
        }

        private Shippers FormToShip()
        {
            Shippers ship = new Shippers();
            ship.ID = txtShipperID.Text.Trim();
            ship.CompanyName = txtCompanyName.Text.Trim();
            ship.Phone = mtbPhone.Text.Trim();
            return ship;

        }

        private void ResetForm()
        {
            isAdd = true;
            // 
            txtCompanyName.Clear();
            mtbPhone.Clear();
            txtShipperID.Clear();
            //
            errName.Clear();
            errPhone.Clear();
        }


        #region ValidField
        public bool validCompanyName()
        {
            if (txtCompanyName.Text.Trim().Length == 0)
            {
                errName.SetError(txtCompanyName, "Empty field");
                return false;
            }
            errName.Clear();
            return true;
        }

        public bool validPhone()
        {
            if (!mtbPhone.MaskCompleted)
            {
                errPhone.SetError(mtbPhone, "Wrong input!!!");
                return false;
            }
            errPhone.Clear();
            return true;
        }

        public bool validation()
        {
            bool name = validCompanyName();
            bool des = validPhone();
            return name && des;
        } 
        #endregion

        #region NonQuery
        private int SQLAdd(Shippers ship)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertShippers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = ship.CompanyName;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = ship.Phone;
                // end params
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

        private int SQLUpdate(Shippers ship)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateShippers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("shipperid", SqlDbType.Int).Value = int.Parse(ship.ID);
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = ship.CompanyName;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = ship.Phone;
                // end params

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
                cmd.CommandText = "[DeleteShippers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("shipperid", SqlDbType.Int).Value = id;
                // end params

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
                cmd.CommandText = "[getAllSales.Shippers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
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
        public void SearchByCompanyName()
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchCompanyNameForShippers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
                // end params
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_SearchByCompanyName" + ex.Message);
                return;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_SearchByCompanyName" + es.Message);
                return;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                con.Close();
            }
        }
        public void SearchByPhone()
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByPhoneShipper]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
                // end params
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_SearchByPhone" + ex.Message);
                return;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_SearchByPhone" + es.Message);
                return;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                con.Close();
            }
        }
        #endregion

        #region Event
        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
        }
        private void dgShippers_SelectionChanged(object sender, EventArgs e)
        {
            if (dgShippers.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            DataGridViewRow row = dgShippers.SelectedRows[0];
            txtShipperID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCompanyName.Text = row.Cells[COLUMN_COMPANY_NAME].Value.ToString();
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (!isAdd)
            {
                return;
            }
            if (!validation())
            {
                return;
            }
            Shippers sh = FormToShip();
            if (isAdd)
            {
                int rs = SQLAdd(sh);
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


        }
        private void btnShowAll_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            // 1. check if user select a row
            if (dgShippers.SelectedRows.Count == 0)
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
                DataGridViewRow row = dgShippers.SelectedRows[0];
                try
                {
                    // 5.get ID
                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    // 6. Call Delete and see result
                    if (CheckConstrainforShipper(id))
                    {
                        int rs = SQLDelete(id);
                        if (rs > 0) // success
                        {
                            // delete row on View
                            dgShippers.Rows.RemoveAt(row.Index);
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
        //check
        private bool CheckConstrainforShipper(int id)
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKShipperOrder]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("shipperid", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows)
                {
                    return true;
                }
                MessageBox.Show("Please make sure no contrain in order table!!!");
                // end params
            }
            catch (SqlException ex)
            {              
                return false;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_SearchByCompanyName" + es.Message);
                return false;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                con.Close();
            }
            return false;
        }
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (isAdd)
            {
                return;
            }
            if (!validation())
            {
                return;
            }
            if (!isAdd)
            {

                Shippers sh = FormToShip();
                int rs = SQLUpdate(sh);
                if (rs > 0)
                {
                    // update UI
                    DataGridViewRow row = dgShippers.SelectedRows[0];
                    row.Cells[COLUMN_COMPANY_NAME].Value = sh.CompanyName;
                    row.Cells[COLUMN_PHONE].Value = sh.Phone;

                }
                else
                {
                    MessageBox.Show("No row was updated. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }      
        private void btnSync_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }
        private void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtSearch.Text.ToString().Trim().Length == 0)
            {
                return;
            }
            int pos = cbSearchBy.SelectedIndex;
            switch (pos)
            {
                case 0:
                    SearchByCompanyName();
                    break;
                case 1:
                    SearchByPhone();
                    break;
                default:
                    MessageBox.Show("Please make sure you already choose type of search !!");
                    break;
            }
        }
        #endregion

        private void dgShippers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgShippers.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            DataGridViewRow row = dgShippers.SelectedRows[0];
            txtShipperID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCompanyName.Text = row.Cells[COLUMN_COMPANY_NAME].Value.ToString();
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
        }
    }
}
