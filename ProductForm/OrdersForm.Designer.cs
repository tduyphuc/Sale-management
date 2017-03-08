namespace ProductForm
{
    partial class OrdersForm
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
            this.btnNew = new System.Windows.Forms.Button();
            this.dgOrders = new System.Windows.Forms.DataGridView();
            this.btnShowAll = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label19 = new System.Windows.Forms.Label();
            this.cbProductFilter = new System.Windows.Forms.ComboBox();
            this.label18 = new System.Windows.Forms.Label();
            this.dd = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.btnCheck = new System.Windows.Forms.Button();
            this.txtToMoney = new System.Windows.Forms.TextBox();
            this.txtFromMoney = new System.Windows.Forms.TextBox();
            this.btnOrderDetail = new System.Windows.Forms.Button();
            this.cbSearchby = new System.Windows.Forms.ComboBox();
            this.cbFilter = new System.Windows.Forms.ComboBox();
            this.label16 = new System.Windows.Forms.Label();
            this.dpkTo = new System.Windows.Forms.DateTimePicker();
            this.dpkFrom = new System.Windows.Forms.DateTimePicker();
            this.btnSync = new System.Windows.Forms.Button();
            this.errID = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCusName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errEmName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errOrderDate = new System.Windows.Forms.ErrorProvider(this.components);
            this.errRequireDate = new System.Windows.Forms.ErrorProvider(this.components);
            this.errShipDate = new System.Windows.Forms.ErrorProvider(this.components);
            this.errShipCom = new System.Windows.Forms.ErrorProvider(this.components);
            this.errFreight = new System.Windows.Forms.ErrorProvider(this.components);
            this.errShipName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errShipAddress = new System.Windows.Forms.ErrorProvider(this.components);
            this.errShipCity = new System.Windows.Forms.ErrorProvider(this.components);
            this.errRegion = new System.Windows.Forms.ErrorProvider(this.components);
            this.errPostal = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCountry = new System.Windows.Forms.ErrorProvider(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.dtShippedDate = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.dpkOrderDate = new System.Windows.Forms.DateTimePicker();
            this.dpkRequiredDate = new System.Windows.Forms.DateTimePicker();
            this.dpkShippedDate = new System.Windows.Forms.DateTimePicker();
            this.txtFreight = new System.Windows.Forms.TextBox();
            this.txtShipName = new System.Windows.Forms.TextBox();
            this.txtShipAddress = new System.Windows.Forms.TextBox();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.cbCity = new System.Windows.Forms.ComboBox();
            this.cbRegion = new System.Windows.Forms.ComboBox();
            this.cbCountry = new System.Windows.Forms.ComboBox();
            this.mtxtPostal = new System.Windows.Forms.MaskedTextBox();
            this.txtOrderID = new System.Windows.Forms.TextBox();
            this.cbCustomerID = new System.Windows.Forms.ComboBox();
            this.cbEmployeeID = new System.Windows.Forms.ComboBox();
            this.cbShippedID = new System.Windows.Forms.ComboBox();
            this.s = new System.Windows.Forms.Panel();
            this.ckCus = new System.Windows.Forms.CheckBox();
            this.ckShipped = new System.Windows.Forms.CheckBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgOrders)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errID)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCusName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errEmName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errOrderDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRequireDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipCom)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFreight)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipAddress)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipCity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRegion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPostal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCountry)).BeginInit();
            this.s.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(31, 668);
            this.btnNew.Margin = new System.Windows.Forms.Padding(4);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(100, 34);
            this.btnNew.TabIndex = 1;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // dgOrders
            // 
            this.dgOrders.AllowUserToAddRows = false;
            this.dgOrders.AllowUserToDeleteRows = false;
            this.dgOrders.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgOrders.Location = new System.Drawing.Point(24, 186);
            this.dgOrders.Margin = new System.Windows.Forms.Padding(4);
            this.dgOrders.MultiSelect = false;
            this.dgOrders.Name = "dgOrders";
            this.dgOrders.ReadOnly = true;
            this.dgOrders.Size = new System.Drawing.Size(883, 453);
            this.dgOrders.TabIndex = 2;
            this.dgOrders.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgOrders_CellClick);
            this.dgOrders.SelectionChanged += new System.EventHandler(this.dgOrders_SelectionChanged);
            // 
            // btnShowAll
            // 
            this.btnShowAll.Location = new System.Drawing.Point(344, 668);
            this.btnShowAll.Margin = new System.Windows.Forms.Padding(4);
            this.btnShowAll.Name = "btnShowAll";
            this.btnShowAll.Size = new System.Drawing.Size(100, 34);
            this.btnShowAll.TabIndex = 4;
            this.btnShowAll.Text = "Show All";
            this.btnShowAll.UseVisualStyleBackColor = true;
            this.btnShowAll.Click += new System.EventHandler(this.btnShowAll_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(189, 668);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(4);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(100, 34);
            this.btnDelete.TabIndex = 5;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(77, 124);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(4);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(100, 28);
            this.btnSearch.TabIndex = 7;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(27, 60);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 17);
            this.label6.TabIndex = 8;
            this.label6.Text = "From:";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label19);
            this.panel1.Controls.Add(this.cbProductFilter);
            this.panel1.Controls.Add(this.label18);
            this.panel1.Controls.Add(this.dd);
            this.panel1.Controls.Add(this.label17);
            this.panel1.Controls.Add(this.btnCheck);
            this.panel1.Controls.Add(this.txtToMoney);
            this.panel1.Controls.Add(this.txtFromMoney);
            this.panel1.Controls.Add(this.btnOrderDetail);
            this.panel1.Controls.Add(this.cbSearchby);
            this.panel1.Controls.Add(this.cbFilter);
            this.panel1.Controls.Add(this.label16);
            this.panel1.Controls.Add(this.dpkTo);
            this.panel1.Controls.Add(this.dpkFrom);
            this.panel1.Controls.Add(this.btnSync);
            this.panel1.Controls.Add(this.btnSearch);
            this.panel1.Controls.Add(this.btnDelete);
            this.panel1.Controls.Add(this.btnShowAll);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Controls.Add(this.btnNew);
            this.panel1.Controls.Add(this.dgOrders);
            this.panel1.Location = new System.Drawing.Point(532, 14);
            this.panel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(917, 738);
            this.panel1.TabIndex = 11;
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(631, 81);
            this.label19.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(98, 17);
            this.label19.TabIndex = 24;
            this.label19.Text = "ProductName:";
            // 
            // cbProductFilter
            // 
            this.cbProductFilter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbProductFilter.FormattingEnabled = true;
            this.cbProductFilter.Location = new System.Drawing.Point(631, 105);
            this.cbProductFilter.Margin = new System.Windows.Forms.Padding(4);
            this.cbProductFilter.Name = "cbProductFilter";
            this.cbProductFilter.Size = new System.Drawing.Size(188, 24);
            this.cbProductFilter.TabIndex = 23;
            this.cbProductFilter.SelectedIndexChanged += new System.EventHandler(this.cbProductFilter_SelectedIndexChanged);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(631, 23);
            this.label18.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(109, 17);
            this.label18.TabIndex = 22;
            this.label18.Text = "CustomerName:";
            // 
            // dd
            // 
            this.dd.AutoSize = true;
            this.dd.Location = new System.Drawing.Point(308, 92);
            this.dd.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.dd.Name = "dd";
            this.dd.Size = new System.Drawing.Size(29, 17);
            this.dd.TabIndex = 21;
            this.dd.Text = "To:";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(308, 57);
            this.label17.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(44, 17);
            this.label17.TabIndex = 20;
            this.label17.Text = "From:";
            // 
            // btnCheck
            // 
            this.btnCheck.Location = new System.Drawing.Point(360, 124);
            this.btnCheck.Margin = new System.Windows.Forms.Padding(4);
            this.btnCheck.Name = "btnCheck";
            this.btnCheck.Size = new System.Drawing.Size(84, 28);
            this.btnCheck.TabIndex = 19;
            this.btnCheck.Text = "Check";
            this.btnCheck.UseVisualStyleBackColor = true;
            this.btnCheck.Click += new System.EventHandler(this.btnCheck_Click);
            // 
            // txtToMoney
            // 
            this.txtToMoney.Location = new System.Drawing.Point(361, 85);
            this.txtToMoney.Margin = new System.Windows.Forms.Padding(4);
            this.txtToMoney.Name = "txtToMoney";
            this.txtToMoney.Size = new System.Drawing.Size(60, 22);
            this.txtToMoney.TabIndex = 18;
            // 
            // txtFromMoney
            // 
            this.txtFromMoney.Location = new System.Drawing.Point(360, 52);
            this.txtFromMoney.Margin = new System.Windows.Forms.Padding(4);
            this.txtFromMoney.Name = "txtFromMoney";
            this.txtFromMoney.Size = new System.Drawing.Size(61, 22);
            this.txtFromMoney.TabIndex = 17;
            // 
            // btnOrderDetail
            // 
            this.btnOrderDetail.Location = new System.Drawing.Point(696, 668);
            this.btnOrderDetail.Margin = new System.Windows.Forms.Padding(4);
            this.btnOrderDetail.Name = "btnOrderDetail";
            this.btnOrderDetail.Size = new System.Drawing.Size(124, 34);
            this.btnOrderDetail.TabIndex = 16;
            this.btnOrderDetail.Text = "Order Detail ";
            this.btnOrderDetail.UseVisualStyleBackColor = true;
            this.btnOrderDetail.Click += new System.EventHandler(this.btnOrderDetail_Click);
            // 
            // cbSearchby
            // 
            this.cbSearchby.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbSearchby.FormattingEnabled = true;
            this.cbSearchby.Items.AddRange(new object[] {
            "Ordered Date",
            "Required Date",
            "Shipped Date"});
            this.cbSearchby.Location = new System.Drawing.Point(31, 16);
            this.cbSearchby.Margin = new System.Windows.Forms.Padding(4);
            this.cbSearchby.Name = "cbSearchby";
            this.cbSearchby.Size = new System.Drawing.Size(132, 24);
            this.cbSearchby.TabIndex = 14;
            // 
            // cbFilter
            // 
            this.cbFilter.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbFilter.FormattingEnabled = true;
            this.cbFilter.Location = new System.Drawing.Point(631, 47);
            this.cbFilter.Margin = new System.Windows.Forms.Padding(4);
            this.cbFilter.Name = "cbFilter";
            this.cbFilter.Size = new System.Drawing.Size(188, 24);
            this.cbFilter.TabIndex = 13;
            this.cbFilter.SelectedIndexChanged += new System.EventHandler(this.cbFilter_SelectedIndexChanged);
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(27, 94);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(29, 17);
            this.label16.TabIndex = 12;
            this.label16.Text = "To:";
            // 
            // dpkTo
            // 
            this.dpkTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dpkTo.Location = new System.Drawing.Point(77, 92);
            this.dpkTo.Margin = new System.Windows.Forms.Padding(4);
            this.dpkTo.Name = "dpkTo";
            this.dpkTo.Size = new System.Drawing.Size(132, 22);
            this.dpkTo.TabIndex = 11;
            // 
            // dpkFrom
            // 
            this.dpkFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dpkFrom.Location = new System.Drawing.Point(77, 57);
            this.dpkFrom.Margin = new System.Windows.Forms.Padding(4);
            this.dpkFrom.Name = "dpkFrom";
            this.dpkFrom.Size = new System.Drawing.Size(132, 22);
            this.dpkFrom.TabIndex = 10;
            // 
            // btnSync
            // 
            this.btnSync.Location = new System.Drawing.Point(840, 676);
            this.btnSync.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSync.Name = "btnSync";
            this.btnSync.Size = new System.Drawing.Size(59, 27);
            this.btnSync.TabIndex = 9;
            this.btnSync.Text = "Sync";
            this.btnSync.UseVisualStyleBackColor = true;
            this.btnSync.Click += new System.EventHandler(this.button1_Click);
            // 
            // errID
            // 
            this.errID.ContainerControl = this;
            // 
            // errCusName
            // 
            this.errCusName.ContainerControl = this;
            // 
            // errEmName
            // 
            this.errEmName.ContainerControl = this;
            // 
            // errOrderDate
            // 
            this.errOrderDate.ContainerControl = this;
            // 
            // errRequireDate
            // 
            this.errRequireDate.ContainerControl = this;
            // 
            // errShipDate
            // 
            this.errShipDate.ContainerControl = this;
            // 
            // errShipCom
            // 
            this.errShipCom.ContainerControl = this;
            // 
            // errFreight
            // 
            this.errFreight.ContainerControl = this;
            // 
            // errShipName
            // 
            this.errShipName.ContainerControl = this;
            // 
            // errShipAddress
            // 
            this.errShipAddress.ContainerControl = this;
            // 
            // errShipCity
            // 
            this.errShipCity.ContainerControl = this;
            // 
            // errRegion
            // 
            this.errRegion.ContainerControl = this;
            // 
            // errPostal
            // 
            this.errPostal.ContainerControl = this;
            // 
            // errCountry
            // 
            this.errCountry.ContainerControl = this;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 25);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(21, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "ID";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(19, 62);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(113, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Customer Name:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(19, 103);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(115, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Employee Name:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(19, 144);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(87, 17);
            this.label4.TabIndex = 3;
            this.label4.Text = "Order Date: ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(19, 185);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(104, 17);
            this.label5.TabIndex = 4;
            this.label5.Text = "Required Date:";
            // 
            // dtShippedDate
            // 
            this.dtShippedDate.AutoSize = true;
            this.dtShippedDate.Location = new System.Drawing.Point(19, 228);
            this.dtShippedDate.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.dtShippedDate.Name = "dtShippedDate";
            this.dtShippedDate.Size = new System.Drawing.Size(98, 17);
            this.dtShippedDate.TabIndex = 5;
            this.dtShippedDate.Text = "Shipped Date:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(23, 247);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(0, 17);
            this.label7.TabIndex = 6;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(16, 300);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(127, 17);
            this.label8.TabIndex = 7;
            this.label8.Text = "Shipped Company:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(16, 340);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(56, 17);
            this.label9.TabIndex = 8;
            this.label9.Text = "Freight:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(19, 377);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(81, 17);
            this.label10.TabIndex = 9;
            this.label10.Text = "Ship Name:";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(19, 423);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(96, 17);
            this.label11.TabIndex = 10;
            this.label11.Text = "Ship Address:";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(19, 471);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(67, 17);
            this.label12.TabIndex = 11;
            this.label12.Text = "Ship City:";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(19, 513);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(89, 17);
            this.label13.TabIndex = 12;
            this.label13.Text = "Ship Region:";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(16, 555);
            this.label14.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(114, 17);
            this.label14.TabIndex = 13;
            this.label14.Text = "Ship Postalcode:";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(19, 598);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(93, 17);
            this.label15.TabIndex = 14;
            this.label15.Text = "Ship Country:";
            // 
            // dpkOrderDate
            // 
            this.dpkOrderDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dpkOrderDate.Location = new System.Drawing.Point(148, 144);
            this.dpkOrderDate.Margin = new System.Windows.Forms.Padding(4);
            this.dpkOrderDate.Name = "dpkOrderDate";
            this.dpkOrderDate.Size = new System.Drawing.Size(265, 22);
            this.dpkOrderDate.TabIndex = 17;
            // 
            // dpkRequiredDate
            // 
            this.dpkRequiredDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dpkRequiredDate.Location = new System.Drawing.Point(148, 185);
            this.dpkRequiredDate.Margin = new System.Windows.Forms.Padding(4);
            this.dpkRequiredDate.Name = "dpkRequiredDate";
            this.dpkRequiredDate.Size = new System.Drawing.Size(265, 22);
            this.dpkRequiredDate.TabIndex = 18;
            // 
            // dpkShippedDate
            // 
            this.dpkShippedDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dpkShippedDate.Location = new System.Drawing.Point(148, 228);
            this.dpkShippedDate.Margin = new System.Windows.Forms.Padding(4);
            this.dpkShippedDate.Name = "dpkShippedDate";
            this.dpkShippedDate.Size = new System.Drawing.Size(265, 22);
            this.dpkShippedDate.TabIndex = 19;
            // 
            // txtFreight
            // 
            this.txtFreight.Location = new System.Drawing.Point(148, 336);
            this.txtFreight.Margin = new System.Windows.Forms.Padding(4);
            this.txtFreight.Name = "txtFreight";
            this.txtFreight.Size = new System.Drawing.Size(160, 22);
            this.txtFreight.TabIndex = 21;
            // 
            // txtShipName
            // 
            this.txtShipName.Location = new System.Drawing.Point(147, 377);
            this.txtShipName.Margin = new System.Windows.Forms.Padding(4);
            this.txtShipName.Name = "txtShipName";
            this.txtShipName.Size = new System.Drawing.Size(195, 22);
            this.txtShipName.TabIndex = 22;
            // 
            // txtShipAddress
            // 
            this.txtShipAddress.Location = new System.Drawing.Point(147, 420);
            this.txtShipAddress.Margin = new System.Windows.Forms.Padding(4);
            this.txtShipAddress.Name = "txtShipAddress";
            this.txtShipAddress.Size = new System.Drawing.Size(195, 22);
            this.txtShipAddress.TabIndex = 23;
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(148, 651);
            this.btnSave.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 31);
            this.btnSave.TabIndex = 28;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(268, 651);
            this.btnReset.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(75, 31);
            this.btnReset.TabIndex = 29;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // cbCity
            // 
            this.cbCity.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCity.FormattingEnabled = true;
            this.cbCity.Items.AddRange(new object[] {
            "Aachen",
            "Albuquerque",
            "Anchorage",
            "Ann Arbor",
            "Annecy",
            "Århus",
            "Barcelona",
            "Barquisimeto",
            "Bend",
            "Bergamo",
            "Berlin",
            "Bern",
            "Boise",
            "Boston",
            "Bräcke",
            "Brandenburg",
            "Bruxelles",
            "Buenos Aires",
            "Butte",
            "Campinas",
            "Caracas",
            "Charleroi",
            "Colchester",
            "Cork",
            "Cowes",
            "Cunewalde",
            "Cuxhaven",
            "Elgin",
            "Eugene",
            "Frankfurt",
            "Frankfurt a.M.",
            "Genève",
            "Göteborg",
            "Graz",
            "Helsinki",
            "I. de Margarita",
            "Kirkland",
            "Kobenhavn",
            "Köln",
            "Lander",
            "Lappeenranta",
            "Leipzig",
            "Lille",
            "Lisboa",
            "London",
            "Luleå",
            "Lyngby",
            "Lyon",
            "Madrid",
            "Manchester",
            "Mannheim",
            "Marseille",
            "Melbourne",
            "México D.F.",
            "Montceau",
            "Montréal",
            "München",
            "Münster",
            "Nantes",
            "New Orleans",
            "Osaka",
            "Oulu",
            "Oviedo",
            "Paris",
            "Portland",
            "Ravenna",
            "Redmond",
            "Reggio Emilia",
            "Reims",
            "Resende",
            "Rio de Janeiro",
            "Salerno",
            "Salzburg",
            "San Cristóbal",
            "San Francisco",
            "Sandvika",
            "Sao Paulo",
            "sdfsdf",
            "Seattle",
            "Sevilla",
            "Singapore",
            "Stavern",
            "Ste-Hyacinthe",
            "Stockholm",
            "Strasbourg",
            "Stuttgart",
            "Sydney",
            "Tacoma",
            "Tokyo",
            "Torino",
            "Toulouse",
            "Tsawassen",
            "Vancouver",
            "Versailles",
            "Walla Walla",
            "Warszawa",
            "Zaandam"});
            this.cbCity.Location = new System.Drawing.Point(147, 471);
            this.cbCity.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbCity.Name = "cbCity";
            this.cbCity.Size = new System.Drawing.Size(121, 24);
            this.cbCity.TabIndex = 30;
            // 
            // cbRegion
            // 
            this.cbRegion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbRegion.FormattingEnabled = true;
            this.cbRegion.Items.AddRange(new object[] {
            "",
            "AK",
            "Asturias",
            "BC",
            "CA",
            "Co. Cork",
            "DF",
            "Essex",
            "ID",
            "Isle of Wight",
            "LA",
            "Lara",
            "MA",
            "MI",
            "MT",
            "NM",
            "NSW",
            "Nueva Esparta",
            "OR",
            "Québec",
            "RJ",
            "SP",
            "Táchira",
            "Victoria",
            "WA",
            "WY"});
            this.cbRegion.Location = new System.Drawing.Point(148, 513);
            this.cbRegion.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbRegion.Name = "cbRegion";
            this.cbRegion.Size = new System.Drawing.Size(121, 24);
            this.cbRegion.TabIndex = 31;
            // 
            // cbCountry
            // 
            this.cbCountry.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCountry.FormattingEnabled = true;
            this.cbCountry.Items.AddRange(new object[] {
            "Argentina",
            "Australia",
            "Austria",
            "Belgium",
            "Brazil",
            "Canada",
            "Denmark",
            "Finland",
            "France",
            "Germany",
            "Ireland",
            "Italy",
            "Japan",
            "Mexico",
            "Netherlands",
            "Norway",
            "Poland",
            "Portugal",
            "sdfsd",
            "Singapore",
            "Spain",
            "Sweden",
            "Switzerland",
            "UK",
            "USA",
            "Venezuela"});
            this.cbCountry.Location = new System.Drawing.Point(148, 594);
            this.cbCountry.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbCountry.Name = "cbCountry";
            this.cbCountry.Size = new System.Drawing.Size(121, 24);
            this.cbCountry.TabIndex = 32;
            // 
            // mtxtPostal
            // 
            this.mtxtPostal.Location = new System.Drawing.Point(148, 555);
            this.mtxtPostal.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtxtPostal.Mask = "00000";
            this.mtxtPostal.Name = "mtxtPostal";
            this.mtxtPostal.Size = new System.Drawing.Size(121, 22);
            this.mtxtPostal.TabIndex = 33;
            this.mtxtPostal.ValidatingType = typeof(int);
            // 
            // txtOrderID
            // 
            this.txtOrderID.Location = new System.Drawing.Point(148, 25);
            this.txtOrderID.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtOrderID.Name = "txtOrderID";
            this.txtOrderID.ReadOnly = true;
            this.txtOrderID.Size = new System.Drawing.Size(100, 22);
            this.txtOrderID.TabIndex = 34;
            // 
            // cbCustomerID
            // 
            this.cbCustomerID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCustomerID.FormattingEnabled = true;
            this.cbCustomerID.Items.AddRange(new object[] {
            ""});
            this.cbCustomerID.Location = new System.Drawing.Point(148, 59);
            this.cbCustomerID.Margin = new System.Windows.Forms.Padding(4);
            this.cbCustomerID.Name = "cbCustomerID";
            this.cbCustomerID.Size = new System.Drawing.Size(243, 24);
            this.cbCustomerID.TabIndex = 39;
            // 
            // cbEmployeeID
            // 
            this.cbEmployeeID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEmployeeID.FormattingEnabled = true;
            this.cbEmployeeID.Items.AddRange(new object[] {
            ""});
            this.cbEmployeeID.Location = new System.Drawing.Point(148, 98);
            this.cbEmployeeID.Margin = new System.Windows.Forms.Padding(4);
            this.cbEmployeeID.Name = "cbEmployeeID";
            this.cbEmployeeID.Size = new System.Drawing.Size(160, 24);
            this.cbEmployeeID.TabIndex = 40;
            // 
            // cbShippedID
            // 
            this.cbShippedID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbShippedID.FormattingEnabled = true;
            this.cbShippedID.Items.AddRange(new object[] {
            ""});
            this.cbShippedID.Location = new System.Drawing.Point(147, 297);
            this.cbShippedID.Margin = new System.Windows.Forms.Padding(4);
            this.cbShippedID.Name = "cbShippedID";
            this.cbShippedID.Size = new System.Drawing.Size(160, 24);
            this.cbShippedID.TabIndex = 41;
            // 
            // s
            // 
            this.s.AccessibleDescription = "";
            this.s.AccessibleName = "";
            this.s.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.s.Controls.Add(this.ckCus);
            this.s.Controls.Add(this.ckShipped);
            this.s.Controls.Add(this.cbShippedID);
            this.s.Controls.Add(this.cbEmployeeID);
            this.s.Controls.Add(this.cbCustomerID);
            this.s.Controls.Add(this.txtOrderID);
            this.s.Controls.Add(this.mtxtPostal);
            this.s.Controls.Add(this.cbCountry);
            this.s.Controls.Add(this.cbRegion);
            this.s.Controls.Add(this.cbCity);
            this.s.Controls.Add(this.btnReset);
            this.s.Controls.Add(this.btnSave);
            this.s.Controls.Add(this.txtShipAddress);
            this.s.Controls.Add(this.txtShipName);
            this.s.Controls.Add(this.txtFreight);
            this.s.Controls.Add(this.dpkShippedDate);
            this.s.Controls.Add(this.dpkRequiredDate);
            this.s.Controls.Add(this.dpkOrderDate);
            this.s.Controls.Add(this.label15);
            this.s.Controls.Add(this.label14);
            this.s.Controls.Add(this.label13);
            this.s.Controls.Add(this.label12);
            this.s.Controls.Add(this.label11);
            this.s.Controls.Add(this.label10);
            this.s.Controls.Add(this.label9);
            this.s.Controls.Add(this.label8);
            this.s.Controls.Add(this.label7);
            this.s.Controls.Add(this.dtShippedDate);
            this.s.Controls.Add(this.label5);
            this.s.Controls.Add(this.label4);
            this.s.Controls.Add(this.label3);
            this.s.Controls.Add(this.label2);
            this.s.Controls.Add(this.label1);
            this.s.Location = new System.Drawing.Point(24, 14);
            this.s.Margin = new System.Windows.Forms.Padding(4);
            this.s.Name = "s";
            this.s.Size = new System.Drawing.Size(489, 738);
            this.s.TabIndex = 0;
            this.s.Tag = "";
            // 
            // ckCus
            // 
            this.ckCus.AutoSize = true;
            this.ckCus.Location = new System.Drawing.Point(425, 60);
            this.ckCus.Margin = new System.Windows.Forms.Padding(4);
            this.ckCus.Name = "ckCus";
            this.ckCus.Size = new System.Drawing.Size(52, 21);
            this.ckCus.TabIndex = 43;
            this.ckCus.Text = "Not";
            this.ckCus.UseVisualStyleBackColor = true;
            this.ckCus.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // ckShipped
            // 
            this.ckShipped.AutoSize = true;
            this.ckShipped.Location = new System.Drawing.Point(148, 262);
            this.ckShipped.Margin = new System.Windows.Forms.Padding(4);
            this.ckShipped.Name = "ckShipped";
            this.ckShipped.Size = new System.Drawing.Size(106, 21);
            this.ckShipped.TabIndex = 42;
            this.ckShipped.Text = "Not shipped";
            this.ckShipped.UseVisualStyleBackColor = true;
            this.ckShipped.CheckedChanged += new System.EventHandler(this.ckShipped_CheckedChanged);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(67, 4);
            // 
            // OrdersForm
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1484, 773);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.s);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "OrdersForm";
            this.Text = "Orders";
            ((System.ComponentModel.ISupportInitialize)(this.dgOrders)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errID)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCusName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errEmName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errOrderDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRequireDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipCom)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFreight)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipAddress)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errShipCity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRegion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPostal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCountry)).EndInit();
            this.s.ResumeLayout(false);
            this.s.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.DataGridView dgOrders;
        private System.Windows.Forms.Button btnShowAll;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ErrorProvider errID;
        private System.Windows.Forms.ErrorProvider errCusName;
        private System.Windows.Forms.ErrorProvider errEmName;
        private System.Windows.Forms.ErrorProvider errOrderDate;
        private System.Windows.Forms.ErrorProvider errRequireDate;
        private System.Windows.Forms.ErrorProvider errShipDate;
        private System.Windows.Forms.ErrorProvider errShipCom;
        private System.Windows.Forms.ErrorProvider errFreight;
        private System.Windows.Forms.ErrorProvider errShipName;
        private System.Windows.Forms.ErrorProvider errShipAddress;
        private System.Windows.Forms.ErrorProvider errShipCity;
        private System.Windows.Forms.ErrorProvider errRegion;
        private System.Windows.Forms.ErrorProvider errPostal;
        private System.Windows.Forms.ErrorProvider errCountry;
        private System.Windows.Forms.Button btnSync;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.DateTimePicker dpkTo;
        private System.Windows.Forms.DateTimePicker dpkFrom;
        private System.Windows.Forms.ComboBox cbFilter;
        private System.Windows.Forms.Panel s;
        private System.Windows.Forms.ComboBox cbShippedID;
        private System.Windows.Forms.ComboBox cbEmployeeID;
        private System.Windows.Forms.ComboBox cbCustomerID;
        private System.Windows.Forms.TextBox txtOrderID;
        private System.Windows.Forms.MaskedTextBox mtxtPostal;
        private System.Windows.Forms.ComboBox cbCountry;
        private System.Windows.Forms.ComboBox cbRegion;
        private System.Windows.Forms.ComboBox cbCity;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.TextBox txtShipAddress;
        private System.Windows.Forms.TextBox txtShipName;
        private System.Windows.Forms.TextBox txtFreight;
        private System.Windows.Forms.DateTimePicker dpkShippedDate;
        private System.Windows.Forms.DateTimePicker dpkRequiredDate;
        private System.Windows.Forms.DateTimePicker dpkOrderDate;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label dtShippedDate;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbSearchby;
        private System.Windows.Forms.Button btnOrderDetail;
        private System.Windows.Forms.CheckBox ckShipped;
        private System.Windows.Forms.CheckBox ckCus;
        private System.Windows.Forms.Label dd;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Button btnCheck;
        private System.Windows.Forms.TextBox txtToMoney;
        private System.Windows.Forms.TextBox txtFromMoney;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.ComboBox cbProductFilter;
        private System.Windows.Forms.Label label18;
    }
}

