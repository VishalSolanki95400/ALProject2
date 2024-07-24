namespace ALProject.ALProject;

page 50124 "RBM list page"
{
    ApplicationArea = All;
    Caption = 'RBM list page';
    PageType = List;
    SourceTable = "RBM Industries";
    UsageCategory = Administration;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Workstation No."; Rec."Workstation No.")
                {
                    ToolTip = 'Specifies the value of the Workstation No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Dye No."; Rec."Dye No.")
                {
                    ToolTip = 'Specifies the value of the Dye No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Lifetime Capacity"; Rec."Lifetime Capacity")
                {
                    ToolTip = 'Specifies the value of the Lifetime Capacity field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Tracking Qty"; Rec."Tracking Qty")
                {
                    ToolTip = 'Specifies the value of the Tracking Qty field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Remaining Qty"; Rec."Remaining Qty")
                {
                    ToolTip = 'Specifies the value of the Remaining Qty field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Alert Capacity"; Rec."Alert Capacity")
                {
                    ToolTip = 'Specifies the value of the Alert Capacity field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
