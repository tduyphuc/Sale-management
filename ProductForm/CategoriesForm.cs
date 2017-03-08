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
    public partial class CategoriesForm : Form
    {
        private const int COLUMN_ID = 0;
        private const int COLUMN_CATE_NAME = 1;
        private const int COLUMN_DESCRIPTION = 2;

        private SqlConnection con;
        private bool isAdd;
        private DataTable dataTbl;
        public CategoriesForm()
        {
            InitializeComponent();
            dataTbl = new DataTable();
            dgCategories.DataSource = dataTbl;
            isAdd = true;
            LoadAllQuery();
        }

        private Categories FormToCate()
        {
            Categories cate = new Categories();
            // code here
            cate.ID = txtCateID.Text.Trim();
            cate.CategoriesName = txtCategoriesName.Text.Trim();
            cate.Description = txtDescription.Text.Trim();
            

            // end code
            return cate;
        }

        private void ResetForm()
        {
            // add mode
            isAdd = true;
            // clear field
            txtCategoriesName.Clear();
            txtDescription.Clear();
            txtCateID.Clear();
            //clear errorprovider
            errID.Clear();
            errName.Clear();
            errDesc.Clear();
        }

        public void UpdateContent()
        {
            throw new NotImplementedException();
        }

        #region ValidField
        private bool validCateName()
        {
            if(txtCategoriesName.Text.Trim().Length == 0)
            {
                errName.SetError(txtCategoriesName, "Empty field");
                return false;
            }
            errName.Clear();
            return true;
        }
        private bool validDescrip()
        {
            if (txtDescription.Text.Trim().Length == 0)
            {
                errDesc.SetError(txtDescription, "Empty field");
                return false;
            }
            errDesc.Clear();
            return true;
        }
        public bool validation()
        {
            bool catename = validCateName();
            bool descrip = validDescrip();
            return catename && descrip;
        }

        public bool validSearch()
        {
            string txt = txtSearch.Text.Trim();
            if (txt.Length > 0)
            {
                return true;
            }
            return false;
        }
      
        #endregion

        #region NonQuery
        private int SQLAdd(Categories cate)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[InsertCategories]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                //@categoryname,@description
                // params
                cmd.Parameters.Add("categoryname", SqlDbType.NVarChar).Value = cate.CategoriesName;
                cmd.Parameters.Add("description", SqlDbType.NVarChar).Value = cate.Description;
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

        private int SQLUpdate(Categories cate)
        {
            SqlCommand cmd;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[UpdateCategories]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("categoryid", SqlDbType.Int).Value = int.Parse(cate.ID);
                cmd.Parameters.Add("categoryname", SqlDbType.NVarChar).Value = cate.CategoriesName;
                cmd.Parameters.Add("description", SqlDbType.NVarChar).Value = cate.Description;
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
                cmd.CommandText = "[DeleteCategories]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // params
                cmd.Parameters.Add("categoryid", SqlDbType.Int).Value = id;
                
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
        private void SearchCategoriesName()
        {
            if (!validSearch())
            {
                MessageBox.Show("Please fill in search bar",
              "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[SearchByCategoryName]"; // ten procedure
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("categoryname", SqlDbType.NVarChar).Value = txtSearch.Text.ToString().Trim();
                dr = cmd.ExecuteReader();
                dataTbl.Clear();
                dataTbl.Load(dr);
                // end params
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SqlException_SearchByCategoryName" + ex.Message);
                return;
            }
            catch (Exception es)
            {
                Console.WriteLine("Exception_SearchByCategoryName" + es.Message);
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
                cmd.CommandText = "[getAllPro.Categories]"; // ten procedure
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
        #endregion

        #region Event
        private void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
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
            Categories ca = FormToCate();
            if (isAdd)
            {
                int rs = SQLAdd(ca);
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

                Categories ca = FormToCate();
                int rs = SQLUpdate(ca);
                if (rs > 0)
                {                  
                    // update UI
                    DataGridViewRow row = dgCategories.SelectedRows[0];
                    row.Cells[COLUMN_CATE_NAME].Value = ca.CategoriesName;
                    row.Cells[COLUMN_DESCRIPTION].Value = ca.Description;

                }
                else
                {
                    MessageBox.Show("No row was updated. Tips: Try to sync.",
                                    "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            // 1. check if user select a row
            if (dgCategories.SelectedRows.Count == 0)
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
                DataGridViewRow row = dgCategories.SelectedRows[0];
                try
                {
                    // 5.get ID
                    int id = Int32.Parse(row.Cells[0].Value.ToString());
                    // 6. Call Delete and see result
                    if (CheckConstrainforCategories(id))
                    {
                        int rs = SQLDelete(id);
                        if (rs > 0) // success
                        {
                            // delete row on View
                            dgCategories.Rows.RemoveAt(row.Index);
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
        private bool CheckConstrainforCategories(int id)
        {
            SqlCommand cmd;
            SqlDataReader dr = null;
            try
            {
                con = AppConfig.GetConnection();
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "[CheckFKCategoriesProducts]";
                cmd.CommandType = CommandType.StoredProcedure;
                // params
                cmd.Parameters.Add("categoryid", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows)
                {
                    return true;
                }
                MessageBox.Show("Please make sure no constrain in Product table!!!");
                // end params
            }
            catch (SqlException ex)
            {
                return false;
            }
            catch (Exception es)
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
        private void btnShow_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }
        private void btnSearch_Click(object sender, EventArgs e)
        {
            SearchCategoriesName();       
        }
        private void btnSync_Click(object sender, EventArgs e)
        {
            ResetForm();
            LoadAllQuery();
        }           
        private void dgCategories_SelectionChanged_1(object sender, EventArgs e)
        {
            /*
            if (dgCategories.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            isAdd = false;
            DataGridViewRow row = dgCategories.SelectedRows[0];
            txtCateID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCategoriesName.Text = row.Cells[COLUMN_CATE_NAME].Value.ToString();
            txtDescription.Text = row.Cells[COLUMN_DESCRIPTION].Value.ToString();
            */
        }
        #endregion

        private void dgCategories_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgCategories.SelectedRows.Count == 0)
            {
                ResetForm();
                return;
            }
            ResetForm();
            isAdd = false;
            DataGridViewRow row = dgCategories.SelectedRows[0];
            txtCateID.Text = row.Cells[COLUMN_ID].Value.ToString();
            txtCategoriesName.Text = row.Cells[COLUMN_CATE_NAME].Value.ToString();
            txtDescription.Text = row.Cells[COLUMN_DESCRIPTION].Value.ToString();
        }
    }
}
