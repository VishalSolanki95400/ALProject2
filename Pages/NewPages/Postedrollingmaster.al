// page 50491 " Rolling Posted Compres Master"
// {
//     ApplicationArea = all;
//     Caption = 'Rolling Posted Compressor Master';
//     PageType = List;
//     SourceTable = RollingPostedCompressormaster;
//     UsageCategory = Administration;
//     Editable = false;
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
//                 }
//                 field("LAST SERVICE DONE ON @ HRS"; rec."LAST SERVICE DONE ON @ HRS")
//                 {
//                     Caption = 'NEXT SERVICE DUE ON @ HRS';
//                     ApplicationArea = all;
//                 }

//                 field(Remarks; rec.Remarks)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Running Date"; rec."Running Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Current Running hours"; rec."Current Running hours")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Running hours(Service is Done)"; Rec."Running hours(Service is Done)")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }
//     var

// }
