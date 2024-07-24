namespace ALProject.ALProject;

page 50122 employeeclearsubform
{
    ApplicationArea = All;
    Caption = 'employeeclearsubform';
    PageType = ListPart;
    SourceTable = "Issue Line";
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Issue Ledger Entry Line No."; Rec."Issue Ledger Entry Line No.")
                {
                    ToolTip = 'Specifies the value of the Issue Ledger Entry Line No. field.';
                }
                field("Issue Ledger Entry No."; Rec."Issue Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Issue Ledger Entry No. field.';
                }
                field("Issue No."; Rec."Issue No.")
                {
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("Issue Type"; Rec."Issue Type")
                {
                    ToolTip = 'Specifies the value of the Issue Type field.';
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                field("Shortcut Dimenssion 1"; Rec."Shortcut Dimenssion 1")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimenssion 1 field.';
                }
                field("Shortcut Dimenssion 2"; Rec."Shortcut Dimenssion 2")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimenssion 2 field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(UOM; Rec.UOM)
                {
                    ToolTip = 'Specifies the value of the UOM field.';
                }
            }
        }
    }
}
