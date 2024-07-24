table 50131 Correctpurchaseheader
{
    Caption = 'Correct Purchase header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = "No. Series";

            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual("No.");
                    // "No.Series" := '';

                end;
            end;
        }
        field(2; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
            trigger OnValidate();
            var
                vendor: Record Vendor;
            begin
                if vendor.Get("vendor no.") then
                    Rec."vendor name" := vendor."Name";
                rec.Address := vendor.Address;
                rec."Contact No." := vendor."Phone No.";
            end;


        }
        field(3; "Vendor Name"; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Address"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Contact No."; Text[30])
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
        field(11; "No.Series"; Code[20])
        {
            TableRelation = "No. Series";

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


    trigger OnInsert()
    begin


        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("PurReq NoSeries.");
            NoSeriesMgt.InitSeries(SalesSetup."RGP No.Series", xRec."No.series", 0D, "No.", "No.");
        end;
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

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "No.Series": Integer;

}