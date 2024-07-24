page 50151 "Correct purchase card page"
{
    ApplicationArea = All;
    Caption = 'Correct purchase card page';
    PageType = Card;
    SourceTable = Correctpurchaseheader;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Contact No."; Rec."Contact No.")
                {
                }
                field("Doc Date"; Rec."Doc Date")
                {
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                }
                field(Narration; Rec.Narration)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Reason; Rec.Reason)
                {
                }

            }
            part(part; "Correct purchase subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No" = field("No.");
            }

        }



    }
    actions
    {
        area(Processing)
        {
            action(upadateGrnfield)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    postedreciptheader: Record PostedCorrectpurchheader;
                    postedreciptline: Record PostedCorrectpurchaseline;
                    purchaseheader: Record "Purchase Header";
                    purchaseline: Record "Purchase Line";
                    coorectline: Record Correctpurchaseline;
                begin
                    coorectline.SetRange("Document No", rec."No.");
                    if coorectline.FindFirst() then begin
                        purchaseheader.Init();
                        purchaseheader."No." := Rec."No.";
                        // purchaseheader  
                    end;



                end;
            }
        }
    }
}
