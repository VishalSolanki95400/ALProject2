table 50117 "OIL AND WINDING TEMPERATURE"
{
    Caption = 'OIL AND WINDING TEMPERATURE';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "DATE"; Date)
        {
            Caption = 'DATE ';
        }
        field(3; "Time"; Time)
        {
            Caption = 'Time';
        }
        field(4; "25MVA TRANSFORMER OIL"; Decimal)
        {
            Caption = '25MVA TRANSFORMER OIL TEMP.(°C)';
        }
        field(5; "25MVA TRANSFORMER WDG"; Decimal)
        {
            Caption = '25MVA TRANSFORMER WDG. TEMP.(°C)';
        }
        field(6; "07 MVA TRANSFORMER OIL"; Decimal)
        {
            Caption = '07 MVA TRANSFORMER OIL TEMP.(°C)';
        }
        field(7; "07 MVA TRANSFORMER WDG"; Decimal)
        {
            Caption = '07 MVA TRANSFORMER WDG. TEMP.(°C)';
        }
        field(8; "30/36 MVA TRANSFORMER OIL"; Decimal)
        {
            Caption = '30/36 MVA TRANSFORMER OIL TEMP.(°C)';
        }
        field(9; "30/36 MVA TRANSFORMER	WDG"; Decimal)
        {
            Caption = '30/36 MVA TRANSFORMER	WDG. TEMP.(°C)';
        }
        field(10; "12.5/16.0 MVA TRANSFORMER"; Decimal)
        {
            Caption = '12.5/16.0 MVA TRANSFORMER OIL TEMP.(°C)';
        }
        field(11; "12.5/16.0 MVA TRANSFORMER WDG"; Decimal)
        {
            Caption = '12.5/16.0 MVA TRANSFORMER WDG. TEMP.(°C)';
        }
        field(12; "04 MVA TRANSFORMER OIL"; Decimal)
        {
            Caption = '04 MVA TRANSFORMER OIL TEMP.(°C)';
        }
        field(13; "04 MVA TRANSFORMER WDG"; Decimal)
        {
            Caption = '04 MVA TRANSFORMER WDG. TEMP.(°C)';
        }
        field(14; SIGNATURE; Text[100])
        {
            Caption = 'SIGNATURE';
        }
        field(15; REMARKS; Text[100])
        {
            Caption = 'REMARKS';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}