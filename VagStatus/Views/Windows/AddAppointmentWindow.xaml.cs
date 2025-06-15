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
using System.Windows.Shapes;
using VagStatus.AppData;
using VagStatus.Model;

namespace VagStatus.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddAppointmentWindow.xaml
    /// </summary>
    public partial class AddAppointmentWindow : Window
    {
        private static VagStatusDbEntities _context = App.GetContext();
        private DateTime _selectedDate;
        public AddAppointmentWindow(DateTime selectedDate)
        {
            InitializeComponent();
            _selectedDate = selectedDate;
            DateDp.SelectedDate = selectedDate;
            ServiceCmb.ItemsSource = _context.Service.ToList();
            ServiceCmb.DisplayMemberPath = "Name";
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DateDp.SelectedDate != null && !string.IsNullOrEmpty(NameTb.Text) && !string.IsNullOrEmpty(NumberTb.Text) && !string.IsNullOrEmpty(ClientSurnameTb.Text)
                && !string.IsNullOrEmpty(ClientNameTb.Text) && !string.IsNullOrEmpty(ClientLastnameTb.Text) && !string.IsNullOrEmpty(ClientEmailTb.Text))
            {
                DateTime appDateTime = DateDp.SelectedDate.Value.AddHours(AppointmentTp.Time.Hour).AddMinutes(AppointmentTp.Time.Minute);

                // Проверка на существующую запись  
                var existingAppointment = _context.Appointment.FirstOrDefault(a => a.DateTime == appDateTime);
                if (existingAppointment != null)
                {
                    MessageBoxHelper.Error("На выбранное время уже существует запись.");
                }
                else
                {
                    Client newClient = new Client()
                    {
                        Lastname = ClientLastnameTb.Text,
                        Name = ClientNameTb.Text,
                        Surname = ClientSurnameTb.Text,
                        Email = ClientEmailTb.Text
                    };
                    _context.Client.Add(newClient);
                    _context.SaveChanges();

                    Car newCar = new Car()
                    {
                        Name = NameTb.Text,
                        Number = NumberTb.Text,
                        ClientId = newClient.Id
                    };
                    _context.Car.Add(newCar);
                    _context.SaveChanges();

                    Appointment newAppointment = new Appointment()
                    {
                        DateTime = appDateTime,
                        User = AuthorisationHelper.selectedUser,
                        CarId = newCar.Id,
                        ServiceId = (ServiceCmb.SelectedItem as Service).Id
                    };
                    _context.Appointment.Add(newAppointment);
                    _context.SaveChanges();

                    MessageBoxHelper.Information("Запись успешно добавлена!");
                    DialogResult = true; 
                }
                
            }
            else
            {
                MessageBoxHelper.Error("Пожалуйста, заполните все поля.");
            }

        }
    }
}
