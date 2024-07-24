report 50125 "Calibration Calender Report"
{
    Caption = ' Calibration Calender Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\calibrationcal.rdl';

    dataset
    {
        dataitem(CalibrationCalender; CalibrationCalender)
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
            column(Sno_; "Sno.")
            {

            }
            column(Description; Description)
            {

            }
            column("Area"; "Area")
            {

            }
            column(Tag_No_; "Tag No.")
            {

            }
            column(Frequency; Frequency)
            {

            }
            column(Jan; Jan)
            {

            }
            column(Feb; Feb)
            {

            }
            column(Mar; Mar)
            {

            }
            column(Apr; Apr)
            {

            }
            column(May; May)
            {

            }
            column(Jun; Jun)
            {

            }
            column(Jul; Jul)
            {

            }
            column(Aug; Aug)
            {

            }
            column(Sep; Sep)
            {

            }
            column(Oct; Oct)
            {

            }
            column(Nov; Nov)
            {

            }
            column(Dec; Dec)
            {

            }
            column(Calibration; Calibration)
            {

            }
            column(Remarks; Remarks)
            {

            }





            trigger OnAfterGetRecord()
            var
            begin
                "Sno." := "Sno." + 1;
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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
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
        Companyinfo: Record "Company Information";
        "Sno.": Integer;
}