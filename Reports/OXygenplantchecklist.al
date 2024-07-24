report 50155 OxygenPlantchecklistexcell
{

    Caption = 'Oxygen Plant Checklistexcell';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem(PostedOxygenPlantChklistHeader; PostedOxygenPlantChklistHeader)
        {
            RequestFilterFields = CheckPoint;
            trigger OnPreDataItem()
            begin
                MakeHeader();
                PostedOxygenPlantChklistHeader.SetRange("Date", FromdateG, todateG);

                TempExcelBufferG.DeleteAll


            end;

            trigger OnAfterGetRecord()
            begin


                MakeBody();
            end;


        }

    }
    RequestPage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    Caption = 'Date Filters';
                    field(FromdateG; FromdateG)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                        trigger OnValidate()
                        begin

                        end;
                    }
                    field(todateG; todateG)
                    {
                        ApplicationArea = All;
                        Caption = 'To Date';
                        trigger OnValidate()
                        begin

                        end;
                    }

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBufferG.Reset();
        TempExcelBufferG.DeleteAll();
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook;
    end;

    local procedure MakeHeader()
    var

    begin
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn(Companyinfo.Picture, false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(Companyinfo.Name, false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(Companyinfo.Address + Companyinfo."Address 2", false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(Companyinfo.City + Companyinfo."State Code", false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(Companyinfo."GST Registration No.", false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Oxygen Plant Checklist', false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow();
        TempExcelBufferG.AddColumn('Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Checkpoint', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Employee Name', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Name of a Job', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Frequency', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('0:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('1:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('2:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('3:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('4:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('5:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('6:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('7:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('8:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('9:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('10:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('11:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('12:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('13:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('14:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('15:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('16:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('17:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('18:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('19:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('20:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('21:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('22:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('23:00', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Remarks', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);


    end;

    local procedure MakeBody()
    var

    begin
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader.Date, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader.CheckPoint, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."Employee Name", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."Name of a Job", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader.Frequency, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."0:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."1:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."2:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."3:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."4:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."5:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."6:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."7:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."8:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."9:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."10:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."11:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."12:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."13:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."14:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."15:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."16:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."17:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."18:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."19:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."20:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."21:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."22:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader."23:00", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn(PostedOxygenPlantChklistHeader.Remarks, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);

    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBufferG.CreateNewBook('Oxygen Plant Checklist');
        TempExcelBufferG.WriteSheet('Oxygen Plant Checklist', CompanyName, UserId);
        TempExcelBufferG.CloseBook();
        TempExcelBufferG.SetFriendlyFilename('Oxygen Plant Checklist');
        TempExcelBufferG.OpenExcel();
    end;


    var
        Companyinfo: record "Company Information";
        ILEG: Record "Item Ledger Entry";
        TempExcelBufferG: Record "Excel Buffer" temporary;
        FromdateG: Date;
        todateG: Date;
}
