tableextension 50101 Salesorderext extends "Sales Header"
{
    fields
    {
        Field(50002; "Type"; Option)
        {

            OptionMembers = "Advance customer","Normal customer";
            DataClassification = ToBeClassified;

        }
        Field(50003; "Advance Amount"; Decimal)
        {
            Editable = false;
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