// table 50158 "Rolling Mech. Area Master"
// {
//     Caption = 'Rolling Mech. Area Master';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Area"; Code[20])
//         {
//             Caption = 'Area';
//             TableRelation = "Rolling Mech. Area Master";
//             // OptionMembers = ,EAF,LRF,VD,CCM,"LT Room","EOT Crane","EAF FAFA","FES","Wire Feeding LRF","VD wire feeding machine","Pump Room","Utilities","LRF FAFA";
//         }
//         field(2; Description; Text[300])
//         {
//             Caption = 'Description';
//         }
//         field(3; "CHECK POINT"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(4; PARAMETER; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(5; "SHIFT A TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(6; "SHIFT A TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; "SHIFT B TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; "SHIFT B TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9; "SHIFT C TASK-1"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(10; "SHIFT C TASK-2"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(11; "No."; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 IF "No." <> xRec."No." THEN BEGIN
//                     NoSeriesMgt.TestManual("No.");
//                     "No. Series" := '';

//                 END;
//             end;
//         }
//         field(12; "No. Series"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(13; "line no"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(14; "Equipment"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EquipmentHeader."Equipment No";
//         }
//         field(15; "Type"; Option)
//         {
//             OptionMembers = " ",Electrial,Mechnical;
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(PK; "Area", "line no")
//         {
//             Clustered = true;
//         }
//         key(PK2; "line no", "Area")
//         {
//             // Clustered = true;
//         }
//     }
//     trigger OnInsert()
//     begin
//         begin
//             IF "No." = '' THEN BEGIN

//                 NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
//             END;
//         end;
//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

//     local procedure GetNoSeriesCode(): Code[20]
//     var
//         myInt: Integer;
//     begin
//         SalesRec.Get();
//         SalesRec.TESTFIELD("Area Code");
//         EXIT(SalesRec."Area Code");

//     end;

//     local procedure TestNoSeries(): Boolean
//     var
//         myInt: Integer;
//     begin
//         SalesRec.Get();
//         SalesRec.TESTFIELD("Area Code");
//         //    EXIT(SalesRec."Transformer Code");
//     end;

//     procedure AssistEdit(equh: Record "Rolling Mech. Area Master"): Boolean
//     var
//         myInt: Integer;
//     begin
//         TestNoSeries;
//         IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, "No.", "No. Series") THEN BEGIN
//             TestNoSeries;
//             NoSeriesMgt.SetSeries("No.");
//             EXIT(TRUE);
//         END;
//     end;



//     var
//         SalesRec: Record "Sales & Receivables Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
// }
