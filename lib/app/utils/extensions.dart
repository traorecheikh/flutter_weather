extension TemperatureExtensions on double {
  double toCelsius() => this - 273.15;
  double toFahrenheit() => (this - 273.15) * 9/5 + 32;
}
