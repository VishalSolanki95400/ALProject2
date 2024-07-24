page 50108 Dailychecklist
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Posted ERP checklist";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Area"; Rec."Area")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Shift-A"; Rec."Shift-A")
                {
                    ApplicationArea = aLl;
                }
                field("Shift-B"; Rec."Shift-B")
                {
                    ApplicationArea = All;
                }
                field("Shift-C"; Rec."Shift-C")
                {
                    ApplicationArea = aLl;
                }
                field("Shift Incharge Name"; Rec."Shift Incharge Name")
                {
                    ApplicationArea = aLl;
                }
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = aLl;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Action21)
            {
                Caption = 'export';
                Image = Export;
                action(export)
                {

                    Caption = 'export';
                    Ellipsis = true;
                    Image = Indent;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        exportCU: Codeunit ExportJson;
                    begin

                        exportCU.Run();
                    end;
                }
            }

        }

    }


    var
        myInt: Integer;
}