pageextension 50121 Salesrecsetupext extends "Sales & Receivables Setup"
{
    layout
    {
        addbefore(General)
        {
            field("PurReq NoSeries."; Rec."PurReq NoSeries.")
            {
                ApplicationArea = All;

            }
            field("RGP No.Series"; Rec."RGP No.Series")
            {
                ApplicationArea = all;
            }
            field("Number series1"; Rec."Number series")
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