// table 50431 RollingPostedCompressormaster
// {
//     Caption = 'Rolling Posted Compressor master';
//     DataClassification = ToBeClassified;
//     LookupPageID = " Rolling Posted Compres Master";
//     fields
//     {
//         field(1; "C2"; Code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(2; "Model No."; code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = ModelCompressor."Model No.";
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

//         field(12; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
//         }
//         field(13; Status; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Open","Due","Complete";
//         }
//         field(15; "Running hours(Service is Done)"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(Key1; "C2", "Line No.")
//         {
//             Clustered = true;
//         }
//     }

// }