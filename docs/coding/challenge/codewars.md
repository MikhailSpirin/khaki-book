---
Title: Codewars
Author: m
Date: 26082023
---
# Intro

I have a long story about [Codewars](http://www.codewars.com), i started it with Java, continued with JS, now im training Python and SQL. For me, its the best source of interesting algorithmic tasks. Return to it time to time...

# Katas!

---

## Kata 1: Vowel Count

Meta | Content
-----|-----------
Date | 2021-03-22
Link | https://www.codewars.com/kata/54ff3102c1bad923760001f3/

### My solution

Return the number (count) of vowels in the given string.


```javascript
function getCount(str) {
  let vowelsArr = str.match(/[aeiou]/ig)
  return vowelsArr != null ? vowelsArr.length : 0;
}
```

## Best another solution

Cool lesson is working with null - this is clever solution:

```javascript
const getCount = (str)=>(str.match(/[aeiou]/ig)||[]).length;
```

---

## Kata 2: Next Perfect Square

Meta | Content
-----|-----------
Date | 2021-03-23
Link | https://www.codewars.com/kata/56269eb78ad2e4ced1000013

### My solution

```javascript
function findNextSquare(sq) {
  let base = Math.sqrt(sq);
  return base % 1 != 0 ? -1 : (base+1)*(base+1);
}
```

---

## Kata 3: Camel Case

Meta | Content
-----|-----------
Date | 2021-03-24
Link | https://www.codewars.com/kata/517abf86da9663f1d2000003

### My solution

```javascript
function toCamelCase(str){
  return str.split(/[-_]/).map((x,i) => i==0 ? x : x.charAt(0).toUpperCase() + x.slice(1)).join("")
}
```

Main problem here for me was:
* several separators for split (now it know i can use regexp in split(re))
* to exclude first character. Solved with checking index,
but i think better way may be is to use reduce. But i didn't find how to do it...
Example of something similar is here:

```javascript
var products = [{ Name: 'milk', price: 2.50, Category: 'groceries' }, { Name: 'shirt', price: 10, Category: 'clothing' }, { Name: 'apples', price: 5, Category: 'groceries' }],
    categories = products.reduce(function (r, a) {
        if (!~r.indexOf(a.Category)) {
            r.push(a.Category);
        }
        return r;
    }, []);
```

// this solution is also cool, based completely on regexps. Didn't know i can use function in replace:
```javascript
function toCamelCase(str){
      var regExp=/[-_]\w/ig;
      return str.replace(regExp,function(match){
            return match.charAt(1).toUpperCase();
       });
}
```

---

## Kata 4: Trailing Zeros

Meta | Content
-----|-----------
Date | 2021-04-23
Link | https://www.codewars.com/kata/52f787eb172a8b4ae1000a34/train/javascript

### My solution

```javascript
function zeros (n) {
  let factors5 = []
  let num = 1;
  do
    factors5 = [...factors5, num *=5];
  while (num<n);
  return factors5.reduce((counter, item)=> counter += Math.floor(n / item), 0)
}
```

Very cool cata, but its pure math, its not that much dev here.
I tried 3 approaches - first generate array of digits and then delete all except 2,5 and 0. Too big array. 12s timeout/
2nd approach was - find how many terms i have - of 2 and 5 and 0. Works with big problem,failed after 100 (because of 25)
Solved it only by finding solutioon outside - that we have anough factors 2, so we need only how much 5s, 25s, 125s we have there
Overengineered, generated array of factors5 and then reduce on it

## Best another solution

```javascript
function zeros (n) {
  var zs = 0;
  while(n>0){
    n=Math.floor(n/5);
    zs+=n
  }
  return zs;
}
```

---

## Kata 5 Decode Morse

Meta | Content
-----|-----------
Date | 2021-03-29
Link | https://www.codewars.com/kata/54b724efac3d5402db00065e

### My solution

```javascript
decodeMorse = function(morseCode){
  return morseCode.split("   ").map(word=>word.split(" ").map(ch=>MORSE_CODE[ch]).join("")).join(" ").trim();
}
```

Problem is internal map. I guess for best practices, it would be much better
if i had an internal function for decoding separate letters - much readable,
and i found such solution at 1st place among best practices

## Best another solution

```javascript
decodeMorse = function(morseCode){
  return morseCode
    .trim()
    .split(/  | /)
    .map( (code) => MORSE_CODE[code] || ' ')
    .join('');
}
```

---

## Kata 6 Grandmother Walk

Meta | Content
-----|-----------
Date | 2021-03-31
Link |

### My solution

```javascript
function isValidWalk(walk) {
  return walk.length == 10 &&
    walk.filter(x=>x=='n').length-walk.filter(x=>x=='s').length == 0 &&
    walk.filter(x=>x=='e').length-walk.filter(x=>x=='w').length == 0 ? true : false;
}
```

// First tried to solve it via reducing array - using its items as commands
// then went for some coffee and understand that there is no sense in it,
//i can isolate each separate dimension and just count its ++ and --.
// So task is 3 conditions now and became very simple.

// No other solutions today, i didn't find anything interesting.
//Maybe, counting commands could be extracted to separate function

---

## Kata 7: Break Camelcase

Meta | Content
-----|-----------
Date | 2021-04-01
Link | https://www.codewars.com/kata/5208f99aee097e6552000148

### My solution

```javascript
function solution(string) {
    return string.split("")
      .reduce((acc,c)=> c.toLowerCase()!=c ? acc+" "+c : acc+c, "")
}
```

## Best another solution

I know i know its regexp. Capturing groups, lookahead probably and $1 $2.
But i wanted to train reduce, its the only higher order function, which i don't "feel" yet.
But i definitely feel its very powerful.

Solution came suprisingly fast, i just had to remember how to return acc. BTW, correct namings helped, need to remember this - use acc, curr, i, arr - this helps to wrtie "return" statement accordingly.

---

## Kata 8 Rule of divisibility by 13

Meta | Content
-----|-----------
Date | 2021-04-03
Link | https://www.codewars.com/kata/564057bc348c7200bd0000ff

### My solution

```javascript
let seq=[1,10,9,12,3,4];

function thirt(n) {
  let nNew = n.toString().split("").reverse().reduce((acc,curr,index)=>{
    return acc += +curr*seq[index % 6];
   }, 0);
  if (n == nNew) return n;
  else {    
    return thirt(nNew);
  }
}
```

Here i really liked my idea about seq[index % 6]. Task is to apply some fixed sequence to long list of didgits (i don't know what is length of this list).
I just take all seprate digits and apply element of sequence with index % 6. Need to remember this approach...+++

---

## Kata 9 Common Denominator

Meta | Content
-----|-----------
Date | 2021-04-04
Link | https://www.codewars.com/kata/54d7660d2daf68c619000d95


### My solution

```javascript
function convertFrac(lst){
  const lcm = (a,b) => a/gcd(a,b)*b;
  const gcd = (a,b) => b==0 ? a : gcd (b, a % b);
  let commonDenom = lst.map(x=>x[1]).reduce((acc,curr)=>lcm(acc,curr), 1);
  return lst.reduce((acc,curr)=> `${acc}(${curr[0]*commonDenom / curr[1]},${commonDenom})`,"")
}
```

I'm very proud of my reduce usage, its very cool in this case. Also it was interesting to try again gcd recursion.
I hope i will remember algorithm once. At least i remember gcd/lcm terms.

---

## Kata 10 Sum Maximum Subarray

Meta | Content
-----|-----------
Date | 2021-04-04
Link | https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c

### My solution

```javascript
var maxSequence = function(arr){
  let bestSum = 0;
  return arr.reduce((acc, curr)=>{
    bestSum = (bestSum + curr > curr) ? bestSum + curr : curr;
    return (acc > bestSum) ? acc : bestSum
  },0)
}
```

This is another algorytm - Kadane Algorytm, which i have no chance to come up with)) So i just read about it it in wiki and created my understood version of it

