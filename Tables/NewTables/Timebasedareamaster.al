table 50120 "Timebased Area Master"
{
    Caption = 'Timebased Area Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Area1"; code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; text[100])
        {

            DataClassification = ToBeClassified;
        }
        field(3; "TBM Doc. No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "CBM Doc. No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Preventive Doc. No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "TBM Revised Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "CBM Revised Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Preventive Revised Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "TBM Effective  Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "CBM Effective Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Preventive Effective Date"; Text[50])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "Area1")
        {
            Clustered = true;
        }
    }
}