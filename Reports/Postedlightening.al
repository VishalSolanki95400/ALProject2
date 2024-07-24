report 50124 " Lightening Arrestor"
{
    Caption = ' Lightening Arrestor Counter Reading';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Postedlightening.rdl';

    dataset
    {

        dataitem("POSTED LIGHTENING ARRESTOR"; "POSTED LIGHTENING ARRESTOR")
        {

            column(DATE; DATE)
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
            column("KV_MAIN_LINE_R_PHASE"; "66KV MAIN LINE R-PHASE")
            {

            }
            column("KV_MAIN_LINE_Y_PHASE"; "66KV MAIN LINE Y-PHASE")
            {

            }
            column("KV_MAIN_LINE_B_PHASE"; "66KV MAIN LINE B-PHASE")
            {

            }
            column("MVA_POWER_TRANSFORMER_R_PHASE"; "12.5/16.0 MVA POWER TRANSFO")
            {

            }
            column("POWER_TRANSFORMER_Y_PHASE"; "12.5/16.0 MVA POWER TRANSFO")
            {

            }
            column("MVA_POWER_TRANSFORMER_B_PHASE"; "12.5/16.0 MVA POWER TRANSF")
            {

            }
            column(Sno_; "Sno.")
            {

            }
            column("VA_POWER_TRANSFORMER_R_PHASE"; "30/36 MVA POWER TRANSFO")
            {

            }
            column("MVA_POWER_TRANSFORMER_Y_PHASE"; "30/36 MVA POWER TRANSF")
            {

            }
            column("POWER_TRANSFORMER_B_PHASE"; "30/36 MVA POWER TRANS")
            {

            }
            column("MVA_EAF_TRANSFORMER_R_PHASE"; "25MVA EAF TRANSFORMER R-PHASE")
            {

            }
            column("MVA_EAF_TRANSFORMER_Y_PHASE"; "25MVA EAF TRANSFORMER Y-PHASE")
            {

            }
            column("MVA_EAF_TRANSFORMER_B_PHASE"; "25MVA EAF TRANSFORMER B-PHASE")
            {

            }
            column("MVA_LRF_TRANSFORMER_R_PHASE"; "07MVA LRF TRANSFORMER R-PHASE")
            {

            }
            column("MVA_LRF_TRANSFORMER_Y_PHASE"; "07MVA LRF TRANSFORMER Y-PHASE")
            {

            }
            column("MVA_LRF_TRANSFORMER_B_PHASE"; "07MVA LRF TRANSFORMER B-PHASE")
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