table 50199 "PostedOxygenPlantChklistHeader"
{
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; CheckPoint; text[100])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Oxygen Plant Master".CheckPoint;
        }
        field(4; "Employee Code"; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(5; "Name of a Job"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "8:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "9:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "10:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "11:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "12:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "13:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "14:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "15:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "16:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "17:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "18:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "19:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "20:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "21:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "22:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "23:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "0:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "1:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "2:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "3:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "4:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "5:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "6:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "7:00"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; Frequency; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Day Shift"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Night Shift"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Post; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(35; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(36; "Employee Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; Remarks; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}