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
    return new Promise(function(resolve) {    // returns a promise for chaining
      console.log(this);
      window.setTimeout(function(){
        resolve();
      }, ms);
   });
};

wait(5000);

// Implementing the .ready() function in jQuery using promises
function ready() {
  return new Promise(function(resolve){
    function checkLoadState() {
      if (document.readyState !== 'loading') {
        resolve();
      }
    }
    document.addEventListener('readystatechange', checkLoadState);
    checkLoadState(); // accounts for the case when state has already changed
  });
};

// Promises template for making get requests:
function get(url) {
  return new Promise(function(resolve, reject){
      var req = new XMLHttpRequest();
      req.open('GET', url);
      req.onload = function() {
        if (req.status == 200) {
          resolve(req.response);
        } else {
          reject(Error(req.statusText));
        }
      };
      req.onerror = function() {
        reject(Error("Network error"));
      };
      req.send();
  });
};

// Sample call and chaining to handle the error
get('url')
  .then(function(response){
    // get call successful, promise resolved
  })
  .catch(function(error){
    // promise was rejected
  });

// Seems like the fetch API is a much better alternative for making HTTP requests
// See: https://developers.google.com/web/updates/2015/03/introduction-to-fetch?hl=en
// Here's a sample fetch with JSON parsing:
function get() {
  return fetch("http://jsonplaceholder.typicode.com/posts/1");
};

function getJSON() {
  return get().then(function(response){
    return response.json();
  });
};

getJSON().then(function(response){
  console.log(response);
});
