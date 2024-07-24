page 50148 VCBenergy
{
    Caption = 'VCB Energy meter reading';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VCBEnergy;
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
                field("MAIN INCOMER(11kV)"; Rec."MAIN INCOMER(11kV)")
                {
                    ApplicationArea = All;
                }
                field("MULTIPLY FACTOR 1"; Rec."MULTIPLY FACTOR 1")
                {
                    ApplicationArea = All;
                }
                field("MAIN INCOMER(11kV)Today"; Rec."MAIN INCOMER(11kV)Today")
                {
                    ApplicationArea = all;
                }
                field("MAIN INCOMER(11kV) To-Date"; Rec."MAIN INCOMER(11kV) To-Date")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-1 (4.5 MVA)"; Rec."VCB FEEDER-1 (4.5 MVA)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 2"; Rec."MULTIPLY FACTOR 2")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-1 (4.5 MVA)Today"; Rec."VCB FEEDER-1 (4.5 MVA)Today")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-1 (4.5 MVA) To-Date"; Rec."VCB FEEDER-1 (4.5 MVA) To-Date")
                {
                    ApplicationArea = All;
                }
                field("VCB FEEDER-2 (4.5 MVA)"; Rec."VCB FEEDER-2 (4.5 MVA)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 3"; Rec."MULTIPLY FACTOR 3")
                {
                    ApplicationArea = ALl;
                }
                field("VCB FEEDER-2 (4.5 MVA) Today"; Rec."VCB FEEDER-2 (4.5 MVA) Today")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-2 (4.5 MVA)-Date"; Rec."VCB FEEDER-2 (4.5 MVA)-Date")
                {
                    ApplicationArea = All;
                }

                field("VCB FEEDER-3 (3.5 MVA)"; Rec."VCB FEEDER-3 (3.5 MVA)")
                {
                    ApplicationArea = ALl;
                }
                field("MULTIPLY FACTOR 4"; Rec."MULTIPLY FACTOR 4")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-3 (3.5 MVA) Today"; Rec."VCB FEEDER-3 (3.5 MVA) Today")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-3 (3.5 MVA) To-Date"; Rec."VCB FEEDER-3 (3.5 MVA) To-Date")
                {
                    ApplicationArea = All;
                }


                field("VCB FEEDER-4 (2.5 MVA)"; Rec."VCB FEEDER-4 (2.5 MVA)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 5"; Rec."MULTIPLY FACTOR 5")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-4 (2.5 MVA) Today"; Rec."VCB FEEDER-4 (2.5 MVA) Today")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-4 (2.5 MVA)To date"; Rec."VCB FEEDER-4 (2.5 MVA)To date")
                {
                    ApplicationArea = all;
                }


                field("VCB FEEDER-5(2.5 MVA)"; Rec."VCB FEEDER-5(2.5 MVA)")
                {
                    ApplicationArea = all;
                }
                field("MULTIPLY FACTOR 6"; Rec."MULTIPLY FACTOR 6")
                {
                    ApplicationArea = all;
                }
                field("VCB FEEDER-5(2 MVA) Today"; Rec."VCB FEEDER-5(2 MVA) Today")
                {
                    ApplicationArea = All;
                }
                field("VCB FEEDER-5(2 MVA) To date"; Rec."VCB FEEDER-5(2 MVA) To date")
                {
                    ApplicationArea = all;
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