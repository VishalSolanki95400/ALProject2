// page 50171 "mech. Daily Checklist Page"
// {
//     Caption = 'Rolling mechanical daily checklist page';
//     PageType = List;
//     SourceTable = "Rolling Mech. checklist";
//     UsageCategory = Lists;
//     SaveValues = true;
//     SourceTableView = where(Type = filter(Mechnical | " "));

//     layout
//     {
//         area(content)
//         {
//             group(Areas)
//             {
//                 field(Dates; Dates)
//                 {
//                     ApplicationArea = all;
//                     trigger OnValidate()
//                     begin
//                         CurrPage.SaveRecord();
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 field(areaa; areaa)
//                 {
//                     ApplicationArea = all;
//                     TableRelation = "Rolling Mech. Area Master"."Area";
//                     // TableRelation = "Area Master"."Area" where(Type = filter(Mechnical));
//                     trigger OnValidate()
//                     var
//                         recvar: Record "Rolling Mech. checklist";
//                         areamas: Record "Rolling Mech. Area Master";
//                         lineno: Integer;
//                     begin
//                         CurrPage.SaveRecord();
//                         lineno := 0;
//                         recvar.Reset();
//                         recvar.DeleteAll();
//                         areamas.SetRange("Area", areaa);
//                         areamas.SetRange(Type, areamas.Type::Mechnical);
//                         if areamas.FindFirst() then
//                             repeat
//                                 lineno += 10000;
//                                 recvar.Init();
//                                 recvar."Line No." := lineno;
//                                 recvar."Area" := areamas."Area";
//                                 if dates <> 0D then
//                                     recvar.Date := dates
//                                 else
//                                     recvar.Date := Today;
//                                 recvar."Check Point" := areamas."CHECK POINT";
//                                 recvar.Equipment := areamas.Equipment;
//                                 recvar.PARAMETER := areamas.PARAMETER;
//                                 recvar."SHIFT A TASK-1" := areamas."SHIFT A TASK-1";
//                                 recvar."SHIFT A TASK-2" := areamas."SHIFT A TASK-2";
//                                 recvar."SHIFT B TASK-1" := areamas."SHIFT B TASK-1";
//                                 recvar."SHIFT B TASK-2" := areamas."SHIFT B TASK-2";
//                                 recvar."SHIFT C TASK-1" := areamas."SHIFT C TASK-1";
//                                 recvar."SHIFT C TASK-2" := areamas."SHIFT C TASK-2";
//                                 recvar.Insert();
//                             until areamas.Next() = 0;
//                         CurrPage.Update(false);
//                     end;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         areamas: Record "Rolling Mech. Area Master";
//                         AreaMas1: Page "Rolling Mech.Area Master Page";
//                         recvar: Record "Rolling Mech. checklist";
//                         //areamas: Record "Area Master";
//                         lineno: Integer;
//                         recvar1: Record "Rolling Mech. checklist";
//                     begin
//                         areamas.Reset();
//                         areamas.SetFilter(Type, '<>%1', areamas.Type::Electrial);
//                         AreaMas1.SETTABLEVIEW(areamas);
//                         AreaMas1.LOOKUPMODE(TRUE);
//                         if (AreaMas1.RunModal() = Action::LookupOK) then begin
//                             AreaMas1.GetRecord(areamas);
//                             areaa := areamas."Area";

