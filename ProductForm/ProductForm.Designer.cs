namespace ProductForm
{
    partial class ProductForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.gbxProductInfo = new System.Windows.Forms.GroupBox();
            this.cbbCategoryID = new System.Windows.Forms.ComboBox();
            this.cbbSupplierID = new System.Windows.Forms.ComboBox();
            this.txtProductID = new System.Windows.Forms.TextBox();
            this.cbxDiscontinued = new System.Windows.Forms.CheckBox();
            this.txtPrice = new System.Windows.Forms.TextBox();
            this.txtProductName = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnShowAll = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.dgvProduct = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblTo = new System.Windows.Forms.Label();
            this.lblName = new System.Windows.Forms.Label();
            this.lblForm = new System.Windows.Forms.Label();
            this.txtTo = new System.Windows.Forms.TextBox();
            this.txtFrom = new System.Windows.Forms.TextBox();
            this.btnSearchByPrice = new System.Windows.Forms.Button();
            this.txtSearchByName = new System.Windows.Forms.TextBox();
            this.btnSearchByName = new System.Windows.Forms.Button();
            this.btnSync = new System.Windows.Forms.Button();
            this.lblSupplier = new System.Windows.Forms.Label();
            this.errProductName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errUnitPrice = new System.Windows.Forms.ErrorProvider(this.components);
            this.errSupplier = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCategory = new System.Windows.Forms.ErrorProvider(this.components);
            this.errFrom = new System.Windows.Forms.ErrorProvider(this.components);
            this.errTo = new System.Windows.Forms.ErrorProvider(this.components);
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cbCateFilter = new System.Windows.Forms.ComboBox();
            this.cbSupplierFilter = new System.Windows.Forms.ComboBox();
            this.errSearchByName = new System.Windows.Forms.ErrorProvider(this.components);
            this.gbxProductInfo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProduct)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errProductName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errUnitPrice)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errSupplier)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCategory)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFrom)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errTo)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errSearchByName)).BeginInit();
            this.SuspendLayout();
            // 
            // gbxProductInfo
            // 
            this.gbxProductInfo.Controls.Add(this.cbbCategoryID);
            this.gbxProductInfo.Controls.Add(this.cbbSupplierID);
            this.gbxProductInfo.Controls.Add(this.txtProductID);
            this.gbxProductInfo.Controls.Add(this.cbxDiscontinued);
            this.gbxProductInfo.Controls.Add(this.txtPrice);
            this.gbxProductInfo.Controls.Add(this.txtProductName);
            this.gbxProductInfo.Controls.Add(this.label5);
            this.gbxProductInfo.Controls.Add(this.label2);
            this.gbxProductInfo.Controls.Add(this.label4);
            this.gbxProductInfo.Controls.Add(this.label3);
            this.gbxProductInfo.Controls.Add(this.label1);
            this.gbxProductInfo.Location = new System.Drawing.Point(11, 22);
            this.gbxProductInfo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.gbxProductInfo.Name = "gbxProductInfo";
            this.gbxProductInfo.Padding = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.gbxProductInfo.Size = new System.Drawing.Size(299, 167);
            this.gbxProductInfo.TabIndex = 2;
            this.gbxProductInfo.TabStop = false;
            this.gbxProductInfo.Text = "Product Information";
            // 
            // cbbCategoryID
            // 
            this.cbbCategoryID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbbCategoryID.FormattingEnabled = true;
            this.cbbCategoryID.Location = new System.Drawing.Point(101, 92);
            this.cbbCategoryID.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbbCategoryID.Name = "cbbCategoryID";
            this.cbbCategoryID.Size = new System.Drawing.Size(137, 21);
            this.cbbCategoryID.TabIndex = 24;
            // 
            // cbbSupplierID
            // 
            this.cbbSupplierID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbbSupplierID.FormattingEnabled = true;
            this.cbbSupplierID.Location = new System.Drawing.Point(101, 70);
            this.cbbSupplierID.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbbSupplierID.Name = "cbbSupplierID";
            this.cbbSupplierID.Size = new System.Drawing.Size(137, 21);
            this.cbbSupplierID.TabIndex = 23;
            // 
            // txtProductID
            // 
            this.txtProductID.Location = new System.Drawing.Point(101, 26);
            this.txtProductID.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtProductID.Name = "txtProductID";
            this.txtProductID.ReadOnly = true;
            this.txtProductID.Size = new System.Drawing.Size(137, 20);
            this.txtProductID.TabIndex = 13;
            // 
            // cbxDiscontinued
            // 
            this.cbxDiscontinued.AutoSize = true;
            this.cbxDiscontinued.Location = new System.Drawing.Point(19, 138);
            this.cbxDiscontinued.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbxDiscontinued.Name = "cbxDiscontinued";
            this.cbxDiscontinued.Size = new System.Drawing.Size(88, 17);
            this.cbxDiscontinued.TabIndex = 22;
            this.cbxDiscontinued.Text = "Discontinued";
            this.cbxDiscontinued.UseVisualStyleBackColor = true;
            // 
            // txtPrice
            // 
            this.txtPrice.Location = new System.Drawing.Point(101, 114);
            this.txtPrice.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtPrice.Name = "txtPrice";
            this.txtPrice.Size = new System.Drawing.Size(137, 20);
            this.txtPrice.TabIndex = 12;
            // 
            // txtProductName
            // 
            this.txtProductName.Location = new System.Drawing.Point(101, 47);
            this.txtProductName.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtProductName.Name = "txtProductName";
            this.txtProductName.Size = new System.Drawing.Size(137, 20);
            this.txtProductName.TabIndex = 12;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(16, 114);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 13);
            this.label5.TabIndex = 1;
            this.label5.Text = "Unit Price:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 50);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Product Name:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 92);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "Category ID:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 70);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Supplier ID:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 30);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Product ID:";
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(658, 457);
            this.btnReset.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(96, 37);
            this.btnReset.TabIndex = 21;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(202, 457);
            this.btnSave.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(96, 37);
            this.btnSave.TabIndex = 20;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnShowAll
            // 
            this.btnShowAll.Location = new System.Drawing.Point(504, 457);
            this.btnShowAll.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnShowAll.Name = "btnShowAll";
            this.btnShowAll.Size = new System.Drawing.Size(96, 37);
            this.btnShowAll.TabIndex = 3;
            this.btnShowAll.Text = "Show All";
            this.btnShowAll.UseVisualStyleBackColor = true;
            this.btnShowAll.Click += new System.EventHandler(this.btnShowAll_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(344, 457);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(96, 37);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(74, 457);
            this.btnNew.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(96, 37);
            this.btnNew.TabIndex = 1;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // dgvProduct
            // 
            this.dgvProduct.AllowUserToAddRows = false;
            this.dgvProduct.AllowUserToDeleteRows = false;
            this.dgvProduct.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProduct.Location = new System.Drawing.Point(11, 232);
            this.dgvProduct.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dgvProduct.MultiSelect = false;
            this.dgvProduct.Name = "dgvProduct";
            this.dgvProduct.ReadOnly = true;
            this.dgvProduct.RowTemplate.Height = 24;
            this.dgvProduct.Size = new System.Drawing.Size(806, 209);
            this.dgvProduct.TabIndex = 5;
            this.dgvProduct.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvProduct_CellClick);
            this.dgvProduct.SelectionChanged += new System.EventHandler(this.dgvProduct_SelectionChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblTo);
            this.groupBox1.Controls.Add(this.lblName);
            this.groupBox1.Controls.Add(this.lblForm);
            this.groupBox1.Controls.Add(this.txtTo);
            this.groupBox1.Controls.Add(this.txtFrom);
            this.groupBox1.Controls.Add(this.btnSearchByPrice);
            this.groupBox1.Controls.Add(this.txtSearchByName);
            this.groupBox1.Controls.Add(this.btnSearchByName);
            this.groupBox1.Location = new System.Drawing.Point(348, 22);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox1.Size = new System.Drawing.Size(406, 127);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Search";
            // 
            // lblTo
            // 
            this.lblTo.AutoSize = true;
            this.lblTo.Location = new System.Drawing.Point(165, 75);
            this.lblTo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblTo.Name = "lblTo";
            this.lblTo.Size = new System.Drawing.Size(23, 13);
            this.lblTo.TabIndex = 8;
            this.lblTo.Text = "To:";
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(9, 28);
            this.lblName.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(38, 13);
            this.lblName.TabIndex = 8;
            this.lblName.Text = "Name:";
            // 
            // lblForm
            // 
            this.lblForm.AutoSize = true;
            this.lblForm.Location = new System.Drawing.Point(13, 72);
            this.lblForm.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblForm.Name = "lblForm";
            this.lblForm.Size = new System.Drawing.Size(33, 13);
            this.lblForm.TabIndex = 8;
            this.lblForm.Text = "From:";
            // 
            // txtTo
            // 
            this.txtTo.Location = new System.Drawing.Point(191, 72);
            this.txtTo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtTo.Name = "txtTo";
            this.txtTo.Size = new System.Drawing.Size(62, 20);
            this.txtTo.TabIndex = 7;
            // 
            // txtFrom
            // 
            this.txtFrom.Location = new System.Drawing.Point(62, 72);
            this.txtFrom.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtFrom.Name = "txtFrom";
            this.txtFrom.Size = new System.Drawing.Size(70, 20);
            this.txtFrom.TabIndex = 6;
            // 
            // btnSearchByPrice
            // 
            this.btnSearchByPrice.Location = new System.Drawing.Point(285, 68);
            this.btnSearchByPrice.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnSearchByPrice.Name = "btnSearchByPrice";
            this.btnSearchByPrice.Size = new System.Drawing.Size(60, 21);
            this.btnSearchByPrice.TabIndex = 5;
            this.btnSearchByPrice.Text = "Search";
            this.btnSearchByPrice.UseVisualStyleBackColor = true;
            this.btnSearchByPrice.Click += new System.EventHandler(this.btnSearchByPrice_Click);
            // 
            // txtSearchByName
            // 
            this.txtSearchByName.Location = new System.Drawing.Point(62, 28);
            this.txtSearchByName.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.txtSearchByName.Name = "txtSearchByName";
            this.txtSearchByName.Size = new System.Drawing.Size(191, 20);
            this.txtSearchByName.TabIndex = 4;
            // 
            // btnSearchByName
            // 
            this.btnSearchByName.Location = new System.Drawing.Point(285, 25);
            this.btnSearchByName.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnSearchByName.Name = "btnSearchByName";
            this.btnSearchByName.Size = new System.Drawing.Size(60, 24);
            this.btnSearchByName.TabIndex = 2;
            this.btnSearchByName.Text = "Search";
            this.btnSearchByName.UseVisualStyleBackColor = true;
            this.btnSearchByName.Click += new System.EventHandler(this.btnSearchByName_Click);
            // 
            // btnSync
            // 
            this.btnSync.Location = new System.Drawing.Point(774, 10);
            this.btnSync.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnSync.Name = "btnSync";
            this.btnSync.Size = new System.Drawing.Size(43, 25);
            this.btnSync.TabIndex = 3;
            this.btnSync.Text = "Sync";
            this.btnSync.UseVisualStyleBackColor = true;
            this.btnSync.Click += new System.EventHandler(this.btnSync_Click);
            // 
            // lblSupplier
            // 
            this.lblSupplier.AutoSize = true;
            this.lblSupplier.Location = new System.Drawing.Point(9, 32);
            this.lblSupplier.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblSupplier.Name = "lblSupplier";
            this.lblSupplier.Size = new System.Drawing.Size(48, 13);
            this.lblSupplier.TabIndex = 8;
            this.lblSupplier.Text = "Supplier:";
            // 
            // errProductName
            // 
            this.errProductName.ContainerControl = this;
            // 
            // errUnitPrice
            // 
            this.errUnitPrice.ContainerControl = this;
            // 
            // errSupplier
            // 
            this.errSupplier.ContainerControl = this;
            // 
            // errCategory
            // 
            this.errCategory.ContainerControl = this;
            // 
            // errFrom
            // 
            this.errFrom.ContainerControl = this;
            // 
            // errTo
            // 
            this.errTo.ContainerControl = this;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.cbCateFilter);
            this.groupBox2.Controls.Add(this.cbSupplierFilter);
            this.groupBox2.Controls.Add(this.lblSupplier);
            this.groupBox2.Location = new System.Drawing.Point(348, 152);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox2.Size = new System.Drawing.Size(406, 65);
            this.groupBox2.TabIndex = 10;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Filter";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(241, 32);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(32, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = "Cate:";
            // 
            // cbCateFilter
            // 
            this.cbCateFilter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCateFilter.FormattingEnabled = true;
            this.cbCateFilter.Location = new System.Drawing.Point(285, 30);
            this.cbCateFilter.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbCateFilter.Name = "cbCateFilter";
            this.cbCateFilter.Size = new System.Drawing.Size(92, 21);
            this.cbCateFilter.TabIndex = 10;
            this.cbCateFilter.SelectedIndexChanged += new System.EventHandler(this.cbCateFilter_SelectedIndexChanged);
            // 
            // cbSupplierFilter
            // 
            this.cbSupplierFilter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbSupplierFilter.FormattingEnabled = true;
            this.cbSupplierFilter.Location = new System.Drawing.Point(62, 32);
            this.cbSupplierFilter.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cbSupplierFilter.Name = "cbSupplierFilter";
            this.cbSupplierFilter.Size = new System.Drawing.Size(103, 21);
            this.cbSupplierFilter.TabIndex = 9;
            this.cbSupplierFilter.SelectedIndexChanged += new System.EventHandler(this.cbSupplierFilter_SelectedIndexChanged);
            // 
            // errSearchByName
            // 
            this.errSearchByName.ContainerControl = this;
            // 
            // ProductForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(826, 500);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnShowAll);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgvProduct);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.btnSync);
            this.Controls.Add(this.gbxProductInfo);
            this.Controls.Add(this.btnSave);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "ProductForm";
            this.Text = "Product";
            this.Load += new System.EventHandler(this.ProductForm_Load);
            this.gbxProductInfo.ResumeLayout(false);
            this.gbxProductInfo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProduct)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errProductName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errUnitPrice)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errSupplier)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCategory)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFrom)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errTo)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errSearchByName)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxProductInfo;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.TextBox txtPrice;
        private System.Windows.Forms.TextBox txtProductName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnShowAll;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.DataGridView dgvProduct;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSync;
        private System.Windows.Forms.Button btnSearchByName;
        private System.Windows.Forms.CheckBox cbxDiscontinued;
        private System.Windows.Forms.TextBox txtProductID;
        private System.Windows.Forms.ComboBox cbbCategoryID;
        private System.Windows.Forms.ComboBox cbbSupplierID;
        private System.Windows.Forms.ErrorProvider errProductName;
        private System.Windows.Forms.ErrorProvider errUnitPrice;
        private System.Windows.Forms.ErrorProvider errSupplier;
        private System.Windows.Forms.ErrorProvider errCategory;
        private System.Windows.Forms.TextBox txtSearchByName;
        private System.Windows.Forms.Button btnSearchByPrice;
        private System.Windows.Forms.Label lblTo;
        private System.Windows.Forms.Label lblSupplier;
        private System.Windows.Forms.Label lblForm;
        private System.Windows.Forms.TextBox txtTo;
        private System.Windows.Forms.TextBox txtFrom;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ErrorProvider errFrom;
        private System.Windows.Forms.ErrorProvider errTo;
        private System.Windows.Forms.ErrorProvider errSearchByName;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbCateFilter;
        private System.Windows.Forms.ComboBox cbSupplierFilter;
    }
}

