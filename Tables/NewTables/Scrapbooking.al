table 50180 "Scrap Booking"
{
    fields
    {

        field(1; "Scrap No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger onvalidate()
            var
                myInt: Integer;
                GeneralLedgerSetup: Record "Purchases & Payables Setup";
                userset: Record "User Setup";
                NoSeriesMgt: Codeunit 396;

            begin
                IF "Scrap No." <> xRec."Scrap No." THEN BEGIN
                    GeneralLedgerSetup.GET;
                    // NoSeriesMgt.TestManual(GeneralLedgerSetup."Scrap Nos");
                    NoSeriesMgt.SetSeries("Scrap No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Broker Code"; code[20])
        {
            // TableRelation = Vendor."No." where("Broker Vendor" = const(true));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                vend: Record vendor;
            begin
                vend.Reset();
                vend.SetRange("No.", "Broker Code");
                if vend.FindFirst() then
                    "Broker Name" := vend.Name;
            end;
        }
        field(3; "Broker Name"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Base Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Item No."; code[20])
        {
            TableRelation = Item."No.";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                vend: Record Item;
            begin
                vend.Reset();
                vend.SetRange("No.", "Item No.");
                if vend.FindFirst() then
                    "Item Description" := vend.Description;
            end;
        }
        field(6; "Item Description"; text[250])
        {
            DataClassification = ToBeClassified;

        }


        field(7; Qty; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if Qty <> 0 then
                    "Maximum Qty Pur" := Qty + (Qty * Tolerance) / 100;
            end;

        }
        field(8; Tolerance; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if Tolerance <> 0 then
                    "Maximum Qty Pur" := Qty + (Qty * Tolerance) / 100;
            end;
        }
        field(9; "Maximum Qty Pur"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Qty Received" <> 0 then
                    "Balance Qty" := "Maximum Qty Pur" - "Qty Received";
            end;

        }
        field(10; "Qty Received"; Decimal)
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Purch. Rcpt. Line"."Document No.";
            trigger OnValidate()
            begin
                if "Maximum Qty Pur" <> 0 then
                    "Balance Qty" := "Maximum Qty Pur" - "Qty Received";
            end;
        }
        field(11; "Balance Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(12; "Commission %"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Commision Type"; Option)
        {
            OptionMembers = " ","Commision %","Commision Value";
            DataClassification = ToBeClassified;
        }
        field(15; "Commission Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    begin

        IF "Scrap No." = '' THEN BEGIN
            // GeneralLedgerSetup.GET;
            // GeneralLedgerSetup.TESTFIELD("Scrap Nos");
            // NoSeriesMgt.InitSeries(GeneralLedgerSetup."Scrap Nos", Rec."No. Series", 0D, "Scrap No.", "No. Series");
        END;

    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GeneralLedgerSetup: Record "Purchases & Payables Setup";
}