nothing that clever in other solutions tho

---

## Kata 12: Multiply N Primes

Meta | Content
-----|-----------
Date | 2021-04-06
Link |

### My solution

```javascript
function numPrimorial(n){
  const findPrimes = (lim) => {
    let arr = Array(lim).fill(true);
    arr[0]=arr[1]=false;
    for (let i=2; i<=Math.sqrt(lim); i++)
      if (arr[i] == true) for (j=i*i; j<lim; j+=i)
        arr[j] = false;  
    return arr.reduce((out, bool, i) => bool ? out.concat(i) : out, [] );
  }
  primes=[];
  for (i=n; primes.length < n; i*=2) primes = findPrimes(i);
  return primes.slice(0,n).reduce((acc,curr) => acc *= curr, 1)
}
```


I hope i will finally remember Sieve of Eratosthenes algorytm. Each time.. This is very logical question on any interview, i must remember it

Another problem - i know it can be optimized, because i calculate array or primes each time

---

## Kata 13: Decomposing Factorial

Meta | Content
-----|-----------
Date | 2021-04-08
Link |

### My solution

```javascript
function decomp(n) {
  const subDecomp = (num,dividers) => {
    let rem = num;
    for (let i=2; i<=Math.sqrt(num); i++) {
      if (rem % i === 0){
        if (!dividers[i]) dividers[i] = 0;
        while (rem % i === 0){
          dividers[i]++;
          rem /= i;
        }
      }
    }
    if (rem > 1)
      dividers[rem] = !dividers[rem] ? 1 :dividers[rem]+1;
    return dividers;
  }
  divs = {};
  for (let i=2; i<=n; i++){
    divs=subDecomp(i,divs);
    }
  return Object.keys(divs).map(x=>divs[x] == 1 ? x : `${x}^${divs[x]}`).join(' * ');
}
```

my first attempt took me too far. I should reduce usage of reduce and stop generating arrays all the time -

it didn't pass random tests due to time of execution.. of course, there are very many divisions

and i cheated for original solution.. found idea on different site...


## Best another solution

```javascript
function getPrimes(n) {
  let lim = Math.sqrt(n);
  let numbers = Array(n+1).fill().map((_,i)=>i);
  numbers[0] = numbers[1]=0;
  for (i=2; i<lim; i++)
    for (j=i*2; j<numbers.length; j+=i)
      numbers[j]=0;
  return numbers.filter(i=>!!i)
}

function getDivs(n,primes) {
  //console.log(primes);
  return primes.reduce((acc,curr)=>{
    let divs = [];
    while (n % curr == 0 && n >= curr){
      n /= curr;
      divs = [...divs, curr];
    }
    return [...acc,...divs];
  },[])
}

function decomp(n) {
  let primes = getPrimes(n);
  let divs = Array(n+1).fill().map((_,i)=>i).filter(i=>i >= 2)
      .reduce((acc,curr)=>[...acc, ...getDivs(curr,primes)],[])
      .reduce(function(acc, curr) {
          acc[curr] = (acc[curr] || 0) + 1;
          return acc;
      }, {});
  return Object.keys(divs).map(x=>divs[x] == 1 ? x : `${x}^${divs[x]}`).join(' * ');
}
```

---

## Kata 14: Difference Between Arrays"

Meta | Content
-----|-----------
Date | 2021-04-08
Link | https://www.codewars.com/kata/523f5d21c841566fde000009

### My solution

```javascript
function arrayDiff(a, b) {
  return a.reduce((acc, curr) => b.indexOf(curr) == -1 ? [...acc, curr] : acc, []);
}
```

thought it is very clever until i saw this one:

## Best another solution

```javascript
function array_diff(a, b) {
  return a.filter(e => !b.includes(e));
}
```

i forgot about filter...

---

## Kata 15: Word of A10n"

Meta | Content
-----|-----------
Date | 2021-04-10
Link | https://www.codewars.com/kata/5375f921003bf62192000746

### My solution

```javascript
const abbreviate = (string) => string.replace(/\w+/gim,
        (s)=>s.length<4 ? s : `${s.slice(0,1)}${s.length-2}${s.slice(s.length-1)}`);
```

## Best another solution

Oneliner - which i do like. Cool that my solution is actually almost exactly "best practices" + "clever" solution.

---

## Kata 16: Count Presses"

Meta | Content
-----|-----------
Date | 2021-04-11
Link | https://www.codewars.com/kata/54a2e93b22d236498400134b

### My solution

```javascript
function presses(phrase) {
  let combi = ['1', 'ABC2', 'DEF3', 'GHI4', 'JKL5', 'MNO6', 'PQRS7', 'TUV8', 'WXYZ9', '*', ' 0', '#' ];
  return phrase.toUpperCase().split("").reduce((acc, curr)=>{
    let word = combi.filter(i=>i.includes(curr))[0];
    return acc+word.indexOf(curr)+1;
  },0);
}
```

Very important in this kata for my POV - how to make it simple and effective, so that in real life you can give it diffreent keyboard layouts

But now i think that simples solution might be better - just additional helper to transform
layouts to number of presses and store object with "symbol":"number of presses"

---

## Kata 17: Longest Palindrome

Meta | Content
-----|-----------
Date | 2021-04-12
Link |

### My solution

```javascript
longestPalindrome=function(s){
  const checkIfPalindrome = (arr) => arr.join("") == arr.reverse().join("")
  const findMaxPalindrome = (acc,c,ind,arr)=> {    
    let maxP = "";
    //check case of odd length palindrome
    let j=1;
    let tryP = c;
    while((ind-j)>=0 && (ind+j)<=arr.length) {
      tryP = [arr[ind-j], ...tryP, arr[ind+j]];
      if (checkIfPalindrome(tryP) && tryP.length > maxP.length) {
        maxP = tryP.join("");
      } else break;
      j++;
    }

    j=1;
    tryP = [c, arr[ind+1]];
    while((ind-j)>=0 && (ind+j+1) <= arr.length) {
      tryP = [arr[ind-j], ...tryP, arr[ind+j+1]];
      if (checkIfPalindrome(tryP) && tryP.length > maxP.length) {
        maxP = tryP.join("");
      } else break;
      j++;
    }
    if (checkIfPalindrome(tryP) && tryP.length > maxP.length)
      maxP = tryP.join("");    
    if (!maxP) {
      maxP = c;
    }
    return acc.length < maxP.length ? maxP : acc;
  }

   return s.split("").reduce(findMaxPalindrome,[]).length;
}
```


that was really tough for me, as i couldn't find small cool algorytm for this. Except bruteforce, only
idea which i thought of is check all symbols and check if to both forward and backward it has palindrome.
Complexity looks like O(n2)
My silution has a lot to enhance, but i can't come up with good enhancements
Anyway, as o understand, there is only 1 algorytm which is simpler - manaker algorytm
Also not sure, but maybe approach which is called dynamic programming could be better than mine

by far - the most complicated task for me

---

## Kata 18: Statistics

