tableextension 50194 "Purch&recivaleext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(5000; "Threshold limit"; Decimal)
        {

        }
        field(50001; "Line approver"; text[20])
        {
            TableRelation = "User Setup";

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