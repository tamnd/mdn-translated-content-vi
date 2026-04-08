---
title: async function
slug: Web/JavaScript/Reference/Statements/async_function
page-type: javascript-statement
browser-compat: javascript.statements.async_function
sidebar: jssidebar
---

Khai báo **`async function`** tạo ra một {{Glossary("binding")}} của một async function mới với một tên đã cho. Từ khóa `await` được phép sử dụng trong thân function, cho phép viết các hành vi bất đồng bộ dựa trên promise theo phong cách rõ ràng hơn và tránh cần thiết phải cấu hình rõ ràng các chuỗi promise.

Bạn cũng có thể định nghĩa async function bằng cách sử dụng [`async function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function).

{{InteractiveExample("JavaScript Demo: async function declaration", "taller")}}

```js interactive-example
function resolveAfter2Seconds() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("resolved");
    }, 2000);
  });
}

async function asyncCall() {
  console.log("calling");
  const result = await resolveAfter2Seconds();
  console.log(result);
  // Expected output: "resolved"
}

asyncCall();
```

## Cú pháp

```js-nolint
async function name(param0) {
  statements
}
async function name(param0, param1) {
  statements
}
async function name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Không được có dấu ngắt dòng giữa `async` và `function`, nếu không, dấu chấm phẩy sẽ được [tự động chèn vào](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion), khiến `async` trở thành một định danh và phần còn lại trở thành một khai báo `function`.

### Tham số

- `name`
  - : Tên của function.
