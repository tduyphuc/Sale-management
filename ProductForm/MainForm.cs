using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProductForm
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void employeesToolStripMenuItem_Click(object sender, EventArgs e)
        {

            foreach(Form f in this.MdiChildren)
            {
                if(f is EmployeeForm)
                {
                    f.Activate();
                    return;
                }
            }
            EmployeeForm form = new EmployeeForm();
            form.MdiParent = this;
            form.Show();
        }

        private void categoriesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is CategoriesForm)
                {
                    f.Activate();
                    return;
                }
            }
            CategoriesForm form = new CategoriesForm();
            form.MdiParent = this;
            form.Show();
        }

        private void productToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is ProductForm)
                {
                    f.Activate();
                    return;
                }
            }
            ProductForm form = new ProductForm();
            form.MdiParent = this;
            form.Show();
        }

        private void suppliersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is SupplierForm)
                {
                    f.Activate();
                    return;
                }
            }
            SupplierForm form = new SupplierForm();
            form.MdiParent = this;
            form.Show();
        }

        private void customersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is CustomerForm)
                {
                    f.Activate();
                    return;
                }
            }
            CustomerForm form = new CustomerForm();
            form.MdiParent = this;
            form.Show();
        }

        private void ordersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is OrdersForm)
                {
                    f.Activate();
                    return;
                }
            }
            OrdersForm form = new OrdersForm();
            form.MdiParent = this;
            form.Show();
        }

        private void shippersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f is ShipperForm)
                {
                    f.Activate();
                    return;
                }
            }
            ShipperForm form = new ShipperForm();
            form.MdiParent = this;
            form.Show();
        }
    }
}
