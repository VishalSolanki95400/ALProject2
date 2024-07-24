report 50131 "Employee Clearence Report"
{
    Caption = 'Employee Clearence Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\EmployeeClearence.rdl';

    dataset
    {
        dataitem("Issue Header"; "Issue Header")
        {
            RequestFilterFields = "Document Date";


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
            column(Status; Status)
            {

            }
            column(Shortcut_Dimenssion_1; "Shortcut Dimenssion 1")
            {

            }
            column(Document_Date; "Document Date")
            {

            }


            dataitem("Issue Line"; "Issue Line")
            {
                DataItemTableView = sorting("Issue No.", "Line No");
                DataItemLink = "Issue No." = field("Issue No.");
                DataItemLinkReference = "Issue Header";
                column(Item_No; "Item No")
                {

                }
                column(UOM; UOM)
                {

                }
                column(item; item."Unit Price")
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(Employee_No; "Employee No")
                {

                }
                column(Employee; Employee."First Name")
                {

                }


                trigger OnAfterGetRecord()
                begin
                    Employee.Reset();
                    if Employee.get("Employee No") then begin

                    end;

                    begin
                        item.Reset();
                        if item.Get("Item No") then begin

                        end;

                    end;
                end;

            }



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
                    // field(Date;Date)
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
                // action(LayoutName)
                // {
                //     ApplicationArea = All;

                // }
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
        Employee: Record Employee;
        item: Record Item;

}