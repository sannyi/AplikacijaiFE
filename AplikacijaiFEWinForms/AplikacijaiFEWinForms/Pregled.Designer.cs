namespace AplikacijaiFEWinForms
{
    partial class Pregled
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.ImeObjekta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TipObjekta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.VhodIzhod = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ImeParametra = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PodatkovniTip = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ImeObjekta,
            this.TipObjekta,
            this.VhodIzhod,
            this.ImeParametra,
            this.PodatkovniTip});
            this.dataGridView1.Location = new System.Drawing.Point(12, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(883, 341);
            this.dataGridView1.TabIndex = 0;
            // 
            // ImeObjekta
            // 
            this.ImeObjekta.HeaderText = "ImeObjekta";
            this.ImeObjekta.Name = "ImeObjekta";
            this.ImeObjekta.ReadOnly = true;
            // 
            // TipObjekta
            // 
            this.TipObjekta.HeaderText = "TipObjekta";
            this.TipObjekta.Name = "TipObjekta";
            // 
            // VhodIzhod
            // 
            this.VhodIzhod.HeaderText = "VhodIzhod";
            this.VhodIzhod.Name = "VhodIzhod";
            this.VhodIzhod.ReadOnly = true;
            // 
            // ImeParametra
            // 
            this.ImeParametra.HeaderText = "ImeParametra";
            this.ImeParametra.Name = "ImeParametra";
            this.ImeParametra.ReadOnly = true;
            // 
            // PodatkovniTip
            // 
            this.PodatkovniTip.HeaderText = "PodatkovniTip";
            this.PodatkovniTip.Name = "PodatkovniTip";
            this.PodatkovniTip.ReadOnly = true;
            // 
            // Pregled
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(950, 521);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Pregled";
            this.Text = "Pogled";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ImeObjekta;
        private System.Windows.Forms.DataGridViewTextBoxColumn TipObjekta;
        private System.Windows.Forms.DataGridViewTextBoxColumn VhodIzhod;
        private System.Windows.Forms.DataGridViewTextBoxColumn ImeParametra;
        private System.Windows.Forms.DataGridViewTextBoxColumn PodatkovniTip;
    }
}