codeunit 50103 AdvanceCustomerManagement
{
    var

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line");
    begin

        GenJournalLine.Type := SalesHeader.Type;
        GenJournalLine."Advance amount" := SalesHeader."Advance Amount";
        begin

            if SalesHeader."Advance Amount" < SalesHeader."Amount" then begin
                Error('Insufficient advance amount for this customer.');
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line");
    begin
        CustLedgerEntry.Type := GenJournalLine.Type;
        CustLedgerEntry."Advance Amount" := GenJournalLine."Advance amount";
    end;
}

//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
//     local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line");
//     begin
//         // GenJournalLine."Debtor Category" := SalesHeader."Debtor Category";
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', false, false)]
//     local procedure OnBeforeCustLedgEntryInsert(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; var NextEntryNo: Integer);
//     begin
//         // CustLedgerEntry."Debtor Category" := GenJournalLine."Debtor Category";
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesOrderPost', '', false, false)]
//     local procedure OnAfterSalesOrderPost(SalesHeader: Record "Sales Header")
//     var
//         RemainingAmount: Decimal;
//     begin
//         if SalesHeader."Sell-to Customer No." <> '' then
//         begin
//             AdvanceCustomerRec.Get(SalesHeader."Sell-to Customer No.");
//             if AdvanceCustomerRec."Type" = 'Advance Customer' then // Check if the customer is an advance customer
//             begin
//                 // Update and add amount on customer card field
//                 AdvanceCustomerRec."Advance Amount" += SalesHeader."Amount";
//                 AdvanceCustomerRec.Modify();

//                 // Update Remaining Amount on Sales Header
//                 RemainingAmount := SalesHeader."Amount" - SalesHeader."Advance Amount";
//                 SalesHeader.Amount := RemainingAmount;
//                 SalesHeader.Modify();
//             end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterValidate', '', false, false)]
//     local procedure OnAfterValidateSalesOrder(var SalesHeader: Record "Sales Header")
//     begin
//         // Check if the customer is an advance customer
//         if SalesHeader."Sell-to Customer No." <> '' then
//         begin
//             AdvanceCustomerRec.Get(SalesHeader."Sell-to Customer No.");
//             if AdvanceCustomerRec."Type" = 'Advance Customer' thens 
//             begin
//                 // Check if available amount is greater
//                 if AdvanceCustomerRec."Advance Amount" < SalesHeader."Amount" then
//                 begin
//                     Error('Insufficient advance amount for this customer.');
//                 end;
//             end;
//         end;
//     end;
// }
