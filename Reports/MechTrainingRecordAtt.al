report 50121 " mech Training Record Attend"
{
    Caption = 'Mech. Training Record Attendance Sheet';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\MechTrainingrecord.rdl';

    dataset
    {

        dataitem(TrCalendar; TrCalendar)
        {
            RequestFilterFields = Department;
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
            column(Actual_hours; "Actual hours")
            {

            }

            column(trainingdate_AC; "trainingdate AC")
            {

            }
            column(Programme_Title; "Programme Title")
            {

            }
            column(Faculty_Name; "Faculty Name")
            {

            }
            column(Venue; Venue)
            {

            }
            column(Sno_; "Sno.")
            {

            }
            column(Participent_Name; "Participent Name")
            {

            }
            column(Participent_Code; "Participent Code")
            {

            }
            column(Department; Department)
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