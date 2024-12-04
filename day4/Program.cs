using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace CurrencyConverter
{
    class Program
    {
        private const string BaseUrl = "https://api.exchangerate-api.com/v4/latest/";

        static async Task Main(string[] args)
        {
            Console.Write("Enter Base Currency (e.g., USD): ");
            string baseCurrency = Console.ReadLine().ToUpper();

            Console.Write("Enter Target Currency (e.g., EUR): ");
            string targetCurrency = Console.ReadLine().ToUpper();

            Console.Write("Enter Amount to Convert: ");
            if (!decimal.TryParse(Console.ReadLine(), out decimal amount))
            {
                Console.WriteLine("Invalid amount. Exiting.");
                return;
            }

            try
            {
                var rates = await FetchExchangeRatesAsync(baseCurrency);
                if (rates == null || !rates.ContainsKey(targetCurrency))
                {
                    Console.WriteLine($"Unable to find exchange rate for {targetCurrency}.");
                    return;
                }

                var conversionRate = rates.FirstOrDefault(r => r.Key == targetCurrency).Value;
                decimal convertedAmount = amount * conversionRate;

                Console.WriteLine($"{amount} {baseCurrency} = {convertedAmount:F2} {targetCurrency} (Rate: {conversionRate})");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }

        private static async Task<Dictionary<string, decimal>> FetchExchangeRatesAsync(string baseCurrency)
        {
            using var httpClient = new HttpClient();

            string url = $"{BaseUrl}{baseCurrency}";

            HttpResponseMessage response = await httpClient.GetAsync(url);
            if (!response.IsSuccessStatusCode)
            {
                Console.WriteLine($"Error fetching data: {response.ReasonPhrase}");
                return null;
            }

            string jsonResponse = await response.Content.ReadAsStringAsync();
            var exchangeData = JsonConvert.DeserializeObject<ExchangeRateResponse>(jsonResponse);

            return exchangeData?.Rates;
        }
    }

    public class ExchangeRateResponse
    {
        public string Base { get; set; }
        public DateTime Date { get; set; }
        public Dictionary<string, decimal> Rates { get; set; }
    }
}