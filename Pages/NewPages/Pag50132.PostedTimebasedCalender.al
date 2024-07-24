namespace ALProject.ALProject;

page 50132 "Posted Timebased Calender"
{
    ApplicationArea = All;
    Caption = 'Posted Timebased Calender';
    PageType = card;
    SourceTable = "Posted Timebased Calender";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Area"; Rec."Area")
                {
                    ToolTip = 'Specifies the value of the Area field.', Comment = '%';
                }
                field(Assemlly; Rec.Assemlly)
                {
                    ToolTip = 'Specifies the value of the Assemlly field.', Comment = '%';
                }
                field("Date of Maintenance"; Rec."Date of Maintenance")
                {
                    ToolTip = 'Specifies the value of the Date of Maintenance field.', Comment = '%';
                }
                field(Delay; Rec.Delay)
                {
                    ToolTip = 'Specifies the value of the Delay field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Equipment no"; Rec."Equipment no")
                {
                    ToolTip = 'Specifies the value of the Equipment no field.', Comment = '%';
                }
                field(Frequency; Rec.Frequency)
                {
                    ToolTip = 'Specifies the value of the Frequency field.', Comment = '%';
                }
                field(HOD; Rec.HOD)
                {
                    ToolTip = 'Specifies the value of the HOD field.', Comment = '%';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.', Comment = '%';
                }
                field("Schedule Date"; Rec."Schedule Date")
                {
                    ToolTip = 'Specifies the value of the Schedule Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisour field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Task Code"; Rec."Task Code")
                {
                    ToolTip = 'Specifies the value of the Task Code field.', Comment = '%';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ToolTip = 'Specifies the value of the Task Description field.', Comment = '%';
                }
                field("sub assembly"; Rec."sub assembly")
                {
                    ToolTip = 'Specifies the value of the sub assembly field.', Comment = '%';
                }
            }
        }
    }
}
