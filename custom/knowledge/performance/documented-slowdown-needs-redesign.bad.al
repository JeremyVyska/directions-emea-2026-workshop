// Slow check accepted because of a comment; called once per row.
procedure GetAvailableEquipment(var TempEquipment: Record Equipment temporary)
var
    Equipment: Record Equipment;
begin
    if Equipment.FindSet() then
        repeat
            // Accepted: the weather check is 250% slower, but safer.
            if IsEquipmentAvailable(Equipment) then // synchronous HTTP call per row
                TempEquipment := Equipment;
        until Equipment.Next() = 0;
end;
