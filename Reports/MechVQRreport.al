report 50129 VQRreport
{
    Caption = 'Vendor Quality Rating';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = True;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            trigger OnPreDataItem()
            begin
                MakeHeader();

            end;

            trigger OnAfterGetRecord()

            var
                line: Record "Purch. Rcpt. Line";
            begin
                Clear(totalrecpt);
                line.Reset();
                line.SetRange("Buy-from Vendor No.", "No.");
                if line.FindFirst() then
                    totalrecpt := line.Count;
                MakeBody();
                date := Today;

            end;

        }

    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(Fromdate; Fromdate)
                {

                }
                field(todate; todate)
                {

                }

            }
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DELETEALL();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook;
        date := Today;
    end;

    local procedure MakeHeader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('DOC NO. A/PUR/PUR/VQR/F010', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Rev No.-', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Date -' + Format(Today), FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('VQR (Vendor Quality Rating)', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Period  From -' + Format("Fromdate"), FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn('To -' + Format(todate), FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Supplier Name', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('No. of Deliveries No.', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('No. of Deliveries %', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('No. of Deliveries Points', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Quality Deviation No.', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quality Deviation %', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quality Deviation points', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Field Return (Rejections) No.', FALSE, '', true, FALSE, true, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Field Return (Rejections) %', FALSE, '', true, FALSE, true, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Field Return (Rejections) Points', FALSE, '', true, FALSE, true, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Customer Disruptions No.', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Customer Disruptions %', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Customer Disruptions Points', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Delay in Delivery No.', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Delay in Delivery %', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Delay in Delivery Points', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Premium Freight No.', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Premium Freight %', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Premium Freight Points', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Overall Service Points', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Total Points', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var

    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn(Vendor.Name, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(totalrecpt, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);




    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('"Vendor Quality Rating"');
        TempExcelBuffer.WriteSheet('"Vendor Quality Rating"', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('"Vendor Quality Rating"');
        TempExcelBuffer.OpenExcel();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        totalrecpt: Integer;
        Fromdate: Date;
        todate: Date;
        date: Date;
}
