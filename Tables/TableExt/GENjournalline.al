tableextension 50104 Grnjournalline extends "Gen. Journal Line"
{
    fields
    {
        field(5000; "Type"; Option)
        {
            OptionMembers = "Advance customer","Normal customer";
            DataClassification = ToBeClassified;

        }
        field(50001; "Advance amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}