Meta | Content
-----|-----------
Date | 2021-04-13
Link |

### My solution

```javascript
const convToMS = (i) => {
  let t = i.split("|");
  return new Date(1970,1,1,t[0],t[1],t[2]).getTime()
}
const convToDate = (i) => {
  let t = new Date(i)
  return `${zero(t.getHours())}|${zero(t.getMinutes())}|${zero(t.getSeconds())}`
}
const zero = (i) => i < 10 ? `0${i}` : i;
const stat = (strg) => {
  if (!strg) return "";
  let tMS = strg.split(", ").map(convToMS).sort((a,b)=>a-b);
  let len = tMS.length;
  let range = tMS[len-1] - tMS[0];
  let average = tMS.reduce((a,b) => a+b,0) / len;
  let median = len % 2 == 0 ? (tMS[len/2] + tMS[len/2-1]) / 2: tMS[(len-1)/2];
  return `Range: ${convToDate(range)} Average: ${convToDate(average)} Median: ${convToDate(median)}`      
}
```

Basically that wasn't complicated - string manipulation, main task here for me was to do it clean and readable
Training "team point of view" when writing a code
I see no cooler solutions than mine

Just one additional comment - here i tried to split functionality in different functions, as i try to do clean and pure functions
No modification of global vars, no complex actions - just one straigntforwad action

## Kata 19 Number to Word

Meta | Content
-----|-----------
Date | 2021-04-14
Link |

### My solution

```javascript
function number2words(n, result = ""){
  const d = {
    0:"zero", 1:"one", 2:"two", 3:"three", 4: "four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine",
    10:"ten", 11:"eleven", 12:"twelve", 13:"thirteen", 14:"fourteen", 15:"fifteen",
    16:"sixteen", 17:"seventeen", 18:"eighteen", 19:"nineteen",
    20:"twenty",30:"thirty",40:"forty",50:"fifty",60:"sixty",70:"seventy",80:"eighty",90:"ninety",
  }
    switch (true) {
        case (n<=20 || n==30 || n==40 || n==50 || n==60 || n==70 || n==80 || n==90) :
          result = `${result}${d[n]}`; break;
        case (n>20 && n<100):
          result = `${d[n-n%10]}-${d[n%10]}`; break;
        case (n%100 == 0 && n<1000):
          result = `${d[Math.round(n/100)]} hundred`; break;
        case (n>=100 && n<1000):
          result = `${d[Math.floor(n/100)]} hundred ${number2words(n%100, result)}`;break;
        case (n%1000 == 0 && n<10000):
          result = `${d[Math.floor(n/1000)]} thousand`; break;
        case (n>=1000 && n<999999):
          result = `${number2words(Math.floor(n/1000), result)} thousand ${number2words(n%1000, result)}`;break;
    }
  return result;// works for numbers between 0 and 999999   
}
```

// This task taught me that i really can use recursion in real life, and take this decision naturally. My solution is not perfect,
// i see that i added to many conditions - seems that can be done only with 3. But this is MINE solution)

// Probably after refactor i could approach this best solution. This is just a lot of ternary checks + now i see that
// i don't need object in this task

## Best another solution

```javascript
function number2words(n){
    // works for numbers between 0 and 999999
    var b=["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"];
    var b2=["twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
    if(n>=0 && n<20){
      return b[n];
    }
    if(n >= 20 && n<100){
      return b2[Math.floor(n/10)-2]+(n%10===0?'':'-'+b[n%10])
    }
    if(n>=100 && n<1000){
      return b[Math.floor(n/100)]+' hundred'+(n%100===0?'':' '+number2words(n%100));
    }else{
      return number2words(Math.floor(n/1000))+' thousand'+(n%1000===0?'':' '+number2words(n%1000));
    }
  }
```

---

## Kata 21: Reverse or rotate?

Meta | Content
-----|-----------
Date | 2021-04-16
Link | https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991/

### My solution

```javascript
function revrot(str, sz) {
  const isSumCubesDivsBy2 = (i) => i.reduce((acc,curr)=>acc+(+curr)**3, 0) % 2 == 0;
  let res=[];
  if (sz==0) return "";
  for (let i=0; i<=str.length; i+=sz)
       res.push(str.slice(i,i+sz).split(""));
  if (res[res.length-1].length<sz) res=res.slice(0,res.length-1);
  return res.map(i=>{
    return isSumCubesDivsBy2(i) ? i.reverse().join("") : [...i.slice(1), i[0]].join("")
  }).join("")
}
```

I solved the problem, but in comparison to best answer i see that i don't have enough experience (yet) about organizing code.
This thing with 3 const functions looks and reads wonderful. Code in solution below is clean and clear.
Mine is spaghetti in comparison, but i will try to improve.
Also i see that i named function wrong here...

## Best different solution

```javascript
function revrot(str, sz) {
  if (sz < 1 || sz > str.length)
    return '';

  let reverse = s => s.split('').reverse().join('');
  let rotate  = s => s.slice(1) + s.slice(0, 1);
  let sum_cubes = c => c.split('').reduce((a, b) => a + +b ** 3, 0);

  return str
    .match(new RegExp('.{' + sz + '}', 'g'))
    .map(c => sum_cubes(c) % 2 ? rotate(c) : reverse(c))
    .join('');
}
```

---

## Kata 22: Sorting liquids

Meta | Content
-----|-----------
Date | 2021-04-17
Link | https://www.codewars.com/kata/562e6df5cf2d3908ad00019e/solutions/javascript

### My solution

```javascript
function separateLiquids(glass) {   /// glass[V][H]
  const density = {
    H : 1.36,
    W : 1.00,
    A : 0.87,
    O : 0.80
  }
  const chunkArray = (arr, size) =>
  arr.length > size
    ? [arr.slice(0, size), ...chunkArray(arr.slice(size), size)]
    : [arr];
  const srt = (a,b) => density[a] == density[b] ? 0 : (density[a] > density[b] ? 1 : -1)

  if (!glass.length) return [];
  return chunkArray(glass.reduce((a,b)=>[...a, ...b]).sort(srt), glass[0].length)
}
```

This is **really** cool kata. Thing is you go through several stages here, from first assumptions to first complicatetd atom conditions to final simple and very cool solution
Before i understand that we have "left" direction and this could mean we just need to sort flat array, i spend some time on trying to get what kinds of limits we have here.

Spend some time on thinking about edge cases... Like

    00++
    ++++
    +111

But, after checking tests it turned out that this exact solution was expected. And all is good.

Also caught something new from other solutions:

## Best different solution

```javascript
const density = { H: 1.36, W: 1, A: .87, O: .8 };  

const separateLiquids = glass =>
  [].concat(...glass)
    .sort((a, b) => density[a] - density[b])
    .reduce((arr, v, i) => {
      if (!(i % glass[0].length)) arr.push([]);
      arr[arr.length - 1].push(v);
      return arr;
    }, []);
```

Cool thing here is sorting function, which i realy like and didn't come up with by myself.

---

## Kata 23: Meeting

Meta | Content
-----|-----------
Date | 2021-04-20
Link | https://www.codewars.com/kata/59df2f8f08c6cec835000012

### My solution

```javascript
const srt = (a,b) =>{
  [anew,bnew] = [a.split(":"), b.split(":")];
  return (anew[1] == bnew[1]) ? anew[0].localeCompare(bnew[0]) : anew[1].localeCompare(bnew[1])
}
const meeting = (s) => {
  let res = s.toUpperCase().split(";").sort(srt)
      .reduce((acc,cur)=>{
        let names=cur.split(":");
        return `${acc}(${names[1]}, ${names[0]})`
      },"")
  return res;
}
```

