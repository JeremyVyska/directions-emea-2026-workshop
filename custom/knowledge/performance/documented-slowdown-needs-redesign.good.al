// Cost paid once per Location and date, not once per row.
procedure GetAvailableEquipment(var TempEquipment: Record Equipment temporary)
var
    Equipment: Record Equipment;
    SevereWeatherByLocation: Dictionary of [Code[20], Boolean];
begin
    if Equipment.FindSet() then
        repeat
            if not SevereWeatherByLocation.ContainsKey(Equipment.Location) then
                SevereWeatherByLocation.Add(Equipment.Location, CheckSevereWeather(Equipment.Location));
            if not SevereWeatherByLocation.Get(Equipment.Location) then
                TempEquipment := Equipment;
        until Equipment.Next() = 0;
end;
