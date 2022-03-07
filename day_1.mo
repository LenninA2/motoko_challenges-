import Debug "mo:base/Debug";
import Array "mo:base/Array";
import lter "mo:base/Iter";
import Iter "mo:base/Iter";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func add(n : Nat, m : Nat) : async Nat {
    return (n + m);
  };

  public func square(n : Nat) : async Nat {
    return (n**2);
  };

  public func days_to_second(n : Nat) : async Nat {
    return (n*24*60*60);
  };

  var counter : Nat = 0;
  public func increment_counter(n : Nat) : async Nat {
    counter += n; 
    return (counter);
  };

  public func clear_counter() : async Nat {
    counter := 0;
    return (counter);
  };

  public func divide(n : Nat, m : Nat) : async Bool {
    let remainder = n % m;
    if(remainder == 0) {
        return (true) 
      } else {
        return (false);
      }
    };
  
  public func is_even(n : Nat) : async Bool {
    if(n % 2 == 0){
      return (true)
    } else {
      return (false);
    }
  };

  public func sum_of_array(userArray : [Nat]) : async Nat {
    var sum = 0;
    if(userArray.size() == 0){
      return 0;
    } else {
      for (value in userArray.vals()){
        sum += value;
      };
    };
   return sum;
  };

  public func maximum(userArray : [Nat]) : async Nat {
    var max : Nat = 0; 
    if(userArray.size() == 0){
      return 0;
    } else {
      for(value in userArray.vals()){
        if(value >= max){
          max := value;
        };
      };
    };
    return max;
  };


  // uses the filter array function to remove an Natural # n from any array
  public func remove_from_array(userArray : [Nat], n : Nat) : async [Nat] {
    let f = func(i : Nat) : Bool {
      if(i == n){
        return false;
      }else{
        return true;
      }
    };
  return(Array.filter<Nat>(userArray, f));
  };

  public func selection_sort(userArray : [Nat]) : async [Nat] {
    for(i in Iter.range(0, userArray.size() -1) ){
      var iMin : Nat = i;
      var tmp : Nat = userArray[iMin];
      for(j in Iter.range(i + 1, userArray.size() -1)){
        if(userArray[j] < userArray[i]){
          var iMin = j;
        };
        if(iMin != i){
       // userArray[iMin] := userArray[j];
        //userArray[j] := tmp;
        };
      };
    };


    return userArray;
  };

};