It was very interesting to solve this problem, as path is very straightforward, but im not that good in splitting main task into simple ones; in this case i managed to do this without any issues.

And then...

## Best another solution

```javascript
function meeting(s) {
  let string = s.toUpperCase().split(';')
                .map(x => x.split(':').reverse().join(', '))
                .sort()
                .join(')(')
  return '(' + string + ')'
}
```

I must have checked if sort works or not for this case without additional things. Looks like it works

---

## Kata 24: Stonks

Meta | Content
-----|-----------
Date | 2021-04-21
Link | https://www.codewars.com/kata/597ef546ee48603f7a000057

### My solution

```javascript
const count_sum = (arr)=>arr.reduce((a,b)=>a+b,0)

function getMostProfitFromStockQuotes(quotes) {
  let max = Math.max(...quotes);
  let income_arr = quotes.slice(0, quotes.indexOf(max));
  let income = max * income_arr.length - count_sum(income_arr);
  if (income < 0) income = 0;
  let left = quotes.slice(quotes.indexOf(max)+1);
  return (left.length == 0) ? income  :
    income + getMostProfitFromStockQuotes(left);
}
```

Main problem here was to understand the logic behind the task. At first i didn't get how results in tests are evaluated.
First assumtion was to evaluate array of max profits from existing stocks - like [sum(what_is_before), maxitem], then select maximum.
Next step was - understanding that it will need recursive behavior, because after first sell there might be another sells also. So i spent some time on setting up recursion for this.
Next, result didn't align with tests) BTW, i thought there are (may be) better strategy... But no, my result was lower than in tests.
Then i understood algorytm (which is just find max on current array, count income, repeat on all array which is to the right from current max)

Cool kata, interesting if there is any algorythm

## Best another solution

Absolute brilliant soltuion, day will come and i will understand logic behind it

```javascript
function getMostProfitFromStockQuotes(quotes) {
  let top=-Infinity;
  return quotes.reduceRight((p,v)=>{
    if(top<v) top=v;
    return p+top-v;
  }, 0);
}
```

---

## Kata 25 Matching and Substituting

Meta | Content
-----|-----------
Date | 2021-04-23
Link | https://www.codewars.com/kata/59de1e2fe50813a046000124/

### My solution

```javascript
function change(s, prog, version) {
  let prog_regex = /(?<=Program).*\n/gm;
  let author_regex = /(?<=Author: ).*\n/gm;
  let phone_regex = /(?<=Phone: ).*\n/gm
  let valid_phone_regex = /\+1-\d{3}-\d{3}-\d{4}\n/gm
  let corp_regex = /Corporation: .*\n/gm;
  let date_regex = /(?<=Date: )(.*)\n/gm;
  let vers_regex = /(?<=Version: ).*\n/gm;
  let valid_vers_regex = /(?<=Version: )\d+\.\d+\n/gm
  let level_regex = /Level: .*/gm;

  return !(valid_phone_regex.test(s) && valid_vers_regex.test(s)) ? "ERROR: VERSION or PHONE" :
     s.replace(prog_regex, `: ${prog} `)
      .replace(author_regex, `g964 `)
      .replace(corp_regex, ``)
      .replace(phone_regex, `+1-503-555-0090 `)
      .replace(date_regex, "2019-01-01 ")
      .replace(vers_regex, (match) => match == 2.0 ? "2.0" : version)
      .replace(level_regex, "")
}
```

Ok there are several lessons under this kata.

* Positive/negative lookaheads/lookbehinds are cool. Spent some time learning them. Very cool
* Capturing groups - last time i was far less effective with them.
* Orginizing code: this time i decided to make this template-task self explanatory and clean

These were straightforward lessons. Less stright is something veri interesting - you shouldn't do kata before fully understanding COMPLETE description. Also, this kata shows that actually transforming original task description can make work much easier. Its fun because this is exactly what i learned as part of software development process... First you always tring to understand if the task should be SO complicated. Usually its actually not.

## Best another solution

```javascript
function change(s, prog, version) {

  if (/Version: 2.0\n/.test(s))
    version = '2.0';

  if (!/Phone: (\+1-\d{3}-\d{3}-\d{4})\n/.test(s) || !/Version: \d+\.\d+\n/.test(s))
    return 'ERROR: VERSION or PHONE';

  return `Program: ${prog} Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: ${version}`;

}
```

---

## Kata 26: Dont Eat Last Cake

Meta | Content
-----|-----------
Date | 2021-04-24T13:46:33+03:00
Link |

### My solution

```javascript
// Constructor (your Captain Obivious)
function Player(){}
// Decide who move first - player or opponent (true if player)

const winning = (i) => {
  let left = (i - 2) % 4;
  return (left == 0) ? 0 : left;
}

Player.prototype.firstmove = function(cakes){
  if (cakes==1) return false;
  if (cakes==2) return false;
  return (winning(cakes) == 0) ? false : true;
}
// Decide your next move
Player.prototype.move = function(cakes, last){
  let left = winning(cakes);
  if (last == 0) return left;

  //obvious moves
  if (cakes==3 && last!=1) return 1;
   if (cakes==4 && last!=3) return 3;
   if (cakes==5 && last !=3) return 3;

  if (left == 3 && last == 1) return 3;  
  if (left == 2 && last == 2) return 1;
  if (left == 1 && last == 3) return 1;

    //sub cases of 2:2
  if (left == 3 && last == 2) return 3;
  if (left == 2 && last == 3) return 2;
}
```

This was by far most complicated one. I didn't manage to solve it in one day, started trying to find pattern and similar games. Actually i determined correct connected algorithm - https://en.wikipedia.org/wiki/Sprague%E2%80%93Grundy_theorem
But, all described games were actually games without abanoded "same move". I dind't manage to understand how to turn this into mex function which is described by that theorem... Finally i decided just to get it from logic and completely analyzed games with n<14. It helped to determin algorythm. Some time was spend on understanding how to do "series" of steps in reaction of opponent goinf out from loosing position.

Interesting that in this case

I will definitely read more about that theorem. BTW, i need to re-read math books from my childhood. I really think i will find something interesting there - mainly by Gardner.

## Best another solution

```javascript

```

---

## Kata 27 Backspaces Processing

Meta | Content
-----|-----------
Date | 2021-04-25
Link | https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/

### My solution

```javascript
function cleanString(s) {
	  return s.split("")
        .reduce((acc,curr)=>curr == "#" ? acc.slice(0,-1) : `${acc}${curr}`,"")
};
```

This was cool and simple. Clear example of reduce usage. Can't come up with something simpler.
## Best another solution

Strange, but crowd thinks that push/pop solution is better. Its a mistake. Mine or their...

---

## Kata 28: How Much

Meta | Content
-----|-----------
Date | 2021-04-26
Link | https://www.codewars.com/kata/55b4d87a3766d9873a0000d4

### My solution
Ok so 6th level for me now is usually not more than 20 mins. I should use it only if know that i will not have a chance to work on bigger kata today.

This was simple.. Just needed some math googling

```javascript
function howmuch(m, n) {
    if (m>n) [m,n] = [n,m];
    let arr = [];
    for (let x = m; x<=n; x++)
      if ((x-1)%9==0 && (x-2)%7==0)
        arr = [...arr,[`M: ${x}`,`B: ${(x-2)/7}`,`C: ${(x-1)/9}`]]    
    return arr;
}
```

