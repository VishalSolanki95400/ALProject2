page 50105 RGPCardPage
{
    ApplicationArea = All;
    Caption = 'RGPCardPage';
    PageType = Card;
    SourceTable = RGPHeader;


    layout
    {
        area(content)
        {
            group(GroupName)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    trigger OnValidate()
                    var
                    begin
                        rec."Document Date" := Today;
                        rec."Posting Date" := Today;
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Locationcode; Rec.Locationcode)
                {
                    ToolTip = 'Specifies the value of the Locationcode field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("No. Series"; Rec."No. Series")
                {

                }
                field("Post "; Rec."Post ")
                {
                    ToolTip = 'Specifies the value of the Post  field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Transporter Vendor No."; Rec."Transporter Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Transporter Vendor No. field.';
                }
                field("Gr/RR No."; Rec."Gr/RR No.")
                {
                    ToolTip = 'Specifies the value of the Gr/RR No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Shipment Method"; Rec."Shipment Method")
                {
                    ToolTip = 'Specifies the value of the Shipment Method field.';
                }
                field("Gate Entry Inward"; Rec."Gate Entry Inward")
                {
                    ToolTip = 'Specifies the value of the Gate Entry Inward field.';
                }
                field("Gate Entry Outword"; Rec."Gate Entry Outword")
                {
                    ToolTip = 'Specifies the value of the Gate Entry Outword field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(subform)
            {

                part(General; RGPsubformpage)
                {
                    SubPageLink = "Document No." = field("Document No.");
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Promoted = true;

                trigger OnAction()
                var
                    PRH: Record RGPHeader;
                    PPRH: record "PostedRGPheader";
                    PRL: Record RGPLine;
                    PPRL: Record "PostedRGPLine";
                begin
                    if rec."Post " = true then begin
                        rec.TestField(Status, rec.Status::Release);
                        rec.TestField(Rec."Post ");
                        PRL.SetRange("Document No.", rec."Document No.");
                        if prl.FindFirst() then
                            PRL.TestField(Quantity);
                        PPRH.Init();
                        PPRH.TransferFields(Rec);
                        PPRH.Insert();



                        PPRL.SETRANGE("Document No.", Rec."Document No.");
                        if PRL.FindSet() then begin
                            repeat
                                PPRL.INIT();
                                PPRL."Document No." := PRL."Document No.";
                                PPRL."Line No" := PRL."Line No";
                                PPRL.Description := PRL.Description;
                                PPRL."Description 2" := PRL."Description 2";
                                PPRL.UOM := PRL.UOM;
                                PPRL."No" := PRL.No;
                                PPRL."Location Code" := PRL."Location Code";
                                PPRL."Document No." := PRL."Document No.";
                                PPRL."Line no" := PRL."Line no";
                                PPRL.Remarks := PRL.Remarks;
                                PPRL."Unit Cost" := PRL."Unit Cost";
                                PPRl."Issue Type" := PRL."Issue Type";
                                PPRL."FARGP Led. Entry No." := PRL."FARGP Led. Entry No.";


                                PPRL.Quantity := PRL.Quantity;
                                PPRL.Insert();
                            until PRL.NEXT = 0;
                        end;

                        Message('The document has been posted.');
                    end else
                        Error('The posting cannot be performed because the Post boolean is not true.');
                end;



            }
            action(Release)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Release;
                    rec.Modify();
                    rec.TestField(Status);
                    Message('Document has been Release');

                end;
            }
            action(Reopen)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    rec.Modify();
                    Rec.TestField(Status);
                    Message('Document has been Open');


                end;


            }
        }
    }
}


