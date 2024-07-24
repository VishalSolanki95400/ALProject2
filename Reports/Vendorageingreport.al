report 50137 "Vendor Ageing Report"
{
    Caption = 'Vendor Ageing Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // ProcessingOnly = true;
    WordLayout = 'Customer.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = where("Document Type" = filter(invoice));
            CalcFields = "Original Amt. (LCY)", "Original Amount";

            trigger OnPreDataItem()
            begin
                MakeHeader();

                if todateG = 0D then
                    Error('To Date must have value');
                SetRange("Due Date", 0D, todateG);


            end;

            trigger OnAfterGetRecord()
            begin
                "Sr No," := "Sr No," + 1;


                IF vend.Get("Vendor Ledger Entry"."Vendor No.") then;
                if vb.Get("Vendor Ledger Entry"."Vendor No.") then;

                if not pih.get("Document No.") then
                    CurrReport.Skip();
                invno := pih."No.";
                dateofinv := pih."Posting Date";

                Pil.Reset();
                pil.SetRange("Document No.", "Document No.");
                pil.SetRange("Receipt Line No.", 10000);
                if pil.FindFirst() then
                    grnno := pil."Receipt No.";

                // Message(grnno);

                prh.Reset();
                prh.SetRange("No.", grnno);
                if prh.FindFirst() then
                    grndate := prh."Posting Date";

                pge.Reset();
                pge.SetRange("No.", grnno);
                if pge.FindFirst() then begin
                    gateentryno := pge."Gate Entry No.";
                    dateofgateentry := pge."Posting Date";
                end;

                VLEG.Reset();
                VLEG.SetRange("Document No.", "Document No.");
                VLEG.SetRange("Closed by Entry No.", "Closed by Entry No.");
                VLEG.SetRange("Entry No.", "Entry No.");
                if VLEG.FindLast() then
                    tba := VLEG."Closed by Amount (LCY)";

                bal := "Vendor Ledger Entry"."Original Amt. (LCY)" - tba;



                //
                MakeBody();

            end;
        }
    }
    RequestPage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    Caption = 'Date Filters';
                    field(todateG; todateG)
                    {

                        Caption = 'As on Date';
                        trigger OnValidate()
                        begin

                        end;
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBufferG.Reset();
        TempExcelBufferG.DeleteAll();
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;

    trigger OnPostReport()
    begin
        CreateExcelBook;

    end;

    local procedure MakeHeader()
    var

    begin

        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(CompanyInfo.Name, FALSE, '', true, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(CompanyInfo.Address + CompanyInfo."Address 2" + CompanyInfo.City, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Vendor Ageing Report', false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow();
        TempExcelBufferG.AddColumn('Sr No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Voucher No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Voucher Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('GRN No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('GRN Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Invoice No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Date of Invoice', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Date of Gate Entry Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Vendor No', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Vendor Name', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('PAN', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('GST No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('MSME No.', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Total Bill Amount', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Payment', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Balance', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Due date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Days Outstaning as Vendor Invoice Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Days Outstaning as per Posting Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Outstaning Grouping As per Vendor Invoice Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Outstaning Grouping Posted Purchase Invoice Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Party Bank Name', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Partys Bank Account', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);





    end;

    local procedure MakeBody()
    var
        purecpL: Record "Purch. Rcpt. Header";
    begin

        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn("Sr No,", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn("Vendor Ledger Entry"."Document No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn("Vendor Ledger Entry"."Posting Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(grnno, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(grndate, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(invno, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(dateofinv, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(dateofgateentry, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(pih."Buy-from Vendor No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(pih."Buy-from Vendor Name", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(vend."P.A.N. No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(vend."GST Registration No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn('Vend.MSME No.', false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn("Vendor Ledger Entry"."Original Amt. (LCY)", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(tba, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(bal, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(pih."Due Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(pih."Due Date" - pih."Document Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn(pih."Due Date" - pih."Posting Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        //For Vendor Invoice date
        if (pih."Due Date" - pih."Document Date" >= 0) and (pih."Due Date" - pih."Document Date" <= 30) then
            TempExcelBufferG.AddColumn(label1, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
        else
            if (pih."Due Date" - pih."Document Date" >= 31) and (pih."Due Date" - pih."Document Date" <= 60) then
                TempExcelBufferG.AddColumn(label2, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
            else
                if (pih."Due Date" - pih."Document Date" >= 61) and (pih."Due Date" - pih."Document Date" <= 90) then
                    TempExcelBufferG.AddColumn(label3, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                else
                    if (pih."Due Date" - pih."Document Date" >= 91) and (pih."Due Date" - pih."Document Date" <= 120) then
                        TempExcelBufferG.AddColumn(label4, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                    else
                        if (pih."Due Date" - pih."Document Date" >= 121) and (pih."Due Date" - pih."Document Date" <= 150) then
                            TempExcelBufferG.AddColumn(label5, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                        else
                            if (pih."Due Date" - pih."Document Date" >= 151) and (pih."Due Date" - pih."Document Date" <= 180) then
                                TempExcelBufferG.AddColumn(label6, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                            else
                                if (pih."Due Date" - pih."Document Date" >= 180) then
                                    TempExcelBufferG.AddColumn(label7, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);

        // Posting PUrchase Invoice date
        if (pih."Due Date" - pih."Posting Date" >= 0) and (pih."Due Date" - pih."Posting Date" <= 30) then
            TempExcelBufferG.AddColumn(label1, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
        else
            if (pih."Due Date" - pih."Posting Date" >= 31) and (pih."Due Date" - pih."Posting Date" <= 60) then
                TempExcelBufferG.AddColumn(label2, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
            else
                if (pih."Due Date" - pih."Posting Date" >= 61) and (pih."Due Date" - pih."Posting Date" <= 90) then
                    TempExcelBufferG.AddColumn(label3, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                else
                    if (pih."Due Date" - pih."Posting Date" >= 91) and (pih."Due Date" - pih."Posting Date" <= 120) then
                        TempExcelBufferG.AddColumn(label4, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                    else
                        if (pih."Due Date" - pih."Posting Date" >= 121) and (pih."Due Date" - pih."Posting Date" <= 150) then
                            TempExcelBufferG.AddColumn(label5, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                        else
                            if (pih."Due Date" - pih."Posting Date" >= 151) and (pih."Due Date" - pih."Posting Date" <= 180) then
                                TempExcelBufferG.AddColumn(label6, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text)
                            else
                                if (pih."Due Date" - pih."Posting Date" >= 180) then
                                    TempExcelBufferG.AddColumn(label7, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);

        TempExcelBufferG.AddColumn(vb."Name", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(vb."Bank Account No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);

    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBufferG.CreateNewBook('Vendor Ageing Report');
        TempExcelBufferG.WriteSheet('Vendor Ageing Report', CompanyName, UserId);
        TempExcelBufferG.CloseBook();
        TempExcelBufferG.SetFriendlyFilename('Vendor Ageing Report');
        TempExcelBufferG.OpenExcel();
    end;

    var
        VLEG: Record "vendor Ledger Entry";
        prh: Record "Purch. Rcpt. Header";
        prl: Record "Purch. Rcpt. Line";
        pih: Record "Purch. Inv. Header";
        Pil: Record "Purch. Inv. Line";
        pge: Record "Posted Gate Entry Header";
        vend: Record Vendor;
        CompanyInfo: Record "Company Information";
        vb: Record "Vendor Bank Account";
        TempExcelBufferG: Record "Excel Buffer" temporary;
        grndate: Date;
        dateofinv: Date;
        dateofgateentry: Date;
        grnno: Code[50];
        fa: Report "Fixed Asset - Book Value 01";
        invno: Code[20];
        gateentryno: Code[20];
        bal: Decimal;
        tba: Decimal;
        todateG: date;
        og: Decimal;
        "Sr No,": Integer;
        label1: label '0-30 Days';
        label2: Label '31-60 Days';
        label3: Label '61-90 Days';
        label4: Label '91-120 Days';
        label5: Label '121-150 Days';
        label6: Label '151-180 Days';
        label7: Label 'More then 180 Days';


}
