Report 50119 "Bulk Approval Criteria Report"
{
    ApplicationArea = All;
    Caption = 'Bulk Approval Criteria Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    Dataset
    {
        Dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";
            CalcFields = Amount;

            DataItemTableView = where(Status = filter(open), Amount = filter('<>0'));
            trigger OnAfterGetRecord()
            begin
                Apprval("Purchase Header");
            end;

        }
    }

    local procedure apprval(var Rec: Record "Purchase Header")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
            ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);

    end;

}
