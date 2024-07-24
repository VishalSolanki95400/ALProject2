pageextension 50192 Purchaselineext extends "Purchase Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("over limit"; Rec."over limit")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin

                end;


            }
            field(Status; Rec.Status1)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("Item Tracking Lines")
        {
            action("send for approval")
            {
                ApplicationArea = all;
                // Promoted = true;
                // PromotedCategory = Process;
                trigger OnAction()
                var
                    CurrentOrder: Record "Purchase Header";
                    purpayb: Record "Purchases & Payables Setup";
                begin
                    purpayb.get();
                    rec."Status1" := rec.Status1::pending;
                    Rec.Approver := purpayb."Line approver";
                    rec.Modify();


                    MESSAGE('Purchase order sent for approval successfully.');

                end;
            }
            action("cancel approval")
            {
                trigger OnAction()
                begin
                    rec.Status1 := rec.Status1::Open;
                    rec.Modify();

                    Message('Purchase order send for approval is canceled');

                end;
            }

        }
    }

    var
        myInt: Integer;
        usersetup: record "User Setup";

}