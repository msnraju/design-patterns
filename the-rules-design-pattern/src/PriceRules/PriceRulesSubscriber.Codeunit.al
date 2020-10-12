codeunit 50112 PriceRulesSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PriceRules, 'OnExecute', '', false, false)]
    local procedure OnExecute(ItemNo: Code[20]; CustomerNo: Code[20]; var Price: Decimal)
    var
        PriceRules: Codeunit PriceRules;
        PriceRuleForGoldCustomer: Codeunit GoldCustomerPriceRule;
        PriceRuleForGoldSilver: Codeunit SilverCustomerPriceRule;
    begin
        PriceRules.ExecuteRule(PriceRuleForGoldCustomer, ItemNo, CustomerNo, Price);
        PriceRules.ExecuteRule(PriceRuleForGoldSilver, ItemNo, CustomerNo, Price);
    end;
}