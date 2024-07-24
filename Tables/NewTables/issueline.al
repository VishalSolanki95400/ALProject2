table 50113 "Issue Line"
{
    Caption = 'Issue Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Issue No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;


        }

        field(4; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if Quantity > "Requested Qty" then
                    Error('Quantity must not be greater then Requested Qty');
            end;
        }

        field(7; UOM; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Unit of Measure".Code;
        }

        field(8; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = Employee."No.";
        }
        field(9; Remarks; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(10; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }

        field(11; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }


        field(12; "Shortcut Dimenssion 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            CaptionClass = '1,2,1';
        }

        field(13; "Shortcut Dimenssion 2"; Code[20])
        {
            //Caption = 'Shortcut Dimenssion 2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            CaptionClass = '1,2,2';
        }
        field(14; "Issue Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Issue,Return;
        }
        field(18; "Issue Ledger Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Issue Ledger Entry Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Item,FA;
        }
        field(60000; "Requested Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

            end;
        }

    }

    keys
    {
        key(PK; "Issue No.", "Line No")
        {
            Clustered = true;
        }
    }

}
