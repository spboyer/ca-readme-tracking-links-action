using System;
using System.IO;
using System.Text.RegularExpressions;

namespace readme_link_trends
{
    class Program
    {
        static void Main(string[] args)
        {
            ProcessReadMe();
        }

        static void ProcessReadMe()
        {
            var readme = File.ReadAllText("./github/home/README.md");
            
            var pattern = @"(((http|ftp|https):\/\/)?[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?)";
            Regex regex = new Regex(pattern);

            string result = regex.Replace(readme, m => Tracking.AppendTrackingInfo(m.Groups[0].Value, "regex", "github", "shboyer"));

            File.WriteAllText("./github/home/README.md", result);
        }

    }
}