//                             lineno := 0;
//                             recvar.Reset();
//                             recvar.SetRange(Type, recvar.Type::Mechnical);
//                             recvar.DeleteAll();
//                             areamas.Reset();
//                             areamas.SetRange("Area", areaa);
//                             areamas.SetRange(Type, areamas.Type::Mechnical);
//                             if areamas.FindFirst() then
//                                 repeat
//                                     recvar1.Reset();
//                                     if recvar1.FindLast() then;
//                                     recvar.Init();
//                                     recvar."Line No." := recvar1."Line No." + 10000;
//                                     recvar."Area" := areamas."Area";
//                                     if dates <> 0D then
//                                         recvar.Date := dates
//                                     else
//                                         recvar.Date := Today;
//                                     recvar."Check Point" := areamas."CHECK POINT";
//                                     recvar.Equipment := areamas.Equipment;
//                                     recvar.PARAMETER := areamas.PARAMETER;
//                                     recvar.Type := recvar.Type::Mechnical;
//                                     recvar."SHIFT A TASK-1" := areamas."SHIFT A TASK-1";
//                                     recvar."SHIFT A TASK-2" := areamas."SHIFT A TASK-2";
//                                     recvar."SHIFT B TASK-1" := areamas."SHIFT B TASK-1";
//                                     recvar."SHIFT B TASK-2" := areamas."SHIFT B TASK-2";
//                                     recvar."SHIFT C TASK-1" := areamas."SHIFT C TASK-1";
//                                     recvar."SHIFT C TASK-2" := areamas."SHIFT C TASK-2";
//                                     recvar.Insert();
//                                 until areamas.Next() = 0;
//                             CurrPage.Update(false);

//                         end;
//                     end;
//                 }
//                 field(Shift; Shift)
//                 {
//                     ApplicationArea = all;

//                     trigger OnValidate()
//                     begin
//                         CurrPage.SaveRecord();
//                         CurrPage.Update(false);
//                     end;
//                 }
//                 field(Employee; Employee)
//                 {
//                     ApplicationArea = all;
//                     TableRelation = Employee;
//                     trigger OnValidate()
//                     var
//                         meter: Record "Rolling Mech. checklist";
//                         emp: Record Employee;
//                     begin
//                         CurrPage.SaveRecord();
//                         emp.Reset();
//                         if emp.get(Employee) then;
//                         meter.Reset();
//                         if meter.FindFirst() then
//                             repeat
//                                 if Shift = Shift::"Shift A" then begin
//                                     if meter."Shift A Submit" = false then begin
//                                         meter."Shift A Incharge Name" := emp."First Name" + ' ' + emp."Last Name";
//                                         meter.Modify();
//                                     end;
//                                 end else
//                                     if Shift = Shift::"Shift B" then begin
//                                         if meter."Shift B Submit" = false then begin
//                                             meter."Shift B Incharge Name" := emp."First Name" + ' ' + emp."Last Name";
//                                             meter.Modify();
//                                         end;
//                                     end else
//                                         if Shift = Shift::"Shift C" then begin
//                                             if meter."Shift C Submit" = false then begin
//                                                 meter."Shift C Incharge Name" := emp."First Name" + ' ' + emp."Last Name";
//                                                 meter.Modify();
//                                             end;
//                                         end;
//                             until meter.Next() = 0;
//                         CurrPage.Update(false);
//                     end;
//                 }
//             }
//             repeater(General)
//             {
//                 field("Line No."; Rec."Line No.")
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
//                     Editable = Shift = Shift::"Shift A";
//                     ToolTip = 'Specifies the value of the Shift-A field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift A Submit", false);
//                     end;
//                 }
//                 field("Shift-B"; Rec."Shift-B")
//                 {
//                     ApplicationArea = All;
//                     Editable = Shift = Shift::"Shift B";
//                     ToolTip = 'Specifies the value of the Shift-B field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift B Submit", false);
//                     end;
//                 }

//                 field("Shift-C"; Rec."Shift-C")
//                 {
//                     ApplicationArea = All;
//                     Editable = Shift = Shift::"Shift C";
//                     ToolTip = 'Specifies the value of the Shift-C field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift C Submit", false);
//                     end;
//                 }

