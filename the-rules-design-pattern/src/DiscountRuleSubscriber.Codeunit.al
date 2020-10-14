codeunit 50112 DiscountRuleSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::DiscountCalculator, 'OnExecute', '', false, false)]
    local procedure OnExecute(DiscountEvaluator: Codeunit DiscountEvaluator; CustomerNo: Code[20]; var Discount: Decimal)
    var
        GoldCustomerDiscountRule: Codeunit GoldCustomerDiscountRule;
        SilverCustomerDiscountRule: Codeunit SilverCustomerDiscountRule;
    begin
        DiscountEvaluator.Evaluate(GoldCustomerDiscountRule, CustomerNo, Discount);
        DiscountEvaluator.Evaluate(SilverCustomerDiscountRule, CustomerNo, Discount);
    end;
}