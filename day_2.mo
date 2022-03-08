import Nat8 "mo:base/Nat8";
import Error "mo:base/Error";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";

actor {

  public func nat_to_nat8(n : Nat) : async Nat8 {

    if(n < 256 and n >= 0 ){
      return (Nat8.fromNat(n));
    }else{
      throw Error.reject("bad");
      return 0;
    };
  };

  public func max_number_with_n_bits(n: Nat) : async Int {
    return 2**n;
  };

  public func decimal_to_bits(n: Nat) : async Text {
    var binary_string : Text = "";
    var iter : Int = n;
    while(iter != 0){
      //binary_string.Text.concat((iter % 2) : Text, binary_string : Text);
      iter := iter/2;
    };
    return binary_string;
  };


  //does not work, having issues inputing a char value 
  //dfx canister call day_2 capitalize_character '("a")'  or '(a)' does not work
  // I would get the unicode and then -32 from it to get the capitaliztion
  public func capitalize_character(c : Char) : async Nat32 {
    
    return Char.toNat32(c);
  };

  
  public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };


  //here I would from loop for each char value in t then run the capitalize_character for each char for(c )
  public func capitalize_text(t: Text) : async Text {
    return "hi";
  }
};