using System;
using System.ServiceProcess;

using NLog;

namespace KeLi.HelloWindowService.App
{
    internal static class Program
    {
        private static readonly Logger _logger = LogManager.GetCurrentClassLogger();

        private static void Main()
        {
            try
            {
                var services = new ServiceBase[] { new TestService() };

                ServiceBase.Run(services);
            }
            catch (Exception e)
            {
                _logger.Fatal(e.ToString);
            }
        }
    }
}