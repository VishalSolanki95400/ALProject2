page 50152 "Posted Correct purchcard page"
{
    ApplicationArea = All;
    Caption = 'Posted Correct purchase card page';
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
        }
    }
}
