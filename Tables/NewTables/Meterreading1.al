table 50125 MeterReading1
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "meter No1"; Code[20])
        {
            Caption = 'Meter No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(3; Month1; Option)
        {
            OptionMembers = "",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        }
        field(4; Date1; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
            begin
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<>%1', rec."Line No");
                metRec.SetRange(Date1, rec.Date1);
                if metRec.FindFirst() then
                    Error('Same date can not be selected.');
            end;
        }
        field(5; Time1; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "CAP. BANK NO. 03"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
            begin
                Rec.TestField(Date1);
                if "CAP. BANK NO. 03" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("CAP. BANK NO. 03", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."CAP. BANK NO. 03 Today" := Rec."CAP. BANK NO. 03" - metRec."CAP. BANK NO. 03";
                        Rec."CAP. BANK NO. 03 To-Date" := Rec."CAP. BANK NO. 03 Today" + metRec."CAP. BANK NO. 03 To-date";
                    end;
                end;
            end;
        }
        field(7; "1500KVA D.G.Set"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
            begin
                Rec.TestField(Date1);
                if "1500KVA D.G.Set" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("1500KVA D.G.Set", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."1500KVA D.G.Set Today" := Rec."1500KVA D.G.Set" - metRec."1500KVA D.G.Set";
                        Rec."1500KVA D.G.Set To-Date" := Rec."1500KVA D.G.Set Today" + metRec."1500KVA D.G.Set To-date";
                    end;
                end;
            end;
        }
        field(8; "2250KVA D.G.Set"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
            begin
                Rec.TestField(Date1);
                if "2250KVA D.G.Set" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("2250KVA D.G.Set", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."2250KVA D.G.Set Today" := Rec."2250KVA D.G.Set" - metRec."2250KVA D.G.Set";
                        Rec."2250KVA D.G.Set To-Date" := Rec."2250KVA D.G.Set Today" + metRec."2250KVA D.G.Set To-date";
                    end;
                end;
            end;
        }
        field(9; "O2 Gas Plant (11KV)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
            begin
                Rec.TestField(Date1);
                if "O2 Gas Plant (11KV)" <> 0 then begin
                    metRec.Reset();
                    metRec.SetRange(Month1, Rec.Month1);
                    metRec.SetFilter("Line No", '<%1', rec."Line No");
                    metRec.SetFilter("O2 Gas Plant (11KV)", '<>%1', 0);
                    if metRec.FindLast() then begin
                        Rec."O2 Gas Plant (11KV) Today" := Rec."O2 Gas Plant (11KV)" - metRec."O2 Gas Plant (11KV)";
                        Rec."O2 Gas Plant (11KV) To-Date" := Rec."O2 Gas Plant (11KV) Today" + metRec."O2 Gas Plant (11KV) To-date";
                    end;
                end;
            end;
        }
        field(10; "Mulitply Factor 1"; Option)
        {
            OptionMembers = ,"1","1000","1000000","100000000";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
                mul: Integer;
            begin
                Rec.TestField(Date1);
                // if "CAP. BANK NO. 03" <> 0 then begin

                rec.Validate("CAP. BANK NO. 03");
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CAP. BANK NO. 03", '<>%1', 0);
                if metRec.FindLast() then;
                if rec."Mulitply Factor 1" = rec."Mulitply Factor 1"::"1" then begin
                    rec."CAP. BANK NO. 03 Today" := rec."CAP. BANK NO. 03 Today" * 1;
                    // rec."CAP. BANK NO. 03 To-Date" := rec."CAP. BANK NO. 03 To-Date" * 1;
                end
                else
                    if rec."Mulitply Factor 1" = rec."Mulitply Factor 1"::"1000" then begin
                        rec."CAP. BANK NO. 03 Today" := rec."CAP. BANK NO. 03 Today" * 1000;
                        // rec."CAP. BANK NO. 03 To-Date" := rec."CAP. BANK NO. 03 To-Date" * 1000;
                    end
                    else
                        if rec."Mulitply Factor 1" = rec."Mulitply Factor 1"::"1000000" then begin
                            rec."CAP. BANK NO. 03 Today" := rec."CAP. BANK NO. 03 Today" * 1000000;
                            // rec."CAP. BANK NO. 03 To-Date" := rec."CAP. BANK NO. 03 To-Date" * 1000000;
                        end else
                            if rec."Mulitply Factor 1" = rec."Mulitply Factor 1"::"100000000" then begin
                                rec."CAP. BANK NO. 03 Today" := rec."CAP. BANK NO. 03 Today" * 100000000;
                                // rec."CAP. BANK NO. 03 To-Date" := rec."CAP. BANK NO. 03 To-Date" * 100000000;
                            end;

                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("CAP. BANK NO. 03", '<>%1', 0);
                if metRec.FindLast() then
                    rec."CAP. BANK NO. 03 To-Date" := rec."CAP. BANK NO. 03 Today" + metRec."CAP. BANK NO. 03 To-Date";
                // rec.Validate("CAP. BANK NO. 03");
            end;
        }
        field(11; "CAP. BANK NO. 03 Today"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(12; "CAP. BANK NO. 03 To-Date"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(13; "1500KVA D.G.Set Today"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(14; "1500KVA D.G.Set To-Date"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(15; "2250KVA D.G.Set Today"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(16; "2250KVA D.G.Set To-Date"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(17; "O2 Gas Plant (11KV) Today"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(18; "O2 Gas Plant (11KV) To-Date"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
            DecimalPlaces = 8 : 8;
        }
        field(19; "Mulitply Factor 2"; Option)
        {
            OptionMembers = ,"1","1000","1000000","100000000";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                metRec: Record MeterReading1;
                mul: Integer;
            begin
                rec.Validate("1500KVA D.G.Set");
                if rec."Mulitply Factor 2" = rec."Mulitply Factor 2"::"1" then begin
                    rec."1500KVA D.G.Set Today" := rec."1500KVA D.G.Set Today" * 1;
                    // rec."1500KVA D.G.Set To-Date" := rec."1500KVA D.G.Set To-Date" * 1;
                end
                else
                    if rec."Mulitply Factor 2" = rec."Mulitply Factor 2"::"1000" then begin
                        rec."1500KVA D.G.Set Today" := rec."1500KVA D.G.Set Today" * 1000;
                        // rec."1500KVA D.G.Set To-Date" := rec."1500KVA D.G.Set To-Date" * 1000;
                    end
                    else
                        if rec."Mulitply Factor 2" = rec."Mulitply Factor 2"::"1000000" then begin
                            rec."1500KVA D.G.Set Today" := rec."1500KVA D.G.Set Today" * 1000000;
                            // rec."1500KVA D.G.Set To-Date" := rec."1500KVA D.G.Set To-Date" * 1000000;
                        end else
                            if rec."Mulitply Factor 2" = rec."Mulitply Factor 2"::"100000000" then begin
                                rec."1500KVA D.G.Set Today" := rec."1500KVA D.G.Set Today" * 100000000;
                                // rec."1500KVA D.G.Set To-Date" := rec."1500KVA D.G.Set To-Date" * 100000000;
                            end;
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("1500KVA D.G.Set", '<>%1', 0);
                if metRec.FindLast() then
                    rec."1500KVA D.G.Set To-Date" := rec."1500KVA D.G.Set Today" + metRec."1500KVA D.G.Set To-Date";
                // rec.Validate("1500KVA D.G.Set");
            end;

        }
        field(20; "Mulitply Factor 3"; Option)
        {
            OptionMembers = ,"1","1000","1000000","100000000";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
                mul: Integer;
            begin
                rec.Validate("2250KVA D.G.Set");
                if rec."Mulitply Factor 3" = rec."Mulitply Factor 3"::"1" then begin
                    rec."2250KVA D.G.Set Today" := rec."2250KVA D.G.Set Today" * 1;
                    // rec."2250KVA D.G.Set To-Date" := rec."2250KVA D.G.Set To-Date" * 1;
                end
                else
                    if rec."Mulitply Factor 3" = rec."Mulitply Factor 3"::"1000" then begin
                        rec."2250KVA D.G.Set Today" := rec."2250KVA D.G.Set Today" * 1000;
                        // rec."2250KVA D.G.Set To-Date" := rec."2250KVA D.G.Set To-Date" * 1000;
                    end
                    else
                        if rec."Mulitply Factor 3" = rec."Mulitply Factor 3"::"1000000" then begin
                            rec."2250KVA D.G.Set Today" := rec."2250KVA D.G.Set Today" * 1000000;
                            // rec."2250KVA D.G.Set To-Date" := rec."2250KVA D.G.Set To-Date" * 1000000;
                        end else
                            if rec."Mulitply Factor 3" = rec."Mulitply Factor 3"::"100000000" then begin
                                rec."2250KVA D.G.Set Today" := rec."2250KVA D.G.Set Today" * 100000000;
                                // rec."2250KVA D.G.Set To-Date" := rec."2250KVA D.G.Set To-Date" * 100000000;
                            end;
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("2250KVA D.G.Set", '<>%1', 0);
                if metRec.FindLast() then
                    rec."2250KVA D.G.Set To-Date" := rec."2250KVA D.G.Set Today" + metRec."2250KVA D.G.Set To-Date";
                // rec.Validate("2250KVA D.G.Set");
            end;
        }
        field(21; "Mulitply Factor 4"; Option)
        {
            OptionMembers = ,"1","1000","1000000","100000000";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                metRec: Record MeterReading1;
                mul: Integer;
            begin
                rec.Validate("O2 Gas Plant (11KV)");
                if rec."Mulitply Factor 4" = rec."Mulitply Factor 4"::"1" then begin
                    rec."O2 Gas Plant (11KV) Today" := rec."O2 Gas Plant (11KV) Today" * 1;
                    // rec."O2 Gas Plant (11KV) To-Date" := rec."O2 Gas Plant (11KV) To-Date" * 1;
                end
                else
                    if rec."Mulitply Factor 4" = rec."Mulitply Factor 4"::"1000" then begin
                        rec."O2 Gas Plant (11KV) Today" := rec."O2 Gas Plant (11KV) Today" * 1000;
                        // rec."O2 Gas Plant (11KV) To-Date" := rec."O2 Gas Plant (11KV) To-Date" * 1000;
                    end
                    else
                        if rec."Mulitply Factor 4" = rec."Mulitply Factor 4"::"1000000" then begin
                            rec."O2 Gas Plant (11KV) Today" := rec."O2 Gas Plant (11KV) Today" * 1000000;
                            // rec."O2 Gas Plant (11KV) To-Date" := rec."O2 Gas Plant (11KV) To-Date" * 1000000;
                        end else
                            if rec."Mulitply Factor 4" = rec."Mulitply Factor 4"::"100000000" then begin
                                rec."O2 Gas Plant (11KV) Today" := rec."O2 Gas Plant (11KV) Today" * 100000000;
                                // rec."O2 Gas Plant (11KV) To-Date" := rec."O2 Gas Plant (11KV) To-Date" * 100000000;
                            end;
                metRec.Reset();
                metRec.SetRange(Month1, Rec.Month1);
                metRec.SetFilter("Line No", '<%1', rec."Line No");
                metRec.SetFilter("O2 Gas Plant (11KV)", '<>%1', 0);
                if metRec.FindLast() then
                    rec."O2 Gas Plant (11KV) To-Date" := rec."O2 Gas Plant (11KV) Today" + metRec."O2 Gas Plant (11KV) To-Date";
                // rec.Validate("O2 Gas Plant (11KV)");
            end;
        }
        field(22; preview; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "meter No1", Month1, "Line No")
        {
            Clustered = true;
        }
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