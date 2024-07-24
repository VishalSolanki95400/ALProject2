namespace ALProject.ALProject;

page 50116 employeeclear
{
    ApplicationArea = All;
    Caption = 'employeeclear';
    PageType = List;
    SourceTable = "Issue Header";
    UsageCategory = Administration;
    CardPageId = employeeclearcard;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Issue No."; Rec."Issue No.")
                {
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Post; Rec.Post)
                {
                    ToolTip = 'Specifies the value of the Post field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Purchase Code"; Rec."Purchase Code")
                {
                    ToolTip = 'Specifies the value of the Purchase Code field.';
                }
                field("Shortcut Dimenssion 1"; Rec."Shortcut Dimenssion 1")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimenssion 1 field.';
                }
                field("Shortcut Dimenssion 2"; Rec."Shortcut Dimenssion 2")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimenssion 2 field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
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
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }
}
