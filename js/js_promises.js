"use strict";
// Udacity has a good course on promises:
// https://www.udacity.com/course/javascript-promises--ud898
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

// this flow is called thenable - has then statements, can be chained
function getJSON() {
  return get().then(function(response){
    return response.json();
  });
};

getJSON()
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });


// Chaining promises
// When dealing with sequences of data operated in parallel, the results
// would end in a random order, like thread processes, which may not be
// what we want. You could either make them run in sequence by chaining them
// or use map to apply the function to each element, which runs in parallel.
response.results.map(function(url){
  getJSON(url).then(doSomething);
});

// Promise.all() can be used to return a promise when all of the promises
// have either resolved or any one of them has been rejected
// The previous example can be changed to:
Promise.all(response.results.map(getJSON));
