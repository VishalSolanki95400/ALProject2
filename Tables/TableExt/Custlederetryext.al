tableextension 50105 Custledger extends "Cust. Ledger Entry"
{
    fields
    {
        Field(50000; "Type"; Option)
        {

            OptionMembers = "Advance customer","Normal customer";
            DataClassification = ToBeClassified;

        }
        Field(50001; "Advance Amount"; Decimal)
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