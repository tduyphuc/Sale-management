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
    public partial class EmployeeForm : Form, INotifyUpdate
    {
        private const int COLUMN_EMID = 0;
        private const int COLUMN_LASTNAME = 1;
        private const int COLUMN_FIRSTNAME = 2;
        private const int COLUMN_TITLE = 3;
        private const int COLUMN_TITCOUR = 4;
        private const int COLUMN_BIRTH_DATE = 5;
        private const int COLUMN_HIRE_DATE = 6;
        private const int COLUMN_ADDRESS = 7;
        private const int COLUMN_CITY = 8;
        private const int COLUMN_REGION = 9;
        private const int COLUMN_POSTAL = 10;
        private const int COLUMN_COUNTRY = 11;
        private const int COLUMN_PHONE = 12;
        private const int COLUMN_MNGID = 13;
        private const int COLUMN_MNGNAME = 14;

        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        private DataTable dataCbMng;

        public EmployeeForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dataCbMng = new DataTable();
            dgEmployees.DataSource = dataTbl;
            cbMngName.DataSource = dataCbMng;
            RefreshForm();
        }

        private void RefreshForm()
        {
            LoadAllQuery();
            LoadAllManager(-1);
            ResetForm();
        }

        public Employees FormToEmployees()
        {
            Employees em = new Employees();
            // code here
            em.ID = txtEmID.Text.Trim();
            em.LastName = txtLastName.Text.Trim();
            em.FirstName = txtFirstName.Text.Trim();
            em.Title = cbTitle.SelectedItem.ToString();
            em.TitleOfCourtesy = cbCourtesy.SelectedItem.ToString();
            em.BirthDate = dpkBirthdate.Text;
            em.HireDate = dpkHireDate.Text;
            em.Address = txtAddress.Text.Trim();
            em.City = cbCity.SelectedItem.ToString();
            if(cbRegion.SelectedIndex >= 0)
            {
                em.Region = cbRegion.SelectedItem.ToString();
            }
            string postal = mtbPostalCode.Text.Trim();
            if (postal.Length > 0)
            {
                em.PostalCode = postal;
            }
            em.Country = cbCountry.SelectedItem.ToString();
            em.Phone = mtbPhone.Text;
            if (!chbNoMng.Checked)
            {
                if (cbMngName.SelectedValue != null)
                {
                    em.MngID = cbMngName.SelectedValue.ToString();
                    em.MngName = cbMngName.SelectedItem.ToString();
                }
            }       
            return em;
        }

        private void ResetForm()
        {
            // add mode
            isAdd = true;
            // clear field
            txtEmID.Clear();
            txtLastName.Clear();
            txtFirstName.Clear();
            cbTitle.SelectedIndex = -1;
            cbCourtesy.SelectedIndex = -1;
            dpkBirthdate.Value = DateTime.Now;
            dpkHireDate.Value = DateTime.Now;
            txtAddress.Clear();
            cbCity.SelectedIndex = -1;
            cbRegion.SelectedIndex = -1;
            cbCountry.SelectedIndex = -1;
            mtbPostalCode.Clear();
            mtbPhone.Clear();
            cbMngName.SelectedIndex = -1;
            chbNoMng.Checked = true;
            cbMngName.Enabled = false;
            //clear errorprovider
            errLastName.Clear();
            errFirstName.Clear();
            errTitle.Clear();
            errorTitOfCour.Clear();
            errBirthDate.Clear();
            errHireDate.Clear();
            errAddress.Clear();
            errCity.Clear();
            errCity.Clear();
            errRegion.Clear();
            errCountry.Clear();
            errPostal.Clear();
            errPhone.Clear();
            errManagerName.Clear();
        }

        public void UpdateContent()
        {
            throw new NotImplementedException();
        }

        #region ValidField
        private bool validLastName()
        {
            string txt = txtLastName.Text.Trim();
            if (txt.Length == 0)
            {
                errLastName.SetError(txtLastName, "Empty field !");
                return false;
            }
            errLastName.Clear();
            return true;
        }

        private bool validFirstName()
        {
            string txt = txtFirstName.Text.Trim();
            if (txt.Length == 0)
            {
                errFirstName.SetError(txtFirstName, "Empty field !");
                return false;
            }
            errFirstName.Clear();
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

        private bool validTitle()
        {
            if(cbTitle.SelectedIndex < 0)
            {
                errTitle.SetError(cbTitle, "Choose a title");
                return false;
            }
            errTitle.Clear();
            return true;
        }

        private bool validTitleOfCourtesy()
        {
            if (cbCourtesy.SelectedIndex < 0)
            {
                errorTitOfCour.SetError(cbCourtesy, "Choose a Title of Courtesy");
                return false;
            }
            errorTitOfCour.Clear();
            return true;
        }

        private bool validCountry()
        {
            if (cbCountry.SelectedIndex < 0)
            {
                errCountry.SetError(cbCountry, "Choose a Country");
                return false;
            }
            errCountry.Clear();
            return true;
        }

        private bool validCity()
        {
            if (cbCity.SelectedIndex < 0)
            {
                errCity.SetError(cbCity, "Choose a City");
                return false;
            }
            errCity.Clear();
            return true;
        }

        private bool validPostal()
        {
            // Postal can be null
            if (String.IsNullOrEmpty(mtbPostalCode.Text.Trim()))
            {
                errPostal.Clear();
                return true;
            }
            if (!mtbPostalCode.MaskCompleted)
            {
                errPostal.SetError(mtbPostalCode, "Postal number: xxxxx");
                return false;
            }
            errPostal.Clear();
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

        private bool validField()
        {
            bool lName = validLastName();
            bool fName = validFirstName();
            bool address = validAddress();
            bool title = validTitle();
            bool toc = validTitleOfCourtesy();
            bool coun = validCountry();
            bool city = validCity();
            bool postal = validPostal();
            bool phone = validPhone();
            return lName && fName && address && title && toc && coun && city && postal && phone;
        }
        #endregion

        #region Constraints
        private bool validEmAgeConstraints()
        {
            if (dpkHireDate.Value.Year - dpkBirthdate.Value.Year < 18)
            {
                errBirthDate.SetError(dpkBirthdate, "Employee must be 18+");
                return false;
            }
            errBirthDate.Clear();
            return true;
        } 
        #endregion

        #region NonQuery
        private int SQLAdd(Employees em)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertEmployees]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                //@lastname,@firstname,@title,@titleofcourtesy,@birthdate,@hiredate,@address,@city,@region,@postalcode,@country,@phone,@mgrid
                cmd.Parameters.Add("lastname", SqlDbType.NVarChar).Value = em.LastName;
                cmd.Parameters.Add("firstname", SqlDbType.NVarChar).Value = em.FirstName;
                cmd.Parameters.Add("title", SqlDbType.NVarChar).Value = em.Title;
                cmd.Parameters.Add("titleofcourtesy", SqlDbType.NVarChar).Value = em.TitleOfCourtesy;
                cmd.Parameters.Add("birthdate", SqlDbType.DateTime).Value = convertToDate(em.BirthDate);
                cmd.Parameters.Add("hiredate", SqlDbType.DateTime).Value = convertToDate(em.HireDate);
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = em.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = em.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = em.Region != null ? em.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = em.PostalCode != null ? em.PostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = em.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = em.Phone;
                cmd.Parameters.Add("mgrid", SqlDbType.Int).Value = em.MngID != null ? em.MngID : (object)DBNull.Value;
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
            catch (SqlException e)
            {
                Console.WriteLine("SqlException: " + e.Message);
                return -1;
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
                return -1;
            }
            finally
            {
                con.Close();
            }
        }

        private int SQLUpdate(Employees em)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateEmployees]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = em.ID;
                cmd.Parameters.Add("lastname", SqlDbType.NVarChar).Value = em.LastName;
                cmd.Parameters.Add("firstname", SqlDbType.NVarChar).Value = em.FirstName;
                cmd.Parameters.Add("title", SqlDbType.NVarChar).Value = em.Title;
                cmd.Parameters.Add("titleofcourtesy", SqlDbType.NVarChar).Value = em.TitleOfCourtesy;
                cmd.Parameters.Add("birthdate", SqlDbType.DateTime).Value = convertToDate(em.BirthDate);
                cmd.Parameters.Add("hiredate", SqlDbType.DateTime).Value = convertToDate(em.HireDate);
                cmd.Parameters.Add("address", SqlDbType.NVarChar).Value = em.Address;
                cmd.Parameters.Add("city", SqlDbType.NVarChar).Value = em.City;
                cmd.Parameters.Add("region", SqlDbType.NVarChar).Value = em.Region != null ? em.Region : (object)DBNull.Value;
                cmd.Parameters.Add("postalcode", SqlDbType.NVarChar).Value = em.PostalCode != null ? em.PostalCode : (object)DBNull.Value;
                cmd.Parameters.Add("country", SqlDbType.NVarChar).Value = em.Country;
                cmd.Parameters.Add("phone", SqlDbType.NVarChar).Value = em.Phone;
                cmd.Parameters.Add("mgrid", SqlDbType.Int).Value = em.MngID != null ? em.MngID : (object)DBNull.Value;
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
            catch (SqlException e)
            {
                Console.WriteLine("SqlException: " + e.Message);
                return -1;
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
                return -2;
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
                cmd.CommandText = "[DeleteEmployees]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = id;
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
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException: " + ex.Message);
                return -1;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return -1;
            }
            finally
            {
                con.Close();
            }
        }

        private int SQLUpdateManager(int id)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateEmployeesSetNullManager]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = id;
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
        private void SearchQuery()
        {
            string txt = txtSearch.Text.Trim();
            if (txt.Length > 0)
            {
                SqlCommand cmd;
                SqlDataReader reader = null;
                try
                {
                    con = AppConfig.GetConnection();
                    con.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "[SearchbyNameEmployees]"; // ten procedure
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("name", SqlDbType.NVarChar).Value = txt;

                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        dataTbl.Clear();
                        dataTbl.Load(reader);
                        dgEmployees.Columns[COLUMN_MNGID].Visible = false;
                    }
                    else
                    {
                        MessageBox.Show("Not found !",
                       "Result", MessageBoxButtons.OK, MessageBoxIcon.Information);
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

        private void SearchQueryByDate(DateTime from, DateTime to)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchEmployeesByDate]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("fromdate", SqlDbType.DateTime).Value = from;
                cmd.Parameters.Add("todate", SqlDbType.DateTime).Value = to;
                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
                dgEmployees.Columns[COLUMN_MNGID].Visible = false;
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
                cmd.CommandText = "[getAllEmployees]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                reader = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(reader);
                dgEmployees.Columns[COLUMN_MNGID].Visible = false;
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

        private void LoadAllManager(int id)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[GetManagerEmployees]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = id;
                reader = cmd.ExecuteReader();
                dataCbMng.Clear();
                dataCbMng.Load(reader);
                cbMngName.DisplayMember = "Name";
                cbMngName.ValueMember = "ID";
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

        private bool DeleteOrderConstraint(int id)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[CheckFKEmployeesOrders]";
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = id;
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
                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.Close();
            }
        }

        private bool DeleteEmConstraint(int id)
        {
            SqlCommand cmd;
            SqlDataReader reader = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[CheckFKEmployees]";
                cmd.Parameters.Add("empid", SqlDbType.Int).Value = id;
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

        private void btnSave_Click(object sender, EventArgs e)
        {
            bool field = validField();
            bool cstr = validEmAgeConstraints();
            if(!(field && cstr))
            {
                return;
            }
            // valid
            Employees em = FormToEmployees();
            if (isAdd)
            {
                int rs = SQLAdd(em);
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
                int rs = SQLUpdate(em);
                if (rs > 0)
                {
                    RefreshForm();
                    // update UI
                    /*
                    DataGridViewRow slRow = dgEmployees.SelectedRows[0];
                    int index = slRow.Index;
                    dataTbl.Rows.RemoveAt(index); // Use DataTable to remove
                    DataRow r = dataTbl.NewRow(); // row in DataTable is DataRow
                    r.SetField<string>(COLUMN_EMID, em.ID);
                    r.SetField<string>(COLUMN_LASTNAME, em.LastName);
                    r.SetField<string>(COLUMN_FIRSTNAME, em.FirstName);
                    r.SetField<string>(COLUMN_TITLE, em.Title);
                    r.SetField<string>(COLUMN_TITCOUR, em.TitleOfCourtesy);
                    r.SetField<string>(COLUMN_BIRTH_DATE, em.BirthDate);
                    r.SetField<string>(COLUMN_HIRE_DATE, em.HireDate);
                    r.SetField<string>(COLUMN_ADDRESS, em.Address);
                    r.SetField<string>(COLUMN_CITY, em.City);
                    r.SetField<string>(COLUMN_REGION, em.Region);
                    r.SetField<string>(COLUMN_POSTAL, em.PostalCode);
                    r.SetField<string>(COLUMN_COUNTRY, em.Country);
                    r.SetField<string>(COLUMN_PHONE, em.Phone);
                    r.SetField<string>(COLUMN_MNGID, em.MngID);
                    r.SetField<string>(COLUMN_MNGNAME, em.MngName);
                    dataTbl.Rows.InsertAt(r, index); // insert
                    */
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

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dgEmployees.SelectedRows.Count == 0)
            {
                MessageBox.Show("Please select row !");
                return;
            }
            DataGridViewRow row = dgEmployees.SelectedRows[0];
            int index = row.Index;
            int id = Int32.Parse(row.Cells[COLUMN_EMID].Value.ToString());
            // check constraint
            if (DeleteOrderConstraint(id))
            {
                DialogResult d = MessageBox.Show("Some order contain this Employee. Make sure that you delete all order relate to this Employee !",
                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (DeleteEmConstraint(id))
            {
                DialogResult d = MessageBox.Show("This Employee is Manager of some others Employee. Delete anyway ?",
                    "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if(d != DialogResult.Yes)
                {
                    return;
                }
            }
            else
            {
                DialogResult drs = MessageBox.Show("Are you sure want to delete ?",
                    "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if(drs != DialogResult.Yes)
                {
                    return;
                }
            }
            try
            {
                SQLUpdateManager(id);
                int rs = SQLDelete(id);
                if (rs > 0) // success
                {
                    // delete row on View
                    RefreshForm();
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
            catch (Exception)
            {
                //
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

        private void btSearch_Click(object sender, EventArgs e)
        {
            SearchQuery();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DateTime from = convertToDate(dpkFrom.Text);
            DateTime to = convertToDate(dpkTo.Text);
            if(to.CompareTo(from) < 0)
            {
                MessageBox.Show("From date can't be to date past !",
                "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            SearchQueryByDate(from, to);
        }

        private void dgEmployees_SelectionChanged(object sender, EventArgs e)
        {
            if (dgEmployees.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            // disable reset btn
            isAdd = false;
            btnReset.Enabled = false;
            // load to form 
            DataGridViewRow row = dgEmployees.SelectedRows[0];
            LoadAllManager(Int32.Parse(row.Cells[COLUMN_EMID].Value.ToString()));
            txtEmID.Text = row.Cells[COLUMN_EMID].Value.ToString();
            txtLastName.Text = row.Cells[COLUMN_LASTNAME].Value.ToString();
            txtFirstName.Text = row.Cells[COLUMN_FIRSTNAME].Value.ToString();
            txtAddress.Text = row.Cells[COLUMN_ADDRESS].Value.ToString();
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
            mtbPostalCode.Text = row.Cells[COLUMN_POSTAL].Value.ToString();
            cbTitle.SelectedIndex = cbTitle.FindString(row.Cells[COLUMN_TITLE].Value.ToString());
            cbCourtesy.SelectedIndex = cbCourtesy.FindString(row.Cells[COLUMN_TITCOUR].Value.ToString());
            cbCity.SelectedIndex = cbCity.FindString(row.Cells[COLUMN_CITY].Value.ToString());
            cbCountry.SelectedIndex = cbCountry.FindString(row.Cells[COLUMN_COUNTRY].Value.ToString());
            //cbMngName.SelectedValue = row.Cells[COLUMN_MNGID].Value;
            if (!String.IsNullOrEmpty(row.Cells[COLUMN_MNGID].Value.ToString()))
            {
                chbNoMng.Checked = false;
                cbMngName.Enabled = true;
                cbMngName.SelectedValue = row.Cells[COLUMN_MNGID].Value;
            }
            else
            {
                chbNoMng.Checked = true;
                cbMngName.Enabled = false;
            }
            cbRegion.SelectedIndex = cbRegion.FindString(row.Cells[COLUMN_REGION].Value.ToString());
            dpkBirthdate.Value = convertToDate(row.Cells[COLUMN_BIRTH_DATE].Value.ToString());
            dpkHireDate.Value = convertToDate(row.Cells[COLUMN_HIRE_DATE].Value.ToString());
        }

        private DateTime convertToDate(string date)
        {
            return DateTime.ParseExact(date, "dd/MM/yyyy", null);
        }
        #endregion

        private void dgEmployees_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgEmployees.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            // disable reset btn
            isAdd = false;
            btnReset.Enabled = false;
            // load to form 
            DataGridViewRow row = dgEmployees.SelectedRows[0];
            LoadAllManager(Int32.Parse(row.Cells[COLUMN_EMID].Value.ToString()));
            txtEmID.Text = row.Cells[COLUMN_EMID].Value.ToString();
            txtLastName.Text = row.Cells[COLUMN_LASTNAME].Value.ToString();
            txtFirstName.Text = row.Cells[COLUMN_FIRSTNAME].Value.ToString();
            txtAddress.Text = row.Cells[COLUMN_ADDRESS].Value.ToString();
            mtbPhone.Text = row.Cells[COLUMN_PHONE].Value.ToString();
            mtbPostalCode.Text = row.Cells[COLUMN_POSTAL].Value.ToString();
            cbTitle.SelectedIndex = cbTitle.FindString(row.Cells[COLUMN_TITLE].Value.ToString());
            cbCourtesy.SelectedIndex = cbCourtesy.FindString(row.Cells[COLUMN_TITCOUR].Value.ToString());
            cbCity.SelectedIndex = cbCity.FindString(row.Cells[COLUMN_CITY].Value.ToString());
            cbCountry.SelectedIndex = cbCountry.FindString(row.Cells[COLUMN_COUNTRY].Value.ToString());
            //cbMngName.SelectedValue = row.Cells[COLUMN_MNGID].Value;
            if (!String.IsNullOrEmpty(row.Cells[COLUMN_MNGID].Value.ToString()))
            {
                chbNoMng.Checked = false;
                cbMngName.Enabled = true;
                cbMngName.SelectedValue = row.Cells[COLUMN_MNGID].Value;
            }
            else
            {
                chbNoMng.Checked = true;
                cbMngName.Enabled = false;
            }
            cbRegion.SelectedIndex = cbRegion.FindString(row.Cells[COLUMN_REGION].Value.ToString());
            dpkBirthdate.Value = convertToDate(row.Cells[COLUMN_BIRTH_DATE].Value.ToString());
            dpkHireDate.Value = convertToDate(row.Cells[COLUMN_HIRE_DATE].Value.ToString());
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (chbNoMng.Checked)
            {
                cbMngName.Enabled = false;
            }
            else
            {
                cbMngName.Enabled = true;
            }
        }
    }
}
