// page 50142 "RollingShutdown Planning Mech."
// {
//     ApplicationArea = All;
//     Caption = 'Rolling Shutdown Planning Mech.';
//     PageType = List;
//     SourceTable = RollingShutdownPlanningmech;
//     UsageCategory = Lists;
//     // SourceTableView = where("Status of the Job" = filter(Pending), "Status of the Job" = filter(" "));
//     SourceTableView = where("Status of the Job" = filter(<> 'completed'));
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Area"; rec."Area")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Equipment; rec.Equipment)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Fixed Asset No"; rec."Fixed Asset No")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Assembly; rec.Assembly)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Sub Assembly"; rec."Sub Assembly")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Description of Job to be done"; rec."Description of Job to be done")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Shutdown Intimation No."; Rec."Shutdown Intimation No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Date; rec.Date)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Time; Rec.Time)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Time Required"; rec."Time Required")
//                 {
//                     ApplicationArea = All;
//                     // Editable = false;
//                     Caption = 'Total Time(In Hrs)';
//                 }
//                 field("Shutdown Start Date"; rec."Shutdown Start Date")
//                 {
//                     ApplicationArea = all;
//                     // Editable = false;
//                 }
//                 field("Shutdown End Date"; rec."Shutdown End Date")
//                 {
//                     ApplicationArea = all;
//                     // Editable = false;
//                 }
//                 field("ManPower Required"; rec."ManPower Required")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Status of the Job"; rec."Status of the Job")
//                 {
//                     ApplicationArea = All;
//                     trigger OnValidate()
//                     begin
//                         if Rec."Status of the Job" = Rec."Status of the Job"::Completed then begin
//                             CurrPage.SaveRecord();
//                             CurrPage.Update();
//                         end;
//                     end;

//                 }
//                 field(Remarks; rec.Remarks)
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     var
//     begin
//         exit(true);
//     end;
// }
