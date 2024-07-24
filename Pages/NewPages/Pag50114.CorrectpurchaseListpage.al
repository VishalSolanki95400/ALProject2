page 50114 "Correct purchase List page"
{
    ApplicationArea = All;
    Caption = 'Correct purchase List page';
    PageType = List;
    SourceTable = Correctpurchaseheader;
    UsageCategory = Administration;
    CardPageId = "Correct purchase card page";

    layout
    {
        area(content)
        {
            repeater(General)
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
