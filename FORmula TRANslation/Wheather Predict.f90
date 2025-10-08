program weather_predictor
    implicit none
    integer, parameter :: days = 7
    character(len=7) :: forecast(days)
    real :: temperature(days)
    real :: humidity(days)
    real :: pressure(days)
    integer :: i

    ! Sample Weekly data (Temp in °C, Humidity in %, Pressure in hPa)
    temperature = [23.0, 28.5, 18.0, 25.0, 21.5, 19.0, 30.0]
    humidity    = [80.0, 40.0, 90.0, 60.0, 85.0, 92.0, 35.0]
    pressure    = [1005.0, 1018.0, 998.0, 1008.0, 1002.0, 997.0, 1020.0]

    ! Weather condition computing
    do i = 1, days
        if (humidity(i) > 85.0 .and. pressure(i) < 1005.0) then
            forecast(i) = "Rainy"
        else if (humidity(i) > 60.0 .or. pressure(i) < 1010.0) then
            forecast(i) = "Cloudy"
        else
            forecast(i) = "Sunny"
        end if
    end do

    ! Output the predictions
    print *, "Day | Temp (°C) | Humidity (%) | Pressure (hPa) | Forecast"
    print *, "----------------------------------------------------------"
    do i = 1, days
        write(*,'(I3, 3X, F6.1, 8X, F6.1, 10X, F6.1, 6X, A)') i, temperature(i), humidity(i), pressure(i), forecast(i)
    end do

end program weather_predictor