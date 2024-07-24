page 50102 Advancejournal
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Advance Journal";

    layout
    {
        area(Content)
        {
            group(repeat)
            {
                field("Line no."; Rec."Line no.")
                {
                    ApplicationArea = All;

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    TableRelation = Customer;
                    trigger OnValidate();
                    var
                        cust: Record Customer;
                    begin
                        if cust.Get(cust."No.") then
                            Rec."Customer Name" := cust."Name";
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(post)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        Cust: record Customer;
}