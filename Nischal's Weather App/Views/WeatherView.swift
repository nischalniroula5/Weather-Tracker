//
//  WeatherView.swift
//  Nischal's Weather App
//
//  Created by Nischal Niroula on 20/7/2023.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            weatherBackground(weather: weather)
                          .resizable()
                          .scaledToFill()
                          .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                HStack {
                        VStack(alignment: .center, spacing: 5){
                            Text(weather.name)
                                .bold()
                                .font(.title)
                            
                            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 45)
                        .foregroundColor(.white) // Center the text vertically
                        
                        Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    
                    HStack{
                        
                        VStack(spacing: 10){
                            Image(systemName: getWeatherIcon(weatherCondition: weather.weather[0].main))
                                      .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                               
                            
                        }
                        .frame(width:150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                            
                    }
                    
                    
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Spacer()
                    
                    
                }.frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 0.0)
                        .foregroundColor(Color(red: 58 / 255, green: 66 / 255, blue: 81 / 255))
                        .opacity(0.6)
                        .edgesIgnoringSafeArea(.all)
                        .shadow(color: Color.gray, radius: 2, x: 2, y: 2)
                        .blur(radius: 2)
                }
                   
            )
            
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 20){
                    
                    Text("Weather Now").fontWeight(.heavy)
                        .bold().padding()
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                            
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + " m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                    
                }
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color.white)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 0.0)
                            .foregroundColor(Color(red: 58 / 255, green: 66 / 255, blue: 81 / 255))
                            .opacity(0.6)
                            .edgesIgnoringSafeArea(.all)
                            .shadow(color: Color.gray, radius: 2, x: 2, y: 2)
                            .blur(radius: 2)
                    }
                       
                )
            }
            
          
            
            
        }.edgesIgnoringSafeArea(.bottom)
            .background(weatherBackground(weather: weather))
            .preferredColorScheme(.dark)
    }
    
    private func getWeatherIcon(weatherCondition: String) -> String {
        switch weatherCondition.lowercased() {
        case "thunderstorm":
            return "cloud.bolt.rain.fill"
        case "drizzle":
            return "cloud.drizzle.fill"
        case "rain":
            return "cloud.rain.fill"
        case "snow":
            return "snow"
        case "clear":
            return "sun.max.fill"
        case "clouds":
            return "cloud.fill"
        case "haze":
            return "sun.haze.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
    
    private func weatherBackground(weather: ResponseBody) -> Image{
            let weatherCondition = weather.weather[0].main.lowercased()
            switch weatherCondition {
            case "thunderstorm":
                    return Image("thunderstorm") // Use "thunderstorm.png" as the background for thunderstorm
                case "drizzle":
                    return Image("drizzle") // Use "drizzle.png" as the background for drizzle
                case "rain":
                    return Image("rain") // Use "rain.png" as the background for rain
                case "snow":
                    return Image("snow") // Use "snow.png" as the background for snow
                case "clear":
                    return Image("clear") // Use "clear.png" as the background for clear weather
                case "clouds":
                    return Image("clouds")
                case "haze":
                return Image("haze")// Use "clouds.png" as the background for clouds
                default:
                    return Image("default")
                    
            }
        }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
