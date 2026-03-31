---
title: Using promises
slug: Web/JavaScript/Guide/Using_promises
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Using_classes", "Web/JavaScript/Guide/Typed_arrays")}}

{{jsxref("Promise")}} là đối tượng đại diện cho việc hoàn thành hoặc thất bại cuối cùng của một thao tác bất đồng bộ. Vì hầu hết mọi người đều là người dùng promise đã được tạo sẵn, hướng dẫn này sẽ giải thích cách sử dụng promise được trả về trước khi giải thích cách tạo chúng.

Về cơ bản, promise là đối tượng được trả về mà bạn đính kèm callback vào đó, thay vì truyền callback vào hàm. Hãy tưởng tượng một hàm `createAudioFileAsync()`, hàm này tạo tệp âm thanh một cách bất đồng bộ với một bản ghi cấu hình và hai hàm callback: một hàm được gọi nếu tệp âm thanh được tạo thành công và hàm kia được gọi nếu xảy ra lỗi.

Đây là code dùng `createAudioFileAsync()`:

```js
function successCallback(result) {
  console.log(`Audio file ready at URL: ${result}`);
}

function failureCallback(error) {
  console.error(`Error generating audio file: ${error}`);
}

createAudioFileAsync(audioSettings, successCallback, failureCallback);
```

Nếu `createAudioFileAsync()` được viết lại để trả về promise, bạn sẽ đính kèm callback vào đó:

```js
createAudioFileAsync(audioSettings).then(successCallback, failureCallback);
```

Quy ước này có một số ưu điểm. Chúng ta sẽ khám phá từng ưu điểm.

## Chaining

