tableextension 50122 "Sales & Receivables Setup EXT" extends "Sales & Receivables Setup"
{
    fields
    {
        Field(50000; "PurReq NoSeries."; Code[20])
        {

            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50001; "RGP No.Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50002; "Number series"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}