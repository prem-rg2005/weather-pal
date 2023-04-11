# weather-pal
Repository that holds demo code for a simple weather app

## App summary
    1. Xcode version used: 13.4.1 (Rosetta not enabled for Apple chip)
    2. Simulators used for testing: iPhone 13 Pro Max, iPhone 12 Pro Max, iPhone 12 Mini, iPhone 8
    3. Dependency Manager: Cocoapods
    4. Third party library: `SDWebImage`

This simple app shows the user a single screen which retrieves his / her location using CoreLocation framework. User's coordinates are then passed on as parameters to the API (from `https://openweathermap.org/api`) whose response is stored in the model class (WeatherData).

A UITableView is used to display 3 UITableViewCells that show the below information:
    1. Current location, temperature, weather description, high temperature and low temperature
    2. Hourly weather forecast
    3. Daily weather forecast (for the whole week)

## Design pattern
Model-View-ViewModel (MVVM) is used for this app and the viewModel handles all business logic. In this case, the network call is done inside the viewModel, data is stored inside the model class (WeatherData) and is accessed by the view through viewModel.

## Code structure
    1. Model: Data model(s) that holds data (eg: WeatherData)
    2. View: Interacts with user and catches events (eg: WeatherViewController)
    3. View Model: view model creators that act communicate between view and model (eg: WeatherViewModel)
    4. Helpers: Helper and Utility classes

## Known functionality and edge case omissions
The app is designed in the simplest way without over-engineering solutions. Some of the known omissions (which can boost performance) are as follows:

    1. NSCache can be used to cache data for better performance
    2. Light / dark mode UI changes
    
