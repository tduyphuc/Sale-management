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
            this.label10 = new System.Windows.Forms.Label();
            this.cbbSearchBy = new System.Windows.Forms.ComboBox();
            this.lblTo = new System.Windows.Forms.Label();
            this.lblName = new System.Windows.Forms.Label();
            this.lblForm = new System.Windows.Forms.Label();
            this.txtTo = new System.Windows.Forms.TextBox();
            this.txtFrom = new System.Windows.Forms.TextBox();
            this.btnSearchByPrice = new System.Windows.Forms.Button();
            this.txtSearchByName = new System.Windows.Forms.TextBox();
            this.btnSync = new System.Windows.Forms.Button();
            this.btnSearchByName = new System.Windows.Forms.Button();
            this.btnFilterCategory = new System.Windows.Forms.Button();
            this.btnFilterSupplier = new System.Windows.Forms.Button();
            this.cbbCategoryFilter = new System.Windows.Forms.ComboBox();
            this.cbbSupplierFilter = new System.Windows.Forms.ComboBox();
            this.lblCategory = new System.Windows.Forms.Label();
            this.lblSupplier = new System.Windows.Forms.Label();
            this.errProductName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errUnitPrice = new System.Windows.Forms.ErrorProvider(this.components);
            this.errSupplier = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCategory = new System.Windows.Forms.ErrorProvider(this.components);
            this.errFrom = new System.Windows.Forms.ErrorProvider(this.components);
            this.errTo = new System.Windows.Forms.ErrorProvider(this.components);
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.errSearchByName = new System.Windows.Forms.ErrorProvider(this.components);
            this.cbbFilter = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
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
            this.gbxProductInfo.Location = new System.Drawing.Point(116, 34);
            this.gbxProductInfo.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxProductInfo.Name = "gbxProductInfo";
            this.gbxProductInfo.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxProductInfo.Size = new System.Drawing.Size(374, 256);
            this.gbxProductInfo.TabIndex = 2;
            this.gbxProductInfo.TabStop = false;
            this.gbxProductInfo.Text = "Product Information";
            // 
            // cbbCategoryID
            // 
            this.cbbCategoryID.FormattingEnabled = true;
            this.cbbCategoryID.Location = new System.Drawing.Point(152, 141);
            this.cbbCategoryID.Name = "cbbCategoryID";
            this.cbbCategoryID.Size = new System.Drawing.Size(203, 28);
            this.cbbCategoryID.TabIndex = 24;
            // 
            // cbbSupplierID
            // 
            this.cbbSupplierID.FormattingEnabled = true;
            this.cbbSupplierID.Location = new System.Drawing.Point(152, 107);
            this.cbbSupplierID.Name = "cbbSupplierID";
            this.cbbSupplierID.Size = new System.Drawing.Size(203, 28);
            this.cbbSupplierID.TabIndex = 23;
            // 
            // txtProductID
            // 
            this.txtProductID.Location = new System.Drawing.Point(152, 40);
            this.txtProductID.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtProductID.Name = "txtProductID";
            this.txtProductID.ReadOnly = true;
            this.txtProductID.Size = new System.Drawing.Size(203, 26);
            this.txtProductID.TabIndex = 13;
            // 
            // cbxDiscontinued
            // 
            this.cbxDiscontinued.AutoSize = true;
            this.cbxDiscontinued.Location = new System.Drawing.Point(28, 212);
            this.cbxDiscontinued.Name = "cbxDiscontinued";
            this.cbxDiscontinued.Size = new System.Drawing.Size(128, 24);
            this.cbxDiscontinued.TabIndex = 22;
            this.cbxDiscontinued.Text = "Discontinued";
            this.cbxDiscontinued.UseVisualStyleBackColor = true;
            // 
            // txtPrice
            // 
            this.txtPrice.Location = new System.Drawing.Point(152, 175);
            this.txtPrice.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtPrice.Name = "txtPrice";
            this.txtPrice.Size = new System.Drawing.Size(203, 26);
            this.txtPrice.TabIndex = 12;
            // 
            // txtProductName
            // 
            this.txtProductName.Location = new System.Drawing.Point(152, 73);
            this.txtProductName.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtProductName.Name = "txtProductName";
            this.txtProductName.Size = new System.Drawing.Size(203, 26);
            this.txtProductName.TabIndex = 12;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 175);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 20);
            this.label5.TabIndex = 1;
            this.label5.Text = "Unit Price:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(114, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Product Name:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 141);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(98, 20);
            this.label4.TabIndex = 0;
            this.label4.Text = "Category ID:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 107);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 20);
            this.label3.TabIndex = 0;
            this.label3.Text = "Supplier ID:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 46);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Product ID:";
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(988, 704);
            this.btnReset.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(144, 57);
            this.btnReset.TabIndex = 21;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(303, 704);
            this.btnSave.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(144, 57);
            this.btnSave.TabIndex = 20;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnShowAll
            // 
            this.btnShowAll.Location = new System.Drawing.Point(756, 704);
            this.btnShowAll.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnShowAll.Name = "btnShowAll";
            this.btnShowAll.Size = new System.Drawing.Size(144, 57);
            this.btnShowAll.TabIndex = 3;
            this.btnShowAll.Text = "Show All";
            this.btnShowAll.UseVisualStyleBackColor = true;
            this.btnShowAll.Click += new System.EventHandler(this.btnShowAll_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(516, 704);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(144, 57);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(110, 704);
            this.btnNew.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(144, 57);
            this.btnNew.TabIndex = 1;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // dgvProduct
            // 
            this.dgvProduct.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProduct.Location = new System.Drawing.Point(17, 306);
            this.dgvProduct.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvProduct.MultiSelect = false;
            this.dgvProduct.Name = "dgvProduct";
            this.dgvProduct.ReadOnly = true;
            this.dgvProduct.RowTemplate.Height = 24;
            this.dgvProduct.Size = new System.Drawing.Size(1208, 373);
            this.dgvProduct.TabIndex = 5;
            this.dgvProduct.SelectionChanged += new System.EventHandler(this.dgvProduct_SelectionChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.cbbSearchBy);
            this.groupBox1.Controls.Add(this.lblTo);
            this.groupBox1.Controls.Add(this.lblName);
            this.groupBox1.Controls.Add(this.lblForm);
            this.groupBox1.Controls.Add(this.txtTo);
            this.groupBox1.Controls.Add(this.txtFrom);
            this.groupBox1.Controls.Add(this.btnSearchByPrice);
            this.groupBox1.Controls.Add(this.txtSearchByName);
            this.groupBox1.Controls.Add(this.btnSync);
            this.groupBox1.Controls.Add(this.btnSearchByName);
            this.groupBox1.Location = new System.Drawing.Point(522, 34);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Size = new System.Drawing.Size(610, 149);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Search";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(13, 36);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(84, 20);
            this.label10.TabIndex = 11;
            this.label10.Text = "Search by:";
            // 
            // cbbSearchBy
            // 
            this.cbbSearchBy.FormattingEnabled = true;
            this.cbbSearchBy.Items.AddRange(new object[] {
            "Product Name",
            "Price Range"});
            this.cbbSearchBy.Location = new System.Drawing.Point(110, 28);
            this.cbbSearchBy.Name = "cbbSearchBy";
            this.cbbSearchBy.Size = new System.Drawing.Size(284, 28);
            this.cbbSearchBy.TabIndex = 10;
            this.cbbSearchBy.SelectedIndexChanged += new System.EventHandler(this.cbbSearchBy_SelectedIndexChanged);
            // 
            // lblTo
            // 
            this.lblTo.AutoSize = true;
            this.lblTo.Location = new System.Drawing.Point(257, 114);
            this.lblTo.Name = "lblTo";
            this.lblTo.Size = new System.Drawing.Size(31, 20);
            this.lblTo.TabIndex = 8;
            this.lblTo.Text = "To:";
            this.lblTo.Visible = false;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(20, 76);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(55, 20);
            this.lblName.TabIndex = 8;
            this.lblName.Text = "Name:";
            this.lblName.Visible = false;
            // 
            // lblForm
            // 
            this.lblForm.AutoSize = true;
            this.lblForm.Location = new System.Drawing.Point(25, 117);
            this.lblForm.Name = "lblForm";
            this.lblForm.Size = new System.Drawing.Size(50, 20);
            this.lblForm.TabIndex = 8;
            this.lblForm.Text = "From:";
            this.lblForm.Visible = false;
            // 
            // txtTo
            // 
            this.txtTo.Location = new System.Drawing.Point(298, 111);
            this.txtTo.Name = "txtTo";
            this.txtTo.Size = new System.Drawing.Size(96, 26);
            this.txtTo.TabIndex = 7;
            this.txtTo.Visible = false;
            // 
            // txtFrom
            // 
            this.txtFrom.Location = new System.Drawing.Point(110, 111);
            this.txtFrom.Name = "txtFrom";
            this.txtFrom.Size = new System.Drawing.Size(103, 26);
            this.txtFrom.TabIndex = 6;
            this.txtFrom.Visible = false;
            // 
            // btnSearchByPrice
            // 
            this.btnSearchByPrice.Location = new System.Drawing.Point(441, 63);
            this.btnSearchByPrice.Name = "btnSearchByPrice";
            this.btnSearchByPrice.Size = new System.Drawing.Size(145, 80);
            this.btnSearchByPrice.TabIndex = 5;
            this.btnSearchByPrice.Text = "Search";
            this.btnSearchByPrice.UseVisualStyleBackColor = true;
            this.btnSearchByPrice.Visible = false;
            // 
            // txtSearchByName
            // 
            this.txtSearchByName.Location = new System.Drawing.Point(110, 70);
            this.txtSearchByName.Name = "txtSearchByName";
            this.txtSearchByName.Size = new System.Drawing.Size(284, 26);
            this.txtSearchByName.TabIndex = 4;
            this.txtSearchByName.Visible = false;
            // 
            // btnSync
            // 
            this.btnSync.Location = new System.Drawing.Point(441, 17);
            this.btnSync.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnSync.Name = "btnSync";
            this.btnSync.Size = new System.Drawing.Size(145, 39);
            this.btnSync.TabIndex = 3;
            this.btnSync.Text = "Sync";
            this.btnSync.UseVisualStyleBackColor = true;
            this.btnSync.Click += new System.EventHandler(this.btnSync_Click);
            // 
            // btnSearchByName
            // 
            this.btnSearchByName.Location = new System.Drawing.Point(441, 62);
            this.btnSearchByName.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSearchByName.Name = "btnSearchByName";
            this.btnSearchByName.Size = new System.Drawing.Size(145, 81);
            this.btnSearchByName.TabIndex = 2;
            this.btnSearchByName.Text = "Search";
            this.btnSearchByName.UseVisualStyleBackColor = true;
            this.btnSearchByName.Visible = false;
            // 
            // btnFilterCategory
            // 
            this.btnFilterCategory.Location = new System.Drawing.Point(441, 23);
            this.btnFilterCategory.Name = "btnFilterCategory";
            this.btnFilterCategory.Size = new System.Drawing.Size(145, 62);
            this.btnFilterCategory.TabIndex = 8;
            this.btnFilterCategory.Text = "Filter";
            this.btnFilterCategory.UseVisualStyleBackColor = true;
            this.btnFilterCategory.Visible = false;
            // 
            // btnFilterSupplier
            // 
            this.btnFilterSupplier.Location = new System.Drawing.Point(441, 25);
            this.btnFilterSupplier.Name = "btnFilterSupplier";
            this.btnFilterSupplier.Size = new System.Drawing.Size(145, 60);
            this.btnFilterSupplier.TabIndex = 8;
            this.btnFilterSupplier.Text = "Filter";
            this.btnFilterSupplier.UseVisualStyleBackColor = true;
            this.btnFilterSupplier.Visible = false;
            // 
            // cbbCategoryFilter
            // 
            this.cbbCategoryFilter.FormattingEnabled = true;
            this.cbbCategoryFilter.Location = new System.Drawing.Point(110, 57);
            this.cbbCategoryFilter.Name = "cbbCategoryFilter";
            this.cbbCategoryFilter.Size = new System.Drawing.Size(284, 28);
            this.cbbCategoryFilter.TabIndex = 9;
            this.cbbCategoryFilter.Visible = false;
            // 
            // cbbSupplierFilter
            // 
            this.cbbSupplierFilter.FormattingEnabled = true;
            this.cbbSupplierFilter.Location = new System.Drawing.Point(110, 57);
            this.cbbSupplierFilter.Name = "cbbSupplierFilter";
            this.cbbSupplierFilter.Size = new System.Drawing.Size(284, 28);
            this.cbbSupplierFilter.TabIndex = 9;
            this.cbbSupplierFilter.Visible = false;
            // 
            // lblCategory
            // 
            this.lblCategory.AutoSize = true;
            this.lblCategory.Location = new System.Drawing.Point(13, 65);
            this.lblCategory.Name = "lblCategory";
            this.lblCategory.Size = new System.Drawing.Size(77, 20);
            this.lblCategory.TabIndex = 8;
            this.lblCategory.Text = "Category:";
            this.lblCategory.Visible = false;
            // 
            // lblSupplier
            // 
            this.lblSupplier.AutoSize = true;
            this.lblSupplier.Location = new System.Drawing.Point(13, 65);
            this.lblSupplier.Name = "lblSupplier";
            this.lblSupplier.Size = new System.Drawing.Size(71, 20);
            this.lblSupplier.TabIndex = 8;
            this.lblSupplier.Text = "Supplier:";
            this.lblSupplier.Visible = false;
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
            this.groupBox2.Controls.Add(this.lblCategory);
            this.groupBox2.Controls.Add(this.cbbFilter);
            this.groupBox2.Controls.Add(this.lblSupplier);
            this.groupBox2.Controls.Add(this.cbbSupplierFilter);
            this.groupBox2.Controls.Add(this.btnFilterCategory);
            this.groupBox2.Controls.Add(this.cbbCategoryFilter);
            this.groupBox2.Controls.Add(this.btnFilterSupplier);
            this.groupBox2.Location = new System.Drawing.Point(522, 190);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(610, 100);
            this.groupBox2.TabIndex = 10;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Filter";
            // 
            // errSearchByName
            // 
            this.errSearchByName.ContainerControl = this;
            // 
            // cbbFilter
            // 
            this.cbbFilter.FormattingEnabled = true;
            this.cbbFilter.Items.AddRange(new object[] {
            "Supplier",
            "Category"});
            this.cbbFilter.Location = new System.Drawing.Point(110, 23);
            this.cbbFilter.Name = "cbbFilter";
            this.cbbFilter.Size = new System.Drawing.Size(284, 28);
            this.cbbFilter.TabIndex = 10;
            this.cbbFilter.SelectedIndexChanged += new System.EventHandler(this.cbbFilterBy_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 31);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(68, 20);
            this.label6.TabIndex = 11;
            this.label6.Text = "Filter by:";
            // 
            // ProductForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1240, 769);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnShowAll);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgvProduct);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.gbxProductInfo);
            this.Controls.Add(this.btnSave);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
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
        private System.Windows.Forms.Button btnFilterCategory;
        private System.Windows.Forms.Button btnFilterSupplier;
        private System.Windows.Forms.ComboBox cbbCategoryFilter;
        private System.Windows.Forms.ComboBox cbbSupplierFilter;
        private System.Windows.Forms.Label lblCategory;
        private System.Windows.Forms.Label lblTo;
        private System.Windows.Forms.Label lblSupplier;
        private System.Windows.Forms.Label lblForm;
        private System.Windows.Forms.TextBox txtTo;
        private System.Windows.Forms.TextBox txtFrom;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.ComboBox cbbSearchBy;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ErrorProvider errFrom;
        private System.Windows.Forms.ErrorProvider errTo;
        private System.Windows.Forms.ErrorProvider errSearchByName;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbbFilter;
    }
}

