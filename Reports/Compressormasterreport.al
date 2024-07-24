report 50147 "Compressor master report"
{
    Caption = 'Compressor Master Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Compressormaster.rdl';

    dataset
    {
        dataitem(PostedCompressorHeader; PostedCompressorHeader)
        {
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
            column(Model_No_; "Model No.")
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(Running_Date; "Running Date")
            {

            }
            column(Current_Running_hours; "Current Running hours")
            {

            }
            column(Running_hours_Service_is_Done_; "Running hours(Service is Done)")
            {

            }
            column(Status; Status)
            {

            }
            column(FromDate; FromDate)
            {

            }
            column(ToDate; ToDate)
            {

            }
            trigger OnPreDataItem()
            var

            begin
                PostedCompressorHeader.SetRange("Running Date", Fromdate, todate);
                PostedCompressorHeader.SetRange(Status, Status::Complete);
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

        FromDate: Date;
        ToDate: Date;
}