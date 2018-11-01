pageextension 50100 "PaymentTermsCode" extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Payment Terms Code"; "Payment Terms Code")
            {
                TableRelation = "Payment Terms";
                CaptionML = ENU = 'Payment Terms Code', DEU = 'Zahlungsbedingungscode';

            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {

            Action(EditCustLadgEntries)
            {
                CaptionML = ENU = 'Edit Entries',DEU = 'Posten Editor';
                Image = Edit;

                trigger OnAction();
                begin
                    page.RunModal(50100,rec);
            
                end;
            }



        }
    }


}