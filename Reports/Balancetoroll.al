report 50128 Balancetoroll
{
    Caption = 'Balance To Roll';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = True;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "document no." = field("no.");

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if items.Get("No.") then;
                end;


            }
            dataitem("Production Order"; "Production Order")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "source no." = field("no.");
            }
            trigger OnPreDataItem()
            begin
                MakeHeader();
                // TempExcelBuffer.DELETEALL
            end;

            trigger OnAfterGetRecord()
            begin
                MakeBody();
                if RPO."Source Type" = rpo."Source Type"::"Sales Header" then
                    Rpo.SetRange("No.");
                if RPO.FindFirst() then;

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
    end;

    local procedure MakeHeader()
    var
        myInt: Integer;

    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Sales Order No', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sales Order Date', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Customer No', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Name', FALSE, '', true, FALSE, true, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Item No', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Item Code', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Fulfilment Thru', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Supply Condition', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Requested Delivery', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Promised Delivery Date', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('ML(Multiple Length)', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Grade', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Dia', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Category', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Type', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sales Order Qty', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Rolling Plan  No', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Production Order No', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Roll Qty', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Pending To Roll', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var

    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn("Sales Header"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Header"."Order Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Sales Header"."Sell-to Customer No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Header"."Sell-to Customer Name", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Header"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Line"."Item Category Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn("Sales Line"."Fulfilment Through", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        // TempExcelBuffer.AddColumn("Sales Line"."Supply Condition", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Sales Line"."Requested Delivery Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Sales Line"."Promised Delivery Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        // TempExcelBuffer.AddColumn("Sales Line".ML, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn(Items.Grade, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn(Items.Dia, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(Items."Item Category Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(Items.Type, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn("Production Order"."Rolling Plan No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Production Order"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Production Order".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Sales Line".Quantity - "Production Order".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);




    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('"Balance To Roll"');
        TempExcelBuffer.WriteSheet('"Balance To Roll"', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('"Balance To Roll"');
        TempExcelBuffer.OpenExcel();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        Items: Record Item;
        RPO: Record "Production Order";
}
