pageextension 50106 Custledger extends "Customer Ledger Entries"
{
    layout
    {
        addbefore(Amount)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = all;
            }
            field("Advance amount"; Rec."Advance amount")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}