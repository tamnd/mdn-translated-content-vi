---
title: Promise
slug: Web/JavaScript/Reference/Global_Objects/Promise
page-type: javascript-class
browser-compat: javascript.builtins.Promise
sidebar: jsref
---

Đối tượng **`Promise`** đại diện cho sự hoàn thành (hoặc thất bại) cuối cùng của một thao tác bất đồng bộ và giá trị kết quả của nó.

Để tìm hiểu về cách thức hoạt động của promise và cách sử dụng chúng, chúng tôi khuyến nghị bạn đọc [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises) trước.

## Mô tả

`Promise` là một proxy cho một giá trị không nhất thiết phải biết khi promise được tạo ra. Nó cho phép bạn liên kết các handler với giá trị thành công hoặc lý do thất bại cuối cùng của một thao tác bất đồng bộ. Điều này cho phép các phương thức bất đồng bộ trả về giá trị giống như các phương thức đồng bộ: thay vì trả về giá trị cuối cùng ngay lập tức, phương thức bất đồng bộ trả về một _promise_ để cung cấp giá trị vào một thời điểm nào đó trong tương lai.

Một `Promise` ở một trong các trạng thái sau:

- _pending_: trạng thái ban đầu, chưa fulfilled cũng chưa rejected.
- _fulfilled_: có nghĩa là thao tác đã hoàn thành thành công.
- _rejected_: có nghĩa là thao tác đã thất bại.

_Trạng thái cuối cùng_ của một promise đang pending có thể là _fulfilled_ với một giá trị hoặc _rejected_ với một lý do (lỗi).
Khi một trong hai tùy chọn này xảy ra, các handler liên quan được xếp hàng bởi phương thức `then` của promise sẽ được gọi. Nếu promise đã được fulfilled hoặc rejected khi một handler tương ứng được gắn vào, handler đó vẫn sẽ được gọi, vì vậy không có race condition giữa việc hoàn thành thao tác bất đồng bộ và việc gắn các handler của nó.

Một promise được gọi là _settled_ nếu nó đã fulfilled hoặc rejected, nhưng không còn ở trạng thái pending.

![Lưu đồ cho thấy cách các trạng thái Promise chuyển đổi giữa pending, fulfilled, và rejected thông qua các handler then/catch. Một promise đang pending có thể trở thành fulfilled hoặc rejected. Nếu fulfilled, handler "on fulfillment", hoặc tham số đầu tiên của phương thức then(), được thực thi và thực hiện các thao tác bất đồng bộ tiếp theo. Nếu rejected, handler lỗi, được truyền như tham số thứ hai của phương thức then() hoặc như tham số duy nhất của phương thức catch(), sẽ được thực thi.](promises.png)

