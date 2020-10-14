interface DiscountRule
{
    procedure CanProcess(CustomerNo: Code[20]): Boolean;
    procedure Process(CustomerNo: Code[20]): Decimal;
}