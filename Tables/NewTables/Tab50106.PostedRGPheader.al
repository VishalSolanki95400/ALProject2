table 50106 postedRGPHeader
{
    Caption = 'postedRGPHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."PurReq NoSeries.");
                    "No.Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Issue,Return;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; Locationcode; Code[20])
        {
            Caption = 'Locationcode';
            TableRelation = Location;
        }
        field(6; Comment; Text[100])
        {
            Caption = 'Comment';
        }
        field(7; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            trigger OnValidate();
            var
                vendor: Record Vendor;
            begin
                if vendor.Get("vendor no.") then
                    Rec."vendor name" := vendor."Name";
            end;
        }
        field(8; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(10; "Post "; Boolean)
        {
            Caption = 'Post ';
        }
        field(11; "Vendor Name"; Text[50])
        {
            Caption = 'Vendor Name';
        }
        field(12; "Transporter Vendor No."; Code[20])
        {
            Caption = 'Transporter Vendor No.';
        }
        field(13; "Gr/RR No."; Code[20])
        {
            Caption = 'Gr/RR No.';
        }
        field(14; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
        }
        field(15; "Shipment Method"; Code[20])
        {
            Caption = 'Shipment Method';
        }
        field(16; "Gate Entry Inward"; Code[20])
        {
            Caption = 'Gate Entry Inward';
        }
        field(17; "Gate Entry Outword"; Code[20])
        {
            Caption = 'Gate Entry Outword';
        }
        field(18; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Release;
        }
        field(19; "No.Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(20; "RGP No.Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(pk1; "Document No.", "No.Series")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        "Posting date" := Today;

        if "Document No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("PurReq NoSeries.");
            NoSeriesMgt.InitSeries(SalesSetup."RGP No.Series", xRec."No.series", 0D, "Document No.", "No.Series");
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

}