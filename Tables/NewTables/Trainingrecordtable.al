table 50173 TrCalendar
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Month; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Month';
            OptionMembers = " ",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        }
        field(2; "Department"; code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(3; "Programme Title"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Programme Title';
        }
        field(4; "Training Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Date (Tentative)';

        }
        field(5; "Faculty Name"; text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Faculty Name';
        }
        field(6; "Type of Faculty"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Internal","External";
            Caption = 'Type of Faculty';
        }
        field(7; Duration; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Duration Of Training (Min)';
        }
        field(8; "Type of participant"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Type Of Participant';
            OptionMembers = " ","Worker","Staff","Worker & Staff";
        }
        field(9; Venue; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Venue';
            OptionMembers = " ","HR Training Hall","Shopfloor","Other(Specify in remarks)";

        }
        field(10; Exstaff; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Staff(Expected)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationEXpected;
            end;
        }
        field(11; exOnroll; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'On-Roll(Expected)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationEXpected;
            end;
        }
        field(12; exContract; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract(Expected)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationEXpected;
            end;

        }
        field(13; "Expected hours"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Man-Minuts(Expected)';
            Editable = false;
        }
        field(14; "trainingdate AC"; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Date (Actual)';
        }
        field(15; "Ac Staff"; Integer)
        {

            DataClassification = ToBeClassified;
            Caption = 'Staff(Actual)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationACTual;
            end;


        }

        field(16; acOnroll; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'On-Roll(Actual)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationACTual;
            end;
        }
        field(17; acContract; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Contract(Actual)';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                CalculationACTual;
            end;

        }
        field(18; "Actual hours"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Man-Minuts(Actual)';
            Editable = false;
        }
        field(19; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Remarks';
        }
        field(20; Status; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            OptionMembers = " ","Pending","Completed";
            /* trigger OnValidate()
             var
                 RecPostedCal: Record PostedTrCalendar;
             begin
                 if Status = Status::Completed then begin
                     RecPostedCal.Init();
                     RecPostedCal.TransferFields(Rec);
                     RecPostedCal.Insert();
                 end;
             end;*/
        }
        field(21; "No."; code[20])
        {
            DataClassification = ToBeClassified;
            trigger onValidate()
            var
                myInt: Integer;
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    InventorySetup.Get();
                    userset.GET(USERID);
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(22; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(23; "Store"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Participent Name"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Participent Code"; Text[500])
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
    local procedure GetNoSeriesCode(): Code[20]
    var
        myInt: Integer;
    begin
        // InventorySetup.GET;
        // InventorySetup.TESTFIELD("TRCalender Series");
        // EXIT(InventorySetup."TRCalender Series");

    end;

    local procedure TestNoSeries(): Boolean
    var
        myInt: Integer;
    begin
        // InventorySetup.TESTFIELD("TRCalender Series");
    end;

    procedure AssistEdit(IssueHeader: Record TrCalendar): Boolean
    var
        myInt: Integer;
    begin
        userset.GET(USERID);

        InventorySetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries("No.");
            EXIT(TRUE);
        END;
    end;

    procedure CalculationACTual()
    var
        myInt: Integer;
    begin
        Rec."Actual hours" := Rec.Duration * (Rec."Ac Staff" + Rec.acOnroll + Rec.acContract);
    end;

    procedure CalculationEXpected()
    var
        myInt: Integer;
    begin
        Rec."Expected hours" := Rec.Duration * (Rec.Exstaff + Rec.exOnroll + Rec.exContract);
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        USERMGT: Codeunit "User Setup Management";
        userset: Record "User Setup";
        InventorySetup: Record "Inventory Setup";
        TRcal: Record TrCalendar;


    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            InventorySetup.GET;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
        END;

    end;

}