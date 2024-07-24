namespace ALProject.ALProject;

page 50128 "Shutdown planning"
{
    ApplicationArea = All;
    Caption = 'Shutdown planning';
    PageType = List;
    SourceTable = "Posted ShutdownPlanning";
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
                field("Assembly"; Rec."Assembly")
                {
                    ToolTip = 'Specifies the value of the Assembly field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Description of Job to be done"; Rec."Description of Job to be done")
                {
                    ToolTip = 'Specifies the value of the Description of Job to be done field.', Comment = '%';
                }
                field(Equipment; Rec.Equipment)
                {
                    ToolTip = 'Specifies the value of the Equipment field.', Comment = '%';
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ToolTip = 'Specifies the value of the Fixed Asset No field.', Comment = '%';
                }
                field("ManPower Required"; Rec."ManPower Required")
                {
                    ToolTip = 'Specifies the value of the ManPower Required field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.', Comment = '%';
                }
                field("Shutdown End Date"; Rec."Shutdown End Date")
                {
                    ToolTip = 'Specifies the value of the Shutdown End Date field.', Comment = '%';
                }
                field("Shutdown Intimation No."; Rec."Shutdown Intimation No.")
                {
                    ToolTip = 'Specifies the value of the Shutdown Intimation No. field.', Comment = '%';
                }
                field("Shutdown Start Date"; Rec."Shutdown Start Date")
                {
                    ToolTip = 'Specifies the value of the Shutdown Start Date field.', Comment = '%';
                }
                field("Status of the Job"; Rec."Status of the Job")
                {
                    ToolTip = 'Specifies the value of the Status of the Job field.', Comment = '%';
                }
                field("Sub Assembly"; Rec."Sub Assembly")
                {
                    ToolTip = 'Specifies the value of the Sub Assembly field.', Comment = '%';
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
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
                field("Time Required"; Rec."Time Required")
                {
                    ToolTip = 'Specifies the value of the Time Required field.', Comment = '%';
                }
            }
        }
    }
}
