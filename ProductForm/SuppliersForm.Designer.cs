namespace ProductForm
{
    partial class SupplierForm
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
            this.gbxInfo = new System.Windows.Forms.GroupBox();
            this.mtbFax = new System.Windows.Forms.MaskedTextBox();
            this.mtbPhone = new System.Windows.Forms.MaskedTextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.cbCountry = new System.Windows.Forms.ComboBox();
            this.mtxtPostal = new System.Windows.Forms.MaskedTextBox();
            this.cbRegion = new System.Windows.Forms.ComboBox();
            this.cbCity = new System.Windows.Forms.ComboBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.txtContactTitle = new System.Windows.Forms.TextBox();
            this.txtContactName = new System.Windows.Forms.TextBox();
            this.txtCompanyName = new System.Windows.Forms.TextBox();
            this.txtID = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbSearchBy = new System.Windows.Forms.ComboBox();
            this.cbFilterCountry = new System.Windows.Forms.ComboBox();
            this.btnSync = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.dgSupplier = new System.Windows.Forms.DataGridView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnShowAll = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.errCompanyname = new System.Windows.Forms.ErrorProvider(this.components);
            this.errContactName = new System.Windows.Forms.ErrorProvider(this.components);
            this.errTitle = new System.Windows.Forms.ErrorProvider(this.components);
            this.errAddress = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCity = new System.Windows.Forms.ErrorProvider(this.components);
            this.errRegion = new System.Windows.Forms.ErrorProvider(this.components);
            this.errPostalcode = new System.Windows.Forms.ErrorProvider(this.components);
            this.errCountry = new System.Windows.Forms.ErrorProvider(this.components);
            this.errPhone = new System.Windows.Forms.ErrorProvider(this.components);
            this.errFax = new System.Windows.Forms.ErrorProvider(this.components);
            this.label13 = new System.Windows.Forms.Label();
            this.gbxInfo.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgSupplier)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errCompanyname)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errContactName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errTitle)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errAddress)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRegion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPostalcode)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCountry)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPhone)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFax)).BeginInit();
            this.SuspendLayout();
            // 
            // gbxInfo
            // 
            this.gbxInfo.Controls.Add(this.mtbFax);
            this.gbxInfo.Controls.Add(this.mtbPhone);
            this.gbxInfo.Controls.Add(this.btnReset);
            this.gbxInfo.Controls.Add(this.btnSave);
            this.gbxInfo.Controls.Add(this.cbCountry);
            this.gbxInfo.Controls.Add(this.mtxtPostal);
            this.gbxInfo.Controls.Add(this.cbRegion);
            this.gbxInfo.Controls.Add(this.cbCity);
            this.gbxInfo.Controls.Add(this.txtAddress);
            this.gbxInfo.Controls.Add(this.txtContactTitle);
            this.gbxInfo.Controls.Add(this.txtContactName);
            this.gbxInfo.Controls.Add(this.txtCompanyName);
            this.gbxInfo.Controls.Add(this.txtID);
            this.gbxInfo.Controls.Add(this.label11);
            this.gbxInfo.Controls.Add(this.label10);
            this.gbxInfo.Controls.Add(this.label9);
            this.gbxInfo.Controls.Add(this.label8);
            this.gbxInfo.Controls.Add(this.label7);
            this.gbxInfo.Controls.Add(this.label6);
            this.gbxInfo.Controls.Add(this.label5);
            this.gbxInfo.Controls.Add(this.label4);
            this.gbxInfo.Controls.Add(this.label3);
            this.gbxInfo.Controls.Add(this.label2);
            this.gbxInfo.Controls.Add(this.label1);
            this.gbxInfo.Location = new System.Drawing.Point(35, 14);
            this.gbxInfo.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxInfo.Name = "gbxInfo";
            this.gbxInfo.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gbxInfo.Size = new System.Drawing.Size(423, 684);
            this.gbxInfo.TabIndex = 1;
            this.gbxInfo.TabStop = false;
            this.gbxInfo.Text = "Supplier infomation";
            // 
            // mtbFax
            // 
            this.mtbFax.Location = new System.Drawing.Point(197, 530);
            this.mtbFax.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtbFax.Mask = "000-00000";
            this.mtbFax.Name = "mtbFax";
            this.mtbFax.Size = new System.Drawing.Size(139, 22);
            this.mtbFax.TabIndex = 23;
            // 
            // mtbPhone
            // 
            this.mtbPhone.Location = new System.Drawing.Point(197, 495);
            this.mtbPhone.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtbPhone.Mask = "000-00000";
            this.mtbPhone.Name = "mtbPhone";
            this.mtbPhone.Size = new System.Drawing.Size(139, 22);
            this.mtbPhone.TabIndex = 22;
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(261, 615);
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
            this.btnSave.Location = new System.Drawing.Point(111, 618);
            this.btnSave.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 34);
            this.btnSave.TabIndex = 20;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
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
            this.cbCountry.Location = new System.Drawing.Point(197, 444);
            this.cbCountry.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbCountry.Name = "cbCountry";
            this.cbCountry.Size = new System.Drawing.Size(139, 24);
            this.cbCountry.TabIndex = 19;
            // 
            // mtxtPostal
            // 
            this.mtxtPostal.Location = new System.Drawing.Point(197, 401);
            this.mtxtPostal.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mtxtPostal.Mask = "00000";
            this.mtxtPostal.Name = "mtxtPostal";
            this.mtxtPostal.Size = new System.Drawing.Size(111, 22);
            this.mtxtPostal.TabIndex = 18;
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
            this.cbRegion.Location = new System.Drawing.Point(197, 354);
            this.cbRegion.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbRegion.Name = "cbRegion";
            this.cbRegion.Size = new System.Drawing.Size(139, 24);
            this.cbRegion.TabIndex = 17;
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
            this.cbCity.Location = new System.Drawing.Point(197, 313);
            this.cbCity.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbCity.Name = "cbCity";
            this.cbCity.Size = new System.Drawing.Size(139, 24);
            this.cbCity.TabIndex = 16;
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(197, 208);
            this.txtAddress.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtAddress.Multiline = true;
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(181, 89);
            this.txtAddress.TabIndex = 15;
            // 
            // txtContactTitle
            // 
            this.txtContactTitle.Location = new System.Drawing.Point(197, 162);
            this.txtContactTitle.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtContactTitle.Name = "txtContactTitle";
            this.txtContactTitle.Size = new System.Drawing.Size(181, 22);
            this.txtContactTitle.TabIndex = 14;
            // 
            // txtContactName
            // 
            this.txtContactName.Location = new System.Drawing.Point(197, 117);
            this.txtContactName.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtContactName.Name = "txtContactName";
            this.txtContactName.Size = new System.Drawing.Size(181, 22);
            this.txtContactName.TabIndex = 13;
            // 
            // txtCompanyName
            // 
            this.txtCompanyName.Location = new System.Drawing.Point(197, 74);
            this.txtCompanyName.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtCompanyName.Name = "txtCompanyName";
            this.txtCompanyName.Size = new System.Drawing.Size(181, 22);
            this.txtCompanyName.TabIndex = 12;
            // 
            // txtID
            // 
            this.txtID.Location = new System.Drawing.Point(197, 37);
            this.txtID.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtID.Name = "txtID";
            this.txtID.ReadOnly = true;
            this.txtID.Size = new System.Drawing.Size(111, 22);
            this.txtID.TabIndex = 11;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(21, 533);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(34, 17);
            this.label11.TabIndex = 10;
            this.label11.Text = "Fax:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(21, 495);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(53, 17);
            this.label10.TabIndex = 9;
            this.label10.Text = "Phone:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(21, 444);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(61, 17);
            this.label9.TabIndex = 8;
            this.label9.Text = "Country:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(21, 401);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(86, 17);
            this.label8.TabIndex = 7;
            this.label8.Text = "Postal code:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(21, 354);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(57, 17);
            this.label7.TabIndex = 6;
            this.label7.Text = "Region:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(24, 313);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(35, 17);
            this.label6.TabIndex = 5;
            this.label6.Text = "City:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(21, 210);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(64, 17);
            this.label5.TabIndex = 4;
            this.label5.Text = "Address:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(21, 162);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(86, 17);
            this.label4.TabIndex = 3;
            this.label4.Text = "Contact title:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(21, 117);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Contact name:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(21, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(110, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Company name:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(25, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "ID:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.cbSearchBy);
            this.groupBox1.Controls.Add(this.cbFilterCountry);
            this.groupBox1.Controls.Add(this.btnSync);
            this.groupBox1.Controls.Add(this.btnSearch);
            this.groupBox1.Controls.Add(this.txtSearch);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Location = new System.Drawing.Point(485, 14);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Size = new System.Drawing.Size(965, 112);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Search";
            // 
            // cbSearchBy
            // 
            this.cbSearchBy.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbSearchBy.FormattingEnabled = true;
            this.cbSearchBy.Items.AddRange(new object[] {
            "Company Name",
            "Contact Name"});
            this.cbSearchBy.Location = new System.Drawing.Point(103, 22);
            this.cbSearchBy.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cbSearchBy.Name = "cbSearchBy";
            this.cbSearchBy.Size = new System.Drawing.Size(160, 24);
            this.cbSearchBy.TabIndex = 5;
            // 
            // cbFilterCountry
            // 
            this.cbFilterCountry.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbFilterCountry.FormattingEnabled = true;
            this.cbFilterCountry.Items.AddRange(new object[] {
            "Argentina",
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
            "Mexico",
            "Norway",
            "Poland",
            "Portugal",
            "Spain",
            "Sweden",
            "Switzerland",
            "UK",
            "USA",
            "Venezuela"});
            this.cbFilterCountry.Location = new System.Drawing.Point(768, 66);
            this.cbFilterCountry.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cbFilterCountry.Name = "cbFilterCountry";
            this.cbFilterCountry.Size = new System.Drawing.Size(181, 24);
            this.cbFilterCountry.TabIndex = 4;
            this.cbFilterCountry.SelectedIndexChanged += new System.EventHandler(this.cbFilterCountry_SelectedIndexChanged);
            // 
            // btnSync
            // 
            this.btnSync.Location = new System.Drawing.Point(889, 15);
            this.btnSync.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSync.Name = "btnSync";
            this.btnSync.Size = new System.Drawing.Size(60, 31);
            this.btnSync.TabIndex = 3;
            this.btnSync.Text = "Sync";
            this.btnSync.UseVisualStyleBackColor = true;
            this.btnSync.Click += new System.EventHandler(this.btnSync_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(325, 62);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(104, 31);
            this.btnSearch.TabIndex = 2;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(103, 65);
            this.txtSearch.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(195, 22);
            this.txtSearch.TabIndex = 1;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(21, 69);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(53, 17);
            this.label12.TabIndex = 0;
            this.label12.Text = "Search";
            // 
            // dgSupplier
            // 
            this.dgSupplier.AllowUserToAddRows = false;
            this.dgSupplier.AllowUserToDeleteRows = false;
            this.dgSupplier.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgSupplier.Location = new System.Drawing.Point(485, 130);
            this.dgSupplier.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgSupplier.MultiSelect = false;
            this.dgSupplier.Name = "dgSupplier";
            this.dgSupplier.ReadOnly = true;
            this.dgSupplier.RowTemplate.Height = 24;
            this.dgSupplier.Size = new System.Drawing.Size(965, 473);
            this.dgSupplier.TabIndex = 3;
            this.dgSupplier.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgSupplier_CellClick);
            this.dgSupplier.SelectionChanged += new System.EventHandler(this.dgSupplier_SelectionChanged);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnShowAll);
            this.panel2.Controls.Add(this.btnDelete);
            this.panel2.Controls.Add(this.btnNew);
            this.panel2.Location = new System.Drawing.Point(485, 633);
            this.panel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(372, 66);
            this.panel2.TabIndex = 4;
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
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click_1);
            // 
            // errCompanyname
            // 
            this.errCompanyname.ContainerControl = this;
            // 
            // errContactName
            // 
            this.errContactName.ContainerControl = this;
            // 
            // errTitle
            // 
            this.errTitle.ContainerControl = this;
            // 
            // errAddress
            // 
            this.errAddress.ContainerControl = this;
            // 
            // errCity
            // 
            this.errCity.ContainerControl = this;
            // 
            // errRegion
            // 
            this.errRegion.ContainerControl = this;
            // 
            // errPostalcode
            // 
            this.errPostalcode.ContainerControl = this;
            // 
            // errCountry
            // 
            this.errCountry.ContainerControl = this;
            // 
            // errPhone
            // 
            this.errPhone.ContainerControl = this;
            // 
            // errFax
            // 
            this.errFax.ContainerControl = this;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(695, 70);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(57, 17);
            this.label13.TabIndex = 6;
            this.label13.Text = "Country";
            // 
            // SupplierForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1499, 711);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.dgSupplier);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.gbxInfo);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "SupplierForm";
            this.Text = "Supplier";
            this.gbxInfo.ResumeLayout(false);
            this.gbxInfo.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgSupplier)).EndInit();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.errCompanyname)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errContactName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errTitle)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errAddress)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errRegion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPostalcode)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errCountry)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errPhone)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errFax)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxInfo;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.ComboBox cbCountry;
        private System.Windows.Forms.MaskedTextBox mtxtPostal;
        private System.Windows.Forms.ComboBox cbRegion;
        private System.Windows.Forms.ComboBox cbCity;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.TextBox txtContactTitle;
        private System.Windows.Forms.TextBox txtContactName;
        private System.Windows.Forms.TextBox txtCompanyName;
        private System.Windows.Forms.TextBox txtID;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.DataGridView dgSupplier;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnShowAll;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.ErrorProvider errCompanyname;
        private System.Windows.Forms.ErrorProvider errContactName;
        private System.Windows.Forms.ErrorProvider errTitle;
        private System.Windows.Forms.ErrorProvider errAddress;
        private System.Windows.Forms.ErrorProvider errCity;
        private System.Windows.Forms.ErrorProvider errRegion;
        private System.Windows.Forms.ErrorProvider errPostalcode;
        private System.Windows.Forms.ErrorProvider errCountry;
        private System.Windows.Forms.ErrorProvider errPhone;
        private System.Windows.Forms.ErrorProvider errFax;
        private System.Windows.Forms.MaskedTextBox mtbFax;
        private System.Windows.Forms.MaskedTextBox mtbPhone;
        private System.Windows.Forms.Button btnSync;
        private System.Windows.Forms.ComboBox cbFilterCountry;
        private System.Windows.Forms.ComboBox cbSearchBy;
        private System.Windows.Forms.Label label13;
    }
}

