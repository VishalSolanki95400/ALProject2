page 50129 "Bulk Approval Criteria Setup"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria Setup Page';
    PageType = List;
    SourceTable = "Bulk Approval Criteria Setup ";
    UsageCategory = Lists;
    Editable = true;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Approved ID"; Rec."Approved ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
