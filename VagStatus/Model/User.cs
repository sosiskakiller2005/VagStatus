//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VagStatus.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.Appointment = new HashSet<Appointment>();
        }
    
        public int Id { get; set; }
        public string Lastname { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Fullname { get
            {
                return Lastname + " " + Name + " " + Surname;
            } }
        public int RoleId { get; set; }
        public string Password { get; set; }
        public byte[] Photo { get; set; }
        public Nullable<int> AutosFixed { get; set; }
    
        public virtual ICollection<Appointment> Appointment { get; set; }
        public virtual Role Role { get; set; }
    }
}
