namespace ALProject.ALProject;

page 50113 "CBm page "
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'CBm page ';
    PageType = List;
    SourceTable = "Posted Daily CBM Calender";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Area"; Rec."Area")
                {
                    ToolTip = 'Specifies the value of the Area field.';
                }
                field("Assembly No."; Rec."Assembly No.")
                {
                    ToolTip = 'Specifies the value of the Assemlly field.';
                }
                field("Current Reading/Operation"; Rec."Current Reading/Operation")
                {
                    ToolTip = 'Specifies the value of the Current Reading/Operation field.';
                }
                field("Date Of Reading"; Rec."Date Of Reading")
                {
                    ToolTip = 'Specifies the value of the Date Of Reading field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Equipment no"; Rec."Equipment no")
                {
                    ToolTip = 'Specifies the value of the Equipment no field.';
                }
                field(HOD; Rec.HOD)
                {
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ToolTip = 'Specifies the value of the Maintenance Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Schedule Date"; Rec."Schedule Date")
                {
                    ToolTip = 'Specifies the value of the Schedule Date field.';
                }
            }
        }
    }
}
