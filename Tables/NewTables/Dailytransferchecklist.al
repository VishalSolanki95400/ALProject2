table 50195 "Transformer Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    NoSeriesMgt.TestManual("No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Transformer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // // TableRelation = "Transformer Master"."Transformer Code";
            // trigger OnValidate()
            // var
            //     TranMast: Record "Transformer Master";
            // begin
            //     if TranMast.Get("Transformer Code") then
            //         "Transformer Name" := TranMast."Transformer Name";
            //     InsertLine("No.", "Transformer Code");
            // end;
        }
        field(3; "Transformer Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Post"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
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
        IF "No." = '' THEN BEGIN

            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
        END;
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

    // procedure InsertLine(No: Code[20]; TransCode: Code[20])
    // var
    //     CheckistMaster: Record "Transformer Checklist Master";
    //     TranLine: Record "Transformer Line";
    //     TranLine1: Record "Transformer Line";
    //     TranLine2: Record "Transformer Line";
    // begin
    //     TranLine2.Reset();
    //     TranLine2.SetRange("Document No.", No);
    //     if TranLine2.FindFirst() then
    //         TranLine2.DeleteAll();
    //     CheckistMaster.Reset();
    //     CheckistMaster.SetRange("Transformer Code", TransCode);
    //     if CheckistMaster.FindFirst() then
    //         repeat
    //             TranLine1.Reset();
    //             if TranLine1.FindLast() then;
    //             TranLine.Init();
    //             TranLine."Document No." := No;
    //             TranLine."Line No." := TranLine1."Line No." + 10000;
    //             TranLine.Insert();
    //             TranLine."Transformer Code" := TransCode;
    //             TranLine."Transformer Name" := CheckistMaster."Transformer Name";
    //             TranLine."Parameter Code" := CheckistMaster."Parameter Code";
    //             TranLine."Parameter Name" := CheckistMaster."Parameter Name";
    //             TranLine.Modify();
    //         until CheckistMaster.Next() = 0;
    // end;


    local procedure GetNoSeriesCode(): Code[20]
    var
        myInt: Integer;
    begin
        // SalesRec.Get();
        // SalesRec.TESTFIELD("Transformer Code");
        // EXIT(SalesRec."Transformer Code");

    end;

    local procedure TestNoSeries(): Boolean
    var
        myInt: Integer;
    begin
        // SalesRec.Get();
        // SalesRec.TESTFIELD("Transformer Code");
        //    EXIT(SalesRec."Transformer Code");
    end;

    procedure AssistEdit(equh: Record "Transformer Header"): Boolean
    var
        myInt: Integer;
    begin
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, "No.", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("No.");
            EXIT(TRUE);
        END;
    end;



    var
        SalesRec: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}