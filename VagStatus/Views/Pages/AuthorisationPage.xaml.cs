using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
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
    /// Логика взаимодействия для AuthorisationPage.xaml
    /// </summary>
    public partial class AuthorisationPage : Page
    {
        public AuthorisationPage()
        {
            InitializeComponent();
        }

        private void OkBtn_Click(object sender, RoutedEventArgs e)
        {
            if (IdTb.Text != string.Empty && PasswordTb.Password != string.Empty)
            {
                if (AuthorisationHelper.Authorise(IdTb.Text, PasswordTb.Password))
                {
                    FrameHelper.selectedFrame.Navigate(new MenuPage());
                }
            }
            else
            {
                MessageBoxHelper.Error("Заполните все поля для ввода.");
            }
        }
    }
}
