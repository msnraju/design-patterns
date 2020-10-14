codeunit 50111 SilverCustomerDiscountRule implements DiscountRule
{
    procedure CanProcess(CustomerNo: Code[20]): Boolean;
    var
        Customer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        if Customer."Customer Price Group" = 'SILVER' then
            exit(true);
    end;

    procedure Process(CustomerNo: Code[20]): Decimal;
    var
        Customer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        case Customer."Gen. Bus. Posting Group" of
            'DOM':
                exit(0.01);
            else
                exit(0.015);
        end;
    end;
}