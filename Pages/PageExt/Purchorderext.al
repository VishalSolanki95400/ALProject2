pageextension 50146 Purchaeorderext extends "Purchase Order"
{
    layout
    {
        addafter(General)
        {
            field(Project; Rec.Project)
            {
                ApplicationArea = all;
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