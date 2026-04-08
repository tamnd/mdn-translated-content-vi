---
title: Function.prototype.apply()
short-title: apply()
slug: Web/JavaScript/Reference/Global_Objects/Function/apply
page-type: javascript-instance-method
browser-compat: javascript.builtins.Function.apply
sidebar: jsref
---

Phương thức **`apply()`** của các instance {{jsxref("Function")}} gọi hàm này với một giá trị `this` cho trước và các tham số được cung cấp dưới dạng mảng (hoặc một [đối tượng giống mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects)).

{{InteractiveExample("JavaScript Demo: Function.prototype.apply()")}}

```js interactive-example
const numbers = [5, 6, 2, 3, 7];

const max = Math.max.apply(null, numbers);

console.log(max);
// Expected output: 7

const min = Math.min.apply(null, numbers);

console.log(min);
// Expected output: 2
```

## Syntax

```js-nolint
apply(thisArg)
apply(thisArg, argsArray)
```

### Parameters

- `thisArg`
  - : Giá trị của `this` được cung cấp cho lời gọi hàm `func`. Nếu hàm không ở [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) sẽ được thay thế bằng đối tượng toàn cục, và các giá trị nguyên thủy sẽ được chuyển đổi thành object.
- `argsArray` {{optional_inline}}
  - : Một đối tượng giống mảng, xác định các tham số mà `func` sẽ được gọi với, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) nếu không cần truyền tham số nào cho hàm.

### Return value

Kết quả của việc gọi hàm với giá trị `this` và tham số đã chỉ định.

## Description

> [!NOTE]
> Hàm này gần giống hệt {{jsxref("Function/call", "call()")}}, ngoại trừ các tham số hàm được truyền vào `call()` riêng lẻ dưới dạng danh sách, còn với `apply()` chúng được kết hợp trong một đối tượng, thường là mảng — ví dụ: `func.call(this, "eat", "bananas")` so với `func.apply(this, ["eat", "bananas"])`.

Thông thường, khi gọi một hàm, giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) bên trong hàm là đối tượng mà hàm đó được truy cập từ. Với `apply()`, bạn có thể gán một giá trị tùy ý làm `this` khi gọi một hàm hiện có, mà không cần gắn hàm đó vào đối tượng như một thuộc tính trước. Điều này cho phép bạn sử dụng các phương thức của một đối tượng như các hàm tiện ích chung.

Bạn cũng có thể sử dụng bất kỳ loại đối tượng giống mảng nào làm tham số thứ hai. Trong thực tế, điều này có nghĩa là nó cần có thuộc tính `length` và các thuộc tính số nguyên ("chỉ số") trong phạm vi `(0..length - 1)`. Ví dụ, bạn có thể dùng {{domxref("NodeList")}}, hoặc một đối tượng tùy chỉnh như `{ 'length': 2, '0': 'eat', '1': 'bananas' }`. Bạn cũng có thể dùng {{jsxref("Functions/arguments", "arguments")}}, ví dụ:

```js
function wrapper() {
  return anotherFn.apply(null, arguments);
}
```

Với [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) và [spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), đoạn trên có thể được viết lại thành:

```js
function wrapper(...args) {
  return anotherFn(...args);
}
```

Nhìn chung, `fn.apply(null, args)` tương đương với `fn(...args)` khi dùng spread syntax, ngoại trừ `args` được kỳ vọng là đối tượng giống mảng trong trường hợp trước với `apply()`, và một đối tượng [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) trong trường hợp sau với spread syntax.

> [!WARNING]
> Không dùng `apply()` để nối chuỗi các constructor (ví dụ, để thực hiện kế thừa). Việc này gọi hàm constructor như một hàm thông thường, nghĩa là [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) là `undefined`, và các class sẽ báo lỗi vì chúng không thể được gọi mà không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Hãy dùng {{jsxref("Reflect.construct()")}} hoặc [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) thay thế.

## Examples

### Sử dụng apply() để thêm một mảng vào mảng khác

