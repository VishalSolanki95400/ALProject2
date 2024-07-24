page 50150 PDP2Meter
{
    Caption = 'PDP 2 Energy meter reading';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PDP 2 meter";
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
                field("MAIN INCOMER (2.5 MVA)"; Rec."MAIN INCOMER (2.5 MVA)")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 1"; Rec."MULTIPLY FACTOR 1")
                {
                    ApplicationArea = All;
                }
                field("MAIN INCOMER (2.5 MVA) Today"; Rec."MAIN INCOMER (2.5 MVA) Today")
                {
                    ApplicationArea = all;
                }
                field("MAIN INCOMER (2.5 MVA) To-Date"; Rec."MAIN INCOMER (2.5 MVA) To-Date")
                {
                    ApplicationArea = all;
                }
                field("2000 H.P. ROUGHING MOTOR"; Rec."2000 H.P. ROUGHING MOTOR")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 2"; Rec."MULTIPLY FACTOR 2")
                {
                    ApplicationArea = all;
                }
                field("2000 H.P. ROUGHING MOTORToday"; Rec."2000 H.P. ROUGHING MOTORToday")
                {
                    ApplicationArea = all;
                }
                field("2000 H.P. ROUGHING MOTOR To-Date"; Rec."2000 H.P. ROUGHING MOTOR To-Date")
                {
                    ApplicationArea = All;
                }
                field("CHARGING CRANE"; Rec."CHARGING CRANE")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 3"; Rec."MULTIPLY FACTOR 3")
                {
                    ApplicationArea = ALl;
                }
                field("2250KVA D.G.Set Today "; Rec."2250KVA D.G.Set Today ")
                {
                    ApplicationArea = all;
                }
                field("CHARGING CRANE To-Date"; Rec."CHARGING CRANE To-Date")
                {
                    ApplicationArea = All;
                }
                field("NEW MPI-2"; Rec."NEW MPI-2")
                {
                    ApplicationArea = All;

                }
                field("MULTIPLY FACTOR 4"; Rec."MULTIPLY FACTOR 4")
                {
                    ApplicationArea = all;
                }
                field("NEW MPI-2 Today Consumption"; Rec."NEW MPI-2 Today Consumption")
                {
                    ApplicationArea = All;
                }
                field("NEW MPI-2 To-Date Consumption"; Rec."NEW MPI-2 To-Date Consumption")
                {
                    ApplicationArea = All;
                }
                field("L.D.B."; Rec."L.D.B.")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 5"; Rec."MULTIPLY FACTOR 5")
                {
                    ApplicationArea = all;
                }
                field("LDB Today Consumption"; Rec."LDB Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("LDB To-Date Consumption"; Rec."LDB To-Date Consumption")
                {
                    ApplicationArea = all;
                }
                field(WORKSHOP; Rec.WORKSHOP)
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 6"; Rec."MULTIPLY FACTOR 6")
                {
                    ApplicationArea = All;
                }
                field("Workshop Today Consumption"; Rec."Workshop Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("Workshop To-Date Consumption"; Rec."Workshop To-Date Consumption")
                {
                    ApplicationArea = ALl;
                }
                field("UT PANEL AND RG STRAIGHTENING"; Rec."UT PANEL AND RG STRAIGHTENING")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 7"; Rec."MULTIPLY FACTOR 7")
                {
                    ApplicationArea = All;
                }
                field("UT PANEL AND RG STRAIGHTENING MACHINE Today"; Rec."UT PANEL AND RG STRAIGHTENING MACHINE Today")
                {
                    ApplicationArea = all;
                }
                field("UT PANEL AND RG STRAIGHTENING MACHINE To-Date"; Rec."UT PANEL AND RG STRAIGHTENING MACHINE To-Date")
                {
                    ApplicationArea = all;
                }
                field("M.L.D.B."; Rec."M.L.D.B.")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 8"; Rec."MULTIPLY FACTOR 8")
                {
                    ApplicationArea = all;
                }
                field("M.L.D.B. Today Consumption"; Rec."M.L.D.B. Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("M.L.D.B. To-Date Consumption "; Rec."M.L.D.B. To-Date Consumption ")
                {
                    ApplicationArea = All;
                }
                field(CHAMFERING; Rec.CHAMFERING)
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 9"; Rec."MULTIPLY FACTOR 9")
                {
                    ApplicationArea = ALl;
                }
                field("CHAMFERING Today Consumption"; Rec."CHAMFERING Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("CHAMFERING  To-Date Consump"; Rec."CHAMFERING  To-Date Consump")
                {
                    ApplicationArea = All;
                }
                field("ADMIN BLOCK"; Rec."ADMIN BLOCK")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 10"; Rec."MULTIPLY FACTOR 10")
                {
                    ApplicationArea = All;
                }
                field("ADMIN BLOCK Today Consumption"; Rec."ADMIN BLOCK Today Consumption")
                {
                    ApplicationArea = all;
                }
                field("ADMIN BLOCK To-Date Consumption"; Rec."ADMIN BLOCK To-Date Consumption")
                {
                    ApplicationArea = All;
                }
                field("NEW MPI-1"; Rec."NEW MPI-1")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 11"; Rec."MULTIPLY FACTOR 11")
                {
                    ApplicationArea = All;
                }
                field("NEW MPI-1 Today Consumption"; Rec."NEW MPI-1 Today Consumption")
                {
                    ApplicationArea = All;
                }
                field("NEW MPI-1 To-Date Consumption"; Rec."NEW MPI-1 To-Date Consumption")
                {
                    ApplicationArea = All;
                }

                field(AIRCOMPRESSOR; Rec.AIRCOMPRESSOR)
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 12"; Rec."MULTIPLY FACTOR 12")
                {
                    ApplicationArea = All;
                }
                field("AIRCOMPRESSOR Today Consump"; Rec."AIRCOMPRESSOR Today Consump")
                {
                    ApplicationArea = All;
                }
                field("AIRCOMPRESSOR To-Date Con"; Rec."AIRCOMPRESSOR To-Date Con")
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