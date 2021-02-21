using System;
using System.ServiceProcess;

using NLog;

namespace KeLi.HelloWindowService.App
{
    public partial class TestService : ServiceBase
	{
        private static readonly Logger _logger = LogManager.GetCurrentClassLogger();

		public TestService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                _logger.Info("OnStart successful!");
            }
            catch (Exception e)
            {
                _logger.Fatal("OnStart error: {0}!", e.ToString());
			}
		}

        protected override void OnStop()
		{
			try
            {
                _logger.Info("OnStop successful!");
            }
            catch (Exception e)
            {
                _logger.Fatal("OnStop error: {0}!", e.ToString());
            }
		}
    }
}