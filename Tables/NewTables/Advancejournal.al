table 50101 "Advance Journal"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line no."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Customer Name"; text[50])
        {

            DataClassification = ToBeClassified;
        }
        field(5; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Line no.", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {

    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}