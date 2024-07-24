pageextension 50105 genjournalline extends "General Journal"
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