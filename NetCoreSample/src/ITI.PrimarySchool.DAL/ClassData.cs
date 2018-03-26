namespace ITI.PrimarySchool
{
    public class ClassData
    {
        public int ClassId { get; set; }

        public string Name { get; set; }

        public string Level { get; set; }

        public string TeacherLastName { get; set; }

        public string TeacherFirstName { get; set; }

        public int TeacherId { get; set; }

        public System.Collections.Generic.IEnumerable<StudentData> Students { get; set; }
    }
}
