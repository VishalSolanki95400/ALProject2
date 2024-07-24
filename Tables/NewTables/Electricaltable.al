// table 50151 Electricaltable
// {
//     Caption = 'Electrical';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "ESS & Helmet"; boolean)
//         {
//             Caption = 'ESS & Helmet/Ear Plug/ Dust Mask/ Gloves, Rubber Mats etc';
//             DataClassification = ToBeClassified;

//         }
//         field(2; "Insulated tools forwork"; boolean)
//         {
//             Caption = 'Insulated tools forwork';
//             DataClassification = ToBeClassified;
//         }
//         field(3; "Control Fuse Removal"; boolean)
//         {
//             Caption = 'Control Fuse Removal/ checked supply cable insulation';
//             DataClassification = ToBeClassified;
//         }
//         field(4; "Discharged rod"; boolean)
//         {
//             Caption = 'Discharged rod/ ELCB';
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Full body harness"; boolean)
//         {
//             Caption = 'Full body harness(above 02 meter) height';
//             DataClassification = ToBeClassified;
//         }
//         field(6; "Test lamp"; boolean)
//         {
//             Caption = 'Test lamp & Multi meter for power isolation';
//             DataClassification = ToBeClassified;
//         }
//         field(7; "Danger board"; boolean)
//         {
//             Caption = 'Danger board/ Men at work tag';
//             DataClassification = ToBeClassified;
//         }
//         field(8; "Working Platform"; boolean)
//         {
//             Caption = 'Working Platform & Ladder';
//             DataClassification = ToBeClassified;
//         }
//         field(9; "Competent Supervisor"; boolean)
//         {
//             Caption = 'Competent Supervisor/ Authorised Technician';
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         key(PK; "ESS & Helmet")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

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

// }