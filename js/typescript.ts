// TypeScript is a strongly typed flavor of JS, compiles down to JavaScript.
// With the biggest selling point being advanced tooling.
// In large angular applications, it becomes really hard to know what type 
// a variable is because a multitude of things could be changing it. 
// TypeScript or a statically typed language can bring all those insights
// into IDE time and as a result make working with it easier. 
// Check out the typescript handbook: http://www.typescriptlang.org/Handbook

class Student {     // this is awesome!!
    fullname: string;
    // I wish they would support multiple constructors with different signatures
    // constructor(public firstname, public lastname) {        
    //     this.fullname = firstname + " " + lastname;
    // };
    
    constructor(public firstname, public middleinitial, public lastname) {        
        this.fullname = firstname + " " + middleinitial + " " + lastname;
    };
    
}


interface Person {
    firstname: string;
    lastname: string;
}

function greeter(person : Person) {
    return "Hello, " + person.firstname + " " + person.lastname;
}

var user = new Student("Jane", "M. ", "User");
console.log(greeter(user));

// Basic data types: boolean, number (floating point), string, array
var isTyped: boolean = true;
var age: number = 200;
var lst: number[] = [1, 1, 2];
var lst1: Array<number> = [1, 1, 2];    // I like this one better

enum Color { Red = 1, Green, Blue };        // this is awesome
var favColor: Color = Color.Green;
console.log(favColor);
 
var notSure: any = 4;       // generics?
notSure = "could be a string";
notSure = 4.999;

// Interfaces




// Classes


// Modules


// Generics


// Mixins