Một nhu cầu phổ biến là thực thi hai hoặc nhiều thao tác bất đồng bộ liên tiếp, trong đó mỗi thao tác tiếp theo bắt đầu khi thao tác trước thành công, với kết quả từ bước trước. Ngày xưa, thực hiện nhiều thao tác bất đồng bộ liên tiếp sẽ dẫn đến hiện tượng [callback hell](https://medium.com/@raihan_tazdid/callback-hell-in-javascript-all-you-need-to-know-296f7f5d3c1) kinh điển:

```js-nolint
doSomething(function (result) {
  doSomethingElse(result, function (newResult) {
    doThirdThing(newResult, function (finalResult) {
      console.log(`Got the final result: ${finalResult}`);
    }, failureCallback);
  }, failureCallback);
}, failureCallback);
```

Với promise, chúng ta thực hiện điều này bằng cách tạo promise chain. Thiết kế API của promise làm cho điều này tuyệt vời vì callback được đính kèm vào đối tượng promise được trả về, thay vì được truyền vào hàm.

Đây là điều kỳ diệu: hàm `then()` trả về một **promise mới**, khác với promise gốc:

```js
const promise = doSomething();
const promise2 = promise.then(successCallback, failureCallback);
```

Promise thứ hai (`promise2`) đại diện cho sự hoàn thành không chỉ của `doSomething()`, mà còn của `successCallback` hay `failureCallback` bạn đã truyền vào — đây có thể là các hàm bất đồng bộ khác trả về promise. Khi đó, bất kỳ callback nào được thêm vào `promise2` sẽ được xếp hàng đằng sau promise được trả về bởi `successCallback` hoặc `failureCallback`.

> [!NOTE]
> Nếu bạn muốn có ví dụ hoạt động để thử nghiệm, bạn có thể dùng mẫu sau để tạo bất kỳ hàm nào trả về promise:
>
> ```js
> function doSomething() {
>   return new Promise((resolve) => {
>     setTimeout(() => {
>       // Other things to do before completion of the promise
>       console.log("Did something");
>       // The fulfillment value of the promise
>       resolve("https://example.com/");
>     }, 200);
>   });
> }
> ```
>
> Việc triển khai được thảo luận trong phần [Tạo Promise từ callback API cũ](#tạo_promise_từ_callback_api_cũ) bên dưới.

Với pattern này, bạn có thể tạo các chain xử lý dài hơn, trong đó mỗi promise đại diện cho sự hoàn thành của một bước bất đồng bộ trong chain. Ngoài ra, các đối số của `then` là tùy chọn và `catch(failureCallback)` là viết tắt của `then(null, failureCallback)` — vì vậy nếu code xử lý lỗi giống nhau cho tất cả các bước, bạn có thể đính kèm nó ở cuối chain:

```js
doSomething()
  .then(function (result) {
    return doSomethingElse(result);
  })
  .then(function (newResult) {
    return doThirdThing(newResult);
  })
  .then(function (finalResult) {
    console.log(`Got the final result: ${finalResult}`);
  })
  .catch(failureCallback);
```

Bạn có thể thấy cách này được viết với [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions):

```js
doSomething()
  .then((result) => doSomethingElse(result))
  .then((newResult) => doThirdThing(newResult))
  .then((finalResult) => {
    console.log(`Got the final result: ${finalResult}`);
  })
  .catch(failureCallback);
```

> [!NOTE]
> Arrow function expressions có thể có [implicit return](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#function_body); vì vậy, `() => x` là viết tắt của `() => { return x; }`.

`doSomethingElse` và `doThirdThing` có thể trả về bất kỳ giá trị nào — nếu chúng trả về promise, promise đó sẽ được chờ đợi cho đến khi settle, và callback tiếp theo nhận giá trị fulfillment, không phải promise đó. Điều quan trọng là luôn trả về promise từ callback `then`, dù promise đó luôn resolve thành `undefined`. Nếu handler trước đó bắt đầu một promise nhưng không trả về nó, không có cách nào theo dõi quá trình settle của nó nữa, và promise được gọi là "floating".

```js example-bad
doSomething()
  .then((url) => {
    // Missing `return` keyword in front of fetch(url).
    fetch(url);
  })
  .then((result) => {
    // result is undefined, because nothing is returned from the previous
    // handler. There's no way to know the return value of the fetch()
    // call anymore, or whether it succeeded at all.
  });
```

Bằng cách trả về kết quả của lời gọi `fetch` (vốn là một promise), chúng ta có thể theo dõi quá trình hoàn thành và nhận giá trị của nó khi hoàn thành.

```js example-good
doSomething()
  .then((url) => {
    // `return` keyword added
    return fetch(url);
  })
  .then((result) => {
    // result is a Response object
  });
```

Floating promise có thể tệ hơn nếu bạn gặp race condition — nếu promise từ handler cuối không được trả về, handler `then` tiếp theo sẽ được gọi sớm và bất kỳ giá trị nào nó đọc có thể chưa đầy đủ.

```js example-bad
const listOfIngredients = [];

doSomething()
  .then((url) => {
    // Missing `return` keyword in front of fetch(url).
    fetch(url)
      .then((res) => res.json())
      .then((data) => {
        listOfIngredients.push(data);
      });
  })
  .then(() => {
    console.log(listOfIngredients);
    // listOfIngredients will always be [], because the fetch request hasn't completed yet.
  });
```

Do đó, theo nguyên tắc kinh nghiệm, bất cứ khi nào thao tác của bạn gặp promise, hãy trả về nó và trì hoãn xử lý cho handler `then` tiếp theo.

```js example-good
const listOfIngredients = [];

doSomething()
  .then((url) => {
    // `return` keyword now included in front of fetch call.
    return fetch(url)
      .then((res) => res.json())
      .then((data) => {
        listOfIngredients.push(data);
      });
  })
  .then(() => {
    console.log(listOfIngredients);
    // listOfIngredients will now contain data from fetch call.
  });
```

Thậm chí tốt hơn, bạn có thể làm phẳng chain lồng nhau thành một chain đơn, đơn giản hơn và dễ xử lý lỗi hơn. Chi tiết được thảo luận trong phần [Nesting](#nesting) bên dưới.

```js
doSomething()
  .then((url) => fetch(url))
  .then((res) => res.json())
  .then((data) => {
    listOfIngredients.push(data);
  })
  .then(() => {
    console.log(listOfIngredients);
  });
```

Dùng [`async`/`await`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) có thể giúp bạn viết code trực quan hơn và trông giống code đồng bộ. Dưới đây là ví dụ tương tự dùng `async`/`await`:

```js
async function logIngredients() {
  const url = await doSomething();
  const res = await fetch(url);
  const data = await res.json();
  listOfIngredients.push(data);
  console.log(listOfIngredients);
}
```

Lưu ý cách code trông giống hệt code đồng bộ, ngoại trừ các từ khóa `await` phía trước promise. Một trong số ít đánh đổi là dễ quên từ khóa [`await`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), điều này chỉ có thể sửa khi có sự không khớp kiểu (ví dụ như cố dùng promise như một giá trị).

`async`/`await` được xây dựng trên promise — ví dụ, `doSomething()` là cùng hàm như trước, vì vậy cần ít refactor để chuyển từ promise sang `async`/`await`. Bạn có thể đọc thêm về cú pháp `async`/`await` trong tham chiếu [async functions](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await).

> [!NOTE]
> `async`/`await` có cùng ngữ nghĩa đồng thời như các promise chain thông thường. `await` trong một async function không dừng toàn bộ chương trình, chỉ dừng các phần phụ thuộc vào giá trị của nó, vì vậy các async job khác vẫn có thể chạy trong khi `await` đang chờ.

## Xử lý lỗi

Bạn có thể nhớ đã thấy `failureCallback` ba lần trong "pyramid of doom" trước đó, so với chỉ một lần ở cuối promise chain:

```js
doSomething()
  .then((result) => doSomethingElse(result))
  .then((newResult) => doThirdThing(newResult))
  .then((finalResult) => console.log(`Got the final result: ${finalResult}`))
  .catch(failureCallback);
```

Nếu có exception, trình duyệt sẽ tìm kiếm xuống chain các handler `.catch()` hay `onRejected`. Điều này rất giống cách code đồng bộ hoạt động:

```js
try {
  const result = syncDoSomething();
  const newResult = syncDoSomethingElse(result);
  const finalResult = syncDoThirdThing(newResult);
  console.log(`Got the final result: ${finalResult}`);
} catch (error) {
  failureCallback(error);
}
```

Sự đối xứng này với code bất đồng bộ đạt đỉnh điểm trong cú pháp `async`/`await`:

```js
async function foo() {
  try {
    const result = await doSomething();
    const newResult = await doSomethingElse(result);
    const finalResult = await doThirdThing(newResult);
    console.log(`Got the final result: ${finalResult}`);
  } catch (error) {
    failureCallback(error);
  }
}
```

Promise giải quyết lỗ hổng cơ bản với pyramid of doom của callback, bằng cách bắt tất cả lỗi, kể cả exception được throw và lỗi lập trình. Điều này rất cần thiết cho việc kết hợp hàm của các thao tác bất đồng bộ. Tất cả lỗi giờ được xử lý bởi phương thức [`catch()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) ở cuối chain, và bạn hầu như không bao giờ cần dùng `try`/`catch` mà không dùng `async`/`await`.

### Nesting

Trong các ví dụ trên liên quan đến `listOfIngredients`, ví dụ đầu tiên có một promise chain lồng trong giá trị trả về của handler `then()` khác, trong khi ví dụ thứ hai dùng chain hoàn toàn phẳng. Các promise chain đơn giản tốt nhất nên giữ phẳng không lồng nhau, vì nesting có thể là kết quả của việc kết hợp cẩu thả.

Nesting là cấu trúc điều khiển để giới hạn phạm vi của các câu lệnh `catch`. Cụ thể, `catch` lồng chỉ bắt các lỗi trong phạm vi của nó và bên dưới, không phải các lỗi cao hơn trong chain bên ngoài phạm vi lồng nhau. Khi được sử dụng đúng cách, điều này cho phép xử lý lỗi chính xác hơn:

```js
doSomethingCritical()
  .then((result) =>
    doSomethingOptional(result)
      .then((optionalResult) => doSomethingExtraNice(optionalResult))
      .catch((e) => {}),
  ) // Ignore if optional stuff fails; proceed.
  .then(() => moreCriticalStuff())
  .catch((e) => console.error(`Critical failure: ${e.message}`));
```

Lưu ý rằng các bước tùy chọn ở đây được lồng nhau — với nesting gây ra không phải bởi thụt lề, mà bởi vị trí dấu ngoặc đơn ngoài `(` và `)` xung quanh các bước.

Handler `catch` bên trong im lặng lỗi chỉ bắt lỗi từ `doSomethingOptional()` và `doSomethingExtraNice()`, sau đó code tiếp tục với `moreCriticalStuff()`. Quan trọng là, nếu `doSomethingCritical()` thất bại, lỗi của nó chỉ được bắt bởi `catch` cuối (bên ngoài), và không bị nuốt bởi handler `catch` bên trong.

Trong `async`/`await`, code này trông như sau:

```js
async function main() {
  try {
    const result = await doSomethingCritical();
    try {
      const optionalResult = await doSomethingOptional(result);
      await doSomethingExtraNice(optionalResult);
    } catch (e) {
      // Ignore failures in optional steps and proceed.
    }
    await moreCriticalStuff();
  } catch (e) {
    console.error(`Critical failure: ${e.message}`);
  }
}
```

> [!NOTE]
> Nếu bạn không có xử lý lỗi phức tạp, rất có thể bạn không cần handler `then` lồng nhau. Thay vào đó, hãy dùng chain phẳng và đặt logic xử lý lỗi ở cuối.

### Chaining sau catch

Có thể chain _sau_ khi thất bại, tức là sau `catch`, điều này hữu ích để thực hiện các hành động mới ngay cả sau khi một hành động thất bại trong chain. Đọc ví dụ sau:

```js
doSomething()
  .then(() => {
    throw new Error("Something failed");

    console.log("Do this");
  })
  .catch(() => {
    console.error("Do that");
  })
  .then(() => {
    console.log("Do this, no matter what happened before");
  });
```

Điều này sẽ xuất ra văn bản sau:

```plain
Do that
Do this, no matter what happened before
```

> [!NOTE]
> Văn bản "Do this" không được hiển thị vì lỗi "Something failed" đã gây ra rejection.

Trong `async`/`await`, code này trông như sau:

```js
async function main() {
  try {
    await doSomething();
    throw new Error("Something failed");
    console.log("Do this");
  } catch (e) {
    console.error("Do that");
  }
  console.log("Do this, no matter what happened before");
}
```

### Sự kiện rejection của promise

Nếu sự kiện rejection của promise không được xử lý bởi handler nào, nó sẽ nổi lên đến đỉnh call stack và host cần phô bày nó. Trên web, bất cứ khi nào promise bị reject, một trong hai sự kiện được gửi đến scope toàn cục (nói chung là [`window`](/en-US/docs/Web/API/Window) hoặc nếu dùng trong web worker, đó là [`Worker`](/en-US/docs/Web/API/Worker) hay interface khác dựa trên worker). Hai sự kiện là:

- [`unhandledrejection`](/en-US/docs/Web/API/Window/unhandledrejection_event)
  - : Được gửi khi promise bị reject nhưng không có rejection handler nào.
- [`rejectionhandled`](/en-US/docs/Web/API/Window/rejectionhandled_event)
  - : Được gửi khi handler được đính kèm vào promise đã bị reject và đã gây ra sự kiện `unhandledrejection`.

Trong cả hai trường hợp, sự kiện (kiểu [`PromiseRejectionEvent`](/en-US/docs/Web/API/PromiseRejectionEvent)) có các thành viên là thuộc tính [`promise`](/en-US/docs/Web/API/PromiseRejectionEvent/promise) chỉ ra promise bị reject, và thuộc tính [`reason`](/en-US/docs/Web/API/PromiseRejectionEvent/reason) cung cấp lý do promise bị reject.

Những điều này giúp cung cấp xử lý lỗi dự phòng cho promise, cũng như hỗ trợ debug các vấn đề với quản lý promise của bạn. Các handler này là toàn cục mỗi context, vì vậy tất cả lỗi sẽ đi đến cùng event handler, bất kể nguồn gốc.

Trong [Node.js](/en-US/docs/Glossary/Node.js), xử lý rejection của promise hơi khác. Bạn bắt các rejection chưa được xử lý bằng cách thêm handler cho sự kiện `unhandledRejection` của Node.js (lưu ý sự khác biệt trong cách viết hoa tên), như sau:

```js
process.on("unhandledRejection", (reason, promise) => {
  // Add code here to examine the "promise" and "reason" values
});
```

Đối với Node.js, để ngăn lỗi được ghi vào console (hành vi mặc định nếu không có), chỉ cần thêm listener `process.on()` là đủ; không cần tương đương của phương thức [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault) của trình duyệt.

Tuy nhiên, nếu bạn thêm listener `process.on` đó nhưng không có code bên trong nó để xử lý các promise bị reject, chúng sẽ bị bỏ qua và im lặng. Vì vậy, trong lý tưởng, bạn nên thêm code trong listener đó để kiểm tra từng promise bị reject và đảm bảo nó không phải do lỗi code thực sự.

## Composition

Có bốn [công cụ composition](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency) để chạy các thao tác bất đồng bộ đồng thời: {{jsxref("Promise.all()")}}, {{jsxref("Promise.allSettled()")}}, {{jsxref("Promise.any()")}}, và {{jsxref("Promise.race()")}}.

Chúng ta có thể bắt đầu các thao tác cùng lúc và chờ tất cả hoàn thành như sau:

```js
Promise.all([func1(), func2(), func3()]).then(([result1, result2, result3]) => {
  // use result1, result2 and result3
});
```

Nếu một trong các promise trong mảng bị reject, `Promise.all()` sẽ ngay lập tức reject promise được trả về. Các thao tác khác tiếp tục chạy, nhưng kết quả của chúng không có sẵn qua giá trị trả về của `Promise.all()`. Điều này có thể gây ra trạng thái hoặc hành vi không mong muốn. {{jsxref("Promise.allSettled()")}} là công cụ composition khác đảm bảo tất cả thao tác hoàn thành trước khi resolve.

Tất cả các phương thức này đều chạy promise đồng thời — một chuỗi promise được bắt đầu đồng thời và không chờ nhau. Composition tuần tự có thể thực hiện bằng một chút JavaScript khéo léo:

```js
[func1, func2, func3]
  .reduce((p, f) => p.then(f), Promise.resolve())
  .then((result3) => {
    /* use result3 */
  });
```

Trong ví dụ này, chúng ta [reduce](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce) mảng các hàm bất đồng bộ xuống còn promise chain. Code trên tương đương với:

```js
Promise.resolve()
  .then(func1)
  .then(func2)
  .then(func3)
  .then((result3) => {
    /* use result3 */
  });
```

Điều này có thể được đưa vào hàm compose có thể tái sử dụng, phổ biến trong lập trình hàm:

```js
const applyAsync = (acc, val) => acc.then(val);
const composeAsync =
  (...funcs) =>
  (x) =>
    funcs.reduce(applyAsync, Promise.resolve(x));
```

Hàm `composeAsync()` nhận bất kỳ số lượng hàm nào làm đối số và trả về hàm mới nhận giá trị ban đầu để truyền qua pipeline composition:

```js
const transformData = composeAsync(func1, func2, func3);
const result3 = transformData(data);
```

Composition tuần tự cũng có thể thực hiện ngắn gọn hơn với async/await:

```js
let result;
for (const f of [func1, func2, func3]) {
  result = await f(result);
}
/* use last result (i.e. result3) */
```

Tuy nhiên, trước khi compose promise tuần tự, hãy xem xét xem điều đó có thực sự cần thiết không — luôn tốt hơn khi chạy promise đồng thời để chúng không chặn nhau một cách không cần thiết trừ khi việc thực thi của một promise phụ thuộc vào kết quả của promise khác.

## Cancellation

`Promise` bản thân không có giao thức first-class cho việc hủy, nhưng bạn có thể trực tiếp hủy thao tác bất đồng bộ bên dưới, thường dùng [`AbortController`](/en-US/docs/Web/API/AbortController).

## Tạo Promise từ callback API cũ

{{jsxref("Promise")}} có thể được tạo từ đầu bằng [constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise). Điều này chỉ nên cần để bọc các API cũ.

Trong thế giới lý tưởng, tất cả các hàm bất đồng bộ sẽ đã trả về promise. Tiếc là, một số API vẫn mong đợi callback thành công và/hoặc thất bại được truyền theo cách cũ. Ví dụ rõ ràng nhất là hàm {{domxref("Window.setTimeout", "setTimeout()")}}:

```js
setTimeout(() => saySomething("10 seconds passed"), 10 * 1000);
```

Trộn lẫn callback kiểu cũ với promise là vấn đề. Nếu `saySomething()` thất bại hoặc có lỗi lập trình, sẽ không có gì bắt được. Đây là bản chất thiết kế của `setTimeout()`.

May mắn thay, chúng ta có thể bọc `setTimeout()` trong một promise. Thực hành tốt nhất là bọc các hàm chấp nhận callback ở mức thấp nhất có thể, rồi không bao giờ gọi trực tiếp chúng nữa:

```js
const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

wait(10 * 1000)
  .then(() => saySomething("10 seconds"))
  .catch(failureCallback);
```

Promise constructor nhận hàm executor cho phép chúng ta resolve hoặc reject promise thủ công. Vì `setTimeout()` không thực sự thất bại, chúng ta đã bỏ qua reject trong trường hợp này. Để biết thêm thông tin về cách hàm executor hoạt động, xem tham chiếu [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise).

## Timing

Cuối cùng, chúng ta sẽ xem xét các chi tiết kỹ thuật hơn, về thời điểm callback đã đăng ký được gọi.

### Đảm bảo

Trong callback-based API, thời điểm và cách callback được gọi phụ thuộc vào người triển khai API. Ví dụ, callback có thể được gọi đồng bộ hoặc bất đồng bộ:

```js example-bad
function doSomething(callback) {
  if (Math.random() > 0.5) {
    callback();
  } else {
    setTimeout(() => callback(), 1000);
  }
}
```

Thiết kế trên bị phản đối mạnh vì dẫn đến "state of Zalgo". Trong ngữ cảnh thiết kế API bất đồng bộ, điều này có nghĩa là callback được gọi đồng bộ trong một số trường hợp nhưng bất đồng bộ trong các trường hợp khác, gây ra sự mơ hồ cho người gọi. Để biết thêm bối cảnh, xem bài viết [Designing APIs for Asynchrony](https://blog.izs.me/2013/08/designing-apis-for-asynchrony/), nơi thuật ngữ này được trình bày chính thức lần đầu. Thiết kế API này làm side effects khó phân tích:

```js
let value = 1;
doSomething(() => {
  value = 2;
});
console.log(value); // 1 or 2?
```

Mặt khác, promise là một hình thức [inversion of control](https://en.wikipedia.org/wiki/Inversion_of_control) — người triển khai API không kiểm soát thời điểm callback được gọi. Thay vào đó, công việc duy trì callback queue và quyết định thời điểm gọi callback được ủy thác cho việc triển khai promise, và cả người dùng API lẫn nhà phát triển API đều tự động nhận được các đảm bảo ngữ nghĩa mạnh, bao gồm:

- Callback được thêm bằng [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) sẽ không bao giờ được gọi trước khi [hoàn thành lần chạy hiện tại](/en-US/docs/Web/JavaScript/Reference/Execution_model#run-to-completion) của event loop JavaScript.
- Các callback này sẽ được gọi ngay cả khi chúng được thêm vào _sau_ khi thao tác bất đồng bộ mà promise đại diện thành công hay thất bại.
- Nhiều callback có thể được thêm bằng cách gọi [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) nhiều lần. Chúng sẽ được gọi theo thứ tự, theo thứ tự chúng được chèn vào.

Để tránh bất ngờ, các hàm được truyền vào [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) sẽ không bao giờ được gọi đồng bộ, kể cả với promise đã resolve:

```js
Promise.resolve().then(() => console.log(2));
console.log(1);
// Logs: 1, 2
```

Thay vì chạy ngay lập tức, hàm được truyền vào được đặt vào microtask queue, có nghĩa là nó chạy sau (chỉ sau khi hàm tạo ra nó thoát ra, và khi stack thực thi JavaScript trống), ngay trước khi quyền kiểm soát được trả về cho event loop; tức là, khá sớm:

```js
const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

wait(0).then(() => console.log(4));
Promise.resolve()
  .then(() => console.log(2))
  .then(() => console.log(3));
console.log(1); // 1, 2, 3, 4
```

### Task queues và microtasks

Promise callback được xử lý như [microtask](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide) trong khi callback {{domxref("Window.setTimeout", "setTimeout()")}} được xử lý như task queue.

```js
const promise = new Promise((resolve, reject) => {
  console.log("Promise callback");
  resolve();
}).then((result) => {
  console.log("Promise callback (.then)");
});

setTimeout(() => {
  console.log("event-loop cycle: Promise (fulfilled)", promise);
}, 0);

console.log("Promise (pending)", promise);
```

Code trên sẽ xuất ra:

```plain
Promise callback
Promise (pending) Promise {<pending>}
Promise callback (.then)
event-loop cycle: Promise (fulfilled) Promise {<fulfilled>}
```

Để biết thêm chi tiết, tham khảo [Tasks vs. microtasks](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide/In_depth#tasks_vs._microtasks).

### Khi promise và task xảy ra cùng lúc

Nếu bạn gặp tình huống có promise và task (như events hay callback) kích hoạt theo thứ tự không thể đoán trước, có thể bạn sẽ hưởng lợi từ việc dùng microtask để kiểm tra trạng thái hoặc cân bằng promise khi promise được tạo có điều kiện.

Nếu bạn nghĩ microtask có thể giúp giải quyết vấn đề này, xem [hướng dẫn microtask](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide) để tìm hiểu cách dùng {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} để đưa hàm vào hàng đợi như microtask.

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("Operators/await", "await")}}
- [Promises/A+ specification](https://promisesaplus.com/)
- [We have a problem with promises](https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html) on pouchdb.com (2015)

{{PreviousNext("Web/JavaScript/Guide/Using_classes", "Web/JavaScript/Guide/Typed_arrays")}}
