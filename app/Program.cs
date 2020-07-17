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
            var readme = File.ReadAllText("./README.md");

            var track_channel = Environment.GetEnvironmentVariable("INPUT_CHANNEL");
            var track_alias = Environment.GetEnvironmentVariable("INPUT_ALIAS");
            var track_event = Environment.GetEnvironmentVariable("INPUT_EVENT");
            
            var pattern = @"(((http|ftp|https):\/\/)?[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?)";
            Regex regex = new Regex(pattern);

            string result = regex.Replace(readme, m => Tracking.AppendTrackingInfo(m.Groups[0].Value, track_event, track_channel, track_alias));

            File.WriteAllText("./README.md", result); 
        }
    }
}
