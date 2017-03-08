namespace ProductForm
{
    partial class OrderDetailsForm
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
            this.gbxOrderDetailsInfo = new System.Windows.Forms.GroupBox();
            this.cbProduct = new System.Windows.Forms.ComboBox();
            this.mtxdiscount = new System.Windows.Forms.MaskedTextBox();
            this.mtbQTY = new System.Windows.Forms.MaskedTextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.txtPrice = new System.Windows.Forms.TextBox();
            this.txtOrderID = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnSync = new System.Windows.Forms.Button();
            this.dgOrderDetails = new System.Windows.Forms.DataGridView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnShowAll = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.errProduct = new System.Windows.Forms.ErrorProvider(this.components);
            this.errQuantity = new System.Windows.Forms.ErrorProvider(this.components);
            this.errDiscount = new System.Windows.Forms.ErrorProvider(this.components);
            this.gbxOrderDetailsInfo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgOrderDetails)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errProduct)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errQuantity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errDiscount)).BeginInit();
            this.SuspendLayout();
            // 
            // gbxOrderDetailsInfo
            // 
            this.gbxOrderDetailsInfo.Controls.Add(this.cbProduct);
            this.gbxOrderDetailsInfo.Controls.Add(this.mtxdiscount);
            this.gbxOrderDetailsInfo.Controls.Add(this.mtbQTY);
            this.gbxOrderDetailsInfo.Controls.Add(this.btnReset);
            this.gbxOrderDetailsInfo.Controls.Add(this.btnSave);
            this.gbxOrderDetailsInfo.Controls.Add(this.txtPrice);
            this.gbxOrderDetailsInfo.Controls.Add(this.txtOrderID);
            this.gbxOrderDetailsInfo.Controls.Add(this.label6);
            this.gbxOrderDetailsInfo.Controls.Add(this.label4);
            this.gbxOrderDetailsInfo.Controls.Add(this.label5);
            this.gbxOrderDetailsInfo.Controls.Add(this.label3);
            this.gbxOrderDetailsInfo.Controls.Add(this.label1);
            this.gbxOrderDetailsInfo.Location = new System.Drawing.Point(11, 19);
            this.gbxOrderDetailsInfo.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxOrderDetailsInfo.Name = "gbxOrderDetailsInfo";
            this.gbxOrderDetailsInfo.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxOrderDetailsInfo.Size = new System.Drawing.Size(423, 353);
            this.gbxOrderDetailsInfo.TabIndex = 3;
            this.gbxOrderDetailsInfo.TabStop = false;
            this.gbxOrderDetailsInfo.Text = "Order Details";
            // 
            // cbProduct
            // 
            this.cbProduct.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbProduct.FormattingEnabled = true;
            this.cbProduct.Location = new System.Drawing.Point(195, 72);
            this.cbProduct.Name = "cbProduct";
            this.cbProduct.Size = new System.Drawing.Size(159, 24);
            this.cbProduct.TabIndex = 24;
            this.cbProduct.SelectedIndexChanged += new System.EventHandler(this.cbProduct_SelectedIndexChanged);
            // 
            // mtxdiscount
            // 
            this.mtxdiscount.Location = new System.Drawing.Point(195, 192);
            this.mtxdiscount.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtxdiscount.Mask = "0.000";
            this.mtxdiscount.Name = "mtxdiscount";
            this.mtxdiscount.Size = new System.Drawing.Size(111, 22);
            this.mtxdiscount.TabIndex = 23;
            // 
            // mtbQTY
            // 
            this.mtbQTY.Location = new System.Drawing.Point(195, 157);
            this.mtbQTY.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtbQTY.Mask = "0000000";
            this.mtbQTY.Name = "mtbQTY";
            this.mtbQTY.Size = new System.Drawing.Size(111, 22);
            this.mtbQTY.TabIndex = 23;
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(231, 287);
            this.btnReset.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(75, 36);
            this.btnReset.TabIndex = 21;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(105, 287);
            this.btnSave.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 34);
            this.btnSave.TabIndex = 20;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // txtPrice
            // 
            this.txtPrice.Location = new System.Drawing.Point(195, 118);
            this.txtPrice.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtPrice.Name = "txtPrice";
            this.txtPrice.ReadOnly = true;
            this.txtPrice.Size = new System.Drawing.Size(111, 22);
            this.txtPrice.TabIndex = 12;
            // 
            // txtOrderID
            // 
            this.txtOrderID.Location = new System.Drawing.Point(195, 37);
            this.txtOrderID.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtOrderID.Name = "txtOrderID";
            this.txtOrderID.ReadOnly = true;
            this.txtOrderID.Size = new System.Drawing.Size(111, 22);
            this.txtOrderID.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(21, 197);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(67, 17);
            this.label6.TabIndex = 1;
            this.label6.Text = "Discount:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(21, 159);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 17);
            this.label4.TabIndex = 1;
            this.label4.Text = "QTY:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(21, 118);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(73, 17);
            this.label5.TabIndex = 1;
            this.label5.Text = "Unit Price:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(21, 37);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 17);
            this.label3.TabIndex = 0;
            this.label3.Text = "Order ID:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 75);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Product:";
            // 
            // btnSync
            // 
            this.btnSync.Location = new System.Drawing.Point(1099, 19);
            this.btnSync.Name = "btnSync";
            this.btnSync.Size = new System.Drawing.Size(60, 31);
            this.btnSync.TabIndex = 3;
            this.btnSync.Text = "Sync";
            this.btnSync.UseVisualStyleBackColor = true;
            this.btnSync.Click += new System.EventHandler(this.btnSync_Click);
            // 
            // dgOrderDetails
            // 
            this.dgOrderDetails.AllowUserToAddRows = false;
            this.dgOrderDetails.AllowUserToDeleteRows = false;
            this.dgOrderDetails.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgOrderDetails.Location = new System.Drawing.Point(446, 67);
            this.dgOrderDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgOrderDetails.MultiSelect = false;
            this.dgOrderDetails.Name = "dgOrderDetails";
            this.dgOrderDetails.ReadOnly = true;
            this.dgOrderDetails.RowTemplate.Height = 24;
            this.dgOrderDetails.Size = new System.Drawing.Size(713, 404);
            this.dgOrderDetails.TabIndex = 8;
            this.dgOrderDetails.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgOrderDetails_CellClick);
            this.dgOrderDetails.SelectionChanged += new System.EventHandler(this.dgOrderDetails_SelectionChanged);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnShowAll);
            this.panel2.Controls.Add(this.btnDelete);
            this.panel2.Controls.Add(this.btnNew);
            this.panel2.Location = new System.Drawing.Point(12, 405);
            this.panel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(372, 66);
            this.panel2.TabIndex = 10;
            // 
            // btnShowAll
            // 
            this.btnShowAll.Location = new System.Drawing.Point(249, 18);
            this.btnShowAll.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnShowAll.Name = "btnShowAll";
            this.btnShowAll.Size = new System.Drawing.Size(75, 30);
            this.btnShowAll.TabIndex = 3;
            this.btnShowAll.Text = "Show All";
            this.btnShowAll.UseVisualStyleBackColor = true;
            this.btnShowAll.Click += new System.EventHandler(this.btnShowAll_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(137, 17);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 31);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(25, 16);
            this.btnNew.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(75, 31);
            this.btnNew.TabIndex = 1;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // errProduct
            // 
            this.errProduct.ContainerControl = this;
            // 
            // errQuantity
            // 
            this.errQuantity.ContainerControl = this;
            // 
            // errDiscount
            // 
            this.errDiscount.ContainerControl = this;
            // 
            // OrderDetailsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1171, 482);
            this.Controls.Add(this.btnSync);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.dgOrderDetails);
            this.Controls.Add(this.gbxOrderDetailsInfo);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "OrderDetailsForm";
            this.Text = "Order Details";
            this.gbxOrderDetailsInfo.ResumeLayout(false);
            this.gbxOrderDetailsInfo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgOrderDetails)).EndInit();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.errProduct)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errQuantity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errDiscount)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxOrderDetailsInfo;
        private System.Windows.Forms.MaskedTextBox mtxdiscount;
        private System.Windows.Forms.MaskedTextBox mtbQTY;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.TextBox txtPrice;
        private System.Windows.Forms.TextBox txtOrderID;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnSync;
        private System.Windows.Forms.DataGridView dgOrderDetails;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnShowAll;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.ComboBox cbProduct;
        private System.Windows.Forms.ErrorProvider errProduct;
        private System.Windows.Forms.ErrorProvider errQuantity;
        private System.Windows.Forms.ErrorProvider errDiscount;
    }
}