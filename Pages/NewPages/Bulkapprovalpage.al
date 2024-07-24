Page 50125 "Bulk Approval Criteria"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria Page';
    PageType = List;
    SourceTable = "Bulk Approval Criteria";
    UsageCategory = Lists;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Criteria ID"; Rec."Criteria ID")
                {
                    ApplicationArea = All;
                }
                field("Item Category "; Rec."Item Category ")
                {
                    ApplicationArea = All;
                }
                field("Price From"; Rec."Price From")
                {
                    ApplicationArea = All;
                }
                field("Price To"; Rec."Price To")
                {
                    ApplicationArea = All;
                }
                field("Volume Threshold"; Rec."Volume Threshold")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
