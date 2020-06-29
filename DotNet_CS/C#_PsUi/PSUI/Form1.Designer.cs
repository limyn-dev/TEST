namespace PSUI
{
    partial class Form1
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
           this.tabMain = new System.Windows.Forms.TabControl();
           this.tbpScript = new System.Windows.Forms.TabPage();
           this.tbpResult = new System.Windows.Forms.TabPage();
           this.btnRun = new System.Windows.Forms.Button();
           this.rtbScript = new System.Windows.Forms.RichTextBox();
           this.tbxResult = new System.Windows.Forms.TextBox();
           this.tabMain.SuspendLayout();
           this.tbpScript.SuspendLayout();
           this.tbpResult.SuspendLayout();
           this.SuspendLayout();
           // 
           // tabMain
           // 
           this.tabMain.Controls.Add(this.tbpScript);
           this.tabMain.Controls.Add(this.tbpResult);
           this.tabMain.Location = new System.Drawing.Point(-3, 27);
           this.tabMain.Name = "tabMain";
           this.tabMain.SelectedIndex = 0;
           this.tabMain.Size = new System.Drawing.Size(987, 480);
           this.tabMain.TabIndex = 0;
           // 
           // tbpScript
           // 
           this.tbpScript.Controls.Add(this.rtbScript);
           this.tbpScript.Location = new System.Drawing.Point(4, 25);
           this.tbpScript.Name = "tbpScript";
           this.tbpScript.Padding = new System.Windows.Forms.Padding(3);
           this.tbpScript.Size = new System.Drawing.Size(979, 451);
           this.tbpScript.TabIndex = 0;
           this.tbpScript.Text = "Script";
           this.tbpScript.UseVisualStyleBackColor = true;
           // 
           // tbpResult
           // 
           this.tbpResult.Controls.Add(this.tbxResult);
           this.tbpResult.Location = new System.Drawing.Point(4, 25);
           this.tbpResult.Name = "tbpResult";
           this.tbpResult.Padding = new System.Windows.Forms.Padding(3);
           this.tbpResult.Size = new System.Drawing.Size(979, 451);
           this.tbpResult.TabIndex = 1;
           this.tbpResult.Text = "Result";
           this.tbpResult.UseVisualStyleBackColor = true;
           // 
           // btnRun
           // 
           this.btnRun.Location = new System.Drawing.Point(4, -5);
           this.btnRun.Name = "btnRun";
           this.btnRun.Size = new System.Drawing.Size(70, 26);
           this.btnRun.TabIndex = 1;
           this.btnRun.Text = "RUN";
           this.btnRun.UseVisualStyleBackColor = true;
           this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
           // 
           // rtbScript
           // 
           this.rtbScript.HideSelection = false;
           this.rtbScript.Location = new System.Drawing.Point(398, 149);
           this.rtbScript.Name = "rtbScript";
           this.rtbScript.Size = new System.Drawing.Size(182, 153);
           this.rtbScript.TabIndex = 4;
           this.rtbScript.Text = "";
           this.rtbScript.KeyDown += new System.Windows.Forms.KeyEventHandler(this.rtbScript_KeyDown);
           this.rtbScript.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.rtbScript_KeyPress);
           // 
           // tbxResult
           // 
           this.tbxResult.Location = new System.Drawing.Point(38, 26);
           this.tbxResult.Multiline = true;
           this.tbxResult.Name = "tbxResult";
           this.tbxResult.ScrollBars = System.Windows.Forms.ScrollBars.Both;
           this.tbxResult.Size = new System.Drawing.Size(341, 250);
           this.tbxResult.TabIndex = 4;
           // 
           // Form1
           // 
           this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
           this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
           this.ClientSize = new System.Drawing.Size(985, 506);
           this.Controls.Add(this.btnRun);
           this.Controls.Add(this.tabMain);
           this.Name = "Form1";
           this.Text = "Form1";
           this.Load += new System.EventHandler(this.Form1_Resize);
           this.Shown += new System.EventHandler(this.Form1_Shown);
           this.Resize += new System.EventHandler(this.Form1_Resize);
           this.tabMain.ResumeLayout(false);
           this.tbpScript.ResumeLayout(false);
           this.tbpResult.ResumeLayout(false);
           this.tbpResult.PerformLayout();
           this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabMain;
        private System.Windows.Forms.TabPage tbpScript;
        private System.Windows.Forms.TabPage tbpResult;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.RichTextBox rtbScript;
        private System.Windows.Forms.TextBox tbxResult;
    }
}

