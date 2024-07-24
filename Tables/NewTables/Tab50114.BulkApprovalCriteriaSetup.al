table 50114 "Bulk Approval Criteria Setup "
{
    Caption = 'Bulk Approval Criteria Setup ';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "User ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'User ID';
        }
        field(2; "Approved ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Approved ID';
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}
