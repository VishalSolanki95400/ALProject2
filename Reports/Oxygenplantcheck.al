report 50156 OxygenPlantchecklist
{

    ApplicationArea = all;
    Caption = 'Oxygen Plant Checklist';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Oxygenplantcheck.rdl';

    dataset
    {
        dataitem(PostedOxygenPlantChklistHeader; PostedOxygenPlantChklistHeader)
        {
            RequestFilterFields = CheckPoint;
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
            column(Date; Date)
            {

            }
            column(CheckPoint; CheckPoint)
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Name_of_a_Job; "Name of a Job")
            {

            }
            column(Frequency; Frequency)
            {

            }
            column("zero"; "0:00")
            {

            }
            column("one"; "1:00")
            {

            }
            column("Two"; "2:00")
            {

            }
            column("Three"; "3:00")
            {

            }
            column("four"; "4:00")
            {

            }
            column("Five"; "5:00")
            {

            }
            column("Six"; "6:00")
            {

            }
            column("seven"; "7:00")
            {

            }
            column("eight"; "8:00")
            {

            }
            column("nine"; "9:00")
            {

            }
            column("Ten"; "10:00")
            {

            }
            column("eleven"; "11:00")
            {

            }
            column("twelve"; "12:00")
            {

            }
            column("thirteen"; "13:00")
            {

            }
            column("fourten"; "14:00")
            {

            }
            column("fifteen"; "15:00")
            {

            }
            column("sixteen"; "16:00")
            {

            }
            column("seventeen"; "17:00")
            {

            }
            column("eighten"; "18:00")
            {

            }
            column("nineteen"; "19:00")
            {

            }
            column("twenty"; "20:00")
            {

            }
            column("Tone"; "21:00")
            {

            }
            column("Ttwo"; "22:00")
            {

            }
            column("Twothree"; "23:00")
            {

            }
            column(Remarks; Remarks)
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
                PostedOxygenPlantChklistHeader.SetRange("Date", Fromdate, todate);
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
        companyInfo: Record "Company Information";
        FromDate: Date;
        ToDate: Date;
}