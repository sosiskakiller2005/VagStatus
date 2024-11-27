using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using VagStatus.Model;

namespace VagStatus.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для AppointmentsPage.xaml
    /// </summary>
    public partial class AppointmentsPage : Page
    {
        private static VagStatusDbEntities _context = App.GetContext();
        List<Appointment> list = _context.Appointment.ToList();
        public AppointmentsPage()
        {
            InitializeComponent();
            AppLb.ItemsSource = _context.Appointment.ToList();
            AppCalendar.SelectedDate = DateTime.Now;
        }

        private void AppCalendar_SelectedDatesChanged(object sender, SelectionChangedEventArgs e)
        {
            list = _context.Appointment.ToList();
            list = list.Where(a => a.DateTime.Date == AppCalendar.SelectedDate).ToList();
            AppLb.ItemsSource = list;
        }

        private void AppLb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (list.Count > 0)
            {
                Appointment selectedApp = AppLb.SelectedItem as Appointment;
                AppGrid.DataContext = selectedApp;
                string car = selectedApp.Car.Name;
                string number = selectedApp.Car.Number;
                string client = selectedApp.Car.Client.Lastname;
                InfoTb.Text = $"{car} | {number} | {client}";
            }
            else
            {
                AppGrid.DataContext = null;
                InfoTb.Text = string.Empty;
            }
        }
    }
}
