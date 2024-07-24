codeunit 50200 "Update Credit Limits"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnRunOnBeforeFinalizePosting', '', true, true)]
    local procedure OnRunOnBeforeFinalizePosting(var SalesHeader: Record "Sales Header";
                                                 var SalesShipmentHeader: Record "Sales Shipment Header";
                                                 var SalesInvoiceHeader: Record "Sales Invoice Header";
                                                 var SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                                                 var ReturnReceiptHeader: Record "Return Receipt Header";
                                                 var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                                                 CommitIsSuppressed: Boolean;
                                                 GenJnlLineExtDocNo: Code[35];
                                                 var EverythingInvoiced: Boolean;
                                                 GenJnlLineDocNo: Code[20];
                                                 SrcCode: Code[10]);

    var
        TaxTransValue: Record "Tax Transaction Value";
        Cust: Record Customer;
        TotalGSTAmount: Decimal;
        Price, DiscAmt, SrNo, freighamt, IGST_perc, IGST_Amt, CGST_perc, CGST_Amt, SGST_perc, SGST_Amt, gsttotal, TotalAmt : Decimal;
        TaxComponentName: Text;
        salesline: record "Sales Line";
    // Cust: Record Customer;
    // TaxTransValue: Record "Tax Transaction Value";
    // GSTSetup: Codeunit "GST Setup";
    begin

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", "salesheader"."No.");
        if SalesLine.FindSet() then begin
            IGST_perc := 0;
            IGST_Amt := 0;
            CGST_perc := 0;
            CGST_Amt := 0;
            SGST_perc := 0;
            SGST_Amt := 0;
            GSTSetup.Get();
            if SalesLine.Type = SalesLine.Type::Item then begin
                TaxTransValue.Reset();
                if TaxTransValue.FindSet() then
                    repeat
                        TaxComponentName := TaxTransValue.GetAttributeColumName();
                        //Message(TaxComponentName);
                        case TaxComponentName of
                            'IGST':
                                begin
                                    IGST_Amt := TaxTransValue.Amount;
                                    IGST_perc := TaxTransValue.Percent;
                                    evaluate(IGST_Amt, TaxTransValue."Column Value");
                                    // Message('%1..%2', IGST_Amt, IGST_perc);
                                end;
                            'CGST':
                                begin
                                    CGST_Amt := TaxTransValue.Amount;
                                    evaluate(CGST_Amt, TaxTransValue."Column Value");
                                    CGST_perc := TaxTransValue.Percent;
                                    // Message('%1..%2', CGST_Amt, CGST_perc);
                                end;
                            'SGST':
                                begin
                                    SGST_Amt := TaxTransValue.Amount;
                                    evaluate(SGST_Amt, TaxTransValue."Column Value");
                                    SGST_perc := TaxTransValue.Percent;
                                    // Message('%1..%2', SGST_Amt, SGST_perc);
                                end;
                        end;
                    until TaxTransValue.Next() = 0;
            END;
        end;

        gsttotal += IGST_Amt + CGST_Amt + SGST_Amt;
        "gst per" := IGST_perc + SGST_perc + CGST_perc;
        // Message('total amount is %1..%2', gsttotal, "gst per");
        // TotalAmt += "Sales Line".Amount + gsttotal;





        if Cust.Get(SalesHeader."Sell-to Customer No.") then begin
            Message('gst amount value :%1 gst', gsttotal);


            Cust."Remaining credit limit" -= gsttotal;
            cust.Modify();
            Message('remainng:%1 rem', Cust."Remaining credit limit");
        end;
        if Cust."Remaining credit limit" < gsttotal Then
            Error('>');
        Message('gst amount :%1', gsttotal);

    end;

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        ending_date: Date;
        starting_date: Date;
        Check: Report "Check";
        cust: record customer;
        AmountInWords: array[2] of Text;
        TotalAmt: Decimal;
        SrNo: Integer;
        "gst per": Decimal;
        freighamt: Decimal;
        TaxTransValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
        TaxComponentName: Text;
        gsttotal: Decimal;
        IGST_perc: Decimal;
        IGST_Amt: Decimal;
        CGST_perc: Decimal;
        CGST_Amt: Decimal;
        SGST_perc: Decimal;
        sgst_amt: Decimal;
        Price: Decimal;
        DiscAmt: Decimal;
        "sales line": Record "Sales Line";

}