## Best another solution

Ok so this is better solution, had to think how to get max better...
```javascript
function howmuch(m, n) {
  let out = [], h = Math.max(m, n);
  for(let i = Math.max(Math.min(m, n), 37); i <= h; i++) {
    //This is the stupidest data "structure" I've ever seen
    if((i - 1) % 9 == 0 && (i - 2) % 7 == 0) out.push([`M: ${i}`, `B: ${(i - 2) / 7}`, `C: ${(i - 1) / 9}`]);
  }
  return out;
}
```

---

## Kata 29 Lazy Evaluation

Meta | Content
-----|-----------
Date | 2021-04-28
Link |

### My solution

```javascript
function Lazy() {
  let functions = [];
  let obj = {
    add(...args) {
      functions.push(args);
      return this;
    },
    invoke(target) {
      return functions
        .reduce((acc, cur)=> cur[0].apply(null, [...cur.slice(1), ...acc]),target)
    }
  }
  return obj;
}
```

Finally! This is what expected when people say "functional programming". Very-very cool kata, not as complicted algorytm, but about managing functions. Was very interesting. Found half of solution by request "how to chain functions", but i had problems with understanding how to pass function with arguments to the list. Solution was to store all of it - like array of [function, ...args] in internal array of functions.
Cool! Want to do such tasks more

Oh and i forgot about constructor. But.. there was no init procedure, so probably that's fine.

## Best another solution

```javascript
class Lazy {
  constructor() {
    this.fnChain = [];
  }
  add(fn, ...args) {
    this.fnChain.push(fn.bind(this, ...args));
    return this;
  }
  invoke(args) {
    return this.fnChain.reduce((args, fn) => fn(...args), args);
  }
}
```

---

## Kata 30: Advanced Pig Latin

Meta | Content
-----|-----------
Date | 2021-04-29
Link |

### My solution

```javascript
function piggify(w) {
  let isCapital = w[0] === w[0].toUpperCase();
  let regex = /(^[b-df-hj-np-tv-z]*)([aeoui]\w*)(\W*)/;
  let piggified = w.toLowerCase().replace(regex, (_,p1,p2,p3)=>{
    return (p1.length==0) ? `${p2}way${p3}` : `${p2}${p1}ay${p3}`
  })
   return isCapital ? `${piggified[0].toUpperCase()}${piggified.slice(1)}` : piggified
}
function translate(sentence) {
  return sentence.split(" ").map(piggify).join(" ");
};
```


Look i spent some time trying to avoid regexp here) But soon understood that this adds ineviteable complexity. Thing is its manipulating chunks of string - exactly regexp is probably the best fit.

## Best another solution
Looks like i didn't think of 2 things - first that i don't necessarly need to split whole sentence into words, it would work without this redundant function. Second is - i don't need 3 groups! Punctuation just stays same as before. So i need only 1st and 2nd group to solve this. Also isCapital may be is redundant, but i used it to make code more readable.

Also if conditions - not sure i understand thin line between when to use ternary operator and when i can't use it


```javascript
function translate(sentence) {
  return sentence.replace(/\b([bcdfghjklmnpqrstvwxyz]*)(\w+)\b/gi, function(_, first, rest) {
    if (first) {
      if (first[0] == first[0].toUpperCase()) rest = rest[0].toUpperCase() + rest.slice(1)
    } else {
      first = 'w'
    }
    return rest + first.toLowerCase() + 'ay'
  })
};
```

## Kata 31: New Holiday

Meta | Content
-----|-----------
Date | 2021-05-06
Link | https://www.codewars.com/kata/58982a388927f70d8b000111/

### My solution

```javascript
function holiday(x, weekDay, month, yearNumber) {
  const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  const leapyear = ((yearNumber % 100 === 0) ? ( yearNumber % 400 === 0) : (yearNumber % 4 === 0));
  const daysinmonths = [31,  leapyear ? 29 : 28 , 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

  let firstday = (new Date(`${month} 1, ${yearNumber}`)).getDay();
  let daysnormalized = [...days.slice(firstday), ...days.slice(0, firstday)];
  let dmax = daysinmonths[months.indexOf(month)];
  let d = (x-1)*7 + daysnormalized.indexOf(weekDay) + 1;
  return d > dmax ? -1 : d
}
```

Kewl! Spent some time trying to understand how to start it. My idea is to get weekday for 1st of given year/month, then count weeks and some leftover days (between starting day and given day). It was hard to start splitting this task. I suspect all date tasks are problematic like this one

## Best another solution

```javascript
function holiday(x, weekDay, month, yearNumber) {

  const months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
  const days_of_week = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ];

  const idx_month = months.indexOf(month);
  const idx_dow = days_of_week.indexOf(weekDay);

  let date = new Date(yearNumber, idx_month, 1);

  if (date.getDay() > idx_dow)
    x++;

  date.setDate(date.getDate() + idx_dow - date.getDay() + 7 * (x - 1));

  return date.getMonth() === idx_month ? date.getDate() : -1;

}
```

Cool thing here is solving leap year problem, i subsituted 29/28 based on counting what is given year, but in this example its done by just getting if we're still in current month or moved to next (it's based on internal js Date mechanizms). This is probably better approach than mine...

---

## Kata 32 String Incrementer

Meta | Content
-----|-----------
Date | 2021-05-14
Link | https://www.codewars.com/kata/54a91a4883a7de5d7800009c/

### My solution

```javascript
const inc_zeros = (n) => {
  let r = `${+n+1}`;
  while (r.length<n.length)
    r = `0${r}`;
  return r
}

function incrementString (strng) {
  return strng.replace(/(\D*)(\d*$)/, (_,p1,p2,offset,s) => {
     console.log(p1,p2);
     if (p2.length == 0) return `${p1}1`;
     if (p2.length == p2.replace(/^0+/, '').length) return `${p1}${+p2+1}`
      else return `${p1}${inc_zeros(p2)}`;
   } );
}
```

It was hard kata for me, because i didn't manage to find beautiful solution. I feel like mine is bad, but i cant figure out what to refactor. Checking best solutions....

## Best another solution

```javascript
function incrementString(input) {
  if(isNaN(parseInt(input[input.length - 1]))) return input + '1';
  return input.replace(/(0*)([0-9]+$)/, function(match, p1, p2) {
    var up = parseInt(p2) + 1;
    return up.toString().length > p2.length ? p1.slice(0, -1) + up : p1 + up;
  });
}
```

This is very clever usage of regexps:

```javascript
function incrementString(input) {
  return input.replace(/([0-8]?)(9*)$/, function(s, d, ns) {
      return +d + 1 + ns.replace(/9/g, '0');
    });
}
```

---

## Kata 33 Simple Fun Best Match

Meta | Content
-----|-----------
Date | 2021-05-15
Link |

### My solution

```javascript
function bestMatch(ALAHLYGoals, zamalekGoals) {
  const srt = (a,b)=>{
    if (a[0]==b[0] && a[1]>b[1]) return -1;
    if (a[0]==b[0] && a[1]<b[1]) return 1;
    if (a[0]==b[0] && a[1]==b[1] && a[2]>b[2]) return 1;
    if (a[0]==b[0] && a[1]==b[1] && a[2]<b[2]) return -1;
    return a[0]>b[0] ? 1 : -1;
  }
  return zamalekGoals.map((e,i)=>[ALAHLYGoals[i]-e, e, i]).sort(srt)[0][2];
}
```

