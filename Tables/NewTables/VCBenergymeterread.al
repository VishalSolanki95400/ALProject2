table 50128 VCBEnergy

{
    Caption = 'VCB Energy Meter Reading';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; Date; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin

                metRec.Reset();
                // metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                if metRec.FindFirst() then
                    // if metRec.FindFirst() then
                    if metRec.Date >= Rec.Date then
                        Error('Date must be greater then previous Date');

                begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<>%1', rec."Line No");
                    metRec.SetRange(Date, rec.Date);

                    if metRec.FindFirst() then
                        Error('Same date can not be selected.');
                end;
            end;

        }
        field(2; Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "MAIN INCOMER(11kV)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "MAIN INCOMER(11kV)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MAIN INCOMER(11kV)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MAIN INCOMER(11kV)Today" := Rec."MAIN INCOMER(11kV)" - metRec."MAIN INCOMER(11kV)";
                        Rec."MAIN INCOMER(11kV) To-Date" := Rec."MAIN INCOMER(11kV)Today" + metRec."MAIN INCOMER(11kV) To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MAIN INCOMER(11kV)" > Rec."MAIN INCOMER(11kV)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(4; "MULTIPLY FACTOR 1"; Option)
        {
            OptionMembers = "","1","1000","1000000","100000000";
            DataClassification = ToBeClassified;


            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MAIN INCOMER(11kV)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER(11kV)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1" then begin
                    rec."MAIN INCOMER(11kV)Today" := rec."MAIN INCOMER(11kV)Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000" then begin
                        rec."MAIN INCOMER(11kV)Today" := rec."MAIN INCOMER(11kV)Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000000" then begin
                            rec."MAIN INCOMER(11kV)Today" := rec."MAIN INCOMER(11kV)Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"100000000" then begin
                                rec."MAIN INCOMER(11kV)Today" := rec."MAIN INCOMER(11kV)Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER(11kV)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MAIN INCOMER(11kV) To-Date" := rec."MAIN INCOMER(11kV)Today" + metRec."MAIN INCOMER(11kV) To-Date";

            end;
        }
        field(5; "MAIN INCOMER(11kV)Today"; Decimal)
        {
            Caption = '" MAIN INCOMER(11kV)Today Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(6; "MAIN INCOMER(11kV) To-Date"; Decimal)
        {
            Caption = '"MAIN INCOMER(11kV) To-Date Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }

        field(7; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(8; Month1; Option)
        {
            OptionMembers = "",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        }
        field(9; "VCB FEEDER-1 (4.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "VCB FEEDER-1 (4.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("VCB FEEDER-1 (4.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."VCB FEEDER-1 (4.5 MVA)Today" := Rec."VCB FEEDER-1 (4.5 MVA)" - metRec."VCB FEEDER-1 (4.5 MVA)";
                        Rec."VCB FEEDER-1 (4.5 MVA) To-Date" := Rec."VCB FEEDER-1 (4.5 MVA)Today" + metRec."VCB FEEDER-1 (4.5 MVA) To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."VCB FEEDER-1 (4.5 MVA)" > Rec."VCB FEEDER-1 (4.5 MVA)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;

            end;
        }
        field(10; "MULTIPLY FACTOR 2"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("VCB FEEDER-1 (4.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-1 (4.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1" then begin
                    rec."VCB FEEDER-1 (4.5 MVA)Today" := rec."VCB FEEDER-1 (4.5 MVA)Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000" then begin
                        rec."VCB FEEDER-1 (4.5 MVA)Today" := rec."VCB FEEDER-1 (4.5 MVA)Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000000" then begin
                            rec."VCB FEEDER-1 (4.5 MVA)Today" := rec."VCB FEEDER-1 (4.5 MVA)Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"100000000" then begin
                                rec."VCB FEEDER-1 (4.5 MVA)Today" := rec."VCB FEEDER-1 (4.5 MVA)Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-1 (4.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."VCB FEEDER-1 (4.5 MVA) To-Date" := rec."VCB FEEDER-1 (4.5 MVA)Today" + metRec."VCB FEEDER-1 (4.5 MVA) To-Date";

            end;
        }
        field(11; "VCB FEEDER-1 (4.5 MVA)Today"; Decimal)
        {
            Caption = '" VCB FEEDER-1 (4.5 MVA)Today Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(12; "VCB FEEDER-1 (4.5 MVA) To-Date"; Decimal)
        {
            Caption = '"VCB FEEDER-1 (4.5 MVA) To-Date Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(13; "VCB FEEDER-2 (4.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;

            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "VCB FEEDER-2 (4.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("VCB FEEDER-2 (4.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."VCB FEEDER-2 (4.5 MVA) Today" := Rec."VCB FEEDER-2 (4.5 MVA)" - metRec."VCB FEEDER-2 (4.5 MVA)";
                        Rec."VCB FEEDER-2 (4.5 MVA)-Date" := Rec."VCB FEEDER-2 (4.5 MVA) Today" + metRec."VCB FEEDER-2 (4.5 MVA)-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."VCB FEEDER-2 (4.5 MVA)" > Rec."VCB FEEDER-2 (4.5 MVA)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(14; "MULTIPLY FACTOR 3"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("VCB FEEDER-2 (4.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-2 (4.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1" then begin
                    rec."VCB FEEDER-2 (4.5 MVA) Today" := rec."VCB FEEDER-2 (4.5 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000" then begin
                        rec."VCB FEEDER-2 (4.5 MVA) Today" := rec."VCB FEEDER-2 (4.5 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000000" then begin
                            rec."VCB FEEDER-2 (4.5 MVA) Today" := rec."VCB FEEDER-2 (4.5 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"100000000" then begin
                                rec."VCB FEEDER-2 (4.5 MVA) Today" := rec."VCB FEEDER-2 (4.5 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-2 (4.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."VCB FEEDER-2 (4.5 MVA)-Date" := rec."VCB FEEDER-2 (4.5 MVA) Today" + metRec."VCB FEEDER-2 (4.5 MVA)-Date";

            end;
        }
        field(15; "VCB FEEDER-2 (4.5 MVA) Today"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-2 (4.5 MVA) Today Consumption"';
            DecimalPlaces = 8 : 8;

        }
        field(16; "VCB FEEDER-2 (4.5 MVA)-Date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-2 (4.5 MVA)-Date Consumption"';
            DecimalPlaces = 8 : 8;
        }



        field(17; "VCB FEEDER-3 (3.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "VCB FEEDER-3 (3.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("VCB FEEDER-3 (3.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."VCB FEEDER-3 (3.5 MVA) Today" := Rec."VCB FEEDER-3 (3.5 MVA)" - metRec."VCB FEEDER-3 (3.5 MVA)";
                        Rec."VCB FEEDER-3 (3.5 MVA) To-Date" := Rec."VCB FEEDER-3 (3.5 MVA) Today" + metRec."VCB FEEDER-3 (3.5 MVA) To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."VCB FEEDER-3 (3.5 MVA)" > Rec."VCB FEEDER-3 (3.5 MVA)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(18; "MULTIPLY FACTOR 4"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";

            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("VCB FEEDER-3 (3.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-3 (3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1" then begin
                    rec."VCB FEEDER-3 (3.5 MVA) Today" := rec."VCB FEEDER-3 (3.5 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000" then begin
                        rec."VCB FEEDER-3 (3.5 MVA) Today" := rec."VCB FEEDER-3 (3.5 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000000" then begin
                            rec."VCB FEEDER-3 (3.5 MVA) Today" := rec."VCB FEEDER-3 (3.5 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"100000000" then begin
                                rec."VCB FEEDER-3 (3.5 MVA) Today" := rec."VCB FEEDER-3 (3.5 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-3 (3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."VCB FEEDER-3 (3.5 MVA) To-Date" := rec."VCB FEEDER-3 (3.5 MVA) Today" + metRec."VCB FEEDER-3 (3.5 MVA) To-Date";

            end;
        }
        field(19; "VCB FEEDER-3 (3.5 MVA) Today"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-3 (3.5 MVA) Today Consumption"';
            DecimalPlaces = 8 : 8;
        }
        field(20; "VCB FEEDER-3 (3.5 MVA) To-Date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-3 (3.5 MVA) To-Date Consumption"';
            DecimalPlaces = 8 : 8;
        }




        field(21; "VCB FEEDER-4 (2.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "VCB FEEDER-4 (2.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("VCB FEEDER-4 (2.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."VCB FEEDER-4 (2.5 MVA) Today" := Rec."VCB FEEDER-4 (2.5 MVA)" - metRec."VCB FEEDER-4 (2.5 MVA)";
                        Rec."VCB FEEDER-4 (2.5 MVA)To date" := Rec."VCB FEEDER-4 (2.5 MVA) Today" + metRec."VCB FEEDER-4 (2.5 MVA)To date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."VCB FEEDER-4 (2.5 MVA)" > Rec."VCB FEEDER-4 (2.5 MVA)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(22; "MULTIPLY FACTOR 5"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("VCB FEEDER-4 (2.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-4 (2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1" then begin
                    rec."VCB FEEDER-4 (2.5 MVA) Today" := rec."VCB FEEDER-4 (2.5 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000" then begin
                        rec."VCB FEEDER-4 (2.5 MVA) Today" := rec."VCB FEEDER-4 (2.5 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000000" then begin
                            rec."VCB FEEDER-4 (2.5 MVA) Today" := rec."VCB FEEDER-4 (2.5 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"100000000" then begin
                                rec."VCB FEEDER-4 (2.5 MVA) Today" := rec."VCB FEEDER-4 (2.5 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-4 (2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."VCB FEEDER-4 (2.5 MVA)To date" := rec."VCB FEEDER-4 (2.5 MVA) Today" + metRec."VCB FEEDER-4 (2.5 MVA)To date";

            end;
        }
        field(23; "VCB FEEDER-4 (2.5 MVA) Today"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-4 (2.5 MVA) Today Consumption"';
            DecimalPlaces = 8 : 8;
        }
        field(24; "VCB FEEDER-4 (2.5 MVA)To date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-4 (2.5 MVA)To date Consumption"';
            DecimalPlaces = 8 : 8;
        }



        field(25; "VCB FEEDER-5(2.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
            begin
                Rec.TestField(Date);
                if "VCB FEEDER-5(2.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("VCB FEEDER-5(2.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."VCB FEEDER-5(2 MVA) Today" := Rec."VCB FEEDER-5(2.5 MVA)" - metRec."VCB FEEDER-5(2.5 MVA)";
                        Rec."VCB FEEDER-5(2 MVA) To date" := Rec."VCB FEEDER-5(2 MVA) Today" + metRec."VCB FEEDER-5(2 MVA) To date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."VCB FEEDER-5(2.5 MVA)" > Rec."VCB FEEDER-5(2.5 MVA)" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(26; "MULTIPLY FACTOR 6"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record VCBEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("VCB FEEDER-5(2.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-5(2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1" then begin
                    rec."VCB FEEDER-5(2 MVA) Today" := rec."VCB FEEDER-5(2 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000" then begin
                        rec."VCB FEEDER-5(2 MVA) Today" := rec."VCB FEEDER-5(2 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000000" then begin
                            rec."VCB FEEDER-5(2 MVA) Today" := rec."VCB FEEDER-5(2 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"100000000" then begin
                                rec."VCB FEEDER-5(2 MVA) Today" := rec."VCB FEEDER-5(2 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("VCB FEEDER-5(2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."VCB FEEDER-5(2 MVA) To date" := rec."VCB FEEDER-5(2 MVA) Today" + metRec."VCB FEEDER-5(2 MVA) To date";

            end;
        }
        field(27; "VCB FEEDER-5(2 MVA) Today"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-5(2 MVA) Today Consumption"';
            DecimalPlaces = 8 : 8;
        }
        field(28; "VCB FEEDER-5(2 MVA) To date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"VCB FEEDER-5(2 MVA) To date Consumption"';
            DecimalPlaces = 8 : 8;
        }








    }

    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}