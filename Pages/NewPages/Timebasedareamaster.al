page 50137 "Timebased Area Master"
{
    ApplicationArea = All;
    Caption = 'Timebased Area Master';
    PageType = List;
    SourceTable = "Timebased Area Master";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Area1; Rec.Area1)
                {
                    ApplicationArea = All;
                    //  ToolTip = 'Specifies the value of the Area1 field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    // ToolTip = 'Specifies the value of the Insulated tools forwork field.', Comment = '%';
                }
                field("TBM Doc. No"; Rec."TBM Doc. No")
                {
                    ApplicationArea = All;

                }
                field("CBM Doc. No"; Rec."CBM Doc. No")
                {
                    ApplicationArea = all;
                }
                field("Preventive Doc. No."; Rec."Preventive Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("TBM Revised Date"; Rec."TBM Revised Date")
                {
                    ApplicationArea = all;

                }
                field("CBM Revised Date"; Rec."CBM Revised Date")
                {
                    ApplicationArea = all;
                }
                field("Preventive Revised Date"; Rec."Preventive Revised Date")
                {
                    ApplicationArea = All;
                }
                field("TBM Effective  Date"; Rec."TBM Effective  Date")
                {
                    ApplicationArea = All;
                }
                field("CBM Effective Date"; Rec."CBM Effective Date")
                {
                    ApplicationArea = All;
                }
                field("Preventive Effective Date"; Rec."Preventive Effective Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
