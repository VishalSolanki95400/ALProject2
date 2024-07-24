// table 50147 "R.Posted ShutdownPlanningMech"
// {
//     Caption = 'Rolling Posted Shutdown Planning Mech.';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(2; "Area"; code[40])
//         {
//             DataClassification = ToBeClassified;
//             // OptionMembers = " ","EAF","LRF","EOT Crane","FES","CCM","66KV Substation","Misc";
//             TableRelation = ShutdownAreaMaster."Shutdown Area";
//         }
//         field(3; "Equipment"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EquipmentHeader."Equipment No";
//         }
//         field(4; "Fixed Asset No"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Fixed Asset"."No.";
//         }
//         field(5; "Assembly"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = AssemblyHeader."Assembly No";
//         }
//         field(6; "Sub Assembly"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = SubAssemblyHeader."Sub Assembly No";
//         }
//         field(7; "Description of Job to be done"; text[300])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; Date; date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9; "Time Required"; duration)
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(10; "ManPower Required"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(11; "Status of the Job"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Pending","Completed";
//         }
//         field(12; Remarks; text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(13; "No. Series"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "No. Series";
//         }
//         field(14; "Shutdown Start Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "Shutdown End Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(16; "Time"; Time)
//         {
//             DataClassification = ToBeClassified;
//         }

//     }
//     keys
//     {
//         key(PK; "No.")
//         {
//             Clustered = true;
//         }
//     }

// }
