// table 50430 RollingCompressorMaster
// {
//     Caption = 'Rolling comprssor master';
//     DataClassification = ToBeClassified;
//     // LookupPageID = compresso;
//     fields
//     {
//         field(1; "C2"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             trigger onValidate()
//             var
//                 myInt: Integer;
//             begin
//                 IF C2 <> xRec.C2 THEN BEGIN
//                     InventorySetup.Get();
//                     userset.GET(USERID);
//                     NoSeriesMgt.TestManual(GetNoSeriesCode);
//                     "No. Series" := '';
//                 END;
//             end;

//         }
//         field(2; "Model No."; code[30])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = Rolling."Model No.";
//             trigger OnValidate()
//             var
//                 RecModel: Record RollingCompressorMaster;
//                 PosCom: Record RollingPostedCompressormaster;
//             begin
//                 PosCom.Reset();
//                 PosCom.SetRange("Model No.", rec."Model No.");
//                 if PosCom.FindLast() then begin
//                     IF RecModel.GET("Model No.") THEN;
//                     "LAST SERVICE DONE ON @ HRS" := PosCom."LAST SERVICE DONE ON @ HRS";
//                     // "NEXT SERVICE DUE @ HRS" := PosCom."NEXT SERVICE DUE @ HRS";
//                     "Frequency (in Hrs.)" := RecModel."Frequency (in Hrs.)";
//                     "NEXT SERVICE DUE @ HRS" := RecModel."Last Service Done";
//                     "LAST SERVICE DONE ON @ HRS" := RecModel."NEXT SERVICE DUE @ HRS";
//                 end else begin
//                     IF RecModel.GET("Model No.") THEN;
//                     "LAST SERVICE DONE ON @ HRS" := RecModel."LAST SERVICE DONE ON @ HRS";
//                     // "NEXT SERVICE DUE @ HRS" := RecModel."NEXT SERVICE DUE @ HRS";
//                     "Frequency (in Hrs.)" := RecModel."Frequency (in Hrs.)";
//                     "NEXT SERVICE DUE @ HRS" := RecModel."Last Service Done";
//                     "LAST SERVICE DONE ON @ HRS" := RecModel."NEXT SERVICE DUE @ HRS";
//                 end;
//             END;
//         }
//         field(3; "LAST SERVICE DONE ON @ HRS"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(4; "NEXT SERVICE DUE @ HRS"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Remarks"; text[30])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(6; "Running Date"; date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; "Current Running hours"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; "No. Series"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "No. Series";
//         }
//         field(9; "Worksheet Template Name"; Code[10])
//         {
//             Caption = 'Worksheet Template Name';
//             TableRelation = "Req. Wksh. Template";
//         }
//         field(10; "Journal Batch Name"; Code[10])
//         {
//             Caption = 'Journal Batch Name';
//             TableRelation = "Requisition Wksh. Name".Name WHERE("Worksheet Template Name" = FIELD("Worksheet Template Name"));
//         }
//         field(11; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
//         }
//         field(13; Status; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Open","Due","Complete";
//             Editable = false;
//             trigger OnValidate()
//             var
//                 modelmas: Record RollingCompressorMaster;
//             begin

//             end;
//         }
//         field(14; "Frequency (in Hrs.)"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "Running hours(Service is Done)"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(Key1; C2)
//         {
//             Clustered = true;
//         }
//     }
//     procedure GetNoSeriesCode(): Code[20]
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.GET;
//         InventorySetup.TESTFIELD("Compressor Series");
//         EXIT(InventorySetup."Compressor Series");

//     end;

//     local procedure TestNoSeries(): Boolean
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.TESTFIELD("Compressor Series");
//     end;

//     procedure AssistEdit(IssueHeader: Record CompressorHeader): Boolean
//     var
//         myInt: Integer;
//     begin
//         userset.GET(USERID);

//         InventorySetup.GET;
//         TestNoSeries;
//         IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
//             TestNoSeries;
//             NoSeriesMgt.SetSeries(C2);
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
//         IF C2 = '' THEN BEGIN
//             InventorySetup.GET;
//             NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, c2, "No. Series");
//         END;
//     end;
// }