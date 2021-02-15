namespace KeLi.HelloWindowService.App
{
	partial class ProjectInstaller
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

		#region Component Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.SpiInstaller = new System.ServiceProcess.ServiceProcessInstaller();
			this.SiInstaller = new System.ServiceProcess.ServiceInstaller();
			// 
			// SpiInstaller
			// 
			this.SpiInstaller.Account = System.ServiceProcess.ServiceAccount.LocalSystem;
			this.SpiInstaller.Password = null;
			this.SpiInstaller.Username = null;
			// 
			// SiInstaller
			// 
			this.SiInstaller.ServiceName = "TestService";
			// 
			// ProjectInstaller
			// 
			this.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.SpiInstaller,
            this.SiInstaller});

		}

		#endregion

		private System.ServiceProcess.ServiceProcessInstaller SpiInstaller;
		private System.ServiceProcess.ServiceInstaller SiInstaller;
	}
}