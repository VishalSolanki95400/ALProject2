pageextension 50102 Salesorderext extends "Sales list"
{
    layout
    {
        addbefore("No.")
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Advance Amount"; Rec."Advance Amount")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        // No changes to page actions
    }

    var
        myInt: Integer;
}
