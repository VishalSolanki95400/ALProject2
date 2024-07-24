Report 50130 "Daily Transformer checklist"
{
    Caption = 'Daily Transformer checkist';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Dailytransformercheck.rdl';

    Dataset
    {
        Dataitem("Transformer Header"; "Transformer Header")
        {


            RequestFilterFields = "Transformer Name", "Transformer Code";
            column(Companypic; Companyinfo.Picture)
            {

            }
            column(Companyname; Companyinfo.Name)
            {

            }
            column(Companyadd; Companyinfo.Address)
            {

            }
            column(Companyadd2; Companyinfo."Address 2")
            {

            }
            column(Companypostcode; Companyinfo."Post Code")
            {

            }
            column(Companystatecode; Companyinfo."State Code")
            {

            }
            column(Companycity; Companyinfo.City)
            {

            }
            column(Companyphone; Companyinfo."Phone No.")
            {

            }
            column(CompanyEMAIL; Companyinfo."E-Mail")
            {

            }
            column(Companyinfo; Companyinfo."GST Registration No.")
            {

            }
            column(Transformer_Name; "Transformer Name")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Arr1; Arr[1])
            {

            }
            column(To_Date; "To Date")
            {

            }
            column(From_Date; "From Date")
            {

            }
            column(Arr2; Arr[2])
            {
            }
            column(Arr3; Arr[3])
            {
            }
            column(Arr4; Arr[4])
            {
            }
            column(Arr5; Arr[5])
            {
            }
            column(Arr6; Arr[6])
            {
            }
            column(Arr7; Arr[7])
            {
            }
            column(Arr8; Arr[8])
            {
            }
            column(Arr9; Arr[9])
            {

            }
            column(Arr10; Arr[10])
            {

            }
            column(Arr11; Arr[11])
            {

            }
            column(Arr12; Arr[12])
            {

            }
            column(Arr13; Arr[13])
            {

            }
            trigger OnAfterGetRecord()
            var
                traline: Record "Transformer Line";
                i: Integer;
            begin
                Clear(val);
                Clear(i);
                traline.Reset();
                traline.SetRange("Document No.", "Transformer Header"."No.");
                if traline.FindFirst() then
                    repeat
                        for i := 1 to 13 do begin
                            if Arr[i] = traline."Parameter Name" then
                                val[i] := traline.Value;
                            val[2] := traline."Parameter Name";
                            val[3] := traline.Value;
                            val[4] := traline.Value;
                            val[5] := traline.Value;
                            val[6] := traline.Value;
                            val[7] := traline.Value;
                            val[8] := traline.Value;
                            val[9] := traline.value;
                            val[10] := traline.Value;
                            val[11] := traline.value;
                            val[12] := traline.Value;
                            val[13] := traline.value;
                        end;
                    until traline.Next() = 0;

            end;

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                    field("From Date"; "From Date")
                    {
                        ApplicationArea = all;
                    }
                    field("To Date"; "To Date")
                    {
                        ApplicationArea = ALL;
                    }

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    procedure addarr()
    begin

        Arr[1] := 'MAIN CONSERVATOR TANK OIL LEVEL (<1/4 & 3/4)';
        Arr[2] := 'O.L.T.C. OIL LEVEL (<1/4 & 3/4)';
        Arr[3] := 'CLEANING OF BREATHER AND ITS OIL CUP';
        Arr[4] := 'WINDING TEMPERATURE (80°C)';
        Arr[5] := 'OIL TEMPERATURE';
        Arr[6] := 'TAP CHANGER READING';
        Arr[7] := 'ANY OIL LEAKAGE (LEAKAGE FOUND OR NOT)';
        Arr[8] := 'MAIN TANK SILICA GEL COLOUR (BLUE)';
        Arr[9] := 'O.L.T.C. SILICA GEL COLOUR (BLUE)';
        Arr[10] := 'COOLING FAN CONDITION (WORKING OK OR NOT)';
        Arr[11] := 'INCOMING VOLTAGE (66KV)';
        Arr[12] := 'OUTGOING VOLTAGE (11KV)';
        Arr[13] := 'VISUAL CHECKING OF NOISE AND SPARKING';

    end;

    var
        myInt: Integer;
        Companyinfo: record "Company Information";
        "Sno.": Integer;
        Location: Code[20];
        "From Date": Date;
        "To Date": Date;
        Arr: array[13] of Text[50];
        val: array[13] of Text[50];
}