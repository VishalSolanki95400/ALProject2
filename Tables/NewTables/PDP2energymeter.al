table 50130 "PDP 2 meter"
{
    Caption = 'PDP 2 Energy Meter reading';
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
        field(3; "MAIN INCOMER (2.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "MAIN INCOMER (2.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MAIN INCOMER (2.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MAIN INCOMER (2.5 MVA) Today" := Rec."MAIN INCOMER (2.5 MVA)" - metRec."MAIN INCOMER (2.5 MVA)";
                        Rec."MAIN INCOMER (2.5 MVA) To-Date" := Rec."MAIN INCOMER (2.5 MVA) Today" + metRec."MAIN INCOMER (2.5 MVA) To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MAIN INCOMER (2.5 MVA)" > Rec."MAIN INCOMER (2.5 MVA)" then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MAIN INCOMER (2.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1" then begin
                    rec."MAIN INCOMER (2.5 MVA) Today" := rec."MAIN INCOMER (2.5 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000" then begin
                        rec."MAIN INCOMER (2.5 MVA) Today" := rec."MAIN INCOMER (2.5 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000000" then begin
                            rec."MAIN INCOMER (2.5 MVA) Today" := rec."MAIN INCOMER (2.5 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"100000000" then begin
                                rec."MAIN INCOMER (2.5 MVA) Today" := rec."MAIN INCOMER (2.5 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (2.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MAIN INCOMER (2.5 MVA) To-Date" := rec."MAIN INCOMER (2.5 MVA) Today" + metRec."MAIN INCOMER (2.5 MVA) To-Date";

            end;
        }
        field(5; "MAIN INCOMER (2.5 MVA) Today"; Decimal)
        {
            Caption = 'MAIN INCOMER (2.5 MVA) Today Consumption';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(6; "MAIN INCOMER (2.5 MVA) To-Date"; Decimal)
        {
            Caption = '"MAIN INCOMER (2.5 MVA) To-Date Consumption"';
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







        field(9; "2000 H.P. ROUGHING MOTOR"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "2000 H.P. ROUGHING MOTOR" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("2000 H.P. ROUGHING MOTOR", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."2000 H.P. ROUGHING MOTORToday" := Rec."2000 H.P. ROUGHING MOTOR" - metRec."2000 H.P. ROUGHING MOTOR";
                        Rec."2000 H.P. ROUGHING MOTOR To-Date" := Rec."2000 H.P. ROUGHING MOTORToday" + metRec."2000 H.P. ROUGHING MOTOR To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."2000 H.P. ROUGHING MOTOR" > Rec."2000 H.P. ROUGHING MOTOR" then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("2000 H.P. ROUGHING MOTOR");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("2000 H.P. ROUGHING MOTOR", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1" then begin
                    rec."2000 H.P. ROUGHING MOTORToday" := rec."2000 H.P. ROUGHING MOTORToday" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000" then begin
                        rec."2000 H.P. ROUGHING MOTORToday" := rec."2000 H.P. ROUGHING MOTORToday" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000000" then begin
                            rec."2000 H.P. ROUGHING MOTORToday" := rec."2000 H.P. ROUGHING MOTORToday" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"100000000" then begin
                                rec."2000 H.P. ROUGHING MOTORToday" := rec."2000 H.P. ROUGHING MOTORToday" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("2000 H.P. ROUGHING MOTOR", '<>%1', 0);
                if metRec.FindLast() then
                    rec."2000 H.P. ROUGHING MOTOR To-Date" := rec."2000 H.P. ROUGHING MOTORToday" + metRec."2000 H.P. ROUGHING MOTOR To-Date";

            end;
        }
        field(11; "2000 H.P. ROUGHING MOTORToday"; Decimal)
        {
            Caption = '"2000 H.P. ROUGHING MOTORToday Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(12; "2000 H.P. ROUGHING MOTOR To-Date"; Decimal)
        {
            Caption = '2000 H.P. ROUGHING MOTOR To-Date Consumption';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(13; "CHARGING CRANE"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;

            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "CHARGING CRANE" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("CHARGING CRANE", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."2250KVA D.G.Set Today " := Rec."CHARGING CRANE" - metRec."CHARGING CRANE";
                        Rec."CHARGING CRANE To-Date" := Rec."2250KVA D.G.Set Today " + metRec."CHARGING CRANE To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."CHARGING CRANE" > Rec."CHARGING CRANE" then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("CHARGING CRANE");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CHARGING CRANE", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1" then begin
                    rec."2250KVA D.G.Set Today " := rec."2250KVA D.G.Set Today " * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000" then begin
                        rec."2250KVA D.G.Set Today " := rec."2250KVA D.G.Set Today " * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000000" then begin
                            rec."2250KVA D.G.Set Today " := rec."2250KVA D.G.Set Today " * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"100000000" then begin
                                rec."2250KVA D.G.Set Today " := rec."2250KVA D.G.Set Today " * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CHARGING CRANE", '<>%1', 0);
                if metRec.FindLast() then
                    rec."CHARGING CRANE To-Date" := rec."2250KVA D.G.Set Today " + metRec."CHARGING CRANE To-Date";

            end;
        }
        field(15; "2250KVA D.G.Set Today "; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '2250KVA D.G.Set Today Consumption';

            DecimalPlaces = 8 : 8;

        }
        field(16; "CHARGING CRANE To-Date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CHARGING CRANE To-Date Consumption';

            DecimalPlaces = 8 : 8;
        }










        field(17; "NEW MPI-2"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "NEW MPI-2" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("NEW MPI-2", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."NEW MPI-2 Today Consumption" := Rec."NEW MPI-2" - metRec."NEW MPI-2";
                        Rec."NEW MPI-2 To-Date Consumption" := Rec."NEW MPI-2 Today Consumption" + metRec."NEW MPI-2 To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."NEW MPI-2" > Rec."NEW MPI-2" then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("NEW MPI-2");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("NEW MPI-2", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1" then begin
                    rec."NEW MPI-2 Today Consumption" := rec."NEW MPI-2 Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000" then begin
                        rec."NEW MPI-2 Today Consumption" := rec."NEW MPI-2 Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000000" then begin
                            rec."NEW MPI-2 Today Consumption" := rec."NEW MPI-2 Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"100000000" then begin
                                rec."NEW MPI-2 Today Consumption" := rec."NEW MPI-2 Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("NEW MPI-2", '<>%1', 0);
                if metRec.FindLast() then
                    rec."NEW MPI-2 To-Date Consumption" := rec."NEW MPI-2 Today Consumption" + metRec."NEW MPI-2 To-Date Consumption";

            end;
        }
        field(19; "NEW MPI-2 Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(20; "NEW MPI-2 To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }









        field(21; "L.D.B."; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "L.D.B." <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("L.D.B.", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."LDB Today Consumption" := Rec."L.D.B." - metRec."L.D.B.";
                        Rec."LDB To-Date Consumption" := Rec."LDB Today Consumption" + metRec."LDB To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."L.D.B." > Rec."L.D.B." then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("L.D.B.");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("L.D.B.", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1" then begin
                    rec."LDB Today Consumption" := rec."LDB Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000" then begin
                        rec."LDB Today Consumption" := rec."LDB Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000000" then begin
                            rec."LDB Today Consumption" := rec."LDB Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"100000000" then begin
                                rec."LDB Today Consumption" := rec."LDB Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("L.D.B.", '<>%1', 0);
                if metRec.FindLast() then
                    rec."LDB To-Date Consumption" := rec."LDB Today Consumption" + metRec."LDB To-Date Consumption";

            end;
        }
        field(23; "LDB Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(24; "LDB To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }











        field(25; "WORKSHOP"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if WORKSHOP <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter(WORKSHOP, '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."Workshop Today Consumption" := Rec."WORKSHOP" - metRec."WORKSHOP";
                        Rec."Workshop To-Date Consumption" := Rec."Workshop Today Consumption" + metRec."Workshop To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."WORKSHOP" > Rec."workshop" then
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
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("WORKSHOP");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(WORKSHOP, '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1" then begin
                    rec."Workshop Today Consumption" := rec."Workshop Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000" then begin
                        rec."Workshop Today Consumption" := rec."Workshop Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000000" then begin
                            rec."Workshop Today Consumption" := rec."Workshop Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"100000000" then begin
                                rec."Workshop Today Consumption" := rec."Workshop Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(WORKSHOP, '<>%1', 0);
                if metRec.FindLast() then
                    rec."Workshop To-Date Consumption" := rec."Workshop Today Consumption" + metRec."Workshop To-Date Consumption";

            end;
        }
        field(27; "Workshop Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(28; "Workshop To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(29; "UT PANEL AND RG STRAIGHTENING"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"UT PANEL AND RG STRAIGHTENING MACHINE"';
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "UT PANEL AND RG STRAIGHTENING" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("UT PANEL AND RG STRAIGHTENING", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" := Rec."UT PANEL AND RG STRAIGHTENING" - metRec."UT PANEL AND RG STRAIGHTENING";
                        Rec."UT PANEL AND RG STRAIGHTENING MACHINE To-Date" := Rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" + metRec."UT PANEL AND RG STRAIGHTENING MACHINE To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."UT PANEL AND RG STRAIGHTENING" > Rec."UT PANEL AND RG STRAIGHTENING" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(30; "MULTIPLY FACTOR 7"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("UT PANEL AND RG STRAIGHTENING");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("UT PANEL AND RG STRAIGHTENING", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1" then begin
                    rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" := rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1000" then begin
                        rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" := rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1000000" then begin
                            rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" := rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"100000000" then begin
                                rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" := rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("UT PANEL AND RG STRAIGHTENING", '<>%1', 0);
                if metRec.FindLast() then
                    rec."UT PANEL AND RG STRAIGHTENING MACHINE To-Date" := rec."UT PANEL AND RG STRAIGHTENING MACHINE Today" + metRec."UT PANEL AND RG STRAIGHTENING MACHINE To-Date";

            end;
        }
        field(31; "UT PANEL AND RG STRAIGHTENING MACHINE Today"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'UT PANEL AND RG STRAIGHTENING MACHINE Today Consumption';
            DecimalPlaces = 8 : 8;
        }
        field(32; "UT PANEL AND RG STRAIGHTENING MACHINE To-Date"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'UT PANEL AND RG STRAIGHTENING MACHINE To-Date Consumption';
            DecimalPlaces = 8 : 8;
        }








        field(33; "M.L.D.B."; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "M.L.D.B." <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("M.L.D.B.", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."M.L.D.B. Today Consumption" := Rec."M.L.D.B." - metRec."M.L.D.B.";
                        Rec."M.L.D.B. To-Date Consumption " := Rec."M.L.D.B. Today Consumption" + metRec."M.L.D.B. To-Date Consumption ";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."M.L.D.B." > Rec."M.L.D.B." then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(34; "MULTIPLY FACTOR 8"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("M.L.D.B.");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("M.L.D.B.", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1" then begin
                    rec."M.L.D.B. Today Consumption" := rec."M.L.D.B. Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1000" then begin
                        rec."M.L.D.B. Today Consumption" := rec."M.L.D.B. Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1000000" then begin
                            rec."M.L.D.B. Today Consumption" := rec."M.L.D.B. Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"100000000" then begin
                                rec."M.L.D.B. Today Consumption" := rec."M.L.D.B. Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("M.L.D.B.", '<>%1', 0);
                if metRec.FindLast() then
                    rec."M.L.D.B. To-Date Consumption " := rec."M.L.D.B. Today Consumption" + metRec."M.L.D.B. To-Date Consumption ";

            end;
        }
        field(35; "M.L.D.B. Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(36; "M.L.D.B. To-Date Consumption "; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(37; "CHAMFERING"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if CHAMFERING <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter(CHAMFERING, '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."CHAMFERING Today Consumption" := Rec.CHAMFERING - metRec.CHAMFERING;
                        Rec."CHAMFERING  To-Date Consump" := Rec."CHAMFERING Today Consumption" + metRec."CHAMFERING  To-Date Consump";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec.CHAMFERING > Rec.CHAMFERING then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(38; "MULTIPLY FACTOR 9"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate(CHAMFERING);
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(CHAMFERING, '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1" then begin
                    rec."CHAMFERING Today Consumption" := rec."CHAMFERING Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1000" then begin
                        rec."CHAMFERING Today Consumption" := rec."CHAMFERING Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1000000" then begin
                            rec."CHAMFERING Today Consumption" := rec."CHAMFERING Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"100000000" then begin
                                rec."CHAMFERING Today Consumption" := rec."CHAMFERING Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(CHAMFERING, '<>%1', 0);
                if metRec.FindLast() then
                    rec."CHAMFERING  To-Date Consump" := rec."CHAMFERING Today Consumption" + metRec."CHAMFERING  To-Date Consump";

            end;
        }
        field(39; "CHAMFERING Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(40; "CHAMFERING  To-Date Consump"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"CHAMFERING  To-Date Consumption"';
            DecimalPlaces = 8 : 8;
        }









        field(41; "ADMIN BLOCK"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "ADMIN BLOCK" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("ADMIN BLOCK", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."ADMIN BLOCK Today Consumption" := Rec."ADMIN BLOCK" - metRec."ADMIN BLOCK";
                        Rec."ADMIN BLOCK To-Date Consumption" := Rec."ADMIN BLOCK Today Consumption" + metRec."ADMIN BLOCK To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."ADMIN BLOCK" > Rec."ADMIN BLOCK" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(42; "MULTIPLY FACTOR 10"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("ADMIN BLOCK");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("ADMIN BLOCK", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1" then begin
                    rec."ADMIN BLOCK Today Consumption" := rec."ADMIN BLOCK Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1000" then begin
                        rec."ADMIN BLOCK Today Consumption" := rec."ADMIN BLOCK Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1000000" then begin
                            rec."ADMIN BLOCK Today Consumption" := rec."ADMIN BLOCK Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"100000000" then begin
                                rec."ADMIN BLOCK Today Consumption" := rec."ADMIN BLOCK Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("ADMIN BLOCK", '<>%1', 0);
                if metRec.FindLast() then
                    rec."ADMIN BLOCK To-Date Consumption" := rec."ADMIN BLOCK Today Consumption" + metRec."ADMIN BLOCK To-Date Consumption";

            end;
        }
        field(43; "ADMIN BLOCK Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(44; "ADMIN BLOCK To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }









        field(45; "NEW MPI-1"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if "NEW MPI-1" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("NEW MPI-1", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."NEW MPI-1 Today Consumption" := Rec."NEW MPI-1" - metRec."NEW MPI-1";
                        Rec."NEW MPI-1 To-Date Consumption" := Rec."NEW MPI-1 Today Consumption" + metRec."NEW MPI-1 To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."NEW MPI-1" > Rec."NEW MPI-1" then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(46; "MULTIPLY FACTOR 11"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("NEW MPI-1");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("NEW MPI-1", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 11" = rec."MULTIPLY FACTOR 11"::"1" then begin
                    rec."NEW MPI-1 Today Consumption" := rec."NEW MPI-1 Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 11" = rec."MULTIPLY FACTOR 11"::"1000" then begin
                        rec."NEW MPI-1 Today Consumption" := rec."NEW MPI-1 Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 11" = rec."MULTIPLY FACTOR 11"::"1000000" then begin
                            rec."NEW MPI-1 Today Consumption" := rec."NEW MPI-1 Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 11" = rec."MULTIPLY FACTOR 11"::"100000000" then begin
                                rec."NEW MPI-1 Today Consumption" := rec."NEW MPI-1 Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("NEW MPI-1", '<>%1', 0);
                if metRec.FindLast() then
                    rec."NEW MPI-1 To-Date Consumption" := rec."NEW MPI-1 Today Consumption" + metRec."NEW MPI-1 To-Date Consumption";

            end;
        }
        field(47; "NEW MPI-1 Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(48; "NEW MPI-1 To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }








        field(49; "AIRCOMPRESSOR"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
            begin
                Rec.TestField(Date);
                if AIRCOMPRESSOR <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter(AIRCOMPRESSOR, '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."AIRCOMPRESSOR Today Consump" := Rec.AIRCOMPRESSOR - metRec.AIRCOMPRESSOR;
                        Rec."AIRCOMPRESSOR To-Date Con" := Rec."AIRCOMPRESSOR Today Consump" + metRec."AIRCOMPRESSOR To-Date Con";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec.AIRCOMPRESSOR > Rec.AIRCOMPRESSOR then
                                Error('Value must be greater then previous Value');
                        until metRec.Next() = 0;
                end;
            end;
        }
        field(50; "MULTIPLY FACTOR 12"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","1","1000","1000000","100000000";
            trigger OnValidate()
            var
                metRec: Record "PDP 2 meter";
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate(AIRCOMPRESSOR);
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(AIRCOMPRESSOR, '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 12" = rec."MULTIPLY FACTOR 12"::"1" then begin
                    rec."AIRCOMPRESSOR Today Consump" := rec."AIRCOMPRESSOR Today Consump" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 12" = rec."MULTIPLY FACTOR 12"::"1000" then begin
                        rec."AIRCOMPRESSOR Today Consump" := rec."AIRCOMPRESSOR Today Consump" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 12" = rec."MULTIPLY FACTOR 12"::"1000000" then begin
                            rec."AIRCOMPRESSOR Today Consump" := rec."AIRCOMPRESSOR Today Consump" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 12" = rec."MULTIPLY FACTOR 12"::"100000000" then begin
                                rec."AIRCOMPRESSOR Today Consump" := rec."AIRCOMPRESSOR Today Consump" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter(AIRCOMPRESSOR, '<>%1', 0);
                if metRec.FindLast() then
                    rec."AIRCOMPRESSOR To-Date Con" := rec."AIRCOMPRESSOR Today Consump" + metRec."AIRCOMPRESSOR To-Date Con";

            end;
        }
        field(51; "AIRCOMPRESSOR Today Consump"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(52; "AIRCOMPRESSOR To-Date Con"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '"AIRCOMPRESSOR To-Date Consumption"';
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