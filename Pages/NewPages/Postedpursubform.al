page 50155 "Posted Correct purchsubform"
{
    ApplicationArea = All;
    Caption = 'Posted Correct purchase subform';
    PageType = ListPart;
    SourceTable = Correctpurchaseline;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("TDS section"; Rec."TDS section")
                {
                    ToolTip = 'Specifies the value of the TDS section field.';
                }
                field("TDS reason"; Rec."TDS reason")
                {
                    ToolTip = 'Specifies the value of the TDS reason field.';
                }
                field("GST Rate"; Rec."GST Rate")
                {
                    ToolTip = 'Specifies the value of the GST Rate field.';
                }
                field("HSN Code"; Rec."HSN Code")
                {
                    ToolTip = 'Specifies the value of the HSN Code field.';
                }
                field("GST Credit"; Rec."GST Credit")
                {
                    ToolTip = 'Specifies the value of the GST Credit field.';
                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                    ToolTip = 'Specifies the value of the GST Group Type field.';
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                    ToolTip = 'Specifies the value of the GST Jurisdiction Type field.';
                }
                field("GST Available"; Rec."GST Available")
                {
                    ToolTip = 'Specifies the value of the GST Available field.';
                }
            }
        }
    }
}