Bạn cũng sẽ nghe thuật ngữ _resolved_ được sử dụng với promise — điều này có nghĩa là promise đã settled hoặc "khóa vào" để khớp với trạng thái cuối cùng của một promise khác, và việc tiếp tục resolve hoặc reject nó sẽ không có tác dụng. Tài liệu [States and fates](https://github.com/domenic/promises-unwrapping/blob/master/docs/states-and-fates.md) từ đề xuất Promise gốc chứa nhiều chi tiết hơn về thuật ngữ promise. Theo ngôn ngữ thông thường, các promise "resolved" thường tương đương với các promise "fulfilled", nhưng như được minh họa trong "States and fates", các promise resolved cũng có thể đang pending hoặc rejected. Ví dụ:

```js
new Promise((resolveOuter) => {
  resolveOuter(
    new Promise((resolveInner) => {
      setTimeout(resolveInner, 1000);
    }),
  );
});
```

Promise này đã _resolved_ tại thời điểm nó được tạo ra (vì `resolveOuter` được gọi đồng bộ), nhưng nó được resolved với một promise khác, do đó sẽ không _fulfilled_ cho đến 1 giây sau, khi promise bên trong fulfilled. Trong thực tế, "resolution" thường được thực hiện ở hậu trường và không thể quan sát được, chỉ có sự fulfilled hoặc rejection của nó mới có thể quan sát.

> [!NOTE]
> Một số ngôn ngữ khác có cơ chế cho lazy evaluation và deferring a computation, mà họ cũng gọi là "promises", ví dụ như Scheme. Các promise trong JavaScript đại diện cho các quá trình đã đang xảy ra, có thể được kết nối với các callback function. Nếu bạn muốn lazily evaluate một biểu thức, hãy xem xét sử dụng một function không có đối số, ví dụ `f = () => expression` để tạo biểu thức lazy-evaluated, và `f()` để evaluate biểu thức ngay lập tức.

`Promise` bản thân không có giao thức hạng nhất để hủy, nhưng bạn có thể trực tiếp hủy thao tác bất đồng bộ cơ bản, thường sử dụng [`AbortController`](/en-US/docs/Web/API/AbortController).

### Promise được kết nối chuỗi (Chained Promises)

Các phương thức promise {{jsxref("Promise/then", "then()")}}, {{jsxref("Promise/catch", "catch()")}}, và {{jsxref("Promise/finally", "finally()")}} được sử dụng để liên kết thêm hành động với một promise đã settled. Phương thức `then()` nhận tối đa hai đối số; đối số đầu tiên là callback function cho trường hợp fulfilled của promise, và đối số thứ hai là callback function cho trường hợp rejected. Các phương thức `catch()` và `finally()` gọi `then()` nội bộ và làm cho việc xử lý lỗi ít verbose hơn. Ví dụ, `catch()` thực chất chỉ là `then()` mà không truyền fulfillment handler. Vì các phương thức này trả về promise, chúng có thể được kết nối chuỗi. Ví dụ:

```js
const myPromise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("foo");
  }, 300);
});

myPromise
  .then(handleFulfilledA, handleRejectedA)
  .then(handleFulfilledB, handleRejectedB)
  .then(handleFulfilledC, handleRejectedC);
```

Chúng ta sẽ sử dụng thuật ngữ sau: _initial promise_ là promise mà `then` được gọi trên đó; _new promise_ là promise được trả về bởi `then`. Hai callback được truyền vào `then` được gọi là _fulfillment handler_ và _rejection handler_, tương ứng.

Trạng thái settled của initial promise xác định handler nào sẽ được thực thi.

- Nếu initial promise được fulfilled, fulfillment handler được gọi với giá trị fulfillment.
- Nếu initial promise bị rejected, rejection handler được gọi với lý do rejection.

Sự hoàn thành của handler xác định trạng thái settled của new promise.

- Nếu handler trả về một giá trị [thenable](#thenables), new promise sẽ settle ở cùng trạng thái với giá trị được trả về.
- Nếu handler trả về một giá trị non-thenable, new promise sẽ được fulfilled với giá trị được trả về.
- Nếu handler ném ra một lỗi, new promise sẽ bị rejected với lỗi được ném ra.
- Nếu initial promise không có handler tương ứng được gắn vào, new promise sẽ settle ở cùng trạng thái với initial promise — nghĩa là, không có rejection handler, một promise bị rejected vẫn bị rejected với cùng lý do.

Ví dụ, trong đoạn code trên, nếu `myPromise` reject, `handleRejectedA` sẽ được gọi, và nếu `handleRejectedA` hoàn thành bình thường (không ném ra hay trả về một promise bị rejected), promise được trả về bởi `then` đầu tiên sẽ được fulfilled thay vì tiếp tục bị rejected. Do đó, nếu một lỗi phải được xử lý ngay lập tức, nhưng chúng ta muốn duy trì trạng thái lỗi trong chuỗi, chúng ta phải ném ra một lỗi nào đó trong rejection handler. Mặt khác, khi không có nhu cầu ngay lập tức, chúng ta có thể bỏ qua việc xử lý lỗi cho đến handler `catch()` cuối cùng.

```js
myPromise
  .then(handleFulfilledA)
  .then(handleFulfilledB)
  .then(handleFulfilledC)
  .catch(handleRejectedAny);
```

Sử dụng [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) cho các callback function, việc triển khai chuỗi promise có thể trông như thế này:

```js
myPromise
  .then((value) => `${value} and bar`)
  .then((value) => `${value} and bar again`)
  .then((value) => `${value} and again`)
  .then((value) => `${value} and again`)
  .then((value) => {
    console.log(value);
  })
  .catch((err) => {
    console.error(err);
  });
```

> [!NOTE]
> Để thực thi nhanh hơn, tất cả các thao tác đồng bộ nên được thực hiện trong một handler nếu có thể, nếu không sẽ mất vài tick để thực thi tất cả các handler theo thứ tự.

JavaScript duy trì một [job queue](/en-US/docs/Web/JavaScript/Reference/Execution_model). Mỗi lần, JavaScript chọn một job từ hàng đợi và thực thi nó cho đến khi hoàn thành. Các job được định nghĩa bởi executor của constructor `Promise()`, các handler được truyền vào `then`, hoặc bất kỳ platform API nào trả về một promise. Các promise trong một chuỗi đại diện cho mối quan hệ phụ thuộc giữa các job này. Khi một promise settle, các handler tương ứng liên quan đến nó được thêm vào cuối job queue.

Một promise có thể tham gia vào nhiều hơn một chuỗi. Đối với đoạn code sau, sự fulfilled của `promiseA` sẽ khiến cả `handleFulfilled1` và `handleFulfilled2` được thêm vào job queue. Vì `handleFulfilled1` được đăng ký trước, nó sẽ được gọi trước.

```js
const promiseA = new Promise(myExecutorFunc);
const promiseB = promiseA.then(handleFulfilled1, handleRejected1);
const promiseC = promiseA.then(handleFulfilled2, handleRejected2);
```

Một hành động có thể được gán cho một promise đã settled. Trong trường hợp này, hành động được thêm ngay lập tức vào cuối job queue và sẽ được thực hiện khi tất cả các job hiện có hoàn thành. Do đó, một hành động cho một promise đã "settled" sẽ chỉ xảy ra sau khi code đồng bộ hiện tại hoàn thành và ít nhất một vòng lặp loop đã qua. Điều này đảm bảo rằng các hành động promise là bất đồng bộ.

```js
const promiseA = new Promise((resolve, reject) => {
  resolve(777);
});
// At this point, "promiseA" is already settled.
promiseA.then((val) => console.log("asynchronous logging has val:", val));
console.log("immediate logging");

// produces output in this order:
// immediate logging
// asynchronous logging has val: 777
```

### Thenables

Hệ sinh thái JavaScript đã có nhiều triển khai Promise trước khi nó trở thành một phần của ngôn ngữ. Mặc dù được biểu diễn khác nhau ở bên trong, ít nhất, tất cả các đối tượng giống Promise đều triển khai giao diện _Thenable_. Một thenable triển khai phương thức [`.then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then), được gọi với hai callback: một cho khi promise fulfilled, một cho khi nó bị rejected. Các promise cũng là thenable.

Để tương tác với các triển khai Promise hiện có, ngôn ngữ cho phép sử dụng thenable thay thế cho promise. Ví dụ, [`Promise.resolve`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) không chỉ resolve các promise, mà còn trace thenable.

```js
// This is not a Promises/A+ compliant thenable! It calls onFulfilled
// synchronously. For demonstration only.
const thenable = {
  then(onFulfilled, onRejected) {
    onFulfilled({
      // The thenable is fulfilled with another thenable
      then(onFulfilled, onRejected) {
        onFulfilled(42);
      },
    });
  },
};

Promise.resolve(thenable); // A promise fulfilled with 42
```

Phương thức `then()` chịu trách nhiệm lập lịch thực thi các callback `onFulfilled` và `onRejected` được cung cấp. Ngữ nghĩa của nó, bao gồm xử lý lỗi và tính bất đồng bộ, được định nghĩa chính xác trong [đặc tả Promises/A+](https://promisesaplus.com/), và chúng tôi sẽ không lặp lại ở đây. Rất hiếm khi bạn cần tự triển khai một thenable; ngay cả khi bạn không sử dụng native promise, bạn có thể sẽ sử dụng một thư viện Promise như [Bluebird](http://bluebirdjs.com/).

### Đồng thời với Promise (Promise concurrency)

Lớp `Promise` cung cấp bốn static method để hỗ trợ [đồng thời](https://en.wikipedia.org/wiki/Concurrent_computing) các tác vụ async:

- {{jsxref("Promise.all()")}}
  - : Fulfills khi **tất cả** các promise fulfill; rejects khi **bất kỳ** promise nào reject.
- {{jsxref("Promise.allSettled()")}}
  - : Fulfills khi **tất cả** các promise settle.
- {{jsxref("Promise.any()")}}
  - : Fulfills khi **bất kỳ** promise nào fulfill; rejects khi **tất cả** các promise reject.
- {{jsxref("Promise.race()")}}
  - : Settle khi **bất kỳ** promise nào settle. Nói cách khác, fulfills khi bất kỳ promise nào fulfill; rejects khi bất kỳ promise nào reject.

Tất cả các phương thức này nhận một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) của các promise ([thenables](#thenables), để chính xác) và trả về một promise mới. Tất cả đều hỗ trợ subclassing, có nghĩa là chúng có thể được gọi trên các subclass của `Promise`, và kết quả sẽ là một promise của kiểu subclass. Để làm như vậy, constructor của subclass phải triển khai cùng chữ ký với constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) — chấp nhận một function `executor` duy nhất có thể được gọi với các callback `resolve` và `reject` làm tham số. Subclass cũng phải có một static method `resolve` có thể được gọi như {{jsxref("Promise.resolve()")}} để resolve các giá trị thành promise.

Lưu ý rằng JavaScript là [single-threaded](/en-US/docs/Glossary/Thread) theo bản chất, vì vậy tại một thời điểm nhất định, chỉ có một tác vụ sẽ được thực thi, mặc dù quyền kiểm soát có thể chuyển đổi giữa các promise khác nhau, làm cho việc thực thi các promise có vẻ đồng thời. [Thực thi song song](https://en.wikipedia.org/wiki/Parallel_computing) trong JavaScript chỉ có thể đạt được thông qua [worker threads](/en-US/docs/Web/API/Web_Workers_API).

## Constructor

- {{jsxref("Promise/Promise", "Promise()")}}
  - : Tạo một đối tượng `Promise` mới. Constructor chủ yếu được sử dụng để bọc các function chưa hỗ trợ promise.

## Thuộc tính tĩnh (Static properties)

- [`Promise[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Symbol.species)
  - : Trả về constructor được sử dụng để xây dựng các giá trị trả về từ các phương thức promise.

## Phương thức tĩnh (Static methods)

- {{jsxref("Promise.all()")}}
  - : Nhận một iterable của các promise làm đầu vào và trả về một `Promise` duy nhất. Promise được trả về sẽ fulfill khi tất cả các promise của đầu vào fulfill (bao gồm khi một iterable rỗng được truyền vào), với một mảng các giá trị fulfillment. Nó sẽ reject khi bất kỳ promise đầu vào nào reject, với lý do rejection đầu tiên.
- {{jsxref("Promise.allSettled()")}}
  - : Nhận một iterable của các promise làm đầu vào và trả về một `Promise` duy nhất. Promise được trả về sẽ fulfill khi tất cả các promise của đầu vào settle (bao gồm khi một iterable rỗng được truyền vào), với một mảng các đối tượng mô tả kết quả của mỗi promise.
- {{jsxref("Promise.any()")}}
  - : Nhận một iterable của các promise làm đầu vào và trả về một `Promise` duy nhất. Promise được trả về sẽ fulfill khi bất kỳ promise đầu vào nào fulfill, với giá trị fulfillment đầu tiên đó. Nó sẽ reject khi tất cả các promise đầu vào reject (bao gồm khi một iterable rỗng được truyền vào), với một {{jsxref("AggregateError")}} chứa một mảng các lý do rejection.
- {{jsxref("Promise.race()")}}
  - : Nhận một iterable của các promise làm đầu vào và trả về một `Promise` duy nhất. Promise được trả về sẽ settle với trạng thái cuối cùng của promise đầu tiên settle.
- {{jsxref("Promise.reject()")}}
  - : Trả về một đối tượng `Promise` mới bị rejected với lý do đã cho.
- {{jsxref("Promise.resolve()")}}
  - : Trả về một đối tượng `Promise` được resolved với giá trị đã cho. Nếu giá trị là thenable (tức là có phương thức `then`), promise được trả về sẽ "theo" thenable đó, áp dụng trạng thái cuối cùng của nó; nếu không, promise được trả về sẽ được fulfilled với giá trị đó.
- {{jsxref("Promise.try()")}}
  - : Nhận một callback của bất kỳ loại nào (trả về hoặc ném ra, đồng bộ hoặc bất đồng bộ) và bọc kết quả của nó trong một `Promise`.
- {{jsxref("Promise.withResolvers()")}}
  - : Trả về một đối tượng chứa một đối tượng `Promise` mới và hai function để resolve hoặc reject nó, tương ứng với hai tham số được truyền vào executor của constructor {{jsxref("Promise/Promise", "Promise()")}}.

## Thuộc tính instance (Instance properties)

Các thuộc tính này được định nghĩa trên `Promise.prototype` và được chia sẻ bởi tất cả các instance của `Promise`.

- {{jsxref("Object/constructor", "Promise.prototype.constructor")}}
  - : Constructor function đã tạo ra đối tượng instance. Đối với các instance `Promise`, giá trị ban đầu là constructor {{jsxref("Promise/Promise", "Promise")}}.
- `Promise.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Promise"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance (Instance methods)

- {{jsxref("Promise.prototype.catch()")}}
  - : Gắn thêm một rejection handler callback vào promise, và trả về một promise mới resolving về giá trị trả về của callback nếu nó được gọi, hoặc về giá trị fulfillment gốc của nó nếu promise được fulfilled thay vào đó.
- {{jsxref("Promise.prototype.finally()")}}
  - : Gắn thêm một handler vào promise, và trả về một promise mới được resolved khi promise gốc được resolved. Handler được gọi khi promise settled, dù fulfilled hay rejected.
- {{jsxref("Promise.prototype.then()")}}
  - : Gắn thêm các fulfillment và rejection handler vào promise, và trả về một promise mới resolving về giá trị trả về của handler được gọi, hoặc về giá trị settled gốc của nó nếu promise không được xử lý (tức là nếu handler liên quan `onFulfilled` hoặc `onRejected` không phải là function).

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, chúng ta sử dụng `setTimeout(...)` để mô phỏng code bất đồng bộ.
Trong thực tế, bạn có thể sẽ sử dụng các thứ như XHR hoặc một HTML API.

```js
const myFirstPromise = new Promise((resolve, reject) => {
  // We call resolve(...) when what we were doing asynchronously
  // was successful, and reject(...) when it failed.
  setTimeout(() => {
    resolve("Success!"); // Yay! Everything went well!
  }, 250);
});

myFirstPromise.then((successMessage) => {
  // successMessage is whatever we passed in the resolve(...) function above.
  // It doesn't have to be a string, but if it is only a succeed message, it probably will be.
  console.log(`Yay! ${successMessage}`);
});
```

### Ví dụ với nhiều tình huống khác nhau

Ví dụ này minh họa các kỹ thuật đa dạng để sử dụng khả năng của Promise và các tình huống khác nhau có thể xảy ra. Để hiểu điều này, hãy bắt đầu bằng cách cuộn xuống cuối khối code và kiểm tra chuỗi promise. Khi được cung cấp một initial promise, một chuỗi promise có thể tiếp theo. Chuỗi được tạo thành từ các lời gọi `.then()`, và thường (nhưng không nhất thiết) có một `.catch()` duy nhất ở cuối, tùy chọn theo sau là `.finally()`. Trong ví dụ này, chuỗi promise được khởi tạo bởi một cấu trúc `new Promise()` tự viết; nhưng trong thực tế, các chuỗi promise thường bắt đầu với một API function (được viết bởi người khác) trả về một promise.

Hàm ví dụ `tetheredGetNumber()` cho thấy rằng một promise generator sẽ sử dụng `reject()` trong khi thiết lập một cuộc gọi bất đồng bộ, hoặc trong callback, hoặc cả hai. Hàm `promiseGetWord()` minh họa cách một API function có thể tạo và trả về một promise theo cách tự chứa.

Lưu ý rằng hàm `troubleWithGetNumber()` kết thúc bằng một `throw`. Điều đó là bắt buộc vì một chuỗi promise đi qua tất cả các promise `.then()`, ngay cả sau một lỗi, và nếu không có `throw`, lỗi sẽ có vẻ được "sửa chữa". Đây là điều phiền toái, và vì lý do này, người ta thường bỏ qua `onRejected` trong chuỗi các promise `.then()`, và chỉ có một `onRejected` duy nhất trong `catch()` cuối cùng.

Code này có thể chạy trong NodeJS. Khả năng hiểu được nâng cao khi thực sự thấy các lỗi xảy ra. Để tạo ra nhiều lỗi hơn, hãy thay đổi các giá trị `threshold`.

```js
// To experiment with error handling, "threshold" values cause errors randomly
const THRESHOLD_A = 8; // can use zero 0 to guarantee error

function tetheredGetNumber(resolve, reject) {
  setTimeout(() => {
    const randomInt = Date.now();
    const value = randomInt % 10;
    if (value < THRESHOLD_A) {
      resolve(value);
    } else {
      reject(new RangeError(`Too large: ${value}`));
    }
  }, 500);
}

function determineParity(value) {
  const isOdd = value % 2 === 1;
  return { value, isOdd };
}

function troubleWithGetNumber(reason) {
  const err = new Error("Trouble getting number", { cause: reason });
  console.error(err);
  throw err;
}

function promiseGetWord(parityInfo) {
  return new Promise((resolve, reject) => {
    const { value, isOdd } = parityInfo;
    if (value >= THRESHOLD_A - 1) {
      reject(new RangeError(`Still too large: ${value}`));
    } else {
      parityInfo.wordEvenOdd = isOdd ? "odd" : "even";
      resolve(parityInfo);
    }
  });
}

new Promise(tetheredGetNumber)
  .then(determineParity, troubleWithGetNumber)
  .then(promiseGetWord)
  .then((info) => {
    console.log(`Got: ${info.value}, ${info.wordEvenOdd}`);
    return info;
  })
  .catch((reason) => {
    if (reason.cause) {
      console.error("Had previously handled error");
    } else {
      console.error(`Trouble with promiseGetWord(): ${reason}`);
    }
  })
  .finally((info) => console.log("All done"));
```

### Ví dụ nâng cao

Ví dụ nhỏ này minh họa cơ chế của một `Promise`. Phương thức `testPromise()` được gọi mỗi khi {{HTMLElement("button")}} được click. Nó tạo ra một promise sẽ được fulfilled, sử dụng {{domxref("Window.setTimeout", "setTimeout()")}}, đến số đếm promise (số bắt đầu từ 1) mỗi 1-3 giây, ngẫu nhiên. Constructor `Promise()` được sử dụng để tạo promise.

Sự fulfilled của promise được ghi lại, thông qua một fulfill callback được thiết lập bằng {{jsxref("Promise/then", "p1.then()")}}. Một số log cho thấy phần đồng bộ của phương thức được tách biệt như thế nào với sự hoàn thành bất đồng bộ của promise.

Bằng cách click nút nhiều lần trong một khoảng thời gian ngắn, bạn sẽ thấy các promise khác nhau được fulfilled lần lượt.

#### HTML

```html
<button id="make-promise">Make a promise!</button>
<div id="log"></div>
```

#### JavaScript

```js
"use strict";

let promiseCount = 0;

function testPromise() {
  const thisPromiseCount = ++promiseCount;
  const log = document.getElementById("log");
  // begin
  log.insertAdjacentHTML("beforeend", `${thisPromiseCount}) Started<br>`);
  // We make a new promise: we promise a numeric count of this promise,
  // starting from 1 (after waiting 3s)
  const p1 = new Promise((resolve, reject) => {
    // The executor function is called with the ability
    // to resolve or reject the promise
    log.insertAdjacentHTML(
      "beforeend",
      `${thisPromiseCount}) Promise constructor<br>`,
    );
    // This is only an example to create asynchronism
    setTimeout(
      () => {
        // We fulfill the promise
        resolve(thisPromiseCount);
      },
      Math.random() * 2000 + 1000,
    );
  });

  // We define what to do when the promise is resolved with the then() call,
  // and what to do when the promise is rejected with the catch() call
  p1.then((val) => {
    // Log the fulfillment value
    log.insertAdjacentHTML("beforeend", `${val}) Promise fulfilled<br>`);
  }).catch((reason) => {
    // Log the rejection reason
    console.log(`Handle rejected promise (${reason}) here.`);
  });
  // end
  log.insertAdjacentHTML("beforeend", `${thisPromiseCount}) Promise made<br>`);
}

const btn = document.getElementById("make-promise");
btn.addEventListener("click", testPromise);
```

#### Kết quả

{{EmbedLiveSample("Advanced_Example", "500", "200")}}

### Tải ảnh với XHR

Một ví dụ khác sử dụng `Promise` và {{domxref("XMLHttpRequest")}} để tải một ảnh được hiển thị bên dưới.
Mỗi bước được chú thích và cho phép bạn theo dõi kiến trúc Promise và XHR một cách chi tiết.

```html hidden live-sample___promises
<h1>Promise example</h1>
```

```js live-sample___promises
function imgLoad(url) {
  // Create new promise with the Promise() constructor;
  // This has as its argument a function with two parameters, resolve and reject
  return new Promise((resolve, reject) => {
    // XHR to load an image
    const request = new XMLHttpRequest();
    request.open("GET", url);
    request.responseType = "blob";
    // When the request loads, check whether it was successful
    request.onload = () => {
      if (request.status === 200) {
        // If successful, resolve the promise by passing back the request response
        resolve(request.response);
      } else {
        // If it fails, reject the promise with an error message
        reject(
          Error(
            `Image didn't load successfully; error code: + ${request.statusText}`,
          ),
        );
      }
    };
    // Handle network errors
    request.onerror = () => reject(new Error("There was a network error."));
    // Send the request
    request.send();
  });
}

// Get a reference to the body element, and create a new image object
const body = document.querySelector("body");
const myImage = new Image();
const imgUrl =
  "https://mdn.github.io/shared-assets/images/examples/round-balloon.png";

// Call the function with the URL we want to load, then chain the
// promise then() method with two callbacks
imgLoad(imgUrl).then(
  (response) => {
    // The first runs when the promise resolves, with the request.response
    // specified within the resolve() method.
    const imageURL = URL.createObjectURL(response);
    myImage.src = imageURL;
    body.appendChild(myImage);
  },
  (error) => {
    // The second runs when the promise
    // is rejected, and logs the Error specified with the reject() method.
    console.log(error);
  },
);
```

{{embedlivesample("promises", "", "240px")}}

### Theo dõi incumbent settings object

Một settings object là một [environment](https://html.spec.whatwg.org/multipage/webappapis.html#environment-settings-object) cung cấp thông tin bổ sung khi JavaScript code đang chạy. Điều này bao gồm realm và module map, cũng như thông tin đặc trưng HTML như origin. Incumbent settings object được theo dõi để đảm bảo rằng trình duyệt biết cái nào cần sử dụng cho một đoạn code người dùng nhất định.

Để hình dung rõ hơn điều này, chúng ta có thể xem xét kỹ hơn cách realm có thể là một vấn đề. Một **realm** có thể được coi gần giống như đối tượng global. Điều đặc biệt về realm là chúng chứa tất cả thông tin cần thiết để chạy JavaScript code. Điều này bao gồm các đối tượng như [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) và [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error). Mỗi settings object có "bản sao" riêng của chúng và chúng không được chia sẻ. Điều đó có thể gây ra một số hành vi không mong đợi liên quan đến promise. Để giải quyết điều này, chúng ta theo dõi thứ gọi là **incumbent settings object**. Điều này đại diện cho thông tin đặc trưng cho context của code người dùng chịu trách nhiệm cho một lời gọi function nhất định.

Để minh họa điều này thêm, chúng ta có thể xem cách một [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe) được nhúng trong một tài liệu giao tiếp với host của nó. Vì tất cả web API đều biết về incumbent settings object, những điều sau sẽ hoạt động trong tất cả trình duyệt:

```html
<!doctype html>
<iframe></iframe>
<!-- we have a realm here -->
<script>
  // we have a realm here as well
  const bound = frames[0].postMessage.bind(frames[0], "some data", "*");
  // bound is a built-in function — there is no user
  // code on the stack, so which realm do we use?
  setTimeout(bound);
  // this still works, because we use the youngest
  // realm (the incumbent) on the stack
</script>
```

Khái niệm tương tự áp dụng cho promise. Nếu chúng ta sửa đổi ví dụ trên một chút, chúng ta sẽ có:

```html
<!doctype html>
<iframe></iframe>
<!-- we have a realm here -->
<script>
  // we have a realm here as well
  const bound = frames[0].postMessage.bind(frames[0], "some data", "*");
  // bound is a built in function — there is no user
  // code on the stack — which realm do we use?
  Promise.resolve(undefined).then(bound);
  // this still works, because we use the youngest
  // realm (the incumbent) on the stack
</script>
```

Nếu chúng ta thay đổi để `<iframe>` trong tài liệu lắng nghe các post message, chúng ta có thể quan sát hiệu ứng của incumbent settings object:

```html
<!-- y.html -->
<!doctype html>
<iframe src="x.html"></iframe>
<script>
  const bound = frames[0].postMessage.bind(frames[0], "some data", "*");
  Promise.resolve(undefined).then(bound);
</script>
```

```html
<!-- x.html -->
<!doctype html>
<script>
  window.addEventListener("message", (event) => {
    document.querySelector("#text").textContent = "hello";
    // this code will only run in browsers that track the incumbent settings object
    console.log(event);
  });
</script>
```

Trong ví dụ trên, văn bản bên trong của `<iframe>` sẽ chỉ được cập nhật nếu incumbent settings object được theo dõi. Điều này là vì nếu không theo dõi incumbent, chúng ta có thể sử dụng sai môi trường để gửi message.

> [!NOTE]
> Hiện tại, việc theo dõi incumbent realm được triển khai đầy đủ trong Firefox, và có các triển khai một phần trong Chrome và Safari.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Promise` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- Hướng dẫn [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [Đặc tả Promises/A+](https://promisesaplus.com/)
- [JavaScript Promises: an introduction](https://web.dev/articles/promises) trên web.dev (2013)
- [Callbacks, Promises, and Coroutines: Asynchronous Programming Patterns in JavaScript](https://www.slideshare.net/slideshow/callbacks-promises-and-coroutines-oh-my-the-evolution-of-asynchronicity-in-javascript/9953720) slide show của Domenic Denicola (2011)
