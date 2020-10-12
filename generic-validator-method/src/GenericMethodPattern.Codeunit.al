// Generic Method Pattern
codeunit 50100 CreateSalesOrderMethod
{
    procedure CreateSalesOrder(Customer: Record Customer; HideDialog: Boolean)
    var
        Handled: Boolean;
    begin
        if not PreCreateSalesOrder(Customer, HideDialog) then
            exit;

        OnBeforeCreateSalesOrder(Customer, Handled);
        DoCreateSalesOrder(Customer, Handled);
        OnAfterCreateSalesOrder(Customer);
        PostCreateSalesOrder(Customer, HideDialog);
    end;

    local procedure PreCreateSalesOrder(Customer: Record Customer; HideDialog: Boolean): Boolean
    begin
        // UI Code
        exit(true);
    end;

    local procedure DoCreateSalesOrder(Customer: Record Customer; Handled: Boolean)
    var
        SalesHeader: Record "Sales Header";
        CreateSalesOrderValidator: Codeunit CreateSalesOrderValidator;
    begin
        // Code
        CreateSalesOrderValidator.Validate(Customer);

        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader.Insert(true);

        SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        SalesHeader.Modify();
    end;


    local procedure PostCreateSalesOrder(Customer: Record Customer; HideDialog: Boolean)
    begin
        // UI Code
    end;

    [BusinessEvent(false)]
    local procedure OnBeforeCreateSalesOrder(Customer: Record Customer; Handled: Boolean)
    begin
    end;

    [BusinessEvent(false)]
    local procedure OnAfterCreateSalesOrder(Customer: Record Customer)
    begin
    end;
}