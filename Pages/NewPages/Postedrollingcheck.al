// page 50172 "Posted Mech. Daily Checklist"
// {
//     Caption = 'Posted Rolling Mech. Daily Checklist';
//     PageType = List;
//     SourceTable = "Posted Roll Mech.ERP checklist";
//     UsageCategory = Lists;
//     Editable = false;
//     ApplicationArea = All;
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Line No. field.';
//                 }
//                 field("Date"; Rec."Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Date field.';
//                 }
//                 field("Area"; Rec."Area")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Area field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field("Shift-A"; Rec."Shift-A")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shift-A field.';
//                 }
//                 field("Shift-B"; Rec."Shift-B")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shift-B field.';
//                 }
//                 field("Shift-C"; Rec."Shift-C")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shift-C field.';
//                 }
//                 field("Shift Incharge Name"; Rec."Shift Incharge Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shift Incharge Name field.';
//                 }
//                 field(Notes; Rec.Notes)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Notes field.';
//                 }
//                 field("Check Point"; Rec."Check Point")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Check Point field.';
//                 }
//                 field(Equipment; Rec.Equipment)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(PARAMETER; Rec.PARAMETER)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the PARAMETER field.';
//                 }
//                 field("SHIFT A TASK-1"; Rec."SHIFT A TASK-1")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A TASK-1 field.';
//                 }
//                 field("SHIFT A Condition-1"; Rec."SHIFT A Condition-1")
//                 {

//                     Caption = 'SHIFT A Remarks';
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A Condition-1 field.';
//                 }
//                 field("SHIFT A TASK-2"; Rec."SHIFT A TASK-2")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A TASK-2 field.';
//                 }
//                 field("SHIFT A Condition-2"; Rec."SHIFT A Condition-2")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A Condition-2 field.';
//                 }
//                 field("SHIFT B TASK-1"; Rec."SHIFT B TASK-1")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT B TASK-1 field.';
//                 }
//                 field("SHIFT B Condition-1"; Rec."SHIFT B Condition-1")
//                 {
//                     Caption = 'SHIFT B Remarks';
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT B Condition-1 field.';
//                 }
//                 field("SHIFT B TASK-2"; Rec."SHIFT B TASK-2")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT B TASK-2 field.';
//                 }
//                 field("SHIFT B Condition-2"; Rec."SHIFT B Condition-2")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT B Condition-2 field.';
//                 }
//                 field("SHIFT C TASK-1"; Rec."SHIFT C TASK-1")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT C TASK-1 field.';
//                 }
//                 field("SHIFT C TASK-2"; Rec."SHIFT C TASK-2")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT C TASK-2 field.';
//                 }
//                 field("SHIFT C Condition-1"; Rec."SHIFT C Condition-1")
//                 {
//                     Caption = 'SHIFT C Remarks';
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT C Condition-1 field.';
//                 }
//                 field("SHIFT C Condition-2"; Rec."SHIFT C Condition-2")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Heat No."; Rec."Heat No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Time for 1 MBar"; Rec."Time for 1 MBar")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Min Vaccume"; Rec."Min Vaccume")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Flooding; Rec.Flooding)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Shift B Incharge Name"; Rec."Shift B Incharge Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Shift C Incharge Name"; Rec."Shift C Incharge Name")
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
//             // action("Mech ERP Checklist Report")
//             // {
//             //     Applicationarea = All;
//             //     trigger OnAction()
//             //     var
//             //         ERP_Head: Record "Posted Mech. ERP checklist";

//             //     begin
//             //         ERP_Head.SetRange("Entry No.", rec."Entry No.");
//             //         if ERP_Head.FindFirst() then
//             //             Report.Run(Report::"Mech ERP Checklist", true, false, ERP_Head);

//             //     end;
//             // }
//         }
//     }
// }
