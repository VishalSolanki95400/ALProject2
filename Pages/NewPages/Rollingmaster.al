// page 50490 "Rolling compressor master"
// {
//     ApplicationArea = all;
//     Caption = 'Rolling Compressor Master';
//     PageType = List;
//     SourceTable = RollingCompressorMaster;
//     UsageCategory = Administration;
//     SourceTableView = where(Status = filter(<> complete));

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("Model No."; rec."Model No.")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("NEXT SERVICE DUE @ HRS"; rec."NEXT SERVICE DUE @ HRS")
//                 {
//                     Caption = 'LAST SERVICE DONE @ HRS';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("LAST SERVICE DONE ON @ HRS"; rec."LAST SERVICE DONE ON @ HRS")
//                 {
//                     Caption = 'NEXT SERVICE DUE ON @ HRS';
//                     ApplicationArea = all;
//                     Editable = false;
//                     Visible = false;
//                 }
//                 field(Remarks; rec.Remarks)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Running Date"; rec."Running Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Frequency (in Hrs.)"; Rec."Frequency (in Hrs.)")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Current Running hours"; rec."Current Running hours")
//                 {
//                     ApplicationArea = all;
//                     trigger OnValidate()
//                     var
//                         poscom: Record PostedCompressorHeader;
//                         RecComp: Record PostedCompressorHeader;
//                         lastno: Integer;
//                     begin
//                         poscom.Reset();
//                         poscom.SetRange("Model No.", Rec."Model No.");
//                         poscom.SetFilter("Running Date", '<%1', Rec."Running Date");
//                         if poscom.FindLast() then;

//                         Clear(lastno);
//                         poscom.Reset();
//                         poscom.SetRange(C2, Rec.C2);
//                         if poscom.FindLast() then
//                             lastno := poscom."Line No.";

//                         if rec."Current Running hours" < poscom."Current Running hours" then
//                             Error('Current Running Hours must be greater than %1', poscom."Current Running hours");

//                         if Rec.Status = Rec.Status::Due then begin
//                             if xRec."Current Running hours" > Rec."Current Running hours" then
//                                 Error('Can not be less than previous value');
//                             RecComp.Init();
//                             RecComp.TransferFields(Rec);
//                             RecComp."Line No." := lastno + 10000;
//                             RecComp.Insert();
//                         end;
//                     end;
//                 }
//                 field("Running hours(Service is Done)"; Rec."Running hours(Service is Done)")
//                 {
//                     Caption = 'Running hours (When Service is Done)';
//                     ApplicationArea = all;
//                     Editable = Rec.Status = Rec.Status::Due;
//                     trigger OnValidate()
//                     var
//                         poscom: Record PostedCompressorHeader;

//                     begin
//                         if rec."Running hours(Service is Done)" < Rec."Current Running hours" then
//                             Error('Running Hours must be greater than %1', Rec."Current Running hours");
//                     end;
//                 }
//                 field(Status; rec.Status)
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action(Post)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'P&ost';
//                 Image = PostOrder;

//                 trigger OnAction()
//                 var
//                     RecComp: Record PostedCompressorHeader;
//                     RecComMail: Codeunit 50408;
//                     Varec: Record CompressorHeader;
//                     modelmas: Record ModelCompressor;
//                     NoSeriesMgt: Codeunit NoSeriesManagement;
//                     invsetp: Record "Inventory Setup";
//                     linno: Integer;
//                 begin
//                     if Rec.Status = Rec.Status::Open then begin
//                         RecComp.Init();
//                         RecComp.TransferFields(Rec);
//                         RecComp.Insert();
//                         // RecComp.Modify();
//                         rec.Status := rec.Status::Due;
//                         Rec.Modify();
//                         Message('Document has been posted successfully');
//                         ////////pru neha 04-01-24
//                         Clear(RecComMail);
//                         RecComMail.CompressorMail(Rec);
//                     end else
//                         if Rec.Status = Rec.Status::Due then begin
//                             Rec.TestField("Running hours(Service is Done)");
//                             Clear(linno);

//                             RecComp.Reset();
//                             RecComp.SetRange(C2, Rec.C2);
//                             if RecComp.FindLast() then
//                                 linno := RecComp."Line No.";

//                             RecComp.Init();
//                             RecComp.TransferFields(Rec);
//                             RecComp."Line No." := linno + 10000;
//                             RecComp.Status := RecComp.Status::Complete;
//                             RecComp.Insert();

//                             Varec.Init();
//                             Varec.TransferFields(Rec);
//                             Varec."LAST SERVICE DONE ON @ HRS" := Rec."Running hours(Service is Done)";

//                             invsetp.Get();
//                             Varec.C2 := NoSeriesMgt.GetNextNo(invsetp."Compressor Series", today, true);
//                             Varec.Status := Varec.Status::Open;
//                             Varec."NEXT SERVICE DUE @ HRS" := Rec."Running hours(Service is Done)";
//                             Varec."LAST SERVICE DONE ON @ HRS" := Rec."Running hours(Service is Done)" + Rec."Frequency (in Hrs.)";
//                             Varec."Current Running hours" := 0;
//                             Varec."Running hours(Service is Done)" := 0;
//                             Varec.Insert(true);

//                             CurrPage.SaveRecord();

//                             modelmas.Reset();
//                             modelmas.Get(Rec."Model No.");
//                             modelmas.Validate("Last Service Done", Rec."Running hours(Service is Done)");
//                             modelmas."NEXT SERVICE DUE @ HRS" := Rec."Running hours(Service is Done)" + Rec."Frequency (in Hrs.)";
//                             // Message('%1..%2..%3', modelmas."NEXT SERVICE DUE @ HRS", modelmas."Last Service Done", modelmas."Frequency (in Hrs.)");
//                             modelmas.Modify(true);

//                             Rec.Validate(Status, Rec.Status::Complete);
//                             Rec.modify();

//                             Message('Entry Completed Successfully.');

//                             CurrPage.Update(false);
//                         end;
//                     // Message('email send');
//                 end;
//             }
//         }
//     }
//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//     begin
//         rec.Status := rec.Status::Open;
//         rec.Modify();
//     end;
// }
