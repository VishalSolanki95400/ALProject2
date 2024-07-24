namespace ALProject.ALProject;

page 50126 "Import sales Contract"
{
    ApplicationArea = All;
    Caption = 'Import sales Contract';
    PageType = Worksheet;
    SourceTable = "IMPORT SALE CONTRACT";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Sr. No."; Rec."Sr. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sr. No. field.', Comment = '%';
                }
                field("Party No."; Rec."Party No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Party No. field.', Comment = '%';
                }
                field("Party Name"; Rec."Party Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Party Name field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rate field.', Comment = '%';
                }
                field("Sales Contract"; Rec."Sales Contract")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Contract field.', Comment = '%';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Origin "; Rec."Origin ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Origin field.', Comment = '%';
                }
                field(Indenter; Rec.Indenter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indenter field.', Comment = '%';
                }
                field("Dated "; Rec."Dated ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dated field.', Comment = '%';
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Terms field.', Comment = '%';
                }
                field("QTY-1"; Rec."QTY-1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-1 field.', Comment = '%';
                }
                field("QTY-2"; Rec."QTY-2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-2 field.', Comment = '%';
                }
                field("QTY-3"; Rec."QTY-3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-3 field.', Comment = '%';
                }
                field("QTY-4"; Rec."QTY-4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-4 field.', Comment = '%';
                }
                field("QTY-5 "; Rec."QTY-5 ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-5 field.', Comment = '%';
                }
                field("QTY-6"; Rec."QTY-6")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-6 field.', Comment = '%';
                }
                field("QTY-7"; Rec."QTY-7")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-7 field.', Comment = '%';
                }
                field("QTY-8"; Rec."QTY-8")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-8 field.', Comment = '%';
                }
                field("QTY-9"; Rec."QTY-9")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-9 field.', Comment = '%';
                }
                field("QTY-10"; Rec."QTY-10")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY-10 field.', Comment = '%';
                }
                field(INV; Rec.INV)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the INV field.', Comment = '%';
                }
                field(BAL; Rec.BAL)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BAL field.', Comment = '%';
                }
                field("BAL QTY"; Rec."BAL QTY")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BAL QTY field.', Comment = '%';
                }
                field("Cont. Exp."; Rec."Cont. Exp.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cont. Exp. field.', Comment = '%';
                }
                field("Mail Drop"; Rec."Mail Drop")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail Drop field.', Comment = '%';
                }
            }
        }
    }
}