## Best another solution

```javascript
function bestMatch(aGoals, bGoals) {
   return bGoals
     .reduce((best, goals, i) => {
       const diff = aGoals[i] - goals;
       return !best.d || (diff < best.d || (diff === best.d && goals > best.v)) ? {d: diff, v: goals, i} : best;
      }, {d: null, g: null, i: null}).i;
}
```

---

## Kata 34 Sort Strings Vowels

Meta | Content
-----|-----------
Date | 2021-05-16
Link | https://www.codewars.com/kata/5d2d0d34bceae80027bffddb

### My solution

```javascript
const srt = (a,b) => {
   if (a.length == b.length) return 0;
   return a.length > b.length ? -1 : 1            
  }

const longestsubstr = (e) => (e.match(/[aeiouAEIOU]+/gm) || []).sort(srt)[0];

function sortStringsByVowels(strings){
  return strings.sort((a,b) => srt((longestsubstr(a) || []),(longestsubstr(b) || [])));
}
```

Well i think my solution is clearer) definitely i must have refactored my sorting function. But im really happy i managed to get the general approach. Also i think it's not 6, its definitely 5 kyu...

## Best another solution

```javascript
function sortStringsByVowels(ss) {
  const gl=s=>(Math.max(...(s.match(/[aeiou]+/ig)||[]).map(r=>r.length)))
  return ss.sort((a,b)=>gl(b)-gl(a));
}
```

---

## Kata 35 Snake Collision

Meta | Content
-----|-----------
Date | 2021-05-18
Link |

### My solution

https://www.codewars.com/kata/5ac616ccbc72620a6a000096/solutions/javascript

```javascript
function snakeCollision(g, m){
  let snake = [[0, 0],[0, 1],[0, 2]];
  let d = "R";
  let steps = 0;

  const isFood = (cords) => g[cords[0]][cords[1]]=='$';
  const isSnake = (cords) => snake.some((e)=>(e[0]==cords[0] && e[1]==cords[1]));
  const isBorder = (cords) => (cords[0] < 0 || cords[0] >= 13 || cords[1] < 0 || cords[1] >= 21);
  const head = () => snake[snake.length-1];
  const move = (d) => {
      let dest;

      switch (d) {
          case "D": dest = [head()[0]+1, head()[1]]; break;
          case "R": dest = [head()[0], head()[1]+1]; break;
          case "U": dest = [head()[0]-1, head()[1]]; break;
          case "L": dest = [head()[0], head()[1]-1]; break;
      }

      if (isBorder(dest)) return false;
      if (isSnake(dest)) return false;
      snake.push(dest);

      if (!isFood(dest))
        snake.shift();
      if (isFood(dest))        
        g[dest[0]] = [...g[dest[0]].slice(0, dest[1]), '-', ...g[dest[0]].slice(dest[1]+1)].join("");   
      return true;
  }

  for (const cmd of m.split(" ")) {
    if (+cmd == cmd) {
      let canMove = true;
      for (let i = 0; i<+cmd; i++) {
        canMove = move(d);
        steps++;
        if (!canMove) return [head(),steps]
      }  
    } else d = cmd;
  }
  return [head(),steps]
}
```

I actually spend some time on this. Definitely most complicated kata by now, reason is simple - it just has too many limitations which needs to be solved. Problem for me here is the fact that i don't know if i solved it right... I tried to be as clean-coded and straight-forward as possible, but still can't figure oout what can be improved.

Im not sure about existence of head() function, and im not that fond of main flow loop...
Still im happy i managed to finish it. Cool.

---

## Kata 36 Merge Strings Checker

Meta | Content
-----|-----------
Date | 2021-05-17
Link | https://www.codewars.com/kata/54c9fcad28ec4c6e680011aa

### My solution

```javascript
function isMerge(s, part1, part2) {
    const takeFromFirst = (s,arr1,arr2) => {
      for (let i in s) {
        if (s[i]==arr1[i] && s[i]==arr2[i] ) continue;
        if (s[i]==arr1[i] && s[i]!==arr2[i]) return true;
        if (s[i]!==arr1[i] && s[i]==arr2[i]) return false;
      }
    }
    let [part1arr, part2arr] = [part1.split(""),
                                part2.split("")];
    for (let i in s) {
      if (s[i] == part1arr[0] && s[i] == part2arr[0]) {
        console.log("we have very complicated situation here");
        if (takeFromFirst(s.slice(i), part1arr, part2arr))
          part1arr.shift();
        else
          part2arr.shift();
        continue;
      } else if (s[i] == part1arr[0])
        part1arr.shift();
      else if (s[i] == part2arr[0])
        part2arr.shift();
      else return false;
    }  
    if (part1arr.length>0 || part2arr.length>0) return false;
    return true;
}
```

Well it was very interesting. I manage to solve it but it ws really tough. I first tried simple and stupid way - sort 1st and concat of test strings. Didn't work like it should be)
Then i was in the cross - like what to do next? Try to improve sorting or go different way? I chose second, but still not sure it was right decision. Will spend some time trying to understand best solution.

UPD - finally i got it! I should have solved it with recursion... So stupid))

## Best another solution

This one i don't understand at all))

```javascript
function isMerge(s, part1, part2) {
  return !s ? !(part1 || part2) :
    s[0] == part1[0] && isMerge(s.slice(1), part1.slice(1), part2) ||
    s[0] == part2[0] && isMerge(s.slice(1), part1, part2.slice(1));
}
```

---

## Kata 37 Traffic Jam

Meta | Content
-----|-----------
Date | 2021-05-20
Link | https://www.codewars.com/kata/5a26073ce1ce0e3c01000023

### My solution

```javascript
var trafficJam = function(mainRoad, sideStreets) {
  let mr = mainRoad.split("");
  let out = sideStreets.reduceRight((acc,curr,i)=>{
    if (curr!="") {
      curr.split("").reverse().forEach((e,ei)=>mr.splice(i+ei*2+1, 0, e));
      return mr;
    } else
      return mr;
  }, mr);
  return out.slice(0,mr.indexOf("X")+1).join("");
}
```

That was the most amazing moment in my (not-yet-started) dev career. Really.
I spent almost whole day on this kata. Couldn't understand the approach. Tried different ones.

Main moment here is when i started to investigate, if all separate side roads addding can be somehow atomic - not like 1 car by 1 car, but whole line of cars.

With approach "pop from every not-empty array", i couldn't come up with idea how to use reduce; but if we do 1-by-1 side road, reduce will fit.

But it didn't work, so i wrote the function, it didn't solve. Also, pattern of generated string was different. So - trying different order, or may be even those insertions can't be atomic?

And then i remember that there is reduceRight function, may be it's already available in this env?... And yes and YES!!! All tests passed, except one issue (reverse order of side roads), which i solved a bit later...

## Best another solution
in javascript i see no such solution. Mine is most simple and beautiful.
)))

---

## Kata 38 Which Are In

Meta | Content
-----|-----------
Date | 2021-05-21
Link | https://www.codewars.com/kata/550554fd08b86f84fe000a58/

### My solution

```javascript
function inArray(array1,array2){
  return array1.filter(e => array2.some(str=>str.indexOf(e) != -1)).sort((a,b)=>a.localeCompare(b))
}
```

Cool, that was really simple)

---

## Kata 39 Chess Fun Cell Color

Meta | Content
-----|-----------
Date | 2021-05-24
Link | https://www.codewars.com/kata/5894134c8afa3618c9000146

