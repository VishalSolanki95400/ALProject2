// page 50183 "Rolling Mech.Area Master"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "Rolling Mech. Area Master";
//     DelayedInsert = true;
//     AutoSplitKey = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {


//                 field("AREA"; Rec."AREA")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("CHECK POINT"; Rec."CHECK POINT")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Type; Rec.Type)
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Equipment; Rec.Equipment)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(PARAMETER; Rec.PARAMETER)
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT A TASK-1"; Rec."SHIFT A TASK-1")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT A TASK-2"; Rec."SHIFT A TASK-2")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT B TASK-1"; Rec."SHIFT B TASK-1")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT B TASK-2"; Rec."SHIFT B TASK-2")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT C TASK-1"; Rec."SHIFT C TASK-1")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("SHIFT C TASK-2"; Rec."SHIFT C TASK-2")
//                 {
//                     ApplicationArea = All;

//                 }

//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(XML_Import)
//             {
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 begin
//                     Xmlport.Run(50108);
//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }