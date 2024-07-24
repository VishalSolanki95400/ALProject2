report 50132 "mech Store Training"
{
    Caption = 'Mech. Store Training calendar';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Mechstoretraining.rdl';

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

            column(Department; Department)
            {

            }
            column(Month; Month)
            {

            }
            column(Type_of_Faculty; "Type of Faculty")
            {

            }
            column(Duration; Duration)
            {

            }
            column(Training_Date; "Training Date")
            {

            }
            column(Type_of_participant; "Type of participant")
            {

            }
            column(Participent_Code; "Participent Code")
            {

            }
            column(Participent_Name; "Participent Name")
            {

            }
            column(Exstaff; Exstaff)
            {

            }
            column(exOnroll; exOnroll)
            {

            }
            column(exContract; exContract)
            {

            }
            column(Expected_hours; "Expected hours")
            {

            }
            column(trainingdate_AC; "trainingdate AC")
            {

            }
            column(Ac_Staff; "Ac Staff")
            {

            }
            column(acOnroll; acOnroll)
            {

            }
            column(acContract; acContract)
            {

            }
            column(Actual_hours; "Actual hours")
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(Status; Status)
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