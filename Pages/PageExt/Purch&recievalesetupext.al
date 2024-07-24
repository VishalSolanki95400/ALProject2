pageextension 50191 "Purchase&recivable" extends "Purchases & Payables Setup"
{
    layout
    {
        addbefore("Discount Posting")
        {
            field("Threshold limit"; Rec."Threshold limit")
            {

            }
            field("Line approver"; Rec."Line approver")
            {

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