- `param` {{optional_inline}}
  - : Tên của một tham số hình thức cho function. Để biết cú pháp của các tham số, xem [Tham chiếu Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo thành thân của function. Cơ chế `await`
    có thể được sử dụng.

## Mô tả

Một khai báo `async function` tạo ra một đối tượng {{jsxref("AsyncFunction")}}. Mỗi lần một async function được gọi, nó trả về một {{jsxref("Promise")}} mới sẽ được resolved với giá trị được trả về bởi async function, hoặc rejected với một ngoại lệ không được bắt trong async function.

Các async function có thể chứa không hoặc nhiều biểu thức {{jsxref("Operators/await", "await")}}. Các biểu thức await khiến các function trả về promise hoạt động như thể chúng đồng bộ bằng cách tạm dừng thực thi cho đến khi promise được trả về fulfilled hoặc rejected. Giá trị resolved của promise được coi như giá trị trả về của biểu thức await. Việc sử dụng `async` và `await` cho phép sử dụng các khối `try` / `catch` thông thường xung quanh code bất đồng bộ.

> [!NOTE]
> Từ khóa `await` chỉ hợp lệ bên trong các async function trong code JavaScript thông thường. Nếu bạn sử dụng nó bên ngoài thân của một async function, bạn sẽ nhận được một {{jsxref("SyntaxError")}}.
>
> `await` có thể được sử dụng độc lập với [JavaScript modules.](/en-US/docs/Web/JavaScript/Guide/Modules)

> [!NOTE]
> Mục đích của `async`/`await` là đơn giản hóa cú pháp
> cần thiết để sử dụng các API dựa trên promise. Hành vi
> của `async`/`await` tương tự như kết hợp [generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) và
> promise.

Các async function luôn trả về một promise. Nếu giá trị trả về của một async function
không phải là một promise rõ ràng, nó sẽ được bọc ngầm trong một promise.

Ví dụ, hãy xem đoạn code sau:

```js
async function foo() {
  return 1;
}
```

Nó tương đương với:

```js
function foo() {
  return Promise.resolve(1);
}
```

Lưu ý rằng mặc dù giá trị trả về của một async function hoạt động như thể nó được bọc trong `Promise.resolve`, chúng không tương đương. Một async function sẽ trả về một _tham chiếu_ khác, trong khi `Promise.resolve` trả về cùng tham chiếu nếu giá trị đã cho là một promise. Điều này có thể là vấn đề khi bạn muốn kiểm tra sự bằng nhau của một promise và giá trị trả về của một async function.

```js
const p = new Promise((res, rej) => {
  res(1);
});

async function asyncReturn() {
  return p;
}

function basicReturn() {
  return Promise.resolve(p);
}

console.log(p === basicReturn()); // true
console.log(p === asyncReturn()); // false
```

Thân của một async function có thể được coi như được chia nhỏ bởi không hoặc nhiều biểu thức await. Code ở cấp cao nhất, bao gồm biểu thức await đầu tiên (nếu có), được chạy đồng bộ. Theo cách này, một async function không có biểu thức await sẽ chạy đồng bộ. Tuy nhiên, nếu có một biểu thức await bên trong thân function, async function sẽ luôn hoàn thành theo cách bất đồng bộ.

Ví dụ:

```js
async function foo() {
  await 1;
}
```

Nó cũng tương đương với:

```js
function foo() {
  return Promise.resolve(1).then(() => undefined);
}
```

Code sau mỗi biểu thức await có thể được coi như tồn tại trong một callback `.then`.
Theo cách này, một chuỗi promise được xây dựng dần dần với mỗi bước re-entrant
qua function. Giá trị trả về tạo thành liên kết cuối cùng trong chuỗi.

Trong ví dụ sau, chúng ta await hai promise liên tiếp. Tiến trình đi qua
function `foo` theo ba giai đoạn.

1. Dòng đầu tiên của thân function `foo` được thực thi đồng bộ,
   với biểu thức await được cấu hình với promise đang pending. Tiến trình qua
   `foo` sau đó bị tạm dừng và quyền kiểm soát được trả về cho function đã
   gọi `foo`.
2. Một thời gian sau, khi promise đầu tiên đã fulfilled hoặc rejected,
   quyền kiểm soát quay trở lại `foo`. Kết quả của sự fulfilled promise đầu tiên
   (nếu nó không bị rejected) được trả về từ biểu thức await. Ở đây `1` được
   gán cho `result1`. Tiến trình tiếp tục, và biểu thức await thứ hai
   được đánh giá. Một lần nữa, tiến trình qua `foo` bị tạm dừng và quyền kiểm soát
   được nhường lại.
3. Một thời gian sau, khi promise thứ hai đã fulfilled hoặc rejected,
   quyền kiểm soát re-enters `foo`. Kết quả của việc resolution promise thứ hai được
   trả về từ biểu thức await thứ hai. Ở đây `2` được gán cho
   `result2`. Quyền kiểm soát chuyển đến biểu thức return (nếu có). Giá trị
   return mặc định là `undefined` được trả về như giá trị resolution của
   promise hiện tại.

```js
async function foo() {
  const result1 = await new Promise((resolve) =>
    setTimeout(() => resolve("1")),
  );
  const result2 = await new Promise((resolve) =>
    setTimeout(() => resolve("2")),
  );
}
foo();
```

Lưu ý cách chuỗi promise không được xây dựng một lúc. Thay vào đó, chuỗi promise được
xây dựng theo từng giai đoạn khi quyền kiểm soát được nhường đi và trả về cho async
function một cách liên tiếp. Kết quả là, chúng ta phải chú ý đến hành vi xử lý lỗi khi xử lý
các thao tác bất đồng bộ đồng thời.

Ví dụ, trong đoạn code sau, một lỗi unhandled promise rejection sẽ được ném ra,
ngay cả khi một handler `.catch` đã được cấu hình ở phần sau của chuỗi
promise. Điều này là vì `p2` sẽ không được "kết nối vào" chuỗi promise cho đến khi
quyền kiểm soát trả về từ `p1`.

```js
async function foo() {
  const p1 = new Promise((resolve) => setTimeout(() => resolve("1"), 1000));
  const p2 = new Promise((_, reject) =>
    setTimeout(() => reject(new Error("failed")), 500),
  );
  const results = [await p1, await p2]; // Do not do this! Use Promise.all or Promise.allSettled instead.
}
foo().catch(() => {}); // Attempt to swallow all errors...
```

Các khai báo `async function` hoạt động tương tự như các khai báo {{jsxref("Statements/function", "function")}} — chúng được [hoisted](/en-US/docs/Glossary/Hoisting) lên đầu scope của chúng và có thể được gọi ở bất cứ đâu trong scope của chúng, và chúng chỉ có thể được khai báo lại trong một số context nhất định.

## Ví dụ

### Async function và thứ tự thực thi

```js
function resolveAfter2Seconds() {
  console.log("starting slow promise");
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("slow");
      console.log("slow promise is done");
    }, 2000);
  });
}

function resolveAfter1Second() {
  console.log("starting fast promise");
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("fast");
      console.log("fast promise is done");
    }, 1000);
  });
}

async function sequentialStart() {
  console.log("== sequentialStart starts ==");

  // 1. Start a timer, log after it's done
  const slow = resolveAfter2Seconds();
  console.log(await slow);

  // 2. Start the next timer after waiting for the previous one
  const fast = resolveAfter1Second();
  console.log(await fast);

  console.log("== sequentialStart done ==");
}

async function sequentialWait() {
  console.log("== sequentialWait starts ==");

  // 1. Start two timers without waiting for each other
  const slow = resolveAfter2Seconds();
  const fast = resolveAfter1Second();

  // 2. Wait for the slow timer to complete, and then log the result
  console.log(await slow);
  // 3. Wait for the fast timer to complete, and then log the result
  console.log(await fast);

  console.log("== sequentialWait done ==");
}

async function concurrent1() {
  console.log("== concurrent1 starts ==");

  // 1. Start two timers concurrently and wait for both to complete
  const results = await Promise.all([
    resolveAfter2Seconds(),
    resolveAfter1Second(),
  ]);
  // 2. Log the results together
  console.log(results[0]);
  console.log(results[1]);

  console.log("== concurrent1 done ==");
}

async function concurrent2() {
  console.log("== concurrent2 starts ==");

  // 1. Start two timers concurrently, log immediately after each one is done
  await Promise.all([
    (async () => console.log(await resolveAfter2Seconds()))(),
    (async () => console.log(await resolveAfter1Second()))(),
  ]);
  console.log("== concurrent2 done ==");
}

sequentialStart(); // after 2 seconds, logs "slow", then after 1 more second, "fast"

// wait above to finish
setTimeout(sequentialWait, 4000); // after 2 seconds, logs "slow" and then "fast"

// wait again
setTimeout(concurrent1, 7000); // same as sequentialWait

// wait again
setTimeout(concurrent2, 10000); // after 1 second, logs "fast", then after 1 more second, "slow"
```

#### await và đồng thời (concurrency)

Trong `sequentialStart`, quá trình thực thi bị tạm dừng 2 giây cho
`await` đầu tiên, và sau đó thêm một giây nữa cho `await` thứ hai. Bộ đếm thời gian
thứ hai không được tạo cho đến khi bộ đếm đầu tiên đã hoàn tất, vì vậy code hoàn thành
sau 3 giây.

Trong `sequentialWait`, cả hai bộ đếm thời gian đều được tạo và sau đó được `await`. Các
bộ đếm chạy đồng thời, có nghĩa là code hoàn thành trong 2 giây thay vì 3 giây,
tức là bộ đếm chậm nhất.
Tuy nhiên, các lời gọi `await` vẫn chạy theo thứ tự, có nghĩa là `await`
thứ hai sẽ chờ cái đầu tiên hoàn thành. Trong trường hợp này, kết quả của
bộ đếm nhanh nhất được xử lý sau bộ đếm chậm nhất.

Nếu bạn muốn thực hiện an toàn các công việc khác sau khi hai hoặc nhiều công việc chạy đồng thời và hoàn thành, bạn phải await một lời gọi
đến {{jsxref("Promise.all()")}} hoặc {{jsxref("Promise.allSettled()")}} trước công việc đó.

> [!WARNING]
> Các function `sequentialWait` và `concurrent1`
> không tương đương về mặt chức năng.
>
> Trong `sequentialWait`, nếu promise `fast` reject trước khi promise
> `slow` được fulfilled, thì một lỗi unhandled promise rejection sẽ được
> raised, bất kể người gọi có cấu hình một mệnh đề catch hay không.
>
> Trong `concurrent1`, `Promise.all` kết nối chuỗi
> promise trong một lần, có nghĩa là thao tác sẽ fail-fast bất kể thứ tự
> rejection của các promise, và lỗi sẽ luôn xảy ra trong chuỗi
> promise đã được cấu hình, cho phép nó được bắt theo cách thông thường.

### Viết lại chuỗi Promise với async function

Một API trả về {{jsxref("Promise")}} sẽ tạo ra một chuỗi promise, và nó
chia function thành nhiều phần. Hãy xem đoạn code sau:

```js
function getProcessedData(url) {
  return downloadData(url) // returns a promise
    .catch((e) => downloadFallbackData(url)) // returns a promise
    .then((v) => processDataInWorker(v)); // returns a promise
}
```

Nó có thể được viết lại với một async function duy nhất như sau:

```js
async function getProcessedData(url) {
  let v;
  try {
    v = await downloadData(url);
  } catch (e) {
    v = await downloadFallbackData(url);
  }
  return processDataInWorker(v);
}
```

Ngoài ra, bạn có thể kết nối chuỗi promise với `catch()`:

```js
async function getProcessedData(url) {
  const v = await downloadData(url).catch((e) => downloadFallbackData(url));
  return processDataInWorker(v);
}
```

Trong hai phiên bản được viết lại, lưu ý rằng không có câu lệnh `await` sau từ khóa
`return`, mặc dù điều đó cũng hợp lệ: Giá trị trả về của một
async function được bọc ngầm trong {{jsxref("Promise.resolve")}} - nếu
nó chưa phải là một promise (như trong các ví dụ).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- Hướng dẫn [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("AsyncFunction")}}
- [`async function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function)
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Statements/async_function*", "async function*")}}
- {{jsxref("Operators/await", "await")}}
- {{jsxref("Promise")}}
- [Decorating async JavaScript functions](https://innolitics.com/10x/javascript-decorators-for-promise-returning-functions/) trên innolitics.com (2016)
