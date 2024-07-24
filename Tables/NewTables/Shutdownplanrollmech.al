// table 50146 "RollingShutdownPlanningMech"
// {
//     Caption = 'Rolling Shutdown Planning Mech.';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; code[20])
//         {
//             DataClassification = ToBeClassified;
//             trigger onValidate()
//             var
//                 myInt: Integer;
//             begin
//                 IF "No." <> xRec."No." THEN BEGIN
//                     InventorySetup.Get();
//                     userset.GET(USERID);
//                     NoSeriesMgt.TestManual(GetNoSeriesCode);
//                     "No. Series" := '';
//                 END;
//             end;
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

//             trigger OnValidate()
//             var
//                 RecPostedShut: Record "R.Posted ShutdownPlanningmech";
//                 recShut: Record RollingShutdownPlanningmech;
//             begin
//                 if rec."Status of the Job" = rec."Status of the Job"::Completed then begin
//                     RecPostedShut.Init();
//                     RecPostedShut.TransferFields(Rec);
//                     RecPostedShut.Insert();
//                 end;
//             end;
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
//         field(17; "Shutdown Intimation No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = PostedShutdownIntimation."No.";
//             trigger OnValidate()
//             var
//                 // recva: Record PostedShutdownIntimation;
//             begin
//                 // recva.get("Shutdown Intimation No.");
//                 // "Shutdown Start Date" := recva."Shutdown Starting Date";
//                 // "Shutdown End Date" := recva."Shutdown End Date";
//                 // "Time Required" := recva."Total Time (in Hrs.)";
//             end;
//         }

//     }
//     keys
//     {
//         key(PK; "No.")
//         {
//             Clustered = true;
//         }
//     }
//     local procedure GetNoSeriesCode(): Code[20]
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.GET;
//         InventorySetup.TESTFIELD("ShutdownPlanning Series");
//         EXIT(InventorySetup."ShutdownPlanning Series");

//     end;

//     local procedure TestNoSeries(): Boolean
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.TESTFIELD("ShutdownPlanning Series");
//     end;

//     procedure AssistEdit(IssueHeader: Record ShutdownPlanning): Boolean
//     var
//         myInt: Integer;
//     begin
//         userset.GET(USERID);

//         InventorySetup.GET;
//         TestNoSeries;
//         IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
//             TestNoSeries;
//             NoSeriesMgt.SetSeries("No.");
//             EXIT(TRUE);
//         END;
//     end;

//     var
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         USERMGT: Codeunit "User Setup Management";
//         userset: Record "User Setup";
//         InventorySetup: Record "Inventory Setup";


//     trigger OnInsert()
//     begin
//         IF "No." = '' THEN BEGIN
//             InventorySetup.GET;
//             NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
//         END;

//     end;
// }
