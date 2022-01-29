using System.Linq;
using api.Controllers;
using Xunit;

namespace Api.Tests
{
    public class RangeTests
    {
        [Fact]
        public void Test1()
        {
            var range = new Range() { Count = 3 };
            var generated = range.Of(() => "");
            Assert.Equal(3,generated.Count());
        }
    }
}