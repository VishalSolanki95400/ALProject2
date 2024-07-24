// table 50144 "Rolling Mech. TBM"
// {
//     Caption = 'Rolling Mech. TBM';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
//             Editable = false;
//         }
//         field(2; "No."; Code[20])
//         {
//             Caption = 'No.';
//             // Editable = bool;
//             trigger onValidate()
//             var
//                 myInt: Integer;
//             begin
//                 IF "No." <> xRec."No." THEN BEGIN
//                     InventorySetup.Get();
//                     NoSeriesMgt.TestManual(GetNoSeriesCode());
//                     "No. Series" := '';
//                 END;
//             end;
//         }
//         field(3; "Area"; Option)
//         {
//             Caption = 'Area';
//             OptionMembers = " ",EAF,LRF,VD,CCM,"EOT CRANE","DG SE","66kV S/S","1500KVA D.G. Set","2250KVA D.G.";
//             trigger OnValidate()
//             begin
//                 checklastduplicate();
//             end;
//         }
//         field(4; "Equipment no"; Code[20])
//         {
//             Caption = 'Equipment no';
//             TableRelation = EquipmentHeader."Equipment No";
//             trigger OnValidate()
//             begin
//                 checklastduplicate();
//             end;
//         }
//         field(5; Assemlly; Code[20])
//         {
//             Caption = 'Assemlly';
//             TableRelation = AssemblyHeader;
//             trigger OnValidate()
//             begin
//                 checklastduplicate();
//             end;
//         }
//         field(6; "sub assembly"; Code[20])
//         {
//             Caption = 'sub assembly';
//             //  TableRelation = SubAssemblyHeader;
//             trigger OnValidate()
//             begin
//                 checklastduplicate();
//             end;
//         }
//         field(7; Department; Code[20])
//         {
//             Caption = 'Department';
//         }
//         field(8; HOD; Option)
//         {
//             Caption = 'HOD';
//             OptionMembers = ,MECHNICAL,ELECTRICAL;
//         }
//         field(9; "Schedule Date"; Date)
//         {
//             Caption = 'Schedule Date';
//         }
//         field(10; "Maintenance Type"; Option)
//         {
//             Caption = 'Maintenance Type';
//             OptionMembers = ,"TIME BASED","Preventive Maintainance";
//         }
//         field(11; "Date of Maintenance"; Date)
//         {
//             trigger OnValidate()
//             var
//                 myInt: Integer;
//             begin


//             end;
//         }
//         field(12; Frequency; Code[10])
//         {
//             Caption = 'Frequency';
//         }
//         field(13; Status; Option)
//         {
//             Caption = 'Status';
//             OptionMembers = Open,Complete;
//             trigger OnValidate()
//             var
//                 exp: text;
//                 nexrec: Record 50144;
//                 nexrec1: Record 50144;
//                 postedtra: Record "Posted Rolling Mech. TBM";
//                 tran1: Record "Rolling Mech. TBM";
//                 entryno: Integer;
//             begin
//                 Rec.TestField("Equipment no");
//                 Rec.TestField("Date of Maintenance");

//                 Clear(entryno);
//                 postedtra.Reset();
//                 if postedtra.FindLast() then
//                     entryno := postedtra."Entry No.";

//                 postedtra.Reset();
//                 postedtra.Init();
//                 postedtra."Entry No." := entryno + 1;
//                 postedtra.TransferFields(Rec, false);
//                 postedtra."Maintenance Type" := Rec."Maintenance Type";
//                 postedtra.Insert(true);

//                 if ("Schedule Date" = 0D) then
//                     Error('Schedule Date must be a value');

