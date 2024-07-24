page 50121 Scrapbookingpage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Scrap Booking";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Scrap No."; Rec."Scrap No.")
                {
                    ApplicationArea = All;

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = ALl;
                }
                field("Broker Code"; Rec."Broker Code")
                {
                    ApplicationArea = all;
                }
                field("Broker Name"; Rec."Broker Name")
                {
                    ApplicationArea = all;
                }
                field("Base Rate"; Rec."Base Rate")
                {
                    ApplicationArea = ALl;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = ALl;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = aLl;
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = ALl;
                }
                field("Qty Received"; Rec."Qty Received")
                {
                    ApplicationArea = aLl;
                }
                field("Balance Qty"; Rec."Balance Qty")
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
            action(ActionName)
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
}