### My solution

```javascript
function chessBoardCellColor(cell1, cell2) {
  const parity = (cell) => ("_ABCDEFGH".indexOf(cell.split("")[0]) + Number(cell.split("")[1])) % 2 == 0;
  return parity(cell1) === parity(cell2)
}
```

Ok, that was simple. Can't find better solution in solutions.

---

## Kata 40 Last Survivor 2

Meta | Content
-----|-----------
Date | 2021-05-25
Link |

### My solution

```javascript
function lastSurvivors(str) {
  const hasDuplicates = (arr) => new Set(arr).size !== arr.length;
  let str_arr = str.split("").map(x=>x.charCodeAt(0));
  while (hasDuplicates(str_arr)) {
    for (const c of str_arr) {
      [first,last] = [str_arr.indexOf(c), str_arr.lastIndexOf(c)]
      if (first !== last) {
        str_arr[first] = (c == 122) ? 97 : str_arr[first] + 1;
        str_arr.splice(last, 1);
        break;
      }        
    }
  }
   return str_arr.map(x=>String.fromCharCode(x)).join("");
}
```

Ok so i spent some time on this. Main problem is that i tried to solve this kata with ES6 abilities - but i failed. Problem is that we need several rimes to look through array - and i can't understand how can i do it with reduce

But, obvious refactor, which i found in other best solution - do away with char codes. I could just create an array of lowcase letters and deal with its array indexes - this is clearer and simpler than solution which i used

BTW, now i think this whole charcodes is my 2000s legacy) Thats how i solved things in my high school. Now its different times...

## Best another solution

```javascript
function lastSurvivors(str) {

  const alpha = 'abcdefghijklmnopqrstuvwxyz';

  let next = str;

  do {
    str = next;
    next = str.replace(/([a-z])(.*?)\1/g, (_, a, b) => alpha[(alpha.indexOf(a) + 1) % 26] + b);
  } while (str !== next)

  return str;

}
```

---

## Kata 41 Compose Functions T Combinator

Meta | Content
-----|-----------
Date | 2021-05-27
Link | https://www.codewars.com/kata/51f9d3db4095e07f130001ee

### My solution

```javascript
var compose = function(n, ...fns) {
  return (fns.length == 0) ? n : fns.reduce((acc,curr)=>curr(acc),n);
}
```
Ok so im amaxed how simple and quick i solved this task. Deadly simple for me, as im really get used to using reduce day-to-day. Plus, with ES6 its really simple to cut array-like arguments...

## Best another solution
Another way of solving it (didn't thinka about it) is actually using recursion, which is also +- simple to understand, even from desciption of this kata. Cool!
```javascript
const compose = (x, f, ...rest) => f ? compose(f(x), ...rest) : x;
```

---

## Kata 42 Sudoku Solver

Meta | Content
-----|-----------
Date | 2021-06-09
Link |

### My solution

Well that was... fuckingfuck. Very tough for me. Lots of cool moments. And all other things))

```javascript
function sudoku(puzzle) {
  let gaps = [], solution = [], last = 1, pushed = false;
  puzzle.forEach((nested,i) => nested.forEach((item,j) => {
    if (item === 0) gaps.push([j,i])
  }));

  while (solution.length < gaps.length) {
    let trySolution, x, y;
    [x,y] = [gaps[solution.length][0], gaps[solution.length][1]];
    pushed = false;
    for (let i = last; i <= 9; i++) {
      trySolution = renderSudoku([...puzzle.map(nested => [...nested])], gaps, solution, i);
      if (validateSolution(trySolution)){
        solution.push(i);
        pushed = true;
        break;
      }
    }
    if (!pushed) {
      if (solution[solution.length - 1] == 9)
        while (solution[solution.length - 1] == 9) solution.pop();
      solution[solution.length - 1] += 1;
    }  
  }
  return renderSudoku([...puzzle.map(nested => [...nested])], gaps, solution, null);
}

function renderSudoku(board, gaps, solution, num){
  if (num) solution = [...solution, num];
  solution.forEach((e,i)=>{
     board[gaps[i][1]][gaps[i][0]] = e;
  })
  return board;
}

function validateSolution(board){
  function isunique(arr) {
    let filtered = arr.filter(x => x !== 0);
    return filtered.every((e,i) => filtered.indexOf(e) === i);
  }

  function checkRows(){
    return board.every(row => isunique(row));
  }
  function checkCols(){
    return board[0].map((e, i) => board.map(row => row[i])).every(col => isunique(col));
  }
  function checkBoxes(){
    let boxes = [];
    for (let i = 0; i <= 6; i += 3)
      for (let j = 0; j <= 6; j += 3)
        boxes.push([...board[j].slice(i,i+3),
                    ...board[j+1].slice(i,i+3),
                    ...board[j+2].slice(i,i+3)]);
    return boxes.every(box => isunique(box));
  }
  return checkRows() && checkCols() && checkBoxes();
}
```

## Best another solution

I will read this at night))) Copyrights to

