using System.Collections.Generic;

namespace ITI.PrimarySchool.WebApp.Models.ClassViewModels
{
    public class ClassViewModel
    {
        public int ClassId { get; set; }

        public string Name { get; set; }

        public string Level { get; set; }

        public string TeacherFirstName { get; set; }

        public string TeacherLastName { get; set; }
        
        public IEnumerable<StudentData> Students { get; set; }

    }
}
