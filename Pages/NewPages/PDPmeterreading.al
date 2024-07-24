page 50149 PDPMeter
{
    Caption = 'PDP Energy meter reading';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PDPEnergy;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = all;
                }
                field("MAIN INCOMER (STAR 3.5 MVA)"; Rec."MAIN INCOMER (STAR 3.5 MVA)")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 1"; Rec."MULTIPLY FACTOR 1")
                {
                    ApplicationArea = All;
                }
                field("MAIN INCOMER (3.5 MVA) Today"; Rec."MAIN INCOMER (3.5 MVA) Today")
                {
                    ApplicationArea = all;
                }
                field("MAIN INCOMER(3.5 MVA) To-Date"; Rec."MAIN INCOMER(3.5 MVA) To-Date")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVELINEUP-1"; Rec."AUXILIARY DRIVELINEUP-1")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 2"; Rec."MULTIPLY FACTOR 2")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVE LINEUP-1 Today"; Rec."AUXILIARY DRIVE LINEUP-1 Today")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVELINEUP-1To-Date"; Rec."AUXILIARY DRIVELINEUP-1To-Date")
                {
                    ApplicationArea = All;
                }
                field("MCC-2"; Rec."MCC-2")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 3"; Rec."MULTIPLY FACTOR 3")
                {
                    ApplicationArea = ALl;
                }
                field("MCC-2 Today Consumption"; Rec."MCC-2 Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("MCC-2 To-Date Consumption"; Rec."MCC-2 To-Date Consumption")
                {
                    ApplicationArea = All;
                }
                field("MCC-1"; Rec."MCC-1")
                {
                    ApplicationArea = All;

                }
                field("MULTIPLY FACTOR 4"; Rec."MULTIPLY FACTOR 4")
                {
                    ApplicationArea = all;
                }
                field("MCC-1 Today Consumption"; Rec."MCC-1 Today Consumption")
                {
                    ApplicationArea = All;
                }
                field("MCC-1 To-Date Consumption"; Rec."MCC-1 To-Date Consumption")
                {
                    ApplicationArea = All;
                }
                field("MCC-4 (ICW)"; Rec."MCC-4 (ICW)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 5"; Rec."MULTIPLY FACTOR 5")
                {
                    ApplicationArea = all;
                }
                field("MCC-4(ICW) Today Consumption"; Rec."MCC-4(ICW) Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("MCC-4(ICW) To date Consumption"; Rec."MCC-4(ICW) To date Consumption")
                {
                    ApplicationArea = all;
                }
                field("DESCALER PUMP"; Rec."DESCALER PUMP")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 6"; Rec."MULTIPLY FACTOR 6")
                {
                    ApplicationArea = All;
                }
                field("DESCALER PUMP Today Consumption"; Rec."DESCALER PUMP Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("DESCALER PUMP To date Consumption"; Rec."DESCALER PUMP To date Consumption")
                {
                    ApplicationArea = ALl;
                }
                field("MAIN INCOMER (DELTA 3.5 MVA)"; Rec."MAIN INCOMER (DELTA 3.5 MVA)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 7"; Rec."MULTIPLY FACTOR 7")
                {
                    ApplicationArea = All;
                }
                field(" MAIN INCOMER (DELTA 3.5 MVA)Today Consumption"; Rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption")
                {
                    ApplicationArea = all;
                }
                field(" MAIN INCOMER (DELTA 3.5 MVA)To date Consumption"; Rec." MAIN INCOMER (DELTA 3.5 MVA)To date Consumption")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVELINEUP-2"; Rec."AUXILIARY DRIVELINEUP-2")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 8"; Rec."MULTIPLY FACTOR 8")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVELINEUP-2 Today Consumption"; Rec."AUXILIARY DRIVELINEUP-2 Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("AUXILIARY DRIVELINEUP-2 To date Consumption"; Rec."AUXILIARY DRIVELINEUP-2 To date Consumption")
                {
                    ApplicationArea = All;
                }
                field("CRANK SHEAR DRIVE"; Rec."CRANK SHEAR DRIVE")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 9"; Rec."MULTIPLY FACTOR 9")
                {
                    ApplicationArea = ALl;
                }
                field("CRANK SHEAR DRIVE Today Consumption"; Rec."CRANK SHEAR DRIVE Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("CRANK SHEAR DRIVE To date Consumption"; Rec."CRANK SHEAR DRIVE To date Consumption")
                {
                    ApplicationArea = All;
                }
                field("MCC-3 (DCW)"; Rec."MCC-3 (DCW)")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 10"; Rec."MULTIPLY FACTOR 10")
                {
                    ApplicationArea = All;
                }
                field("MCC-3(DCW) Today Consumption"; Rec."MCC-3(DCW) Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("MCC-3 (DCW) To date Consumption"; Rec."MCC-3 (DCW) To date Consumption")
                {
                    ApplicationArea = All;
                }







            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}