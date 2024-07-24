table 50129 PDPEnergy

{
    Caption = 'PDP 1 Energy Meter reading';
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
        field(3; "MAIN INCOMER (STAR 3.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MAIN INCOMER (STAR 3.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MAIN INCOMER (STAR 3.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MAIN INCOMER (3.5 MVA) Today" := Rec."MAIN INCOMER (STAR 3.5 MVA)" - metRec."MAIN INCOMER (STAR 3.5 MVA)";
                        Rec."MAIN INCOMER(3.5 MVA) To-Date" := Rec."MAIN INCOMER (3.5 MVA) Today" + metRec."MAIN INCOMER(3.5 MVA) To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MAIN INCOMER (STAR 3.5 MVA)" > Rec."MAIN INCOMER (STAR 3.5 MVA)" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MAIN INCOMER (STAR 3.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (STAR 3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1" then begin
                    rec."MAIN INCOMER (3.5 MVA) Today" := rec."MAIN INCOMER (3.5 MVA) Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000" then begin
                        rec."MAIN INCOMER (3.5 MVA) Today" := rec."MAIN INCOMER (3.5 MVA) Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"1000000" then begin
                            rec."MAIN INCOMER (3.5 MVA) Today" := rec."MAIN INCOMER (3.5 MVA) Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 1" = rec."MULTIPLY FACTOR 1"::"100000000" then begin
                                rec."MAIN INCOMER (3.5 MVA) Today" := rec."MAIN INCOMER (3.5 MVA) Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (STAR 3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MAIN INCOMER(3.5 MVA) To-Date" := rec."MAIN INCOMER (3.5 MVA) Today" + metRec."MAIN INCOMER(3.5 MVA) To-Date";

            end;
        }
        field(5; "MAIN INCOMER (3.5 MVA) Today"; Decimal)
        {
            Caption = 'MAIN INCOMER(3.5 MVA) Today Consumption';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(6; "MAIN INCOMER(3.5 MVA) To-Date"; Decimal)
        {
            Caption = '" MAIN INCOMER(3.5 MVA) To-Date Consumption"';
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




        field(9; "AUXILIARY DRIVELINEUP-1"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "AUXILIARY DRIVELINEUP-1" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("AUXILIARY DRIVELINEUP-1", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."AUXILIARY DRIVE LINEUP-1 Today" := Rec."AUXILIARY DRIVELINEUP-1" - metRec."AUXILIARY DRIVELINEUP-1";
                        Rec."AUXILIARY DRIVELINEUP-1To-Date" := Rec."AUXILIARY DRIVE LINEUP-1 Today" + metRec."AUXILIARY DRIVELINEUP-1To-Date";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."AUXILIARY DRIVELINEUP-1" > Rec."AUXILIARY DRIVELINEUP-1" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("AUXILIARY DRIVELINEUP-1");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("AUXILIARY DRIVELINEUP-1", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1" then begin
                    rec."AUXILIARY DRIVE LINEUP-1 Today" := rec."AUXILIARY DRIVE LINEUP-1 Today" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000" then begin
                        rec."AUXILIARY DRIVE LINEUP-1 Today" := rec."AUXILIARY DRIVE LINEUP-1 Today" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"1000000" then begin
                            rec."AUXILIARY DRIVE LINEUP-1 Today" := rec."AUXILIARY DRIVE LINEUP-1 Today" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 2" = rec."MULTIPLY FACTOR 2"::"100000000" then begin
                                rec."AUXILIARY DRIVE LINEUP-1 Today" := rec."AUXILIARY DRIVE LINEUP-1 Today" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("AUXILIARY DRIVELINEUP-1", '<>%1', 0);
                if metRec.FindLast() then
                    rec."AUXILIARY DRIVELINEUP-1To-Date" := rec."AUXILIARY DRIVE LINEUP-1 Today" + metRec."AUXILIARY DRIVELINEUP-1To-Date";

            end;
        }
        field(11; "AUXILIARY DRIVE LINEUP-1 Today"; Decimal)
        {
            Caption = '"AUXILIARY DRIVE LINEUP-1 Today Consumption"';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(12; "AUXILIARY DRIVELINEUP-1To-Date"; Decimal)
        {
            Caption = 'AUXILIARY DRIVELINEUP-1 To-Date Consumption';
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }




        field(13; "MCC-2"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;

            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MCC-2" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MCC-2", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MCC-2 Today Consumption" := Rec."MCC-2" - metRec."MCC-2";
                        Rec."MCC-2 To-Date Consumption" := Rec."MCC-2 Today Consumption" + metRec."MCC-2 To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MCC-2" > Rec."MCC-2" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MCC-2");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-2", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1" then begin
                    rec."MCC-2 Today Consumption" := rec."MCC-2 Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000" then begin
                        rec."MCC-2 Today Consumption" := rec."MCC-2 Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"1000000" then begin
                            rec."MCC-2 Today Consumption" := rec."MCC-2 Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 3" = rec."MULTIPLY FACTOR 3"::"100000000" then begin
                                rec."MCC-2 Today Consumption" := rec."MCC-2 Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-2", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MCC-2 To-Date Consumption" := rec."MCC-2 Today Consumption" + metRec."MCC-2 To-Date Consumption";

            end;
        }
        field(15; "MCC-2 Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;

            DecimalPlaces = 8 : 8;

        }
        field(16; "MCC-2 To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;

            DecimalPlaces = 8 : 8;
        }






        field(17; "MCC-1"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MCC-1" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MCC-1", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MCC-1 Today Consumption" := Rec."MCC-1" - metRec."MCC-1";
                        Rec."MCC-1 To-Date Consumption" := Rec."MCC-1 Today Consumption" + metRec."MCC-1 To-Date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MCC-1" > Rec."MCC-1" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MCC-1");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-1", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1" then begin
                    rec."MCC-1 Today Consumption" := rec."MCC-1 Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000" then begin
                        rec."MCC-1 Today Consumption" := rec."MCC-1 Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"1000000" then begin
                            rec."MCC-1 Today Consumption" := rec."MCC-1 Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 4" = rec."MULTIPLY FACTOR 4"::"100000000" then begin
                                rec."MCC-1 Today Consumption" := rec."MCC-1 Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-1", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MCC-1 To-Date Consumption" := rec."MCC-1 Today Consumption" + metRec."MCC-1 To-Date Consumption";

            end;
        }
        field(19; "MCC-1 Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(20; "MCC-1 To-Date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(21; "MCC-4 (ICW)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MCC-4 (ICW)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MCC-4 (ICW)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MCC-4(ICW) Today Consumption" := Rec."MCC-4 (ICW)" - metRec."MCC-4 (ICW)";
                        Rec."MCC-4(ICW) To date Consumption" := Rec."MCC-4(ICW) Today Consumption" + metRec."MCC-4(ICW) To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MCC-4 (ICW)" > Rec."MCC-4 (ICW)" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MCC-4 (ICW)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-4 (ICW)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1" then begin
                    rec."MCC-4(ICW) Today Consumption" := rec."MCC-4(ICW) Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000" then begin
                        rec."MCC-4(ICW) Today Consumption" := rec."MCC-4(ICW) Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"1000000" then begin
                            rec."MCC-4(ICW) Today Consumption" := rec."MCC-4(ICW) Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 5" = rec."MULTIPLY FACTOR 5"::"100000000" then begin
                                rec."MCC-4(ICW) Today Consumption" := rec."MCC-4(ICW) Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-4 (ICW)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MCC-4(ICW) To date Consumption" := rec."MCC-4(ICW) Today Consumption" + metRec."MCC-4(ICW) To date Consumption";

            end;
        }
        field(23; "MCC-4(ICW) Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(24; "MCC-4(ICW) To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(25; "DESCALER PUMP"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "DESCALER PUMP" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("DESCALER PUMP", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."DESCALER PUMP Today Consumption" := Rec."DESCALER PUMP" - metRec."DESCALER PUMP";
                        Rec."DESCALER PUMP To date Consumption" := Rec."DESCALER PUMP Today Consumption" + metRec."DESCALER PUMP To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."DESCALER PUMP" > Rec."DESCALER PUMP" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("DESCALER PUMP");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("DESCALER PUMP", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1" then begin
                    rec."DESCALER PUMP Today Consumption" := rec."DESCALER PUMP Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000" then begin
                        rec."DESCALER PUMP Today Consumption" := rec."DESCALER PUMP Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"1000000" then begin
                            rec."DESCALER PUMP Today Consumption" := rec."DESCALER PUMP Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 6" = rec."MULTIPLY FACTOR 6"::"100000000" then begin
                                rec."DESCALER PUMP Today Consumption" := rec."DESCALER PUMP Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("DESCALER PUMP", '<>%1', 0);
                if metRec.FindLast() then
                    rec."DESCALER PUMP To date Consumption" := rec."DESCALER PUMP Today Consumption" + metRec."DESCALER PUMP To date Consumption";

            end;
        }
        field(27; "DESCALER PUMP Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'DESCALER PUMP Today Consumption';
            DecimalPlaces = 8 : 8;
        }
        field(28; "DESCALER PUMP To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'DESCALER PUMP To date Consumption';
            DecimalPlaces = 8 : 8;
        }







        field(29; "MAIN INCOMER (DELTA 3.5 MVA)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MAIN INCOMER (DELTA 3.5 MVA)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MAIN INCOMER (DELTA 3.5 MVA)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" := Rec."MAIN INCOMER (DELTA 3.5 MVA)" - metRec."MAIN INCOMER (DELTA 3.5 MVA)";
                        Rec." MAIN INCOMER (DELTA 3.5 MVA)To date Consumption" := Rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" + metRec." MAIN INCOMER (DELTA 3.5 MVA)To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MAIN INCOMER (DELTA 3.5 MVA)" > Rec."MAIN INCOMER (DELTA 3.5 MVA)" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MAIN INCOMER (DELTA 3.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (DELTA 3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1" then begin
                    rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" := rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1000" then begin
                        rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" := rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"1000000" then begin
                            rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" := rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 7" = rec."MULTIPLY FACTOR 7"::"100000000" then begin
                                rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" := rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MAIN INCOMER (DELTA 3.5 MVA)", '<>%1', 0);
                if metRec.FindLast() then
                    rec." MAIN INCOMER (DELTA 3.5 MVA)To date Consumption" := rec." MAIN INCOMER (DELTA 3.5 MVA)Today Consumption" + metRec." MAIN INCOMER (DELTA 3.5 MVA)To date Consumption";

            end;
        }
        field(31; " MAIN INCOMER (DELTA 3.5 MVA)Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'DESCALER PUMP Today Consumption';
            DecimalPlaces = 8 : 8;
        }
        field(32; " MAIN INCOMER (DELTA 3.5 MVA)To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = ' MAIN INCOMER (DELTA 3.5 MVA)To date Consumption';
            DecimalPlaces = 8 : 8;
        }








        field(33; "AUXILIARY DRIVELINEUP-2"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "AUXILIARY DRIVELINEUP-2" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("AUXILIARY DRIVELINEUP-2", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."AUXILIARY DRIVELINEUP-2 Today Consumption" := Rec."AUXILIARY DRIVELINEUP-2" - metRec."AUXILIARY DRIVELINEUP-2";
                        Rec."AUXILIARY DRIVELINEUP-2 To date Consumption" := Rec."AUXILIARY DRIVELINEUP-2 Today Consumption" + metRec."AUXILIARY DRIVELINEUP-2 To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."AUXILIARY DRIVELINEUP-2" > Rec."AUXILIARY DRIVELINEUP-2" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MAIN INCOMER (DELTA 3.5 MVA)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("AUXILIARY DRIVELINEUP-2", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1" then begin
                    rec."AUXILIARY DRIVELINEUP-2 Today Consumption" := rec."AUXILIARY DRIVELINEUP-2 Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1000" then begin
                        rec."AUXILIARY DRIVELINEUP-2 Today Consumption" := rec."AUXILIARY DRIVELINEUP-2 Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"1000000" then begin
                            rec."AUXILIARY DRIVELINEUP-2 Today Consumption" := rec."AUXILIARY DRIVELINEUP-2 Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 8" = rec."MULTIPLY FACTOR 8"::"100000000" then begin
                                rec."AUXILIARY DRIVELINEUP-2 Today Consumption" := rec."AUXILIARY DRIVELINEUP-2 Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("AUXILIARY DRIVELINEUP-2", '<>%1', 0);
                if metRec.FindLast() then
                    rec."AUXILIARY DRIVELINEUP-2 To date Consumption" := rec."AUXILIARY DRIVELINEUP-2 Today Consumption" + metRec."AUXILIARY DRIVELINEUP-2 To date Consumption";

            end;
        }
        field(35; "AUXILIARY DRIVELINEUP-2 Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(36; "AUXILIARY DRIVELINEUP-2 To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }







        field(37; "CRANK SHEAR DRIVE"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "CRANK SHEAR DRIVE" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("CRANK SHEAR DRIVE", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."CRANK SHEAR DRIVE Today Consumption" := Rec."CRANK SHEAR DRIVE" - metRec."CRANK SHEAR DRIVE";
                        Rec."CRANK SHEAR DRIVE To date Consumption" := Rec."CRANK SHEAR DRIVE Today Consumption" + metRec."CRANK SHEAR DRIVE To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."CRANK SHEAR DRIVE" > Rec."CRANK SHEAR DRIVE" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("CRANK SHEAR DRIVE");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CRANK SHEAR DRIVE", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1" then begin
                    rec."CRANK SHEAR DRIVE Today Consumption" := rec."CRANK SHEAR DRIVE Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1000" then begin
                        rec."CRANK SHEAR DRIVE Today Consumption" := rec."CRANK SHEAR DRIVE Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"1000000" then begin
                            rec."CRANK SHEAR DRIVE Today Consumption" := rec."CRANK SHEAR DRIVE Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 9" = rec."MULTIPLY FACTOR 9"::"100000000" then begin
                                rec."CRANK SHEAR DRIVE Today Consumption" := rec."CRANK SHEAR DRIVE Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CRANK SHEAR DRIVE", '<>%1', 0);
                if metRec.FindLast() then
                    rec."CRANK SHEAR DRIVE To date Consumption" := rec."CRANK SHEAR DRIVE Today Consumption" + metRec."CRANK SHEAR DRIVE To date Consumption";

            end;
        }
        field(39; "CRANK SHEAR DRIVE Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(40; "CRANK SHEAR DRIVE To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }









        field(41; "MCC-3 (DCW)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record PDPEnergy;
            begin
                Rec.TestField(Date);
                if "MCC-3 (DCW)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("MCC-3 (DCW)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."MCC-3(DCW) Today Consumption" := Rec."MCC-3 (DCW)" - metRec."MCC-3 (DCW)";
                        Rec."MCC-3 (DCW) To date Consumption" := Rec."MCC-3(DCW) Today Consumption" + metRec."MCC-3 (DCW) To date Consumption";
                    end;
                end;
                begin

                    metRec.Reset();
                    // metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    if metRec.FindFirst() then
                        repeat
                            if metRec."MCC-3 (DCW)" > Rec."MCC-3 (DCW)" then
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
                metRec: Record PDPEnergy;
                mul: Integer;
            begin
                Rec.TestField(Date);


                rec.Validate("MCC-3 (DCW)");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-3 (DCW)", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1" then begin
                    rec."MCC-3(DCW) Today Consumption" := rec."MCC-3(DCW) Today Consumption" * 1;

                end
                else
                    if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1000" then begin
                        rec."MCC-3(DCW) Today Consumption" := rec."MCC-3(DCW) Today Consumption" * 1000;

                    end
                    else
                        if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"1000000" then begin
                            rec."MCC-3(DCW) Today Consumption" := rec."MCC-3(DCW) Today Consumption" * 1000000;

                        end else
                            if rec."MULTIPLY FACTOR 10" = rec."MULTIPLY FACTOR 10"::"100000000" then begin
                                rec."MCC-3(DCW) Today Consumption" := rec."MCC-3(DCW) Today Consumption" * 100000000;

                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("MCC-3 (DCW)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."MCC-3 (DCW) To date Consumption" := rec."MCC-3(DCW) Today Consumption" + metRec."MCC-3 (DCW) To date Consumption";

            end;
        }
        field(43; "MCC-3(DCW) Today Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(44; "MCC-3 (DCW) To date Consumption"; Decimal)
        {
            DataClassification = ToBeClassified;
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