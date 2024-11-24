using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using VagStatus.Model;

namespace VagStatus
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private static VagStatusDbEntities _context;
        public static VagStatusDbEntities GetContext()
        {
            if (_context == null)
            {
                _context = new VagStatusDbEntities();
            }
            return _context;
        }
    }
}
