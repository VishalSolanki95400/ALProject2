page 50112 mechanicalListpage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Safety;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Safety Shoes"; Rec."Safety Shoes")
                {
                    ApplicationArea = All;
                }
                field("Welding Screen"; Rec."Welding Screen")
                {
                    ApplicationArea = All;
                }
                field("All Compressed gas cylinder"; Rec."All Compressed gas cylinder")
                {
                    ApplicationArea = all;
                }
                field("Flash back Arreslor"; Rec."Flash back Arreslor")
                {
                    ApplicationArea = all;
                }
                // field(Apron; Rec.Apron)
                // {
                //     ApplicationArea = All;
                // }
                field("Warning Tape"; Rec."Warning Tape")
                {
                    ApplicationArea = All;
                }
                field("Ear Plug"; Rec."Ear Plug")
                {
                    ApplicationArea = All;
                }
                field("Competent Supervisor1"; Rec."Competent Supervisor")
                {
                    ApplicationArea = all;
                }
                field("ESS & Helmet"; Rec."ESS & Helmet")
                {
                    ApplicationArea = All;

                }
                field("Insulated tools forwork"; Rec."Insulated tools forwork")
                {
                    ApplicationArea = All;
                }
                field("Control Fuse Removal"; Rec."Control Fuse Removal")
                {
                    ApplicationArea = All;
                }
                field("Discharged rod"; Rec."Discharged rod")
                {
                    ApplicationArea = all;
                }
                field("Full body harness"; Rec."Full body harness")
                {
                    ApplicationArea = all;
                }
                field("Test lamp"; Rec."Test lamp")
                {
                    ApplicationArea = all;
                }
                field("Danger board"; Rec."Danger board")
                {
                    ApplicationArea = all;
                }
                field("Working Platform"; Rec."Working Platform")
                {
                    ApplicationArea = All;
                }
                field("Competent Supervisor"; Rec."Competent Supervisor")
                {
                    ApplicationArea = all;
                }
                field("Gas Prone/Confined Space"; Rec."Gas Prone/Confined Space")
                {
                    ApplicationArea = All;
                }
                field("Oxygen deficiency"; Rec."Oxygen deficiency")
                {
                    ApplicationArea = all;
                }
                field("Ventilation & frameproof"; Rec."Ventilation & frameproof")
                {
                    ApplicationArea = all;
                }
                field(Apron; Rec.Apron)
                {
                    ApplicationArea = All;
                }
                field("Adequate means of access"; Rec."Adequate means of access")
                {
                    ApplicationArea = All;
                }
                field("Equipment properly flushed"; Rec."Equipment properly flushed")
                {
                    ApplicationArea = All;
                }
                field("Medical O2 Cylinder"; Rec."Medical O2 Cylinder")
                {
                    ApplicationArea = All;
                }
                field("safe & appropriate hand"; Rec."safe & appropriate hand")
                {
                    ApplicationArea = All;
                }
                field("Continuous Supervision"; Rec."Continuous Supervision")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}