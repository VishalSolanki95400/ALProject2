report 50148 HeatSummaryreport
{
    Caption = 'Heat Summary Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Heatsummary.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Heat No.";
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
            column(Heat_No_; "Heat No.")
            {

            }
            column(Item_Type; "Item Type")
            {

            }
            column(qTYBLcon; qTYBLcon)
            {

            }

            column(qTYBLOut; qTYBLOut)
            {

            }
            column(qTYBLsal; qTYBLsal)
            {

            }
            column(qTYBRcon; qTYBRcon)
            {

            }
            column(qTYBROut; qTYBROut)
            {

            }
            column(qTYbRsal; qTYbRsal)
            {

            }
            column(qTYRLcon; qTYRLcon)
            {

            }
            column(qTYRLOut; qTYRLOut)
            {

            }
            column(qTYRLsal; qTYRLsal)
            {

            }
            column(TotalBl; TotalBl)
            {

            }
            column(TotalBR; TotalBR)
            {

            }
            column(TotalRL; TotalRL)
            {

            }


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                ILE: RECORD "Item Ledger Entry";


            begin
                ILE.SetRange("Item Type", 'BL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Consumption);


                IF ILE.FindFirst() then begin
                    qTYBLcon += ILE.Quantity;

                end;

                ILE.SetRange("Item Type", 'BL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Output);

                IF ILE.FindFirst() then begin
                    qTYBLOut += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'BL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Sale);

                IF ILE.FindFirst() then begin
                    qTYBLsal += ILE.Quantity;

                end;

                ILE.SetRange("Item Type", 'RL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Consumption);

                IF ILE.FindFirst() then begin
                    qTYRLcon += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'RL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Output);

                IF ILE.FindFirst() then begin
                    qTYRLOut += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'RL');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Sale);

                IF ILE.FindFirst() then begin
                    qTYRLsal += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'BR');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Consumption);

                IF ILE.FindFirst() then begin
                    qTYBRcon += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'BR');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Output);

                IF ILE.FindFirst() then begin
                    qTYBROut += ILE.Quantity;

                end;
                ILE.SetRange("Item Type", 'BR');
                ILE.SetRange("Heat No.", "Item Ledger Entry"."Heat No.");
                ILE.SetRange("Entry Type", "Entry Type"::Sale
                );

                IF ILE.FindFirst() then begin
                    qTYbRsal += ILE.Quantity;

                end;

                TotalBl := qTYBLcon + qTYBLOut + qTYBLsal;
                TotalBR := qTYbRsal + qTYBRcon + qTYBROut;
                TotalRL := qTYRLcon + qTYRLOut + qTYRLsal;



            end;

            trigger OnPreDataItem()
            var
            begin
                "Item Ledger Entry".SetRange("Posting Date", Fromdate, todate);
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
                    field(Fromdate; Fromdate)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(todate; todate)
                    {
                        ApplicationArea = all;
                        caption = 'To Date';
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

    var
        myInt: Integer;
        Companyinfo: record "Company Information";
        qTYBLcon: Decimal;
        qTYBLOut: Decimal;
        qTYBLsal: Decimal;

        qTYRLcon: Decimal;
        qTYRLOut: Decimal;
        qTYRLsal: Decimal;

        qTYBRcon: Decimal;
        qTYBROut: Decimal;
        qTYbRsal: Decimal;
        TotalBl: Decimal;
        TotalRL: Decimal;
        TotalBR: Decimal;
        FromDate: Date;
        ToDate: Date;
}