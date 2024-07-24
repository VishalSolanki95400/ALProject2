table 50112 "Issue Header"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Issue No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger onValidate()
            var
                myInt: Integer;
            begin
                IF "Issue No." <> xRec."Issue No." THEN BEGIN
                    PurchPaySetup.Get();
                    userset.GET(USERID);
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;

        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Issue,Return;
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Shortcut Dimenssion 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            CaptionClass = '1,2,1';
        }

        field(6; "Shortcut Dimenssion 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            CaptionClass = '1,2,2';
        }
        field(7; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                IssueSlipLine: Record "Issue Line";
            begin
                IssueSlipLine.Reset();
                IssueSlipLine.SetRange("Issue No.", "Issue No.");
                if IssueSlipLine.FindFirst() then
                    repeat
                        IssueSlipLine."Employee No" := "Employee No";
                        IssueSlipLine.Modify();
                    until IssueSlipLine.Next() = 0;
            end;
        }
        field(8; "User ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(9; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Post; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Purchase Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code;
            DataClassification = ToBeClassified;
        }
        field(12; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Submitted,Released;
        }

    }

    keys
    {
        key(Key1; "Issue No.")
        {
            Clustered = true;
        }
    }
    local procedure GetNoSeriesCode(): Code[20]
    var
        myInt: Integer;
    begin
        // InventorySetup.GET;
        // InventorySetup.TESTFIELD("Issue No.");
        // EXIT(InventorySetup."Issue No.");

    end;

    local procedure TestNoSeries(): Boolean
    var
        myInt: Integer;
    begin
        // InventorySetup.TESTFIELD("Issue No.");
    end;

    procedure AssistEdit(IssueHeader: Record "Issue Header"): Boolean
    var
        myInt: Integer;
    begin
        userset.GET(USERID);

        PurchPaySetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("Issue No.");
            EXIT(TRUE);
        END;
    end;

    var
        myInt: Integer;

        PurchPaySetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        USERMGT: Codeunit "User Setup Management";
        userset: Record "User Setup";
        InventorySetup: Record "Inventory Setup";


    trigger OnInsert()
    begin
        IF "Issue No." = '' THEN BEGIN
            PurchPaySetup.GET;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "Issue No.", "No. Series");
        END;
        "Document Date" := WorkDate;
        "User ID" := USERID;
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