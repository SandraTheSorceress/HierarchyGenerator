using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;

namespace MyIntegrationTests
{
    public class HierarchyApiTests
    {
        private readonly HttpClient _client;
        private readonly string _jwtToken;

        public HierarchyApiTests()
        {
            _client = new HttpClient();
            _client.BaseAddress = new System.Uri("https://localhost:7029");
            _jwtToken = ReadJwtTokenFromFile();

        }

        private string ReadJwtTokenFromFile()
        {
            var projectDirectory = AppDomain.CurrentDomain.BaseDirectory;
            var tokenFilePath = Path.Combine(projectDirectory, "..", "..", "..", "jwt_token.txt");
            try
            {
                return File.ReadAllText(tokenFilePath).Trim();
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to read JWT token from file: {ex.Message}");
            }
        }

        private void SetBearerToken()
        {
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _jwtToken);
        }


        [Fact]
        public async Task PostHierarchy_ShouldReturnNoContent()
        {
            SetBearerToken();

            var postData = new
            {
                Name = "TestHierarchy created by xUnit"
            };

            var content = new StringContent(JsonConvert.SerializeObject(postData), Encoding.UTF8, "application/json");

            var response = await _client.PostAsync("/api/hierarchy", content);

            response.EnsureSuccessStatusCode();
            Assert.Equal(System.Net.HttpStatusCode.NoContent, response.StatusCode);
        }

        [Fact]
        public async Task GetHierarchy_ShouldReturnPagedData()
        {
            var response = await _client.GetAsync("/api/hierarchy?page=1&limit=5");

            response.EnsureSuccessStatusCode();
            Assert.Equal(System.Net.HttpStatusCode.OK, response.StatusCode);

            var content = await response.Content.ReadAsStringAsync();
            var result = JsonConvert.DeserializeObject(content);

            Assert.NotNull(result);
        }
    }
}
