---
title: Iteration protocols
slug: Web/JavaScript/Reference/Iteration_protocols
page-type: guide
spec-urls: https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-iteration
sidebar: jssidebar
---

**Iteration protocols** không phải là các built-in hay cú pháp mới, mà là _protocol_. Các protocol này có thể được triển khai bởi bất kỳ đối tượng nào bằng cách tuân theo một số quy ước.

Có hai protocol: [iterable protocol](#the_iterable_protocol) và [iterator protocol](#the_iterator_protocol).

## Iterable protocol

**Iterable protocol** cho phép các đối tượng JavaScript định nghĩa hoặc tùy chỉnh hành vi lặp của chúng, chẳng hạn như những giá trị nào được lặp trong cấu trúc {{jsxref("Statements/for...of", "for...of")}}. Một số kiểu tích hợp sẵn là [iterable tích hợp sẵn](#built-in_iterables) với hành vi lặp mặc định, chẳng hạn như {{jsxref("Array")}} hoặc {{jsxref("Map")}}, trong khi các kiểu khác (như {{jsxref("Object")}}) thì không.

Để có thể **iterable**, một đối tượng phải triển khai phương thức **`[Symbol.iterator]()`**, nghĩa là đối tượng (hoặc một trong các đối tượng trong [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của nó) phải có thuộc tính với khóa `[Symbol.iterator]` có thể truy cập qua hằng số {{jsxref("Symbol.iterator")}}:

- `[Symbol.iterator]()`
  - : Một hàm không có đối số trả về một đối tượng tuân thủ [iterator protocol](#the_iterator_protocol).

Bất cứ khi nào một đối tượng cần được lặp (chẳng hạn như ở đầu vòng lặp {{jsxref("Statements/for...of", "for...of")}}), phương thức `[Symbol.iterator]()` của nó được gọi không có đối số, và **iterator** được trả về được dùng để lấy các giá trị cần lặp.

Lưu ý rằng khi hàm không có đối số này được gọi, nó được gọi như một phương thức trên đối tượng iterable. Do đó, bên trong hàm, từ khóa `this` có thể được dùng để truy cập các thuộc tính của đối tượng iterable, để quyết định cung cấp gì trong quá trình lặp.

Hàm này có thể là hàm thông thường, hoặc có thể là generator function, để khi được gọi, một đối tượng iterator được trả về. Bên trong generator function này, mỗi entry có thể được cung cấp bằng cách dùng `yield`.

## Iterator protocol

**Iterator protocol** định nghĩa một cách chuẩn để tạo ra một chuỗi giá trị (hữu hạn hoặc vô hạn), và có thể là giá trị trả về khi tất cả các giá trị đã được tạo ra.

Một đối tượng là iterator khi nó triển khai phương thức **`next()`** với ngữ nghĩa sau:

- `next()`
  - : Một hàm chấp nhận không hoặc một đối số và trả về một đối tượng tuân thủ giao diện `IteratorResult` (xem bên dưới). Nếu giá trị không phải đối tượng được trả về (chẳng hạn `false` hoặc `undefined`) khi tính năng ngôn ngữ tích hợp (như `for...of`) đang dùng iterator, một {{jsxref("TypeError")}} (`"iterator.next() returned a non-object value"`) sẽ được ném.

Tất cả các phương thức iterator protocol (`next()`, `return()` và `throw()`) đều được mong đợi trả về đối tượng triển khai giao diện `IteratorResult`. Nó phải có các thuộc tính sau:

- `done` {{optional_inline}}
  - : Một boolean là `false` nếu iterator có thể tạo ra giá trị tiếp theo trong chuỗi. (Điều này tương đương với việc không chỉ định thuộc tính `done` hoàn toàn.)

    Có giá trị `true` nếu iterator đã hoàn thành chuỗi của nó. Trong trường hợp này, `value` tùy chọn chỉ định giá trị trả về của iterator.

- `value` {{optional_inline}}
  - : Bất kỳ giá trị JavaScript nào được trả về bởi iterator. Có thể bỏ qua khi `done` là `true`.

Trong thực tế, không thuộc tính nào là yêu cầu nghiêm ngặt; nếu đối tượng không có thuộc tính nào được trả về, nó tương đương với `{ done: false, value: undefined }`.

Nếu iterator trả về kết quả với `done: true`, bất kỳ lời gọi tiếp theo nào đến `next()` cũng được mong đợi trả về `done: true`, mặc dù điều này không được thực thi ở cấp ngôn ngữ.

Phương thức `next` có thể nhận một giá trị sẽ được cung cấp cho thân phương thức. Không có tính năng ngôn ngữ tích hợp nào sẽ truyền bất kỳ giá trị nào. Giá trị được truyền cho phương thức `next` của [generator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) sẽ trở thành giá trị của biểu thức `yield` tương ứng.

Tùy chọn, iterator cũng có thể triển khai các phương thức **`return(value)`** và **`throw(exception)`**, khi được gọi, báo cho iterator biết rằng caller đã hoàn thành việc lặp và có thể thực hiện bất kỳ dọn dẹp cần thiết nào (chẳng hạn như đóng kết nối cơ sở dữ liệu).

- `return(value)` {{optional_inline}}
  - : Một hàm chấp nhận không hoặc một đối số và trả về đối tượng tuân thủ giao diện `IteratorResult`, thường với `value` bằng `value` được truyền vào và `done` bằng `true`. Gọi phương thức này báo cho iterator rằng caller không có ý định gọi `next()` thêm nữa và có thể thực hiện các hành động dọn dẹp. Khi các tính năng ngôn ngữ tích hợp gọi `return()` để dọn dẹp, `value` luôn là `undefined`.
- `throw(exception)` {{optional_inline}}
  - : Một hàm chấp nhận không hoặc một đối số và trả về đối tượng tuân thủ giao diện `IteratorResult`, thường với `done` bằng `true`. Gọi phương thức này báo cho iterator rằng caller phát hiện điều kiện lỗi, và `exception` thường là một instance {{jsxref("Error")}}. Không có tính năng ngôn ngữ tích hợp nào gọi `throw()` cho mục đích dọn dẹp — đây là tính năng đặc biệt của generator cho tính đối xứng của `return`/`throw`.

> [!NOTE]
> Không thể biết reflectively (tức là không thực sự gọi `next()` và xác thực kết quả trả về) liệu một đối tượng cụ thể có triển khai iterator protocol hay không.

Rất dễ để làm cho iterator cũng iterable: chỉ cần triển khai phương thức `[Symbol.iterator]()` trả về `this`.

```js
// Satisfies both the Iterator Protocol and Iterable
const myIterator = {
  next() {
    // …
  },
  [Symbol.iterator]() {
    return this;
  },
};
```

Đối tượng như vậy được gọi là _iterable iterator_. Làm như vậy cho phép iterator được sử dụng bởi các cú pháp khác nhau mong đợi iterable — do đó, hiếm khi hữu ích khi triển khai Iterator Protocol mà không triển khai Iterable. (Trên thực tế, hầu hết tất cả cú pháp và API đều mong đợi _iterable_, không phải _iterator_.) [Đối tượng generator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) là một ví dụ:

```js
const generatorObject = (function* () {
  yield 1;
  yield 2;
  yield 3;
})();

console.log(typeof generatorObject.next);
// "function" — it has a next method (which returns the right result), so it's an iterator

console.log(typeof generatorObject[Symbol.iterator]);
// "function" — it has a [Symbol.iterator] method (which returns the right iterator), so it's an iterable

console.log(generatorObject[Symbol.iterator]() === generatorObject);
// true — its [Symbol.iterator] method returns itself (an iterator), so it's an iterable iterator
```

Tất cả iterator tích hợp đều kế thừa từ {{jsxref("Iterator", "Iterator.prototype")}}, triển khai phương thức `[Symbol.iterator]()` trả về `this`, để các iterator tích hợp cũng iterable.

Tuy nhiên, khi có thể, tốt hơn là `iterable[Symbol.iterator]()` nên trả về các iterator khác nhau luôn bắt đầu từ đầu, như [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator).

## Async iterator và async iterable protocol

Có một cặp protocol khác được dùng cho async iteration, được gọi là **async iterator** và **async iterable** protocol. Chúng có giao diện rất giống so với iterable và iterator protocol, ngoại trừ mỗi giá trị trả về từ các lời gọi đến phương thức iterator được bọc trong promise.

Một đối tượng triển khai async iterable protocol khi nó triển khai các phương thức sau:

- [`[Symbol.asyncIterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncIterator)
  - : Một hàm không có đối số trả về một đối tượng tuân thủ async iterator protocol.

Một đối tượng triển khai async iterator protocol khi nó triển khai các phương thức sau:

- `next()`
  - : Một hàm chấp nhận không hoặc một đối số và trả về promise. Promise fulfills thành đối tượng tuân thủ giao diện `IteratorResult`, và các thuộc tính có cùng ngữ nghĩa với iterator đồng bộ.
- `return(value)` {{optional_inline}}
  - : Một hàm chấp nhận không hoặc một đối số và trả về promise. Promise fulfills thành đối tượng tuân thủ giao diện `IteratorResult`, và các thuộc tính có cùng ngữ nghĩa với iterator đồng bộ.
- `throw(exception)` {{optional_inline}}
  - : Một hàm chấp nhận không hoặc một đối số và trả về promise. Promise fulfills thành đối tượng tuân thủ giao diện `IteratorResult`, và các thuộc tính có cùng ngữ nghĩa với iterator đồng bộ.

## Tương tác giữa ngôn ngữ và iteration protocol

Ngôn ngữ chỉ định các API hoặc tạo ra hoặc tiêu thụ iterable và iterator.

### Iterable tích hợp sẵn

{{jsxref("String")}}, {{jsxref("Array")}}, {{jsxref("TypedArray")}}, {{jsxref("Map")}}, {{jsxref("Set")}} và [`Segments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) (được trả về bởi [`Intl.Segmenter.prototype.segment()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment)) đều là iterable tích hợp sẵn, vì mỗi đối tượng `prototype` của chúng triển khai phương thức `[Symbol.iterator]()`. Ngoài ra, đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) và một số kiểu DOM collection như {{domxref("NodeList")}} cũng là iterable.
Không có đối tượng nào trong ngôn ngữ JavaScript cốt lõi là async iterable. Một số Web API, như {{domxref("ReadableStream")}}, có phương thức `Symbol.asyncIterator` được đặt mặc định.

[Generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*) trả về [generator object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator), là iterable iterator. [Async generator function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*) trả về [async generator object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator), là async iterable iterator.

Các iterator được trả về từ iterable tích hợp thực sự đều kế thừa từ lớp chung {{jsxref("Iterator")}}, triển khai phương thức `[Symbol.iterator]() { return this; }` đã đề cập, làm cho tất cả chúng đều là iterable iterator. Lớp `Iterator` cũng cung cấp các [phương thức helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_methods) bổ sung ngoài phương thức `next()` bắt buộc bởi iterator protocol. Bạn có thể kiểm tra chuỗi prototype của iterator bằng cách log nó trong console đồ họa.

```plain
console.log([][Symbol.iterator]());

Array Iterator {}
  [[Prototype]]: Array Iterator     ==> This is the prototype shared by all array iterators
    next: ƒ next()
    Symbol(Symbol.toStringTag): "Array Iterator"
    [[Prototype]]: Object           ==> This is the prototype shared by all built-in iterators
      Symbol(Symbol.iterator): ƒ [Symbol.iterator]()
      [[Prototype]]: Object         ==> This is Object.prototype
```

### API tích hợp chấp nhận iterable

Có nhiều API chấp nhận iterable. Một số ví dụ bao gồm:

- {{jsxref("Map/Map", "Map()")}}
- {{jsxref("WeakMap/WeakMap", "WeakMap()")}}
- {{jsxref("Set/Set", "Set()")}}
- {{jsxref("WeakSet/WeakSet", "WeakSet()")}}
- {{jsxref("Promise.all()")}}
- {{jsxref("Promise.allSettled()")}}
- {{jsxref("Promise.race()")}}
- {{jsxref("Promise.any()")}}
- {{jsxref("Array.from()")}}
- {{jsxref("Object.groupBy()")}}
- {{jsxref("Map.groupBy()")}}

```js
const myObj = {};

new WeakSet(
  (function* () {
    yield {};
    yield myObj;
    yield {};
  })(),
).has(myObj); // true
```

### Cú pháp mong đợi iterable

Một số câu lệnh và biểu thức mong đợi iterable, ví dụ vòng lặp {{jsxref("Statements/for...of", "for...of")}}, [array và parameter spreading](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), {{jsxref("Operators/yield*", "yield*")}} và [array destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring):

```js
for (const value of ["a", "b", "c"]) {
  console.log(value);
}
// "a"
// "b"
// "c"

console.log([..."abc"]); // ["a", "b", "c"]

function* gen() {
  yield* ["a", "b", "c"];
}

console.log(gen().next()); // { value: "a", done: false }

[a, b, c] = new Set(["a", "b", "c"]);
console.log(a); // "a"
```

Khi các cú pháp tích hợp đang lặp qua một iterator, và kết quả cuối cùng `done` là `false` (tức là iterator có thể tạo thêm giá trị) nhưng không cần thêm giá trị, phương thức `return` sẽ được gọi nếu có. Điều này có thể xảy ra, ví dụ, nếu gặp `break` hoặc `return` trong vòng lặp `for...of`, hoặc nếu tất cả định danh đã được gán trong array destructuring.

```js
const obj = {
  [Symbol.iterator]() {
    let i = 0;
    return {
      next() {
        i++;
        console.log("Returning", i);
        if (i === 3) return { done: true, value: i };
        return { done: false, value: i };
      },
      return() {
        console.log("Closing");
        return { done: true };
      },
    };
  },
};

const [a] = obj;
// Returning 1
// Closing

const [b, c, d] = obj;
// Returning 1
// Returning 2
// Returning 3
// Already reached the end (the last call returned `done: true`),
// so `return` is not called
console.log([b, c, d]); // [1, 2, undefined]; the value associated with `done: true` is not reachable

for (const b of obj) {
  break;
}
// Returning 1
// Closing
```

Vòng lặp [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of) và [`yield*`](/en-US/docs/Web/JavaScript/Reference/Operators/yield*) trong [async generator function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*) (nhưng không phải [sync generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*)) là những cách duy nhất để tương tác với async iterable. Dùng `for...of`, array spreading, v.v. trên async iterable không phải là sync iterable (tức là có `[Symbol.asyncIterator]()` nhưng không có `[Symbol.iterator]()`) sẽ ném TypeError: x is not iterable.

## Xử lý lỗi

Vì lặp liên quan đến việc chuyển quyền điều khiển qua lại giữa iterator và consumer, xử lý lỗi xảy ra theo cả hai chiều: cách consumer xử lý lỗi được ném bởi iterator, và cách iterator xử lý lỗi được ném bởi consumer. Khi bạn đang dùng một trong những cách lặp tích hợp, ngôn ngữ cũng có thể ném lỗi vì iterable vi phạm một số {{Glossary("invariant", "invariant")}} nhất định. Chúng tôi sẽ mô tả cách các cú pháp tích hợp tạo ra và xử lý lỗi, có thể được dùng như hướng dẫn cho mã của bạn nếu bạn đang bước qua iterator thủ công.

### Iterable không hợp lệ

Lỗi có thể xảy ra khi lấy iterator từ iterable. Invariant ngôn ngữ được thực thi ở đây là iterable phải tạo ra một iterator hợp lệ:

- Nó có phương thức `[Symbol.iterator]()` có thể gọi.
- Phương thức `[Symbol.iterator]()` trả về một đối tượng.
- Đối tượng được trả về bởi `[Symbol.iterator]()` có phương thức `next()` có thể gọi.

Khi dùng cú pháp tích hợp để khởi động lặp trên iterable không hợp lệ, TypeError được ném.

```js example-bad
const nonWellFormedIterable = { [Symbol.iterator]: 1 };
[...nonWellFormedIterable]; // TypeError: nonWellFormedIterable is not iterable
nonWellFormedIterable[Symbol.iterator] = () => 1;
[...nonWellFormedIterable]; // TypeError: [Symbol.iterator]() returned a non-object value
nonWellFormedIterable[Symbol.iterator] = () => ({});
[...nonWellFormedIterable]; // TypeError: nonWellFormedIterable[Symbol.iterator]().next is not a function
```

Đối với async iterable, nếu thuộc tính `[Symbol.asyncIterator]()` của nó có giá trị `undefined` hoặc `null`, JavaScript sẽ fall back sang sử dụng thuộc tính `[Symbol.iterator]` thay thế (và bọc iterator kết quả thành async iterator bằng cách [chuyển tiếp](#forwarding_errors) các phương thức). Nếu không, thuộc tính `[Symbol.asyncIterator]` cũng phải tuân thủ các invariant trên.

Loại lỗi này có thể được ngăn chặn bằng cách xác thực iterable trước khi cố gắng lặp qua nó. Tuy nhiên, điều này khá hiếm vì thường bạn biết kiểu của đối tượng bạn đang lặp qua. Nếu bạn nhận được iterable này từ mã khác, bạn nên để lỗi lan truyền đến caller để họ biết đầu vào không hợp lệ đã được cung cấp.

### Lỗi trong quá trình lặp

Hầu hết lỗi xảy ra khi bước qua iterator (gọi `next()`). Invariant ngôn ngữ được thực thi ở đây là phương thức `next()` phải trả về một đối tượng (đối với async iterator, một đối tượng sau khi await). Nếu không, TypeError được ném.

Nếu invariant bị vi phạm hoặc phương thức `next()` ném lỗi (đối với async iterator, nó cũng có thể trả về promise bị từ chối), lỗi sẽ lan truyền đến caller. Đối với cú pháp tích hợp, lặp đang diễn ra bị hủy bỏ mà không thử lại hoặc dọn dẹp (với giả định rằng nếu phương thức `next()` ném lỗi, thì nó đã dọn dẹp rồi). Nếu bạn đang gọi `next()` thủ công, bạn có thể bắt lỗi và thử lại gọi `next()`, nhưng nhìn chung bạn nên giả định iterator đã bị đóng.

Nếu caller quyết định thoát lặp vì lý do nào đó khác với lỗi trong đoạn trước, chẳng hạn khi nó vào trạng thái lỗi trong mã riêng của nó (ví dụ, trong khi xử lý giá trị không hợp lệ được tạo ra bởi iterator), nó nên gọi phương thức `return()` trên iterator, nếu có. Điều này cho phép iterator thực hiện bất kỳ dọn dẹp nào. Phương thức `return()` chỉ được gọi cho các thoát sớm — nếu `next()` trả về `done: true`, phương thức `return()` không được gọi, với giả định iterator đã dọn dẹp rồi.

Phương thức `return()` cũng có thể không hợp lệ! Ngôn ngữ cũng thực thi rằng phương thức `return()` phải trả về đối tượng và ném TypeError nếu không. Nếu phương thức `return()` ném lỗi, lỗi sẽ lan truyền đến caller. Tuy nhiên, nếu phương thức `return()` được gọi vì caller gặp lỗi trong mã riêng của nó, thì lỗi này sẽ ghi đè lỗi được ném bởi phương thức `return()`.

Thông thường, caller triển khai xử lý lỗi như thế này:

```js
try {
  for (const value of iterable) {
    // …
  }
} catch (e) {
  // Handle the error
}
```

`catch` sẽ có thể bắt lỗi được ném khi `iterable` không phải là iterable hợp lệ, khi `next()` ném lỗi, khi `return()` ném lỗi (nếu vòng lặp `for` thoát sớm) và khi thân vòng lặp `for` ném lỗi.

Hầu hết iterator được triển khai bằng generator function, vì vậy chúng tôi sẽ minh họa cách generator function thường xử lý lỗi:

```js
function* gen() {
  try {
    yield doSomething();
    yield doSomethingElse();
  } finally {
    cleanup();
  }
}
```

Việc thiếu `catch` ở đây khiến lỗi được ném bởi `doSomething()` hoặc `doSomethingElse()` lan truyền đến caller của `gen`. Nếu những lỗi này được bắt trong generator function (cũng được khuyến nghị), generator function có thể quyết định tiếp tục yield giá trị hoặc thoát sớm. Tuy nhiên, khối `finally` là cần thiết cho generator giữ tài nguyên mở. Khối `finally` được đảm bảo chạy, dù khi `next()` cuối cùng được gọi hay khi `return()` được gọi.

### Chuyển tiếp lỗi

Một số cú pháp tích hợp bọc iterator trong một iterator khác. Chúng bao gồm iterator được tạo bởi {{jsxref("Iterator.from()")}}, [iterator helper method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_methods) (`map()`, `filter()`, `take()`, `drop()` và `flatMap()`), [`yield*`](/en-US/docs/Web/JavaScript/Reference/Operators/yield*) và một wrapper ẩn khi bạn dùng async iteration (`for await...of`, `Array.fromAsync`) trên sync iterator. Iterator được bọc sau đó chịu trách nhiệm chuyển tiếp lỗi giữa iterator bên trong và caller.

- Tất cả wrapper iterator đều trực tiếp chuyển tiếp phương thức `next()` của iterator bên trong, bao gồm giá trị trả về và lỗi được ném.
- Wrapper iterator thường trực tiếp chuyển tiếp phương thức `return()` của iterator bên trong. Nếu phương thức `return()` không tồn tại trên iterator bên trong, nó trả về `{ done: true, value: undefined }` thay thế. Trong trường hợp iterator helper: nếu phương thức `next()` của iterator helper chưa được gọi, sau khi cố gắng gọi `return()` trên iterator bên trong, iterator hiện tại luôn trả về `{ done: true, value: undefined }`. Điều này nhất quán với generator function khi thực thi chưa vào biểu thức `yield*`.
- `yield*` là cú pháp tích hợp duy nhất chuyển tiếp phương thức `throw()` của iterator bên trong. Để biết thông tin về cách [`yield*`](/en-US/docs/Web/JavaScript/Reference/Operators/yield*) chuyển tiếp phương thức `return()` và `throw()`, xem tài liệu tham chiếu của nó.

## Ví dụ

### Iterable do người dùng định nghĩa

Bạn có thể tạo iterable của riêng mình như thế này:

```js
const myIterable = {
  *[Symbol.iterator]() {
    yield 1;
    yield 2;
    yield 3;
  },
};

console.log([...myIterable]); // [1, 2, 3]
```

### Iterator cơ bản

Iterator là có trạng thái theo bản chất. Nếu bạn không định nghĩa nó như generator function (như ví dụ trên), bạn có thể muốn đóng gói trạng thái trong một closure.

```js
function makeIterator(array) {
  let nextIndex = 0;
  return {
    next() {
      return nextIndex < array.length
        ? {
            value: array[nextIndex++],
            done: false,
          }
        : {
            done: true,
          };
    },
  };
}

const it = makeIterator(["yo", "ya"]);

console.log(it.next().value); // 'yo'
console.log(it.next().value); // 'ya'
console.log(it.next().done); // true
```

### Iterator vô hạn

```js
function idMaker() {
  let index = 0;
  return {
    next() {
      return {
        value: index++,
        done: false,
      };
    },
  };
}

const it = idMaker();

console.log(it.next().value); // 0
console.log(it.next().value); // 1
console.log(it.next().value); // 2
// …
```

### Định nghĩa iterable bằng generator

```js
function* makeGenerator(array) {
  let nextIndex = 0;
  while (nextIndex < array.length) {
    yield array[nextIndex++];
  }
}

const gen = makeGenerator(["yo", "ya"]);

console.log(gen.next().value); // 'yo'
console.log(gen.next().value); // 'ya'
console.log(gen.next().done); // true

function* idMaker() {
  let index = 0;
  while (true) {
    yield index++;
  }
}

const it = idMaker();

console.log(it.next().value); // 0
console.log(it.next().value); // 1
console.log(it.next().value); // 2
// …
```

### Định nghĩa iterable bằng lớp

Đóng gói trạng thái cũng có thể được thực hiện bằng [private field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

```js
class SimpleClass {
  #data;

  constructor(data) {
    this.#data = data;
  }

  [Symbol.iterator]() {
    // Use a new index for each iterator. This makes multiple
    // iterations over the iterable safe for non-trivial cases,
    // such as use of break or nested looping over the same iterable.
    let index = 0;

    return {
      // Note: using an arrow function allows `this` to point to the
      // one of `[Symbol.iterator]()` instead of `next()`
      next: () => {
        if (index >= this.#data.length) {
          return { done: true };
        }
        return { value: this.#data[index++], done: false };
      },
    };
  }
}

const simple = new SimpleClass([1, 2, 3, 4, 5]);

for (const val of simple) {
  console.log(val); // 1 2 3 4 5
}
```

### Ghi đè iterable tích hợp

Ví dụ, {{jsxref("String")}} là đối tượng iterable tích hợp:

```js
const someString = "hi";
console.log(typeof someString[Symbol.iterator]); // "function"
```

[Iterator mặc định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) của `String` trả về code point của chuỗi từng cái một:

```js
const iterator = someString[Symbol.iterator]();
console.log(`${iterator}`); // "[object String Iterator]"

console.log(iterator.next()); // { value: "h", done: false }
console.log(iterator.next()); // { value: "i", done: false }
console.log(iterator.next()); // { value: undefined, done: true }
```

Bạn có thể định nghĩa lại hành vi lặp bằng cách cung cấp `[Symbol.iterator]()` của riêng bạn:

```js
// need to construct a String object explicitly to avoid auto-boxing
const someString = new String("hi");

someString[Symbol.iterator] = function () {
  return {
    // this is the iterator object, returning a single element (the string "bye")
    next() {
      return this._first
        ? { value: "bye", done: (this._first = false) }
        : { done: true };
    },
    _first: true,
  };
};
```

Chú ý cách việc định nghĩa lại `[Symbol.iterator]()` ảnh hưởng đến hành vi của các cấu trúc tích hợp sử dụng iteration protocol:

```js
console.log([...someString]); // ["bye"]
console.log(`${someString}`); // "hi"
```

### Sửa đổi đồng thời khi lặp

Hầu hết iterable đều có ngữ nghĩa cơ bản giống nhau: chúng không sao chép dữ liệu tại thời điểm lặp bắt đầu. Thay vào đó, chúng giữ con trỏ và di chuyển nó xung quanh. Do đó, nếu bạn thêm, xóa hoặc sửa đổi phần tử trong collection trong khi lặp qua collection, bạn có thể vô tình thay đổi việc các phần tử _không thay đổi_ khác trong collection có được truy cập hay không. Điều này rất giống với cách [phương thức array lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#mutating_initial_array_in_iterative_methods) hoạt động.

Hãy xem xét trường hợp sau sử dụng {{domxref("URLSearchParams")}}:

```js
const searchParams = new URLSearchParams(
  "deleteme1=value1&key2=value2&key3=value3",
);

// Delete unwanted keys
for (const [key, value] of searchParams) {
  console.log(key);
  if (key.startsWith("deleteme")) {
    searchParams.delete(key);
  }
}

// Output:
// deleteme1
// key3
```

Lưu ý cách nó không bao giờ log `key2`. Vì `URLSearchParams` về cơ bản là danh sách các cặp key-value. Khi `deleteme1` được truy cập và xóa, tất cả các entry khác dịch sang trái một vị trí, vì vậy `key2` chiếm vị trí mà `deleteme1` từng ở, và khi con trỏ di chuyển đến key tiếp theo, nó đến `key3`.

Một số triển khai iterable tránh vấn đề này bằng cách đặt giá trị "tombstone" để tránh dịch chuyển các giá trị còn lại. Hãy xem mã tương tự dùng `Map`:

```js
const myMap = new Map([
  ["deleteme1", "value1"],
  ["key2", "value2"],
  ["key3", "value3"],
]);

for (const [key, value] of myMap) {
  console.log(key);
  if (key.startsWith("deleteme")) {
    myMap.delete(key);
  }
}

// Output:
// deleteme1
// key2
// key3
```

Lưu ý cách nó log tất cả các key. Vì `Map` không dịch chuyển các key còn lại khi một key bị xóa. Nếu bạn muốn triển khai điều gì đó tương tự, đây là cách nó có thể trông như thế nào:

```js
const tombstone = Symbol("tombstone");

class MyIterable {
  #data;
  constructor(data) {
    this.#data = data;
  }
  delete(deletedKey) {
    for (let i = 0; i < this.#data.length; i++) {
      if (this.#data[i][0] === deletedKey) {
        this.#data[i] = tombstone;
        return true;
      }
    }
    return false;
  }
  *[Symbol.iterator]() {
    for (const data of this.#data) {
      if (data !== tombstone) {
        yield data;
      }
    }
  }
}

const myIterable = new MyIterable([
  ["deleteme1", "value1"],
  ["key2", "value2"],
  ["key3", "value3"],
]);
for (const [key, value] of myIterable) {
  console.log(key);
  if (key.startsWith("deleteme")) {
    myIterable.delete(key);
  }
}
```

> [!WARNING]
> Sửa đổi đồng thời, nói chung, rất dễ gây bug và gây nhầm lẫn. Trừ khi bạn biết chính xác cách iterable được triển khai, tốt nhất là tránh sửa đổi collection trong khi lặp qua nó.

## Specifications

{{Specifications}}

## See also

- [Iterators and generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) guide
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Symbol.iterator")}}
- {{jsxref("Iterator")}}
