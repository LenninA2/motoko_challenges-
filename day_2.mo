import Nat8 "mo:base/Nat8";
import Error "mo:base/Error";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";
import Array "mo:base/Array";
import Blob "mo:base/Blob";

actor {

  //  1
  public func nat_to_nat8(n : Nat) : async Nat8 {

    if(n < 256 and n >= 0 ){
      return (Nat8.fromNat(n));
    }else{
      throw Error.reject("bad");
      return 0;
    };
  };
  // 2
  public func max_number_with_n_bits(n: Nat) : async Int {
    return 2**n;
  };

  // 3
  public func decimal_to_bits(n: Nat) : async Text {
    var binary_string : Text = "";
    var iter : Int = n;
    while(iter != 0){
      //binary_string.Text.concat((iter % 2) : Text, binary_string : Text);
      iter := iter/2;
    };
    return binary_string;
  };


  // 4
  public func capitalize_character(c : Char) : async Text {
    var unicode : Nat32 = Char.toNat32(c);
    unicode -= 32;
    let ans : Char = Char.fromNat32(unicode);
    return Char.toText(ans);
  };

  // helper func
  public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };


  // 5
  public func capitalize_text(t: Text) : async Text {
    var cap_text : Text = "";
    for(char in t.chars()) {
      //    Stderr: expression of type async<$capitalize_text> Text cannot produce expected type Char
      //cap_text := cap_text # capitalize_character(char);
    };
    return cap_text;
  };

  // 6
  public func is_inside(a : Text, c : Char) : async Bool {
    for(char in a.chars()){
      if(char == c){
        return true;
      };
    };
    return false;
  };

  // 7
  public func trim_whitespace(a: Text) : async Text {
    var text_no_whitespace : Text = "";
    for(char in a.chars()){
      if(Char.isWhitespace(char) != true){
        text_no_whitespace := text_no_whitespace # Char.toText(char);
      };
    };
    return text_no_whitespace;
  };

  // 8 doesnt work atm need help debugging 
  public func duplicated_character(a : Text) : async Text {
    var chars : [Char] = [];
    for(char in a.chars()){
      let f = func(i : Char) : Bool {
      if(i == char){
        return true;
      }else{
        return false;
      };
    };
      if(Array.find<Char>(chars, f) == char){
        return Char.toText(char);
      }else{
        var char_array: [Char] = Array.make<Char>(char);
      }
    };
    return a;
  };

  // 9
  public func size_in_bytes(t: Text) : async Nat {
    let ans : Blob = Text.encodeUtf8(t);
    var blob_array : [Nat8] = Blob.toArray(ans);
    var sum = 0;
    for (value in blob_array.vals()){
        sum += Nat8.toNat(value);
    };
    return sum;
  };

  public func bubble_sort(n : [Nat]) : async [Nat]{
    
  };

};