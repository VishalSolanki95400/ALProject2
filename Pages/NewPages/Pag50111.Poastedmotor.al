namespace ALProject.ALProject;

page 50111 "Poasted motor"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Poasted motor';
    PageType = List;
    SourceTable = "Posted MotorGreasing Checklist";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Execution Date"; Rec."Execution Date")
                {
                    ToolTip = 'Specifies the value of the Execution Date field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Motor Greasing"; Rec."Motor Greasing")
                {
                    ToolTip = 'Specifies the value of the Motor Greasing field.';
                }
                field("Motor No."; Rec."Motor No.")
                {
                    ToolTip = 'Specifies the value of the Motor No. field.';
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ToolTip = 'Specifies the value of the Next Due Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
            }
        }
    }
}
