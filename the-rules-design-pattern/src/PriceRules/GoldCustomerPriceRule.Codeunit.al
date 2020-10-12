codeunit 50110 GoldCustomerPriceRule implements PriceRule
{
    procedure CanExecute(ItemNo: Code[20]; CustomerNo: Code[20]): Boolean;
    var
        Customer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        if Customer."Customer Price Group" = 'GOLD' then
            exit(true);
    end;

    procedure Execute(ItemNo: Code[20]; CustomerNo: Code[20]): Decimal;
    var
        Customer: Record Customer;
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        exit(Item."Unit Price" - (Item."Unit Price" * 0.05));
    end;
}