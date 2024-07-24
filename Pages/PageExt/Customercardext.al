pageextension 50198 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        addbefore(General)
        {
            field("Temporary Credit Limit"; Rec."Temporary Credit Limit")
            {
                ApplicationArea = All;
            }
            field("Remaining Credit Limit"; Rec."Remaining Credit Limit")
            {
                ApplicationArea = All;
            }
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
            }
            field("Advance Amount"; Rec."Advance Amount")
            {
                ApplicationArea = All;
            }
        }
    }


}
