tableextension 50196 Purchaselineext extends "Purchase Line"
{
    fields
    {
        field(50000; "over limit"; Boolean)
        {


        }
        field(50001; "Status1"; Option)
        {
            OptionMembers = Open,Pending,approved;
        }
        field(50002; Approver; Code[20])
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