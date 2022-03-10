import Weed "weed";
import Animal "animal"

actor {

    // 1
    public type Weed = Weed.Weed;
    public func fun() : async Weed {
        let bubba_kush : Weed = {
            strain = "bubba_kush";
            amount_in_oz = 1;
        };
        return bubba_kush;
    };

    public type Animal = Animal.Animal;
}