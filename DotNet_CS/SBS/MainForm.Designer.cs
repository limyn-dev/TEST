/*
 * Created by SharpDevelop.
 * User: USRLOC
 * Date: 08.10.2018
 * Time: 22:07
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace SBS
{
	partial class MainForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		private System.Windows.Forms.MenuStrip menuStrip1;
		private System.Windows.Forms.TabControl tabMAIN;
		private System.Windows.Forms.TabPage tbpLOG;
		private System.Windows.Forms.TextBox tbxLOG;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem newToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator;
		private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem saveAsToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
		private System.Windows.Forms.ToolStripMenuItem printToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem printPreviewToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
		private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem undoToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem redoToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
		private System.Windows.Forms.ToolStripMenuItem cutToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem copyToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem pasteToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
		private System.Windows.Forms.ToolStripMenuItem selectAllToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem customizeToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem contentsToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem indexToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem searchToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
		private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
		   System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
		   this.menuStrip1 = new System.Windows.Forms.MenuStrip();
		   this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.newToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator = new System.Windows.Forms.ToolStripSeparator();
		   this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.saveAsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
		   this.printToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.printPreviewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
		   this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.undoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.redoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
		   this.cutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.copyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.pasteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
		   this.selectAllToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.customizeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.contentsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.indexToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.searchToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
		   this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
		   this.tabMAIN = new System.Windows.Forms.TabControl();
		   this.tbpLOG = new System.Windows.Forms.TabPage();
		   this.tbxLOG = new System.Windows.Forms.TextBox();
		   this.tabPage2 = new System.Windows.Forms.TabPage();
		   this.menuStrip1.SuspendLayout();
		   this.tabMAIN.SuspendLayout();
		   this.tbpLOG.SuspendLayout();
		   this.SuspendLayout();
		   // 
		   // menuStrip1
		   // 
		   this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
		   this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
         this.fileToolStripMenuItem,
         this.editToolStripMenuItem,
         this.toolsToolStripMenuItem,
         this.helpToolStripMenuItem});
		   this.menuStrip1.Location = new System.Drawing.Point(0, 0);
		   this.menuStrip1.Name = "menuStrip1";
		   this.menuStrip1.Size = new System.Drawing.Size(1205, 33);
		   this.menuStrip1.TabIndex = 0;
		   this.menuStrip1.Text = "menuStrip1";
		   // 
		   // fileToolStripMenuItem
		   // 
		   this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
         this.newToolStripMenuItem,
         this.openToolStripMenuItem,
         this.toolStripSeparator,
         this.saveToolStripMenuItem,
         this.saveAsToolStripMenuItem,
         this.toolStripSeparator1,
         this.printToolStripMenuItem,
         this.printPreviewToolStripMenuItem,
         this.toolStripSeparator2,
         this.exitToolStripMenuItem});
		   this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
		   this.fileToolStripMenuItem.Size = new System.Drawing.Size(50, 29);
		   this.fileToolStripMenuItem.Text = "&File";
		   // 
		   // newToolStripMenuItem
		   // 
		   this.newToolStripMenuItem.Enabled = false;
		   this.newToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("newToolStripMenuItem.Image")));
		   this.newToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.newToolStripMenuItem.Name = "newToolStripMenuItem";
		   this.newToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.N)));
		   this.newToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.newToolStripMenuItem.Text = "&New";
		   // 
		   // openToolStripMenuItem
		   // 
		   this.openToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("openToolStripMenuItem.Image")));
		   this.openToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.openToolStripMenuItem.Name = "openToolStripMenuItem";
		   this.openToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
		   this.openToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.openToolStripMenuItem.Text = "&Open";
		   this.openToolStripMenuItem.Click += new System.EventHandler(this.OpenToolStripMenuItemClick);
		   // 
		   // toolStripSeparator
		   // 
		   this.toolStripSeparator.Name = "toolStripSeparator";
		   this.toolStripSeparator.Size = new System.Drawing.Size(207, 6);
		   // 
		   // saveToolStripMenuItem
		   // 
		   this.saveToolStripMenuItem.Enabled = false;
		   this.saveToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("saveToolStripMenuItem.Image")));
		   this.saveToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
		   this.saveToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S)));
		   this.saveToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.saveToolStripMenuItem.Text = "&Save";
		   // 
		   // saveAsToolStripMenuItem
		   // 
		   this.saveAsToolStripMenuItem.Enabled = false;
		   this.saveAsToolStripMenuItem.Name = "saveAsToolStripMenuItem";
		   this.saveAsToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.saveAsToolStripMenuItem.Text = "Save &As";
		   // 
		   // toolStripSeparator1
		   // 
		   this.toolStripSeparator1.Name = "toolStripSeparator1";
		   this.toolStripSeparator1.Size = new System.Drawing.Size(207, 6);
		   // 
		   // printToolStripMenuItem
		   // 
		   this.printToolStripMenuItem.Enabled = false;
		   this.printToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("printToolStripMenuItem.Image")));
		   this.printToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.printToolStripMenuItem.Name = "printToolStripMenuItem";
		   this.printToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.P)));
		   this.printToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.printToolStripMenuItem.Text = "&Print";
		   // 
		   // printPreviewToolStripMenuItem
		   // 
		   this.printPreviewToolStripMenuItem.Enabled = false;
		   this.printPreviewToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("printPreviewToolStripMenuItem.Image")));
		   this.printPreviewToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.printPreviewToolStripMenuItem.Name = "printPreviewToolStripMenuItem";
		   this.printPreviewToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.printPreviewToolStripMenuItem.Text = "Print Pre&view";
		   // 
		   // toolStripSeparator2
		   // 
		   this.toolStripSeparator2.Name = "toolStripSeparator2";
		   this.toolStripSeparator2.Size = new System.Drawing.Size(207, 6);
		   // 
		   // exitToolStripMenuItem
		   // 
		   this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
		   this.exitToolStripMenuItem.Size = new System.Drawing.Size(210, 30);
		   this.exitToolStripMenuItem.Text = "E&xit";
		   // 
		   // editToolStripMenuItem
		   // 
		   this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
         this.undoToolStripMenuItem,
         this.redoToolStripMenuItem,
         this.toolStripSeparator3,
         this.cutToolStripMenuItem,
         this.copyToolStripMenuItem,
         this.pasteToolStripMenuItem,
         this.toolStripSeparator4,
         this.selectAllToolStripMenuItem});
		   this.editToolStripMenuItem.Enabled = false;
		   this.editToolStripMenuItem.Name = "editToolStripMenuItem";
		   this.editToolStripMenuItem.Size = new System.Drawing.Size(54, 29);
		   this.editToolStripMenuItem.Text = "&Edit";
		   // 
		   // undoToolStripMenuItem
		   // 
		   this.undoToolStripMenuItem.Name = "undoToolStripMenuItem";
		   this.undoToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Z)));
		   this.undoToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.undoToolStripMenuItem.Text = "&Undo";
		   // 
		   // redoToolStripMenuItem
		   // 
		   this.redoToolStripMenuItem.Name = "redoToolStripMenuItem";
		   this.redoToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Y)));
		   this.redoToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.redoToolStripMenuItem.Text = "&Redo";
		   // 
		   // toolStripSeparator3
		   // 
		   this.toolStripSeparator3.Name = "toolStripSeparator3";
		   this.toolStripSeparator3.Size = new System.Drawing.Size(198, 6);
		   // 
		   // cutToolStripMenuItem
		   // 
		   this.cutToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("cutToolStripMenuItem.Image")));
		   this.cutToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.cutToolStripMenuItem.Name = "cutToolStripMenuItem";
		   this.cutToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.X)));
		   this.cutToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.cutToolStripMenuItem.Text = "Cu&t";
		   // 
		   // copyToolStripMenuItem
		   // 
		   this.copyToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("copyToolStripMenuItem.Image")));
		   this.copyToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.copyToolStripMenuItem.Name = "copyToolStripMenuItem";
		   this.copyToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.C)));
		   this.copyToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.copyToolStripMenuItem.Text = "&Copy";
		   // 
		   // pasteToolStripMenuItem
		   // 
		   this.pasteToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("pasteToolStripMenuItem.Image")));
		   this.pasteToolStripMenuItem.ImageTransparentColor = System.Drawing.Color.Magenta;
		   this.pasteToolStripMenuItem.Name = "pasteToolStripMenuItem";
		   this.pasteToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.V)));
		   this.pasteToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.pasteToolStripMenuItem.Text = "&Paste";
		   // 
		   // toolStripSeparator4
		   // 
		   this.toolStripSeparator4.Name = "toolStripSeparator4";
		   this.toolStripSeparator4.Size = new System.Drawing.Size(198, 6);
		   // 
		   // selectAllToolStripMenuItem
		   // 
		   this.selectAllToolStripMenuItem.Name = "selectAllToolStripMenuItem";
		   this.selectAllToolStripMenuItem.Size = new System.Drawing.Size(201, 30);
		   this.selectAllToolStripMenuItem.Text = "Select &All";
		   // 
		   // toolsToolStripMenuItem
		   // 
		   this.toolsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
         this.customizeToolStripMenuItem,
         this.optionsToolStripMenuItem});
		   this.toolsToolStripMenuItem.Enabled = false;
		   this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
		   this.toolsToolStripMenuItem.Size = new System.Drawing.Size(65, 29);
		   this.toolsToolStripMenuItem.Text = "&Tools";
		   // 
		   // customizeToolStripMenuItem
		   // 
		   this.customizeToolStripMenuItem.Name = "customizeToolStripMenuItem";
		   this.customizeToolStripMenuItem.Size = new System.Drawing.Size(179, 30);
		   this.customizeToolStripMenuItem.Text = "&Customize";
		   // 
		   // optionsToolStripMenuItem
		   // 
		   this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
		   this.optionsToolStripMenuItem.Size = new System.Drawing.Size(179, 30);
		   this.optionsToolStripMenuItem.Text = "&Options";
		   // 
		   // helpToolStripMenuItem
		   // 
		   this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
         this.contentsToolStripMenuItem,
         this.indexToolStripMenuItem,
         this.searchToolStripMenuItem,
         this.toolStripSeparator5,
         this.aboutToolStripMenuItem});
		   this.helpToolStripMenuItem.Enabled = false;
		   this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
		   this.helpToolStripMenuItem.Size = new System.Drawing.Size(61, 29);
		   this.helpToolStripMenuItem.Text = "&Help";
		   // 
		   // contentsToolStripMenuItem
		   // 
		   this.contentsToolStripMenuItem.Name = "contentsToolStripMenuItem";
		   this.contentsToolStripMenuItem.Size = new System.Drawing.Size(167, 30);
		   this.contentsToolStripMenuItem.Text = "&Contents";
		   // 
		   // indexToolStripMenuItem
		   // 
		   this.indexToolStripMenuItem.Name = "indexToolStripMenuItem";
		   this.indexToolStripMenuItem.Size = new System.Drawing.Size(167, 30);
		   this.indexToolStripMenuItem.Text = "&Index";
		   // 
		   // searchToolStripMenuItem
		   // 
		   this.searchToolStripMenuItem.Name = "searchToolStripMenuItem";
		   this.searchToolStripMenuItem.Size = new System.Drawing.Size(167, 30);
		   this.searchToolStripMenuItem.Text = "&Search";
		   // 
		   // toolStripSeparator5
		   // 
		   this.toolStripSeparator5.Name = "toolStripSeparator5";
		   this.toolStripSeparator5.Size = new System.Drawing.Size(164, 6);
		   // 
		   // aboutToolStripMenuItem
		   // 
		   this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
		   this.aboutToolStripMenuItem.Size = new System.Drawing.Size(167, 30);
		   this.aboutToolStripMenuItem.Text = "&About...";
		   // 
		   // tabMAIN
		   // 
		   this.tabMAIN.Controls.Add(this.tbpLOG);
		   this.tabMAIN.Controls.Add(this.tabPage2);
		   this.tabMAIN.Dock = System.Windows.Forms.DockStyle.Fill;
		   this.tabMAIN.Location = new System.Drawing.Point(0, 33);
		   this.tabMAIN.Name = "tabMAIN";
		   this.tabMAIN.SelectedIndex = 0;
		   this.tabMAIN.Size = new System.Drawing.Size(1205, 651);
		   this.tabMAIN.TabIndex = 1;
		   // 
		   // tbpLOG
		   // 
		   this.tbpLOG.Controls.Add(this.tbxLOG);
		   this.tbpLOG.Location = new System.Drawing.Point(4, 29);
		   this.tbpLOG.Name = "tbpLOG";
		   this.tbpLOG.Padding = new System.Windows.Forms.Padding(3);
		   this.tbpLOG.Size = new System.Drawing.Size(1197, 618);
		   this.tbpLOG.TabIndex = 0;
		   this.tbpLOG.Text = "LOG";
		   this.tbpLOG.UseVisualStyleBackColor = true;
		   // 
		   // tbxLOG
		   // 
		   this.tbxLOG.Dock = System.Windows.Forms.DockStyle.Fill;
		   this.tbxLOG.Location = new System.Drawing.Point(3, 3);
		   this.tbxLOG.Multiline = true;
		   this.tbxLOG.Name = "tbxLOG";
		   this.tbxLOG.Size = new System.Drawing.Size(1191, 612);
		   this.tbxLOG.TabIndex = 0;
		   // 
		   // tabPage2
		   // 
		   this.tabPage2.Location = new System.Drawing.Point(4, 29);
		   this.tabPage2.Name = "tabPage2";
		   this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
		   this.tabPage2.Size = new System.Drawing.Size(1197, 618);
		   this.tabPage2.TabIndex = 1;
		   this.tabPage2.Text = "tabPage2";
		   this.tabPage2.UseVisualStyleBackColor = true;
		   // 
		   // MainForm
		   // 
		   this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
		   this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
		   this.ClientSize = new System.Drawing.Size(1205, 684);
		   this.Controls.Add(this.tabMAIN);
		   this.Controls.Add(this.menuStrip1);
		   this.MainMenuStrip = this.menuStrip1;
		   this.Name = "MainForm";
		   this.Text = "SBS";
		   this.menuStrip1.ResumeLayout(false);
		   this.menuStrip1.PerformLayout();
		   this.tabMAIN.ResumeLayout(false);
		   this.tbpLOG.ResumeLayout(false);
		   this.tbpLOG.PerformLayout();
		   this.ResumeLayout(false);
		   this.PerformLayout();

		}
	
	}
}
