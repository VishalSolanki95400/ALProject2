tableextension 50197 Customercardext extends "customer"
{
    fields
    {
        field(50000; "Temporary credit limit"; Decimal)
        {
            trigger OnValidate()
            var
            begin
                rec."Remaining credit limit" := Rec."Temporary credit limit" + rec."Credit Limit (LCY)";

            end;

        }
        field(50001; "Remaining credit limit"; Decimal)
        {
            Editable = false;
        }
        Field(50002; "Type"; Option)
        {

            OptionMembers = "Advance customer","Normal customer";
            DataClassification = ToBeClassified;

        }
        Field(50003; "Advance Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }


    var
        myInt: Integer;
}