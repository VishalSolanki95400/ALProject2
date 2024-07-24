table 50132 PostedCorrectpurchheader
{
    Caption = 'Posted Correct Purchase header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Vendor Name"; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Address"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Contact No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Doc Date"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(7; "Invoice No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Reason"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Narration"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Department"; Text[20])
        {
            DataClassification = ToBeClassified;

        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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