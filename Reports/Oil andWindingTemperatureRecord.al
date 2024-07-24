report 50122 "Oil and Winding Temp"
{
    Caption = 'Oil and Winding Temperature Record';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Temperaturereport.rdl';

    dataset
    {

        dataitem("OIL AND WINDING TEMPERATURE"; "OIL AND WINDING TEMPERATURE")
        {

            column(DATE; DATE)
            {

            }
            column(Time; Time)
            {

            }
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
            column("MVA_TRANSFORMER_OIL_TEMP___CONE_"; "25MVA TRANSFORMER OIL")
            {

            }
            column("MVA_TRANSFORMER_WDG__TEMP___CONE"; "25MVA TRANSFORMER WDG")
            {

            }
            column("MVA_TRANSFORMER_OIL_TEMP___CTWO"; "07 MVA TRANSFORMER OIL")
            {

            }
            column("MVA_TRANSFORMER_WDG__TEMP___CTWO"; "07 MVA TRANSFORMER WDG")
            {

            }
            column("MVA_TRANSFORMER_OIL_TEMP___CThree"; "30/36 MVA TRANSFORMER OIL")
            {

            }
            column("MVA_TRANSFORMER_WDG__TEMP___CThre"; "30/36 MVA TRANSFORMER	WDG")
            {

            }
            column(Sno_; "Sno.")
            {

            }
            column("MVA_TRANSFORMER_OIL_TEMP___C_four"; "12.5/16.0 MVA TRANSFORMER")
            {

            }
            column("MVA_TRANSFORMER_WDG__TEMP___C_four"; "12.5/16.0 MVA TRANSFORMER WDG")
            {

            }
            column("MVA_TRANSFORMER_OIL_TEMP___C_five"; "04 MVA TRANSFORMER OIL")
            {

            }
            column("MVA_TRANSFORMER_WDG__TEMP___C_five"; "04 MVA TRANSFORMER WDG")
            {

            }
            column(SIGNATURE; SIGNATURE)
            {

            }
            column(REMARKS; REMARKS)
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