```javascript
function calculateGridRange(gridNumber) {
  // summary:
  //  Calculates the min and max row and column numbers associated
  //  with a grid number.
  // gridNumber: Number
  //  Expects a zero-based number (0-8)
  // return: Object
  //  An object containing the min and max row and column numbers.
  var rowMin = Math.floor(gridNumber / 3) * 3,
      columnMin = gridNumber % 3 * 3;

  return {
    row: {
      min: rowMin,
      max: rowMin + 2
    },
    column: {
      min: columnMin,
      max: columnMin + 2
    }
  };
}

function calculateGridNumber(row, column) {
  // summary:
  //  Calculate the grid number that corresponds
  //  to the grid in which a row and column pair reside.
  // row: Number
  //  Expects a zero-based number (0-8)
  // column: Number
  //  Expects a zero-based number (0-8)
  // return: Number
  //  The grid number in which this row and column pair reside.
  return (Math.floor(row / 3) * 3) + Math.floor(column / 3);
}

function parse(puzzle) {
  // summary:
  //  Takes a sudoku puzzle and creates a number map based on the
  //  numbers' locations within the board.  Also provides methods for
  //  dynamically generating maps.
  // puzzle: Array[]
  //  Array of arrays.  Each element in the parent array is a row.
  //  The index of the element in the parent array, corresponds to
  //  the row number.
  //  Each element in a child array is a number in that row, and its
  //  index corresponds to the column number in which it resides.
  // return: Object
  //  Object containing number map, which is a mapping of where every
  //  number currently resides in the board, contains a method for determining if there are still empty spaces on the board, contains method for retrieving the empty spaces in a grid, and contains a method for retrieving the missing numbers for a grid.
  // Example:
  //  Number Map structure.  Example for number "1":
  //  {
  //    "1": {
  //      "1": { // Row number
  //        "3": { // Column number
  //          rowNumber: 1,
  //          columnNumber: 3,
  //          gridNumber: 1
  //        }
  //      }
  //    }
  //  }
  var numberMaps = {},
      row, i, j,
      number, numberMap,
      columnMax, map;

  for (i = 0; i < 9; i++) {
    row = puzzle[i];

    for (j = 0; j < 9; j++) {

      number = row[j];        
      if (number) {
        numberMap = numberMaps[number];

        if (!numberMap) {
          numberMap = numberMaps[number] = {};
        }

        map = numberMap[i];

        if (!map) {
          map = numberMap[i] = {};
        }

        map[j] = {
          rowNumber: i,
          columnNumber: j,
          gridNumber: calculateGridNumber(i, j)
        };

      }
    }
  }

  return {
    numberMaps: numberMaps,
    hasEmptySpaces: function () {
      // summary:
      //  Determines if there are empty spaces on the entire board.
      // returns: Boolean
      var i, j;

      for (i = 0; i < 9; i++) {
        for (j = 0; j < 9; j++) {
          if (!puzzle[i][j]) {
            return true;
          }
        }
      }

      return false;
    },
    getEmptySpacesByGridNumber: function (gridNumber) {
      // summary:
      //  Retrieve the empty spaces (spaces filled with the number 0)
      //  for a provided grid.
      // gridNumber: Number
      //  Expects a zero-based number (0-8)
      // return: Object
      //  A row/column mapping of empty spaces.
      var emptySpaces = {},
          range = calculateGridRange(gridNumber),
          row = range.row,
          column = range.column,
          rowMin = row.min,
          rowMax = row.max,
          columnMin = column.min,
          columnMax = column.max,
          i, z, space;

      for (i = rowMin; i < rowMax + 1; i++) {
        for (z = columnMin; z < columnMax + 1; z++) {
          if (!puzzle[i][z]) {

            space = emptySpaces[i];

            if (!space) {
              space = emptySpaces[i] = {};
            }

            space[z] = true;
          }
        }
      }

      return emptySpaces;
    },
    getMissingNumbersByGrid: function (gridNumber) {
      // summary:
      //  Returns all of the missing numbers for a given grid as
      //  a concatenated string.
      // gridNumber: Number
      //  Expects a zero-based number (0-8)
      // return: String
      var range = calculateGridRange(gridNumber),
          row = range.row,
          column = range.column,
          rowMin = row.min,
          rowMax = row.max,
          columnMin = column.min,
          columnMax = column.max,
          missingNumbers = "123456789",
          i, j;

      for (i = rowMin; i < rowMax + 1; i++) {
        for (j = columnMin; j < columnMax + 1; j++) {
          number = puzzle[i][j];

          if (number) {
            missingNumbers = missingNumbers.replace(number, "");
          }
        }
      }

      return missingNumbers;
    }
  };
}

function crossHatch(gridNumber, maps, puzzle) {
  // summary:
  //  Performs a cross hatch of a number to a grid's empty spaces.
  //  When a number is already on the board, and its location
  //  intersects with a row/column in the grid, that grid is removed
  //  from the available possibilities for placing a number.
  //  When only one possibility remains for a number, it is placed.
  //  If more than one possibility exists, the number is skipped.
  var missingNumbers = maps.getMissingNumbersByGrid(gridNumber).split(""),
      total = missingNumbers.length,
      gridRange = calculateGridRange(gridNumber),
      row = gridRange.row,
      column = gridRange.column,
      rowMin = row.min,
      rowMax = row.max,
      columnMin = column.min,
      columnMax = column.max,
      number, numberMap, i, j, rowMap, rowNumber, map,
      columnNumber, availableSpaces, availableRows, availableColumns;

  for (i = 0; i < total; i++) {
    number = missingNumbers[i];
    numberMap = maps.numberMaps[number];
    availableSpaces = maps.getEmptySpacesByGridNumber(gridNumber);

    for (rowNumber in numberMap) {
      rowMap = numberMap[rowNumber];

      if (rowNumber >= rowMin && rowNumber <= rowMax) {                                                      
        if (availableSpaces[rowNumber]) {
          delete availableSpaces[rowNumber];
        }
      }

      for (columnNumber in rowMap) {          
        if (columnNumber >= columnMin && columnNumber <= columnMax) {
          for (j = rowMin; j < rowMax + 1; j++) {
            if (availableSpaces[j]) {
              delete availableSpaces[j][columnNumber];

              if (!Object.keys(availableSpaces[j]).length) {
                delete availableSpaces[j];
              }
            }
          }
        }
      }
    }

    // Converting the keys of the availableSpaces (which will be row numbers where a number can go)
    // into an array.  We can then check the length of this array to ensure that only one
    // possibile row exists for this number in a grid.
    availableRows = Object.keys(availableSpaces);
    if (availableRows.length === 1) {
      // Convert the keys of the availableSpaces[availableRows[0]] (which will be the column numbers where
      // a number can go) into an array.  We can then check the length of this array, to ensure that only one
      // possible column exists for this number in a grid.  If there is only one possible column, we have
      // eliminated all other possibilities for this number in this grid, so we can place it.
      availableColumns = Object.keys(availableSpaces[availableRows[0]]);
      if (availableColumns.length === 1) {
        rowNumber = availableRows[0];
        columnNumber = availableColumns[0];

        // Convert to a true number because the test expects the array to contain only numbers.
        puzzle[rowNumber][columnNumber] = parseInt(number, 10);

        // Update the number map to include the new location of this placed number.
        map = numberMap[rowNumber];

        if (!map) {
          map = numberMap[rowNumber] = {};
        }

        map[columnNumber] = {
          rowNumber: availableRows[0],
          columnNumber: availableColumns[0],
          gridNumber: gridNumber
        };
      }
    }
  }
}

function sudoku(puzzle) {
  // summary:
  //  Parses the puzzle and begins the solve process.
  // puzzle: Array[]
  //  Array of arrays.  Each element in the parent array is a row.
  //  The index of the element in the parent array, corresponds to
  //  the row number.
  //  Each element in a child array is a number in that row, and its
  //  index corresponds to the column number in which it resides.
  var maps = parse(puzzle),
      i = 0;

  while (maps.hasEmptySpaces()) {
    if (i === 9) {
      i = 0;
    }

    crossHatch(i, maps, puzzle);
    i++;
  }

  return puzzle;
}
```

---

## Kata 43 Sudoku Validator

Meta | Content
-----|-----------
Date | 2021-06-09
Link |

### My solution

```javascript
function validSolution(board){
  function isunique(arr) {
    let filtered = arr.filter(x => x !== 0);
    return filtered.every((e,i) => filtered.indexOf(e) === i);
  }

  function checkRows(){
    return board.every(row => isunique(row));
  }
  function checkCols(){
    return board[0].map((e, i) => board.map(row => row[i])).every(col => isunique(col));
  }
  function checkBoxes(){
    let boxes = [];
    for (let i = 0; i <= 6; i += 3)
      for (let j = 0; j <= 6; j += 3)
        boxes.push([...board[j].slice(i,i+3),
                    ...board[j+1].slice(i,i+3),
                    ...board[j+2].slice(i,i+3)]);
    return boxes.every(box => isunique(box));
  }
  return checkRows() && checkCols() && checkBoxes();
}
```

## Best another solution

Need to check this one - lots of reduce, all as i like

```javascript
function validSolution(board){
  var validSet = s => s.size == 9 && !s.has(0);
  var rowSet = i => board[i].reduce((s,v) => s.add(v), new Set());
  var columnSet = i => board.reduce((s,v) => s.add(v[i]), new Set());
  var boxSet = ([r,c]) => board.slice(r,r+3).reduce((s,v) => v.slice(c,c+3).reduce((s,v) => s.add(v), s), new Set());
  var boxCorner = i => [Math.floor(i / 3) * 3,(i % 3) * 3];
  for (var i = 0; i < 9; i++)
    if ( !validSet(rowSet(i)) || !validSet(columnSet(i)) || !validSet(boxSet(boxCorner(i))) )
      return false;
  return true;
}
```