//                 nexrec1.Reset();
//                 if nexrec1.FindLast() then;
//                 exp := '<+' + Frequency + '>';
//                 if Status = Status::Complete then begin
//                     if ("Area" = "Area") and ("Equipment no" = "Equipment no") and (Assemlly = Assemlly) and ("sub assembly" = "sub assembly") and ("Task Code" = "Task Code") then begin
//                         nexrec.Init();
//                         nexrec."Line No." := nexrec1."Line No." + 10000;
//                         nexrec."No." := rec."No.";
//                         nexrec."Area" := rec."Area";
//                         nexrec."Equipment no" := rec."Equipment no";
//                         nexrec.Assemlly := rec.Assemlly;
//                         nexrec."sub assembly" := rec."sub assembly";
//                         nexrec."Task Code" := rec."Task Code";
//                         nexrec."Task Description" := rec."Task Description";
//                         nexrec.Department := rec.Department;
//                         nexrec.HOD := rec.HOD;
//                         nexrec."Maintenance Type" := rec."Maintenance Type";
//                         nexrec."Schedule Date" := CalcDate(exp, "Date of Maintenance");
//                         nexrec.Frequency := rec.Frequency;
//                         nexrec.Remarks := rec.Remarks;
//                         nexrec.Delay := rec.Delay;
//                         nexrec.Status := nexrec.Status::Open;
//                         Bool := true;   // ss
//                         nexrec.Insert();
//                     end;
//                 end;

//                 Message('Posted successfully. New calender Generated!!');
//                 // Rec.Delete();
//             end;
//         }
//         field(14; "No. Series"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "No. Series";
//         }
//         field(15; "Task Code"; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Task Master";

//             trigger OnValidate()
//             var
//                 task: Record "Task Master";
//             begin
//                 checklastduplicate();
//                 task.get("Task Code");
//                 "Task Description" := task.Description;
//             end;
//         }
//         field(16; "Task Description"; text[300])
//         {
//             Editable = false;
//             DataClassification = ToBeClassified;
//         }
//         field(17; "Remarks"; code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(18; "Delay"; code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(19; Supervisor; Text[30])
//         {
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

//     local procedure GetNoSeriesCode(): Code[20]
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.GET;
//         InventorySetup.TESTFIELD("Timebased Maintainance Series");
//         EXIT(InventorySetup."Timebased Maintainance Series");

//     end;

//     local procedure TestNoSeries(): Boolean
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.TESTFIELD("Timebased Maintainance Series");
//     end;

//     procedure AssistEdit(IssueHeader: Record "Rolling Mech. TBM"): Boolean
//     var
//         myInt: Integer;
//     begin
//         InventorySetup.GET;
//         TestNoSeries;
//         IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, IssueHeader."No. Series", "No. Series") THEN BEGIN
//             TestNoSeries;
//             NoSeriesMgt.SetSeries("No.");
//             EXIT(TRUE);
//         END;
//     end;

//     procedure checklastduplicate()
//     var
//         timbase: Record "Rolling Mech. TBM";
//         check: Integer;
//     begin
//         clear(check);
//         timbase.Reset();
//         if rec."Area" <> "Area"::" " then begin
//             timbase.SetRange("Area", rec."Area");
//             if timbase.FindFirst() then
//                 check += 1;
//         end;
//         timbase.Reset();
//         if rec."Equipment no" <> '' then begin
//             timbase.SetRange("Equipment no", rec."Equipment no");
//             if timbase.FindFirst() then
//                 check += 1;
//         end;
//         timbase.Reset();
//         if rec.Assemlly <> '' then begin
//             timbase.SetRange("Assemlly", rec."Assemlly");
//             if timbase.FindFirst() then
//                 check += 1;
//         end;
//         timbase.Reset();
//         if rec."sub assembly" <> '' then begin
//             timbase.SetRange("sub assembly", rec."sub assembly");
//             if timbase.FindFirst() then
//                 check += 1;
//         end;
//         timbase.Reset();
//         if rec."Task Code" <> '' then begin
//             timbase.SetRange("Task Code", rec."Task Code");
//             if timbase.FindFirst() then
//                 check += 1;
//         end;
//         if check = 5 then
//             Error('All 5 fields can not be the exact match of previous values.');
//     end;

//     trigger OnInsert()
//     begin
//         IF "No." = '' THEN BEGIN
//             InventorySetup.GET;
//             NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
//         END;

//     end;

//     var
//         InventorySetup: Record "Inventory Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         USERMGT: Codeunit "User Setup Management";
//         tem: Record "Purchase Header";
//         Bool: Boolean;
// }
