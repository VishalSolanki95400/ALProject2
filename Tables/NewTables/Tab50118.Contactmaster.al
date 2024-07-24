table 50118 "Contact master"
{
    Caption = 'Contact master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;

            Caption = 'Name';
        }
        field(3; "Phone Number"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone Number';
        }
        field(4; "Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Name';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
