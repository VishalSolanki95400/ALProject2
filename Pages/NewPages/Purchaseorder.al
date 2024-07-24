page 50100 PurchaseLine
{
    UsageCategory = Administration;
    Caption = 'purchase line approval';
    PageType = List;
    SourceTable = "Purchase Line";
    ApplicationArea = All;
    SourceTableView = where(Status1 = filter(Pending));
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field(total; Total)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Total := Rec."Unit Cost" * Rec.Quantity;
                    end;
                }
                field(Status1; Rec.Status1)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Status1 := Rec.Status1::approved;
                    Rec.Modify();
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Status1 := rec.Status1::Open;
                    Rec.Modify();
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.SetRange(Approver, UserId);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange(Approver, UserId);
    end;

    var
        Total: Decimal;


}
