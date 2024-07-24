page 50120 Tempsalescard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Temp sales header ";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = aLl;
                }
                field("Location code"; Rec."Location code")
                {
                    ApplicationArea = all;
                }
                field("Posting date"; Rec."Posting date")
                {
                    ApplicationArea = aLl;
                }
                field("External Doc No."; Rec."External Doc No.")
                {
                    ApplicationArea = all;
                }
                field("Type "; Rec."Type ")

                {
                    ApplicationArea = aLl;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = aLl;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = aLl;
                }
                field("unit cost"; Rec."unit cost")
                {
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = aLl;
                }
                field("Sales order No."; Rec."Sales order No.")
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
            action("Impport sales order")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50110, false, true);

                end;
            }
        }
    }

    var
        myInt: Integer;
}