//                 field("Shift Incharge Name"; Rec."Shift A Incharge Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shift A Incharge Name field.';
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         employees: Record Employee;
//                     begin
//                         employees.Reset();
//                         if Page.RunModal(Page::"Employee List", employees) = Action::LookupOK then
//                             Rec."Shift A Incharge Name" := employees."First Name" + ' ' + employees."Last Name";
//                     end;
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
//                     Editable = false;
//                 }
//                 field(Equipment; Rec.Equipment)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(PARAMETER; Rec.PARAMETER)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the PARAMETER field.';
//                     Editable = false;
//                 }
//                 field("Shift A Incharge Name"; Rec."Shift A Incharge Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("SHIFT A TASK-1"; Rec."SHIFT A TASK-1")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A TASK-1 field.';
//                 }
//                 field("SHIFT A Condition-1"; Rec."SHIFT A Condition-1")
//                 {
//                     Caption = 'SHIFT A Remarks';
//                     Editable = Shift = Shift::"Shift A";
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT A Condition-1 field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift A Submit", false);
//                     end;
//                 }
//                 field("Shift B Incharge Name";Rec."Shift B Incharge Name")
//                 {
//                     ApplicationArea = all;
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
//                 field("Shift C Incharge Name"; Rec."Shift C Incharge Name")
//                 {
//                     ApplicationArea = all;
//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         employees: Record Employee;
//                     begin
//                         employees.Reset();
//                         if Page.RunModal(Page::"Employee List", employees) = Action::LookupOK then
//                             Rec."Shift C Incharge Name" := employees."First Name" + ' ' + employees."Last Name";
//                     end;
//                 }
//                 field("SHIFT B Condition-1"; Rec."SHIFT B Condition-1")
//                 {
//                     Caption = 'SHIFT B Remarks';
//                     Editable = Shift = Shift::"Shift B";
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT B Condition-1 field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift B Submit", false);
//                     end;
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
//                     Editable = Shift = Shift::"Shift C";
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the SHIFT C Condition-1 field.';
//                     trigger OnValidate()
//                     begin
//                         rec.TestField("Shift C Submit", false);
//                     end;
//                 }
//                 field("SHIFT C Condition-2"; Rec."SHIFT C Condition-2")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Heat No."; Rec."Heat No.")
//                 {
//                     ApplicationArea = all;
//                     Visible = areaa = 'VD';
//                 }
//                 field("Time for 1 MBar"; Rec."Time for 1 MBar")
//                 {
//                     ApplicationArea = all;
//                     Visible = areaa = 'VD';
//                 }
//                 field("Min Vaccume"; Rec."Min Vaccume")
//                 {
//                     ApplicationArea = all;
//                     Visible = areaa = 'VD';
//                 }
//                 field(Flooding; Rec.Flooding)
//                 {
//                     ApplicationArea = all;
//                     Visible = areaa = 'VD';
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action("Shift A Submit")
//             {
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 Visible = false;
//                 trigger OnAction()
//                 var
//                     meter: Record "Rolling Mech. checklist";
//                 begin
//                     meter.Reset();
//                     if meter.FindFirst() then
//                         repeat
//                             meter.TestField("Shift-A");
//                             meter."Shift A Submit" := true;
//                             meter.Modify();
//                         until meter.Next() = 0;
//                     Message('Submitted');
//                 end;
//             }
//             action("Shift B Submit")
//             {
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 Visible = false;
//                 trigger OnAction()
//                 var
//                     meter: Record "Rolling Mech. checklist";
//                 begin
//                     meter.Reset();
//                     if meter.FindFirst() then
//                         repeat
//                             meter.TestField("Shift-B");
//                             meter."Shift B Submit" := true;
//                             meter.Modify();
//                         until meter.Next() = 0;
//                     Message('Submitted');
//                 end;
//             }
//             action("Shift C Submit")
//             {
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 Visible = false;
//                 trigger OnAction()
//                 var
//                     meter: Record "Rolling Mech. checklist";
//                 begin
//                     meter.Reset();
//                     if meter.FindFirst() then
//                         repeat
//                             meter.TestField("Shift-C");
//                             meter."Shift C Submit" := true;
//                             meter.Modify();
//                         until meter.Next() = 0;
//                     Message('Submitted');
//                 end;
//             }
//             action(Post)
//             {
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 trigger OnAction()
//                 var
//                     posvar: Record "Posted Roll Mech.ERP checklist";
//                     lastno: Integer;
//                     meter: Record "Rolling Mech. checklist";
//                     posvar1: Record "Posted Roll Mech.ERP checklist";
//                     MechErp: Record "Rolling Mech. checklist";
//                 begin
//                     if Shift = Shift::"Shift A" then begin
//                         MechErp.Reset();
//                         MechErp.SetRange("Area", Rec."Area");
//                         MechErp.SetRange(Date, rec.Date);
//                         MechErp.SetRange("Shift-A", '');
//                         MechErp.SetRange(Type, MechErp.Type::Mechnical);
//                         if MechErp.FindFirst() then
//                             Error('Please fill all the data of shift A');

