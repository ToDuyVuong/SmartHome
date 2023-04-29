package vn.smarthome.pattern.strategy;

public interface IShippingFeeStrategy {
    double calculateShippingCost(double weight);
}
