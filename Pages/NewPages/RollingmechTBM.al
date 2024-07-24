// page 50156 "Rolling Mech. TBM"
// {
//     // ApplicationArea = All;
//     Caption = 'Rolling Mech. TBM';
//     PageType = List;
//     SourceTable = "Rolling Mech. TBM";
//     // UsageCategory = Lists;
//     SourceTableView = where(Status = filter(Open));
//     AutoSplitKey = true;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Line No."; Rec."Line No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Line No. field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the No. field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Area"; Rec."Area")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Area field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Equipment no"; Rec."Equipment no")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Equipment no field.';
//                     caption = 'Equipment No';
//                     // LookupPageId = EquipmentList;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         Project: Record EquipmentHeader;
//                         ProjectList: Page EquipmentList;
//                     //Project1: Record Job;
//                     begin
//                         Project.Reset();
//                         ProjectList.SETTABLEVIEW(Project);
//                         ProjectList.LOOKUPMODE(TRUE);
//                         if (ProjectList.RunModal() = Action::LookupOK) then begin
//                             ProjectList.GetRecord(Project);
//                             Rec.validate("Equipment no", Project."Equipment No");
//                         end;
//                     end;

//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field(Assemlly; Rec.Assemlly)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Assemlly field.';
//                     caption = 'Assembly No';
//                     //  LookupPageId = AssemblyList;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         Project: Record "Equipment Line";
//                         ProjectList: Page "equipment lines";
//                     //Project1: Record Job;
//                     begin
//                         Project.Reset();
//                         Project.SetRange("Equipment No", Rec."Equipment no");
//                         Project.SetRange(Type, Project.Type::Assembly);
//                         ProjectList.SETTABLEVIEW(Project);
//                         ProjectList.LOOKUPMODE(TRUE);
//                         if (ProjectList.RunModal() = Action::LookupOK) then begin
//                             ProjectList.GetRecord(Project);
//                             Rec.validate(Assemlly, Project."No.");

//                         end;
//                     end;

//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("sub assembly"; Rec."sub assembly")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the sub assembly field.';
//                     caption = 'Sub Assembly No';
//                     // LookupPageId = SubAssemblyList;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         assmhead: Record "Assembly Header";
//                         //  Project: Record "Equipment Line";
//                         // ProjectList: Page "Equipment SubForm List";
//                         Project: Record AssemblyLine;
//                         ProjectList: Page "Assembly list Sub";
//                     //Project1: Record Job;
//                     begin
//                         Project.Reset();
//                         // Project.SetRange("Equipment No" , Rec."Equipment no");
//                         Project.SetRange(Type, Project.Type::"Sub Assembly No");
//                         Project.SetRange("Assembly No.", Rec.Assemlly);
//                         ProjectList.SETTABLEVIEW(Project);
//                         ProjectList.LOOKUPMODE(TRUE);
//                         if (ProjectList.RunModal() = Action::LookupOK) then begin
//                             ProjectList.GetRecord(Project);
//                             //Rec.validate("sub assembly", Project."Item No.");
//                             Rec."sub assembly" := Project."Item No.";
//                         end;
//                     end;

//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Task Code"; rec."Task Code")
//                 {
//                     ApplicationArea = all;
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                         reco: Record "Rolling Mech. TBM";
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         myInt: Integer;
//                         tasmas: Record "Task Master";
//                     begin
//                         tasmas.Reset();
//                         tasmas.SetRange("Equipment No", rec."Equipment no");
//                         tasmas.SetRange("Maintenance Type", rec."Maintenance Type");
//                         if page.RunModal(page::"Task Master", tasmas) = Action::LookupOK then begin
//                             rec.Validate("Task Code", tasmas.Code);
//                         end;
//                     end;
//                 }
//                 field("Task Description"; rec."Task Description")
//                 {
//                     ApplicationArea = all;
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field(Department; Rec.Department)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Department field.';
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(GLSetup."Global Dimension 1 Code", Text));
//                     end;

