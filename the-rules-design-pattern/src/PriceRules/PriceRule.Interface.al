interface PriceRule
{
    procedure CanExecute(ItemNo: Code[20]; CustomerNo: Code[20]): Boolean;
    procedure Execute(ItemNo: Code[20]; CustomerNo: Code[20]): Decimal;
}