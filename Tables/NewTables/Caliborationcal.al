table 50179 CalibrationCalender
{
    DataClassification = ToBeClassified;
    caption = 'Calibration Calender';


    fields
    {

        field(1; "Sr No."; integer)
        {
            DataClassification = ToBeClassified;
            // autoincrement = true;
        }
        field(2; "Tag No."; Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = CriticalCalibrationMaster."CriticalCalibration No";

            // trigger OnValidate()
            // var
            //     RecCal: Record CriticalCalibrationMaster;
            // begin
            //     if RecCal.Get("Tag No.") then
            //         "Area" := RecCal."Area";
            //     Description := RecCal.Description;
            //     "Serial No." := RecCal."Serial No.";
            // end;
        }
        field(3; Description; text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Area"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Frequency; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Monthly,"Quaterly","Half Yearly","Yearly";
        }
        field(7; Startdate; date)
        {
            DataClassification = ToBeClassified;
            caption = 'Start Date';
        }
        field(8; Jan; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Feb; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Mar; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Apr; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; May; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Jun; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Jul; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Aug; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Sep; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Oct; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; Nov; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Dec; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Calibration; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","In House","Out House";
        }
        field(21; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; CalNo; code[20])
        {
            DataClassification = ToBeClassified;

            trigger onValidate()
            var
                myInt: Integer;
            begin
                IF CalNo <> xRec.CalNo THEN BEGIN
                    InventorySetup.Get();
                    userset.GET(USERID);
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(23; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(24; "Serial No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; JanStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; FebStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; MarStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; AprStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; MayStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; JunStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(31; JulStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; AugStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; SepStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; OctStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; NovStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; DecStatus; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Status"; Option)
        {
            OptionMembers = Open,Completed;
            DataClassification = ToBeClassified;
        }
        field(38; "Next Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; CalNo, "Sr No.")
        {
            Clustered = true;
        }
    }
    local procedure GetNoSeriesCode(): Code[20]
    var
        myInt: Integer;
    begin
        // InventorySetup.GET;
        // InventorySetup.TESTFIELD("Cal Series");
        // EXIT(InventorySetup."Cal Series");

    end;

    local procedure TestNoSeries(): Boolean
    var
        myInt: Integer;
    begin
        // InventorySetup.TESTFIELD("Cal Series");
    end;

    procedure AssistEdit(IssueHeader: Record CalibrationCalender): Boolean
    var
        myInt: Integer;
    begin
        userset.GET(USERID);

        InventorySetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.SetSeries(CalNo);
            EXIT(TRUE);
        END;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        USERMGT: Codeunit "User Setup Management";
        userset: Record "User Setup";
        InventorySetup: Record "Inventory Setup";
    // earth: Record EarthpitMaster;

    trigger OnInsert()
    begin
        IF CalNo = '' THEN BEGIN
            InventorySetup.GET;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, CalNo, "No. Series");
        END;

    end;
}




