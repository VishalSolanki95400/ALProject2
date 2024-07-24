// page 50113 GASProneconfinedspacelistpage
// {
//     Caption = 'GAS Prone confined space list page';
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = GASProneconfinedspace;

//     layout
//     {
//         area(Content)
//         {
//             group(GroupName)
//             {
//                 field("Gas Prone/Confined Space"; Rec."Gas Prone/Confined Space")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Oxygen deficiency"; Rec."Oxygen deficiency")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Ventilation & frameproof"; Rec."Ventilation & frameproof")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Apron; Rec.Apron)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Adequate means of access"; Rec."Adequate means of access")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Equipment properly flushed"; Rec."Equipment properly flushed")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Medical O2 Cylinder"; Rec."Medical O2 Cylinder")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("safe & appropriate hand"; Rec."safe & appropriate hand")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Continuous Supervision"; Rec."Continuous Supervision")
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
//             action(ActionName)
//             {
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }