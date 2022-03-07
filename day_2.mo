import Nat8 "mo:base/Nat8";
import E "mo:base/Error";

actor {

  type ErrorCode = {
    #canister_reject
  };

  public func nat_to_nat8(n : Nat) : async Nat8 {

    if(n < 256 and n >= 0 ){
      return (Nat8.fromNat(n));
    }else{
      //throw(E.Error);
      return 0;
    };
  };

  public func max_number_with_n_bits(n: Nat) : async Int {
    return 2**n;
  }
};