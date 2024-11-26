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
using VagStatus.AppData;

namespace VagStatus.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
            FrameHelper.selectedFrame = MainFrm;
            MainFrm.Navigate(new ProfilePage());
        }

        private void ProfileBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangeColor(ProfileBtn.Name);
            MainFrm.Navigate(new ProfilePage());
        }


        private void AppointmentBTn_Click(object sender, RoutedEventArgs e)
        {
            ChangeColor(AppointmentBTn.Name);
            MainFrm.Navigate(new AppointmentsPage());
        }

        private void ClientsBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangeColor(ClientsBtn.Name);
            MainFrm.Navigate(new ClientsPage());
        }

        private void WarehouseBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangeColor(WarehouseBtn.Name);
            MainFrm.Navigate(new WarehousePage());
        }
        private void ChangeColor(string name)
        {
            List<Button> buttons = new List<Button>();
            buttons.Add(ProfileBtn);
            buttons.Add(AppointmentBTn);
            buttons.Add(ClientsBtn);
            buttons.Add(WarehouseBtn);

            foreach (Button btn in buttons)
            {
                if (btn.Name == name)
                {
                    btn.Background = new SolidColorBrush(Colors.Black);
                    btn.Foreground = new SolidColorBrush(Colors.White);
                }
                else
                {
                    btn.Background = new SolidColorBrush(Color.FromRgb(253, 193, 1));
                    btn.Foreground = new SolidColorBrush(Colors.Black);
                }
            }
        }
    }
}
