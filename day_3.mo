import Nat8 "mo:base/Nat8";
import Error "mo:base/Error";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";
import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";

actor{

    private func _swap<A>(array : [A], i : Nat, j : Nat) : [A] {
        let array_mutable = Array.thaw<A>(array);
        let tmp = array_mutable[i];
        array_mutable[i] := array_mutable[j];
        array_mutable[j] := tmp;
        return Array.freeze<A>(array_mutable);
    };

    //public func swap_test<Nat>(array : [Nat]) : async [Nat] {
      //  return _swap<Nat>(array, 1,2);
    //};


    //2
    public func init_count(n : Nat) : async [Nat] {
        var counter = 0;
        let buffer : Buffer.Buffer<Nat> = Buffer.Buffer<Nat>(0);
        while(counter != n){
            counter += 1;
            buffer.add(counter);
        };
        return buffer.toArray(); 
    };

    //3
    public func seven(array: [Nat]) : async Text {
        for(value in array.vals()){
            if(value == 7) {
                return "Seven was found!"
            };
        };
        return "seven was not found"
    };

    //4 use <opt Nat> to call variables with ?NAt   
    public func nat_opt_to_nat(n: ?Nat, m : Nat) : async Nat {
        switch(n){
            case(null) {
                return m;
            };
            case(?n){
                return n;
            };
        };
    }; 

    //5
    public func day_of_the_week(n: Nat) : async ?Text {
        switch(n){
            case(1){
                return ?"Monday";
            };
            case(2){
                return ?"Tuesday";
            };
            case(3){
                return ?"Wednesday";
            };
            case(4){
                return ?"Thursday";
            };
            case(5){
                return ?"Friday";
            };
            case(6){
                return ?"Saturday";
            };
            case(7){
                return ?"Sunday";
            };
            case(n){
                return null;
            };
        };
    };

    // 6
    public func populate_array(array : [?Nat]) : async [Nat] {
        let f = func(n : ?Nat) : Nat{
            switch(n){
                case(null) {
                    return 0;
                };
                case(?n){
                    return n;
                };
            };
        };
        return Array.map<?Nat, Nat>(array, f);
    };

    //7
    public func sum_of_array(array: [Nat]) : async Nat {
        let sum = func(n: Nat, m: Nat) : Nat {
            return n+m;
        };
        return Array.foldRight(array, 0, sum);
    };

    //8
    public func squared_array(array: [Nat] ) : async [Nat] {
        let f = func(n : Nat) : Nat{
            switch(n){
                case(n) {
                    return n**2;
                };
            };
        };
        return Array.map<Nat, Nat>(array, f);
    };

    //9
    public func increase_by_index(array: [Nat]) : async [Nat] {
        let add_by_index = func(n: Nat, m :Nat) : Nat {
            return n+m;   
        };
        return Array.mapEntries<Nat, Nat>(array, add_by_index);
    };

    //10
    public func contains<A>(array: [A], a : A, f : (A,A) -> Bool): async Bool {
        for(i in Iter.range(0, array.size() -1)){
            if(f(array[i], a)){
                return true;
            };
        };
    return false;
  };


};