Bạn có thể dùng {{jsxref("Array.prototype.push()")}} để thêm một phần tử vào mảng. Vì `push()` nhận số lượng tham số tùy ý, bạn cũng có thể thêm nhiều phần tử cùng lúc. Tuy nhiên, nếu bạn truyền một mảng vào `push()`, nó sẽ thêm mảng đó như một phần tử đơn lẻ, thay vì thêm từng phần tử riêng lẻ, kết quả là có một mảng bên trong mảng. Mặt khác, {{jsxref("Array.prototype.concat()")}} có hành vi mong muốn trong trường hợp này, nhưng nó không thêm vào mảng _hiện có_ — nó tạo và trả về một mảng mới.

Trong trường hợp này, bạn có thể dùng `apply` để ngầm "trải rộng" một mảng thành một chuỗi tham số.

```js
const array = ["a", "b"];
const elements = [0, 1, 2];
array.push.apply(array, elements);
console.info(array); // ["a", "b", 0, 1, 2]
```

Hiệu ứng tương tự có thể đạt được với spread syntax.

```js
const array = ["a", "b"];
const elements = [0, 1, 2];
array.push(...elements);
console.info(array); // ["a", "b", 0, 1, 2]
```

### Sử dụng apply() với các hàm tích hợp sẵn

Việc dùng `apply()` một cách thông minh cho phép bạn sử dụng các hàm tích hợp sẵn cho một số tác vụ mà nếu không sẽ phải duyệt qua tập hợp theo cách thủ công (hoặc dùng spread syntax).

Ví dụ, chúng ta có thể dùng {{jsxref("Math.max()")}} và {{jsxref("Math.min()")}} để tìm giá trị lớn nhất và nhỏ nhất trong một mảng.

```js
// min/max number in an array
const numbers = [5, 6, 2, 3, 7];

// using Math.min/Math.max apply
let max = Math.max.apply(null, numbers);
// This about equal to Math.max(numbers[0], …)
// or Math.max(5, 6, …)

let min = Math.min.apply(null, numbers);

// vs. loop based algorithm
max = -Infinity;
min = Infinity;

for (const n of numbers) {
  if (n > max) {
    max = n;
  }
  if (n < min) {
    min = n;
  }
}
```

Nhưng hãy cẩn thận: khi dùng `apply()` (hoặc spread syntax) với danh sách tham số có độ dài tùy ý, bạn có nguy cơ vượt quá giới hạn độ dài tham số của JavaScript engine.

Hậu quả của việc gọi hàm với quá nhiều tham số (tức là, hơn vài chục nghìn tham số) không được xác định và khác nhau tùy engine. (Engine JavaScriptCore có [giới hạn tham số cứng là 65536](https://webkit.org/b/80797).) Hầu hết các engine sẽ ném ngoại lệ; nhưng không có quy định chuẩn nào ngăn chặn các hành vi khác, chẳng hạn như giới hạn tùy ý số lượng tham số thực sự được truyền vào hàm. Để minh họa trường hợp sau này: nếu một engine có giới hạn bốn tham số (giới hạn thực tế tất nhiên cao hơn đáng kể), nó sẽ giống như chỉ có các tham số `5, 6, 2, 3` được truyền vào `apply` trong các ví dụ trên, thay vì toàn bộ mảng.

Nếu mảng giá trị của bạn có thể tăng lên đến hàng chục nghìn, hãy sử dụng chiến lược kết hợp: áp dụng hàm cho từng đoạn của mảng mỗi lần:

```js
function minOfArray(arr) {
  let min = Infinity;
  const QUANTUM = 32768;

  for (let i = 0; i < arr.length; i += QUANTUM) {
    const subMin = Math.min.apply(
      null,
      arr.slice(i, Math.min(i + QUANTUM, arr.length)),
    );
    min = Math.min(subMin, min);
  }

  return min;
}

const min = minOfArray([5, 6, 2, 3, 7]);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Function.prototype.bind()")}}
- {{jsxref("Function.prototype.call()")}}
- {{jsxref("Reflect.apply()")}}
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Spread syntax (`...`)](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
