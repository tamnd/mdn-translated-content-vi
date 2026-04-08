---
title: await using
slug: Web/JavaScript/Reference/Statements/await_using
page-type: javascript-statement
browser-compat: javascript.statements.await_using
sidebar: jssidebar
---

Khai báo **`await using`** khai báo các biến cục bộ có phạm vi khối được _giải phóng bất đồng bộ_. Giống như {{jsxref("Statements/const", "const")}}, các biến được khai báo với `await using` phải được khởi tạo và không thể được gán lại. Giá trị của biến phải là `null`, `undefined`, hoặc một đối tượng có phương thức [`[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncDispose) hoặc [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/dispose). Khi biến ra khỏi phạm vi, phương thức `[Symbol.asyncDispose]()` hoặc `[Symbol.dispose]()` của đối tượng được gọi và chờ đợi, để đảm bảo rằng các tài nguyên được giải phóng.

## Cú pháp

```js-nolint
await using name1 = value1;
await using name1 = value1, name2 = value2;
await using name1 = value1, name2 = value2, /* …, */ nameN = valueN;
```

- `nameN`
  - : Tên của biến cần khai báo. Mỗi tên phải là một [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ và _không_ phải là một [mẫu ràng buộc destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `valueN`
  - : Giá trị ban đầu của biến. Có thể là bất kỳ biểu thức hợp lệ nào nhưng giá trị của nó phải là `null`, `undefined`, hoặc một đối tượng có phương thức [`[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncDispose) hoặc [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/dispose).

## Mô tả

Khai báo này chỉ có thể được sử dụng ở những nơi mà cả {{jsxref("Operators/await", "await")}} và {{jsxref("Statements/using", "using")}} đều có thể được sử dụng, bao gồm:

- Bên trong một [khối lệnh](/en-US/docs/Web/JavaScript/Reference/Statements/block) (nếu khối lệnh cũng nằm trong ngữ cảnh bất đồng bộ)
- Bên trong thân của một [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc async generator function
- Ở cấp độ cao nhất của một [module](/en-US/docs/Web/JavaScript/Guide/Modules)
- Trong phần khởi tạo của vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for), [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) (nếu vòng lặp `for` cũng nằm trong ngữ cảnh bất đồng bộ), hoặc [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of)

`await using` khai báo một tài nguyên có thể giải phóng bất đồng bộ được gắn với thời gian tồn tại của phạm vi biến (khối lệnh, hàm, module, v.v.). Khi phạm vi kết thúc, tài nguyên được giải phóng bất đồng bộ. Cú pháp của nó có thể gây nhầm lẫn một chút, vì `await` không có hiệu ứng chờ đợi khi biến được khai báo lần đầu, mà chỉ khi biến ra khỏi phạm vi.

Khi một biến được khai báo lần đầu và giá trị của nó khác null, một _disposer_ được lấy từ đối tượng. Thuộc tính `[Symbol.asyncDispose]` được thử trước, và nếu `[Symbol.asyncDispose]` là `undefined` thì chuyển sang `[Symbol.dispose]`. Nếu không có thuộc tính nào chứa một hàm, một `TypeError` sẽ được ném ra. Đáng chú ý, phương thức `[Symbol.dispose]()` được bọc vào một hàm trông giống như `async () => { object[Symbol.dispose](); }`, có nghĩa là nếu nó trả về một promise, promise đó _không_ được chờ đợi. Disposer này được lưu vào phạm vi.

Khi biến ra khỏi phạm vi, disposer được gọi và chờ đợi. Nếu phạm vi chứa nhiều khai báo {{jsxref("Statements/using", "using")}} hoặc `await using`, tất cả các disposer sẽ chạy tuần tự theo thứ tự ngược lại của khai báo, bất kể loại khai báo. Tất cả các disposer đều được đảm bảo chạy (giống như khối `finally` trong {{jsxref("Statements/try...catch", "try...catch...finally")}}). Tất cả các lỗi xảy ra trong quá trình giải phóng, bao gồm cả lỗi ban đầu khiến phạm vi kết thúc (nếu có), đều được tổng hợp trong một {{jsxref("SuppressedError")}}, với mỗi ngoại lệ trước đó là thuộc tính `suppressed` và ngoại lệ sau là thuộc tính `error`. `SuppressedError` này được ném ra sau khi việc giải phóng hoàn tất.

Biến được phép có giá trị `null` hoặc `undefined`, do đó tài nguyên có thể tùy chọn có mặt. Miễn là một biến `await using` được khai báo trong phạm vi này, ít nhất một `await` được đảm bảo xảy ra khi thoát phạm vi, ngay cả khi biến thực sự có giá trị `null` hoặc `undefined`. Điều này ngăn việc giải phóng xảy ra đồng bộ, gây ra các vấn đề về thời gian (xem [hiệu ứng luồng điều khiển của `await`](/en-US/docs/Web/JavaScript/Reference/Operators/await#control_flow_effects_of_await)).

`await using` gắn việc quản lý tài nguyên với các phạm vi từ vựng, vừa tiện lợi vừa đôi khi gây nhầm lẫn. Xem bên dưới để biết một số ví dụ mà nó có thể không hoạt động như bạn mong đợi. Nếu bạn muốn quản lý việc giải phóng tài nguyên thủ công, trong khi vẫn duy trì các đảm bảo xử lý lỗi tương tự, bạn có thể sử dụng {{jsxref("AsyncDisposableStack")}} thay thế.

## Ví dụ

Bạn cũng nên xem {{jsxref("Statements/using", "using")}} để biết thêm ví dụ, đặc biệt là một số lưu ý chung liên quan đến quản lý tài nguyên dựa trên phạm vi.

### Sử dụng cơ bản

Thông thường, bạn sử dụng `await using` trên một tài nguyên do thư viện cung cấp đã triển khai giao thức async disposable. Ví dụ, [`FileHandle`](https://nodejs.org/api/fs.html#filehandlesymbolasyncdispose) của Node.js là async disposable:

```js
import fs from "node:fs/promises";

async function example() {
  await using file = await fs.open("example.txt", "r");
  console.log(await file.read());
  // Trước khi `file` ra khỏi phạm vi, nó được giải phóng bằng cách gọi `file[Symbol.asyncDispose]()` và chờ đợi.
}
```

Lưu ý rằng có hai thao tác `await` trong khai báo cho `file`, thực hiện những việc khác nhau và cả hai đều cần thiết. `await fs.open()` gây ra một await trong quá trình _thu nhận_: nó chờ tệp được mở và giải nén promise được trả về thành một đối tượng `FileHandle`. `await using file` gây ra một await trong quá trình _giải phóng_: nó làm cho `file` được giải phóng bất đồng bộ khi biến ra khỏi phạm vi.

### `await using` với `for await...of`

Rất dễ nhầm lẫn ba cú pháp sau:

- `for await (using x of y) { ... }`
- `for (await using x of y) { ... }`
- `for (using x of await y) { ... }`

Có thể còn gây nhầm lẫn hơn khi biết rằng chúng có thể được sử dụng cùng nhau.

```js
for await (await using x of await y) {
  // ...
}
```

Đầu tiên, `await y` làm những gì bạn mong đợi: chúng ta {{jsxref("Operators/await", "await")}} promise `y`, được kỳ vọng sẽ resolve thành một đối tượng để lặp. Hãy để biến thể này sang một bên.

Vòng lặp {{jsxref("Statements/for-await...of", "for await...of")}} yêu cầu đối tượng `y` là một _async iterable_. Điều này có nghĩa là đối tượng phải có một phương thức `[Symbol.asyncIterator]` trả về một _async iterator_, có phương thức `next()` trả về một promise đại diện cho kết quả. Điều này dành cho khi iterable không biết giá trị tiếp theo là gì, hoặc thậm chí liệu nó đã xong chưa, cho đến khi một thao tác bất đồng bộ hoàn thành.

Mặt khác, cú pháp `await using x` yêu cầu đối tượng `x`, được yield từ iterable, là một _async disposable_. Điều này có nghĩa là đối tượng phải có một phương thức `[Symbol.asyncDispose]` trả về một promise đại diện cho thao tác giải phóng. Đây là mối quan tâm riêng biệt với chính quá trình lặp, và chỉ được gọi khi biến `x` ra khỏi phạm vi.

Nói cách khác, tất cả bốn kết hợp sau đây đều hợp lệ và làm những việc khác nhau:

- `for (using x of y)`: `y` được lặp đồng bộ, yielding một kết quả tại một thời điểm, có thể được giải phóng đồng bộ.
- `for await (using x of y)`: `y` được lặp bất đồng bộ, yielding một kết quả tại một thời điểm sau khi chờ đợi, nhưng giá trị kết quả có thể được giải phóng đồng bộ.
- `for (await using x of y)`: `y` được lặp đồng bộ, yielding một kết quả tại một thời điểm, nhưng giá trị kết quả chỉ có thể được giải phóng bất đồng bộ.
- `for await (await using x of y)`: `y` được lặp bất đồng bộ, yielding một kết quả tại một thời điểm sau khi chờ đợi, và giá trị kết quả chỉ có thể được giải phóng bất đồng bộ.

Dưới đây, chúng ta tạo ra một số giá trị hư cấu của `y` để minh họa các trường hợp sử dụng của chúng. Đối với các API bất đồng bộ, chúng ta dựa code trên module [`fs/promises`](https://nodejs.org/api/fs.html#promises-api) của Node.js.

```js
const syncIterableOfSyncDisposables = [
  stream1.getReader(),
  stream2.getReader(),
];
for (using reader of syncIterableOfSyncDisposables) {
  console.log(reader.read());
}
```

```js
async function* requestMany(urls) {
  for (const url of urls) {
    const res = await fetch(url);
    yield res.body.getReader();
  }
}
const asyncIterableOfSyncDisposables = requestMany([
  "https://example.com",
  "https://example.org",
]);
for await (using reader of asyncIterableOfSyncDisposables) {
  console.log(reader.read());
}
```

```js
const syncIterableOfAsyncDisposables = await Promise.all(
  fs.globSync("*.txt").map((path) => fs.open(path, "r")),
);
for (await using file of syncIterableOfAsyncDisposables) {
  console.log(await file.read());
}
```

```js
async function* globHandles(pattern) {
  for await (const path of fs.glob(pattern)) {
    yield await fs.open(path, "r");
  }
}
const asyncIterableOfAsyncDisposables = globHandles("*.txt");
for await (await using file of asyncIterableOfAsyncDisposables) {
  console.log(await file.read());
}
```

### `await` ngầm định khi thoát phạm vi

Ngay khi một `await using` được khai báo trong một phạm vi, phạm vi đó sẽ luôn có một `await` khi thoát, ngay cả khi biến là `null` hoặc `undefined`. Điều này đảm bảo thứ tự thực thi ổn định và xử lý lỗi. Các ví dụ [Hiệu ứng luồng điều khiển của await](/en-US/docs/Web/JavaScript/Reference/Operators/await#control_flow_effects_of_await) có nhiều chi tiết hơn về điều này.

Trong ví dụ dưới đây, lời gọi `example()` bên dưới không resolve cho đến một tick sau, do một `await` ngầm định khi hàm trả về.

```js
async function example() {
  await using nothing = null;
  console.log("Example call");
}

example().then(() => console.log("Example done"));
Promise.resolve().then(() => console.log("Microtask done"));
// Đầu ra:
// Example call
// Microtask done
// Example done
```

Hãy xem xét code tương tự nhưng với {{jsxref("Statements/using", "using")}} đồng bộ thay thế. Lần này, lời gọi `example()` ngay lập tức resolve, vì vậy hai handler `then()` được gọi trong cùng một tick.

```js
async function example() {
  using nothing = null;
  console.log("Example call");
}

example().then(() => console.log("Example done"));
Promise.resolve().then(() => console.log("Microtask done"));
// Đầu ra:
// Example call
// Example done
// Microtask done
```

Để có ví dụ thực tế hơn, hãy xem xét hai lời gọi đồng thời đến một hàm:

```js
class Resource {
  #name;
  constructor(name) {
    this.#name = name;
  }
  async [Symbol.asyncDispose]() {
    console.log(`Disposing resource ${this.#name}`);
  }
}

async function example(id, createOptionalResource) {
  await using required = new Resource(`required ${id}`);
  await using optional = createOptionalResource
    ? new Resource("optional")
    : null;
  await using another = new Resource(`another ${id}`);
}

example(1, true);
example(2, false);
// Đầu ra:
// Disposing resource another 1
// Disposing resource another 2
// Disposing resource optional
// Disposing resource required 1
// Disposing resource required 2
```

Như bạn có thể thấy, tài nguyên `required 2` được giải phóng trong cùng tick với `required 1`. Nếu tài nguyên `optional` không gây ra một `await` dư thừa, thì `required 2` đã được giải phóng sớm hơn, điều đó sẽ xảy ra đồng thời với `optional`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/using", "using")}}
- {{jsxref("Symbol.asyncDispose")}}
- {{jsxref("AsyncDisposableStack")}}
