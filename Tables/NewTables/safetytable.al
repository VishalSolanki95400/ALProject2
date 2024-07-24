table 50152 Safety
{
    Caption = 'Safety';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Safety Shoes"; boolean)
        {
            Caption = 'Safety Shoes, Helmet & Hand Gloves';
            DataClassification = ToBeClassified;
        }
        field(2; "Welding Screen"; boolean)
        {
            Caption = 'Welding Screen & Gas Cutting Goggles/ Grinding Googles';
            DataClassification = ToBeClassified;
        }
        field(3; "All Compressed gas cylinder"; boolean)
        {
            Caption = 'All Compressed gas cylinder kept in Vertical condition';
            DataClassification = ToBeClassified;
        }
        field(4; "Flash back Arreslor"; boolean)
        {
            Caption = 'Flash back Arreslor/ Gas Trolley with chain';
            DataClassification = ToBeClassified;
        }
        field(5; "Apron"; boolean)
        {
            Caption = 'Apron/ jacket/ Breathing Apparatus';
            DataClassification = ToBeClassified;
        }
        field(6; "Warning Tape"; boolean)
        {
            Caption = 'Warning Tape (Safety Ribbon) below working area ';
            DataClassification = ToBeClassified;
        }
        field(7; "Ear Plug"; boolean)
        {
            Caption = 'Ear Plug/ Gas Mask/ Full Body Safety Herness';
            DataClassification = ToBeClassified;
        }
        field(8; "Medical O2 Cylinder1"; boolean)
        {
            Caption = 'Medical O2 Cylinder/ N2 purging';
            DataClassification = ToBeClassified;
        }
        field(9; "Competent Supervisor"; boolean)
        {
            Caption = 'Competent Supervisor';
            DataClassification = ToBeClassified;
        }
        field(10; "Gas Prone/Confined Space"; boolean)
        {
            Caption = 'Gas Prone/Confined Space is free of any toxic gas';
            DataClassification = ToBeClassified;
        }
        field(11; "Oxygen deficiency"; boolean)
        {
            Caption = 'Oxygen deficiency test carned out (min.19.5% and max.23.5% )';
            DataClassification = ToBeClassified;
        }
        field(12; "Ventilation & frameproof"; boolean)
        {
            Caption = 'Ventilation & frameproof lighting arrangement';
            DataClassification = ToBeClassified;
        }
        // field(13; "Apron"; boolean)
        // {
        //     Caption = 'Apron/ jacket/ Breathing Apparatus';
        //     DataClassification = ToBeClassified;
        // }
        field(14; "Adequate means of access"; boolean)
        {
            Caption = 'Adequate means of access & egrees';
            DataClassification = ToBeClassified;
        }
        field(15; "Equipment properly flushed"; boolean)
        {
            Caption = 'Equipment properly flushed, drained & depressuirised';
            DataClassification = ToBeClassified;
        }
        field(16; "Medical O2 Cylinder"; boolean)
        {
            Caption = 'Medical O2 Cylinder/ N2 purging';
            DataClassification = ToBeClassified;
        }
        field(17; "safe & appropriate hand"; boolean)
        {
            Caption = 'safe & appropriate hand tool used';
            DataClassification = ToBeClassified;
        }
        field(18; "Continuous Supervision"; boolean)
        {
            Caption = 'Continuous Supervision during confined entry';
            DataClassification = ToBeClassified;
        }
        field(19; "ESS & Helmet"; boolean)
        {
            Caption = 'ESS & Helmet/Ear Plug/ Dust Mask/ Gloves, Rubber Mats etc';
            DataClassification = ToBeClassified;
        }
        field(20; "Insulated tools forwork"; boolean)
        {
            Caption = 'Insulated tools forwork';
            DataClassification = ToBeClassified;
        }
        field(21; "Control Fuse Removal"; boolean)
        {
            Caption = 'Control Fuse Removal/ checked supply cable insulation';
            DataClassification = ToBeClassified;
        }
        field(22; "Discharged rod"; boolean)
        {
            Caption = 'Discharged rod/ ELCB';
            DataClassification = ToBeClassified;
        }
        field(23; "Full body harness"; boolean)
        {
            Caption = 'Full body harness(above 02 meter) height';
            DataClassification = ToBeClassified;
        }
        field(24; "Test lamp"; boolean)
        {
            Caption = 'Test lamp & Multi meter for power isolation';
            DataClassification = ToBeClassified;
        }
        field(25; "Danger board"; boolean)
        {
            Caption = 'Danger board/ Men at work tag';
            DataClassification = ToBeClassified;
        }
        field(26; "Working Platform"; boolean)
        {
            Caption = 'Working Platform & Ladder';
            DataClassification = ToBeClassified;
        }
        field(27; "Competent Supervisor1"; boolean)
        {
            Caption = 'Competent Supervisor/ Authorised Technician';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Safety Shoes")
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