function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config Json
    env: env,
	myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}

/*
// this is coming from   https://github.com/intuit/karate
/*
The only 'rule' is that on start-up Karate expects a file called karate-config.js
to exist on the 'classpath' and contain a JavaScript function.
The function is expected to return a JSON object and all keys and values in that
JSON object will be made available as script variables.
And that's all there is to Karate configuration !
You can easily get the value of the current 'environment' or 'profile', and
then set up 'global' variables using some simple JavaScript. Here is an example:

Here above, you see the karate.log(), karate.env and karate.configure() "helpers" being used.
Note that the karate-config.js is re-processed for every Scenario and in rare cases, you may
want to initialize (e.g. auth tokens) only once for all of your tests.
This can be achieved using karate.callSingle().
*/