//                         posvar1.Reset();
//                         posvar1.SetRange("Area", Rec."Area");
//                         posvar1.SetRange(Date, Rec.Date);
//                         posvar1.SetFilter("Shift-A", '<>%1', '');
//                         posvar1.SetRange(Type, MechErp.Type::Mechnical);
//                         if posvar1.FindFirst() then
//                             Error('This area code and shift has been already post in posted document');
//                     ENd else if Shift = Shift::"Shift B" then begin
//                         MechErp.Reset();
//                         MechErp.SetRange("Area", Rec."Area");
//                         MechErp.SetRange(Date, rec.Date);
//                         MechErp.SetRange("Shift-B", '');
//                         MechErp.SetRange(Type, MechErp.Type::Mechnical);
//                         if MechErp.FindFirst() then
//                             Error('Please fill all the data of shift B');

//                         posvar1.Reset();
//                         posvar1.SetRange("Area", Rec."Area");
//                         posvar1.SetRange(Date, Rec.Date);
//                         posvar1.SetFilter("Shift-B", '<>%1', '');
//                         posvar1.SetRange(Type, MechErp.Type::Mechnical);
//                         if posvar1.FindFirst() then
//                             Error('This area code and shift has been already post in posted document');
//                     end else if Shift = Shift::"Shift C" then begin
//                         MechErp.Reset();
//                         MechErp.SetRange("Area", Rec."Area");
//                         MechErp.SetRange(Date, rec.Date);
//                         MechErp.SetRange("Shift-C", '');
//                         MechErp.SetRange(Type, MechErp.Type::Mechnical);
//                         if MechErp.FindFirst() then
//                             Error('Please fill all the data of shift C');

//                         posvar1.Reset();
//                         posvar1.SetRange("Area", Rec."Area");
//                         posvar1.SetRange(Date, Rec.Date);
//                         posvar1.SetFilter("Shift-C", '<>%1', '');
//                         posvar1.SetRange(Type, MechErp.Type::Mechnical);
//                         if posvar1.FindFirst() then
//                             Error('This area code and shift has been already post in posted document');
//                     end;
//                     meter.Reset();
//                     meter.SetRange("Area", Rec."Area");
//                     meter.SetRange(meter.Date, Rec.Date);
//                     meter.SetFilter("Line No.", '<>%1', 0);
//                     meter.SetRange(Type, MechErp.Type::Mechnical);
//                     if meter.FindFirst() then begin
//                         repeat
//                             posvar.Reset();
//                             if posvar.FindLast() then
//                                 lastno := posvar."Entry No.";
//                             posvar.Reset();

//                             posvar.Init();
//                             posvar."Entry No." := lastno + 1;
//                             posvar.TransferFields(meter, false);
//                             posvar.Insert();
//                             meter.Delete();
//                         until meter.Next() = 0;
//                     end;
//                     Message('Document has been posted successfully');
//                 end;
//             }
//         }
//     }

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         Rec.Type := Rec.Type::Mechnical;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         emp: Record Employee;
//     begin

//         Rec.Type := Rec.Type::Mechnical;
//         emp.Reset();
//         if emp.get(Employee) then;
//         if Shift = Shift::"Shift A" then
//             Rec."Shift A Incharge Name" := emp."First Name" + ' ' + emp."Last Name"
//         else
//             if Shift = Shift::"Shift B" then
//                 Rec."Shift B Incharge Name" := emp."First Name" + ' ' + emp."Last Name"
//             else
//                 if Shift = Shift::"Shift C" then
//                     Rec."Shift C Incharge Name" := emp."First Name" + ' ' + emp."Last Name"
//     end;

//     var
//         areaa: Code[20];
//         paymnj: page "Payment Journal";
//         Dates: date;
//         fa: Record 50175;
//         Shift: Option " ","Shift A","Shift B","Shift C";
//         Employee: Code[20];
// }
