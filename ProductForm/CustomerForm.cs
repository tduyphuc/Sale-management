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
    public partial class CustomerForm : Form
    {
        private const int COLUMN_ID = 0;
        private const int COLUMN_COMPANY_NAME = 1;
        private const int COLUMN_CONTACT_NAME = 2;
        private const int COLUMN_CONTACT_TITLE = 3;
        private const int COLUMN_ADDRESS = 4;
        private const int COLUMN_CITY = 5;
        private const int COLUMN_REGION = 6;
        private const int COLUMN_POSTAL = 7;
        private const int COLUMN_COUNTRY = 8;
        private const int COLUMN_PHONE = 9;
        private const int COLUMN_FAX = 10;

        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        public CustomerForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dgCustomer.DataSource = dataTbl;
            isAdd = true;
            LoadAllQuery();
        }

        private Customers FormToCus()
        {
            Customers cus = new Customers();
            cus.ID = txtID.Text.Trim();
            cus.CompanyName = txtCompanyName.Text.Trim();
            cus.ContactName = txtContactName.Text.Trim();
            cus.ContactTitle = txtContactTitle.Text.Trim();
            cus.Address = txtAddress.Text.Trim();
            cus.City = cbCity.SelectedItem.ToString();
            if (cbRegion.SelectedIndex > 0)
            {
                cus.Region = cbRegion.SelectedItem.ToString();
            }
            if (mtxtPostal.Text.Trim().Length > 0)
            {
                cus.PostalCode = mtxtPostal.Text.Trim();
            }
            cus.Country = cbCountry.SelectedItem.ToString();
            cus.Phone = mtbPhone.Text.Trim();
            if (mtbFax.Text.Trim().Length > 1)
            {
                cus.Fax = mtbFax.Text.Trim();
            }
            return cus;
        }

        #region EventMethod
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!validField())
            {
                return;
            }
            Customers cus = FormToCus();
            if (isAdd)
            {
                int rs = SQLAdd(cus);
                if (rs > 0)
                {
                    ResetForm();
                    LoadAllQuery();
                }
                else
                {
                    MessageBox.Show("No row was added. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                int rs = SQLUpdate(cus);
                if (rs > 0)
                {
                    DataGridViewRow row = dgCustomer.SelectedRows[0];
                    row.Cells[COLUMN_COMPANY_NAME].Value = cus.CompanyName;
                    row.Cells[COLUMN_CONTACT_NAME].Value = cus.ContactName;
                    row.Cells[COLUMN_CONTACT_TITLE].Value = cus.ContactTitle;
                    row.Cells[COLUMN_ADDRESS].Value = cus.Address;
                    row.Cells[COLUMN_CITY].Value = cus.City;
                    row.Cells[COLUMN_REGION].Value = cus.Region;
                    row.Cells[COLUMN_POSTAL].Value = cus.PostalCode;
                    row.Cells[COLUMN_COUNTRY].Value = cus.Country;
                    row.Cells[COLUMN_PHONE].Value = cus.Phone;
                    row.Cells[COLUMN_FAX].Value = cus.Fax;
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

            if (dgCustomer.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }

            DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                                "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (drs == DialogResult.Yes)
            {

                DataGridViewRow row = dgCustomer.SelectedRows[0];
                try
                {

                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    ConstrainCustomerForOrder(id);
                    int rs = SQLDelete(id);
                    if (rs > 0)
                    {

                        dgCustomer.Rows.RemoveAt(row.Index);

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
            if (!validSearchField())
            {
                MessageBox.Show("Please fill Search Field",
                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int pos = cbSearchBy.SelectedIndex;
            
            switch (pos)
            {
                case 0:
                    SearchByCompanyName();
                    break;
                case 1:
                    SearchByContactName();
                    break;
                default:
                    MessageBox.Show("Please make sure you already choose type of search !!");
                    break;
            }
        }

        private void btnSync_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dgCustomer.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            // disable reset btn
            isAdd = false;
            btnReset.Enabled = false;
            // load to form
            DataGridViewRow row = dgCustomer.SelectedRows[0];
            txtID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCompanyName.Text = row.Cells[COLUMN_COMPANY_NAME].Value.ToString();
            txtContactName.Text = row.Cells[COLUMN_CONTACT_NAME].Value.ToString();
            txtContactTitle.Text = row.Cells[COLUMN_CONTACT_TITLE].Value.ToString();
            txtAddress.Text = row.Cells[COLUMN_ADDRESS].Value.ToString();
            cbCity.SelectedIndex = cbCity.FindString(row.Cells[COLUMN_CITY].Value.ToString());
            cbRegion.SelectedIndex = row.Cells[COLUMN_REGION].Value != null ? cbRegion.FindString(row.Cells[COLUMN_REGION].Value.ToString()) : 0;
            mtxtPostal.Text = row.Cells[COLUMN_POSTAL].Value.ToString();
            cbCountry.SelectedIndex = cbCountry.FindString(row.Cells[COLUMN_COUNTRY].Value.ToString());
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
            mtbFax.Text = row.Cells[COLUMN_FAX].Value.ToString();

        }
        #endregion

        #region ValidField
        private bool validCompanyName()
        {
            string txt = txtCompanyName.Text.Trim();
            if (txt.Length == 0)
            {
                errCompanyName.SetError(txtCompanyName, "Empty field");
                return false;
            }
            errCompanyName.Clear();
            return true;
        }

        private bool validContactName()
        {
            string txt = txtContactName.Text.Trim();
            if (txt.Length == 0)
            {
                errContactName.SetError(txtContactName, "Empty field");
                return false;
            }
            errContactName.Clear();
            return true;
        }

        private bool validContactTitle()
        {
            string txt = txtContactTitle.Text.Trim();
            if (txt.Length == 0)
            {
                errContactTitle.SetError(txtContactTitle, "Empty field");
                return false;
            }
            errContactTitle.Clear();
            return true;
        }

        private bool validAddress()
        {
            string txt = txtAddress.Text.Trim();
            if (txt.Length == 0)
            {
                errAddress.SetError(txtAddress, "Empty field");
                return false;
            }
            errAddress.Clear();
            return true;
        }

        private bool validCity()
        {
            if (cbCity.SelectedIndex < 0)
            {
                errCity.SetError(cbCity, "Please pick a city");
                return false;
            }
            errCity.Clear();
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

        private bool validPostal()
        {
            // Postal can be null
            if (String.IsNullOrEmpty(mtxtPostal.Text.Trim()))
            {
                errPostalCode.Clear();
                return true;
            }
            if (!mtxtPostal.MaskCompleted)
            {
                errPostalCode.SetError(mtxtPostal, "Postal number: xxxxx");
                return false;
            }
            errPostalCode.Clear();
            return true;
        }

        private bool validPhone()
        {
            if (!mtbPhone.MaskCompleted)
            {
                errPhone.SetError(mtbPhone, "Phone number: xxx-xxxxx");
                return false;
            }
            errPhone.Clear();
            return true;
        }

        private bool validFax()
        {
            // fax can be null
            if (mtbFax.Text.Trim().Length == 1)
            {
                errFax.Clear();
                return true;
            }
            if (!mtbFax.MaskCompleted)
            {
                errFax.SetError(mtbFax, "Fax number: xxx-xxxxx");
                return false;
            }
            errFax.Clear();
            return true;
        }

        private bool validField()
        {
            bool com = validCompanyName();
            bool contactName = validContactName();
            bool contactTitle = validContactTitle();
            bool address = validAddress();
            bool city = validCity();
            bool postal = validPostal();
            bool country = validCountry();
            bool phone = validPhone();
            bool fax = validFax();
            return com && contactName && contactTitle && address && city && postal && country && phone && fax;
        }
        
        private bool validSearchField()
        {
            if (txtSearch.Text.Trim().Length == 0)
            {
                return false;
            }
            return true;
        }
        #endregion

        #region NonQuery
        private int SQLAdd(Customers cus)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertCustomers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = cus.CompanyName;
                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = cus.ContactName;
                cmd.Parameters.Add("contacttitle", SqlDbType.NVarChar).Value = cus.ContactTitle;
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = cus.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = cus.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = cus.Region != null ? cus.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = cus.PostalCode != null ? cus.PostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = cus.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = cus.Phone;
                cmd.Parameters.Add("fax", SqlDbType.NVarChar).Value = cus.Fax != null ? cus.Fax : (object)DBNull.Value;

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

        private int SQLUpdate(Customers cus)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateCustomers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("cusid", SqlDbType.NVarChar).Value = cus.ID;
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = cus.CompanyName;
                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = cus.ContactName;
                cmd.Parameters.Add("contacttitle", SqlDbType.NVarChar).Value = cus.ContactTitle;
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = cus.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = cus.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = cus.Region != null ? cus.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = cus.PostalCode != null ? cus.PostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = cus.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = cus.Phone;
                cmd.Parameters.Add("fax", SqlDbType.NVarChar).Value = cus.Fax != null ? cus.Fax : (object)DBNull.Value;

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
                cmd.CommandText = "[DeleteCustomers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("cusid", SqlDbType.VarChar).Value = id;

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
        #endregion

        #region UIMethod
        private void ResetForm()
        {
            txtID.Clear();
            txtCompanyName.Clear();
            txtContactName.Clear();
            txtContactTitle.Clear();
            txtAddress.Clear();
            cbCity.SelectedIndex = -1;
            cbCountry.SelectedIndex = -1;
            cbRegion.SelectedIndex = -1;
            mtbFax.Clear();
            mtbPhone.Clear();
            mtxtPostal.Clear();
            isAdd = true;
            btnReset.Enabled = true;

            // clear err
            errID.Clear();
            errCompanyName.Clear();
            errContactName.Clear();
            errContactTitle.Clear();
            errContactName.Clear();
            errAddress.Clear();
            errCity.Clear();
            errCountry.Clear();
            errRegion.Clear();
            errPhone.Clear();
            errFax.Clear();
        }
        #endregion

        #region Query
        private void SearchQuery()
        {
            string txt = txtSearch.Text.Trim();
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
                cmd.CommandText = "[getAllSales.Customer]";
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                MessageBox.Show("SqlException_LoadAllQuery" + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception_LoadAllQuery" + ex.Message);
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

        private bool ConstrainCustomerForOrder(int id)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKCustomerOrder]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("cusid", SqlDbType.Int).Value = id;
                reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                {
                    return true;
                }
                MessageBox.Show("Please make sure no constrain in Order table!!!");
            }
            catch (SqlException ex)
            {
                MessageBox.Show("SqlException_Constrain" + ex.Message);
                return false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception_Constrain" + ex.Message);
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

        private void SearchByContactName()
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByContactNameCustomers]";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
              
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_SearchByContactName" + ex.Message);
                return;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_SearchByContactName" + es.Message);
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

        private void SearchByCompanyName()
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByCompanynameCustomer]";
                cmd.CommandType = CommandType.StoredProcedure;       
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);               
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
        #endregion

        private void dgCustomer_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgCustomer.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            // disable reset btn
            isAdd = false;
            btnReset.Enabled = false;
            // load to form
            DataGridViewRow row = dgCustomer.SelectedRows[0];
            txtID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCompanyName.Text = row.Cells[COLUMN_COMPANY_NAME].Value.ToString();
            txtContactName.Text = row.Cells[COLUMN_CONTACT_NAME].Value.ToString();
            txtContactTitle.Text = row.Cells[COLUMN_CONTACT_TITLE].Value.ToString();
            txtAddress.Text = row.Cells[COLUMN_ADDRESS].Value.ToString();
            cbCity.SelectedIndex = cbCity.FindString(row.Cells[COLUMN_CITY].Value.ToString());
            cbRegion.SelectedIndex = row.Cells[COLUMN_REGION].Value != null ? cbRegion.FindString(row.Cells[COLUMN_REGION].Value.ToString()) : 0;
            mtxtPostal.Text = row.Cells[COLUMN_POSTAL].Value.ToString();
            cbCountry.SelectedIndex = cbCountry.FindString(row.Cells[COLUMN_COUNTRY].Value.ToString());
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
            mtbFax.Text = row.Cells[COLUMN_FAX].Value.ToString();
        }

        private void cbFilterCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByCountryCustomers]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = cbFilterCountry.Text.ToString();               
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);

            }
            catch (SqlException ex)
            {
                MessageBox.Show("SqlException_Filter" + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception_Filter" + ex.Message);
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
}
