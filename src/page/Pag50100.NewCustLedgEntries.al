page 50100 "New Cust. Ledg. Entries"
{
    PageType = List;
    SourceTable = "Cust. Ledger Entry";
    //CaptionML = ENU = 'Edit Cust. Ledg. Entries', DEU = 'Debitorposten Editor';
    Permissions = TableData "Cust. Ledger Entry" = m;
    InsertAllowed = False;
    DeleteAllowed = false;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    Editable = false;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
    
                }
                field("Due Date"; "Due Date")
                {
                    Editable = false;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}