//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field(HOD; Rec.HOD)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the HOD field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Schedule Date"; Rec."Schedule Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Schedule Date field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Maintenance Type"; Rec."Maintenance Type")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Maintenance Type field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field("Date of Maintenance"; Rec."Date of Maintenance")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Date of Maintenance field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         If Rec."Schedule Date" < rec."Date of Maintenance" then begin
//                             rec.Delay := 'YES';
//                             rec.Modify();
//                         end else begin
//                             rec.Delay := 'NO';
//                             rec.Modify();
//                         end;
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field(Frequency; Rec.Frequency)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Frequency field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         if xRec.Status = xRec.Status::Complete then
//                             Error('Can not change if status is completed');
//                     end;
//                 }
//                 field(Supervisor; Rec.Supervisor)
//                 {
//                     ApplicationArea = All;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         custcont: record employee;
//                         CustContPage: Page "Employee List";
//                     begin
//                         custcont.Reset();
//                         custcont.FilterGroup(2);
//                         CustContPage.SETTABLEVIEW(custcont);
//                         CustContPage.LOOKUPMODE(TRUE);
//                         if (CustContPage.RunModal() = Action::LookupOK) then begin
//                             CustContPage.GetRecord(custcont);
//                             Rec.Validate(Supervisor, custcont."First Name");

//                         end;
//                     end;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Status field.';
//                     trigger OnValidate()
//                     var
//                         myInt: Integer;
//                     begin
//                         // if xRec.Status = xRec.Status::Complete then
//                         //     Error('Can not change if status is completed');
//                         // posting1(Rec);
//                         CurrPage.SaveRecord();
//                         CurrPage.Update(false);
//                         Rec.Delete();
//                     end;
//                 }
//                 field(Remarks; rec.Remarks)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Delay; rec.Delay)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action("Maintanance Job Work")
//             {
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 ApplicationArea = all;
//                 trigger OnAction()
//                 var
//                     recm1: Record "Maintanance Job work Header";
//                     recm: Record "Maintanance Job work Header";
//                 begin
//                     recm1.Reset();
//                     recm1.SetRange("No.", Rec."No.");
//                     if not recm1.FindFirst() then begin
//                         recm.Init();
//                         recm."No." := Rec."No.";
//                         recm.Insert();
//                         recm.Validate("Equipment No", Rec."Equipment no");
//                         recm.Validate("Assembly No", Rec.Assemlly);
//                         recm.Validate("Sub Assembly No", Rec."sub assembly");
//                         recm.Modify();
//                         Commit();
//                         Page.RunModal(50182, recm);
//                     end else begin
//                         Page.RunModal(50182, recm1);
//                     end;
//                 end;
//             }
//             action("Post")
//             {
//                 ShortcutKey = f9;
//                 Image = Post;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 ApplicationArea = all;
//                 trigger OnAction()
//                 var
//                     postedtra: Record "Posted Rolling Mech. TBM";
//                     tran1: Record "Rolling Mech. TBM";
//                     entryno: Integer;
//                 begin
//                     tran1.Reset();
//                     tran1.SetRange(Status, tran1.Status::Complete);
//                     if tran1.FindFirst() then
//                         repeat
//                             tran1.TestField("Equipment no");
//                             postedtra.Reset();
//                             if postedtra.FindLast() then
//                                 entryno := postedtra."Entry No.";
//                             postedtra.Reset();
//                             postedtra.Init();
//                             postedtra."Entry No." := entryno + 1;
//                             postedtra.TransferFields(tran1, false);
//                             postedtra.Insert(true);
//                             tran1.Delete();
//                         until tran1.Next() = 0;
//                     CurrPage.Update();
//                     // tran1.Reset();
//                     // if tran1.FindFirst() then
//                     //     repeat
//                     //         tran1.TestField(Status, tran1.Status::Complete);
//                     //     until tran1.Next() = 0;


//                 end;
//             }
//         }
//     }
//     trigger OnOpenPage()

//     begin
//         GLSetup.get();
//     end;

//     procedure posting1(var Revar: Record "Rolling Mech. TBM")
//     var
//         postedtra: Record "Posted Rolling Mech. TBM";
//         tran1: Record "Rolling Mech. TBM";
//         entryno: Integer;
//     begin
//         postedtra.Reset();
//         if postedtra.FindLast() then
//             entryno := postedtra."Entry No.";
//         postedtra.Reset();
//         postedtra.Init();
//         postedtra."Entry No." := entryno + 1;
//         postedtra.TransferFields(Revar, false);
//         postedtra.Insert(true);
//         Revar.Delete();
//     end;

//     // trigger OnModifyRecord(): Boolean
//     // var
//     //     myInt: Integer;
//     //     recc: Record "TimeBased Management Calender";
//     // begin

//     //     if Rec.Status = rec.Status::Complete then
//     //         Error('Completed records can not be edited');
//     // end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         postedtra: Record "Posted Rolling Mech. TBM";
//         tran1: Record "Rolling Mech. TBM";
//     begin

//         // tran1.Reset();
//         // if tran1.FindLast() then
//         //     tran1.TestField(Status, tran1.Status::Complete);
//     end;

//     var
//         GLsetup: Record "General Ledger Setup";
// }
