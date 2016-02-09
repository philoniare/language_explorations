"use strict";

// Promises are used to operate on deferred and asynchronous computations
// that might involve API requests. Basically, you promise to do something
// once some condition is fulfilled like the completion of an asynchronous
// call. Here is a comprehensive guide:
//  http://www.html5rocks.com/en/tutorials/es6/promises/

// Promises can be in 4 states:
//    - fulfilled: action succeeded
//    - rejected: action failed
//    - pending: the result of the action is still not known and is waiting
//    - settled: has either fulfilled or rejected

// Example promise:
new Promise(function(resolve) {
  console.log('first');
  resolve();                    // the passed parameter gets passed to next then
  console.log('second');
}).then(function() {            // promise executes the next chain when settled
  console.log('third');
});
// If a promise is passed, it gets executed first and the value is passed over

function wait(ms) {
  console.log(this);
  return new Promise(function(resolve) {
    window.setTimeout(function(){
      console.log(this);
    }, ms);
    console.log(this);
    resolve();
  });
};

wait(5);
