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
    public partial class SupplierForm : Form
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
        public SupplierForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dgSupplier.DataSource = dataTbl;
            isAdd = true;
            LoadAllQuery();
        }

        private Suppliers FormToSup()
        {
            Suppliers sup = new Suppliers();
            sup.ID = txtID.Text.Trim();
            sup.CompanyName = txtCompanyName.Text.Trim();
            sup.ContactName = txtContactName.Text.Trim();
            sup.ContactTitle = txtContactTitle.Text.Trim();
            sup.Address = txtAddress.Text.Trim();
            sup.City = cbCity.SelectedItem.ToString();
            if (cbRegion.SelectedIndex > 0)
            {
                sup.Region = cbRegion.SelectedItem.ToString();
            }
            if (mtxtPostal.Text.Trim().Length > 0)
            {
                sup.PostalCode = mtxtPostal.Text.Trim();
            }
            sup.Country = cbCountry.SelectedItem.ToString();
            sup.Phone = mtbPhone.Text.Trim();
            if (mtbFax.Text.Trim().Length > 1)
            {
                sup.Fax = mtbFax.Text.Trim();
            }
            return sup;
        }

        private void ResetForm()
        {
            isAdd = true;
            btnReset.Enabled = true;
            // 
            txtCompanyName.Clear();
            txtContactName.Clear();
            txtContactTitle.Clear();
            txtID.Clear();
            txtAddress.Clear();
            mtbFax.Clear();
            mtbPhone.Clear();
            mtxtPostal.Clear();
            cbCity.SelectedIndex = -1;
            cbCountry.SelectedIndex = -1;
            cbRegion.SelectedIndex = -1;

            errAddress.Clear();
            errCity.Clear();
            errCompanyname.Clear();
            errContactName.Clear();
            errCountry.Clear();
            errFax.Clear();
            errPhone.Clear();
            errPostalcode.Clear();
            errRegion.Clear();
            errTitle.Clear();
        }

        #region Validation
        private bool validCompanyName()
        {
            //
            string txt = txtCompanyName.Text.Trim();
            if (txt.Length == 0)
            {
                errCompanyname.SetError(txtCompanyName, "Empty fieldd !");
                return false;
            }
            errCompanyname.Clear();
            return true;
        }

        private bool validContactName()
        {
            string txt = txtContactName.Text.Trim();
            if (txt.Length == 0)
            {
                errContactName.SetError(txtContactName, "Empty field !");
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
                errTitle.SetError(txtContactTitle, "Empty field !");
                return false;
            }
            errTitle.Clear();
            return true;
        }

        private bool validAddress()
        {
            string txt = txtAddress.Text.Trim();
            if (txt.Length == 0)
            {
                errAddress.SetError(txtAddress, "Empty field !");
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
            if (String.IsNullOrEmpty(mtxtPostal.Text))
            {
                errPostalcode.Clear();
                return true;
            }
            if (!mtxtPostal.MaskCompleted)
            {
                errPostalcode.SetError(mtxtPostal, "Postal number: xxxxx");
                return false;
            }
            errPostalcode.Clear();
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


        #endregion

        #region NonQuery
        private int SQLAdd(Suppliers sup)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertSuppliers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = sup.CompanyName;
                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = sup.ContactName;
                cmd.Parameters.Add("contacttitle", SqlDbType.NVarChar).Value = sup.ContactTitle;
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = sup.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = sup.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = sup.Region != null ? sup.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = sup.PostalCode != null ? sup.PostalCode : (object)DBNull.Value; ;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = sup.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = sup.Phone;
                cmd.Parameters.Add("fax", SqlDbType.NVarChar).Value = sup.Fax != null ? sup.Fax : (object)DBNull.Value;
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

        private int SQLUpdate(Suppliers sup)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateSuppliers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("supplierid", SqlDbType.Int).Value = int.Parse(sup.ID);
                cmd.Parameters.Add("companyname", SqlDbType.NVarChar).Value = sup.CompanyName;
                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = sup.ContactName;
                cmd.Parameters.Add("contacttitle", SqlDbType.NVarChar).Value = sup.ContactTitle;
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = sup.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = sup.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = sup.Region != null ? sup.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = sup.PostalCode != null ? sup.PostalCode : (object)DBNull.Value; ;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = sup.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = sup.Phone;
                cmd.Parameters.Add("fax", SqlDbType.NVarChar).Value = sup.Fax != null ? sup.Fax : (object)DBNull.Value;
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
                cmd.CommandText = "[DeleteSuppliers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("supplierid", SqlDbType.Int).Value = id;
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
                cmd.CommandText = "[getAllPro.Suppliers]"; // ten procedure
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

        private bool ContrainsForSuppliers(int id)
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKSupplierProducts]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("supplierid", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows)
                {
                    return true;
                }
                MessageBox.Show("Please make sure no constrain in Product table!!!");
                // end params
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
                if (dr != null)
                {
                    dr.Close();
                }
                con.Close();
            }
            return false;
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
                cmd.CommandText = "[SearchByCompanyNameSuppliers]"; // ten procedure
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

        public void SearchByContactName()
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByContactNameSuppliers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("contactname", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
                // end params
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
        #endregion

        #region Event
        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
        }
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!validField())
            {
                return;
            }
            Suppliers sup = FormToSup();
            if (isAdd)
            {
                int rs = SQLAdd(sup);
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
                int rs = SQLUpdate(sup);
                if (rs > 0)
                {
                    DataGridViewRow row = dgSupplier.SelectedRows[0];
                    row.Cells[COLUMN_COMPANY_NAME].Value = sup.CompanyName;
                    row.Cells[COLUMN_CONTACT_NAME].Value = sup.ContactName;
                    row.Cells[COLUMN_CONTACT_TITLE].Value = sup.ContactTitle;
                    row.Cells[COLUMN_ADDRESS].Value = sup.Address;
                    row.Cells[COLUMN_CITY].Value = sup.City;
                    row.Cells[COLUMN_REGION].Value = sup.Region;
                    row.Cells[COLUMN_POSTAL].Value = sup.PostalCode;
                    row.Cells[COLUMN_COUNTRY].Value = sup.Country;
                    row.Cells[COLUMN_PHONE].Value = sup.Phone;
                    row.Cells[COLUMN_FAX].Value = sup.Fax;
                }
                else
                {
                    MessageBox.Show("No row was updated. Tips: Try to sync. ",
                        "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void btnReset_Click(object sender, EventArgs e)
        {
            ResetForm();
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dgSupplier.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }
            DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (drs == DialogResult.Yes)
            {
                DataGridViewRow row = dgSupplier.SelectedRows[0];
                try
                {
                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    if (ContrainsForSuppliers(id))
                    {        
                        int rs = SQLDelete(id);
                        if (rs > 0)
                        {
                            dgSupplier.Rows.RemoveAt(row.Index);
                            if (!isAdd)
                            {
                                ResetForm();
                            }
                        }
                    else if (rs == 0)
                    {
                        MessageBox.Show("Some error has occur. Please try again later",
                            "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        private void btnShowAll_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }
        private void btnSync_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }
        private void dgSupplier_SelectionChanged(object sender, EventArgs e)
        {
            if (dgSupplier.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            DataGridViewRow row = dgSupplier.SelectedRows[0];
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
        private void btnNew_Click_1(object sender, EventArgs e)
        {
            ResetForm();
        }
        private void cbFilterCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByCountrySuppliers]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = cbFilterCountry.SelectedItem.ToString();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
                // end params
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_FilterCountry" + ex.Message);
                return;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_FilterCountry" + es.Message);
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
        private void btnSearch_Click(object sender, EventArgs e)
        {
            string txt = txtSearch.Text.Trim();
            if(txt.Length < 1)
            {
                MessageBox.Show("Please fill in search bar",
                                "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        private void dgSupplier_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgSupplier.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            btnReset.Enabled = false;
            DataGridViewRow row = dgSupplier.SelectedRows[0];
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
    }

}
