// table 50146 "Rolling Mech. checklist"
// {
//     Caption = 'Rolling mechanical daily checklist';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Line No."; Integer)
//         {
//             // Caption = 'Line No.';
//         }
//         field(2; "Date"; Date)
//         {
//             Caption = 'Date';
//         }
//         field(3; "Area"; Code[20])
//         {
//             Caption = 'Area';
//             // OptionMembers = ,EAF,LRF,VD,CCM,"LT Room","EOT Crane";
//             //    TableRelation = "Mech. Area Master";
//         }
//         field(4; Description; Text[300])
//         {
//             Caption = 'Description';
//         }
//         field(5; "Shift-A"; Code[20])
//         {
//             Caption = 'Shift-A';
//         }
//         field(6; "Shift-B"; Code[20])
//         {
//             Caption = 'Shift-B';
//         }
//         field(7; "Shift-C"; Code[20])
//         {
//             Caption = 'Shift-C';
//         }
//         field(8; "Shift A Incharge Name"; Text[50])
//         {
//             Caption = 'Shift Incharge Name';
//         }
//         field(9; Notes; Text[100])
//         {
//             Caption = 'Notes';
//         }

//         field(10; "Check Point"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(11; PARAMETER; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Parameter Master"."Parameter Code";
//         }
//         field(12; "SHIFT A TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(13; "SHIFT A Condition-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(14; "SHIFT A TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "SHIFT A Condition-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(16; "SHIFT B TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(17; "SHIFT B Condition-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(18; "SHIFT B TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(19; "SHIFT B Condition-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(20; "SHIFT C TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(21; "SHIFT C Condition-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(22; "SHIFT C TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(23; "SHIFT C Condition-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(24; "Equipment"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(25; "Heat No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Heat Master List";
//         }
//         field(26; "Time for 1 MBar"; Text[25])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(27; "Min Vaccume"; Text[25])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(28; Flooding; Text[25])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(29; "Shift B Incharge Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(30; "Shift C Incharge Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(31; "Shift A Submit"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(32; "Shift B Submit"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(33; "Shift C Submit"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(34; "Type"; Option)
//         {
//             OptionMembers = " ",Electrial,Mechnical;
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(PK; "Line No.")
//         {
//             Clustered = true;
//         }
//     }
// }
