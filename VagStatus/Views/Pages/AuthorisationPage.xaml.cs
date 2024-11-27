using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

        private void IdTb_GotFocus(object sender, RoutedEventArgs e)
        {
            if (IdTb.Text == "Код")
            {
                IdTb.Text = string.Empty;
            }
        }

        private void IdTb_LostFocus(object sender, RoutedEventArgs e)
        {
            if (IdTb.Text == string.Empty)
            {
                IdTb.Text = "Код";
            }
        }

        private void PasswordTb_GotFocus(object sender, RoutedEventArgs e)
        {
            if (PasswordTb.Password == "password")
            {
                PasswordTb.Password = string.Empty;
            }
        }

        private void PasswordTb_LostFocus(object sender, RoutedEventArgs e)
        {
            if (PasswordTb.Password == string.Empty)
            {
                PasswordTb.Password = "password";
            }
        }

        private static readonly Regex _regex = new Regex("[^0-9.-]+"); //regex that matches disallowed text
        private static bool IsTextAllowed(string text)
        {
            return !_regex.IsMatch(text);
        }

        private void IdTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text);
        }
    }
}
