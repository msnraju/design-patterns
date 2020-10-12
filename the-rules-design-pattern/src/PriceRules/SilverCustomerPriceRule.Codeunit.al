codeunit 50111 SilverCustomerPriceRule implements PriceRule
{
    procedure CanExecute(ItemNo: Code[20]; CustomerNo: Code[20]): Boolean;
    var
        Customer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        if Customer."Customer Price Group" = 'SILVER' then
            exit(true);
    end;

    procedure Execute(ItemNo: Code[20]; CustomerNo: Code[20]): Decimal;
    var
        Customer: Record Customer;
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        exit(Item."Unit Price" - (Item."Unit Price" * 0.025));
    end;
}