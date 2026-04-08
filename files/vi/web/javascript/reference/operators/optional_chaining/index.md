---
title: Optional chaining (?.)
slug: Web/JavaScript/Reference/Operators/Optional_chaining
page-type: javascript-operator
browser-compat: javascript.operators.optional_chaining
sidebar: jssidebar
---

Toán tử **optional chaining (`?.`)** truy cập thuộc tính của một object hoặc gọi một hàm. Nếu object được truy cập hoặc hàm được gọi bằng toán tử này là {{jsxref("undefined")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), biểu thức short circuit và được đánh giá thành {{jsxref("undefined")}} thay vì ném ra lỗi.

{{InteractiveExample("JavaScript Demo: Optional chaining (?.) operator", "taller")}}

```js interactive-example
const adventurer = {
  name: "Alice",
  cat: {
    name: "Dinah",
  },
};

const dogName = adventurer.dog?.name;
console.log(dogName);
// Expected output: undefined

console.log(adventurer.someNonExistentMethod?.());
// Expected output: undefined
```

## Cú pháp

```js-nolint
obj?.prop
obj?.[expr]
func?.(args)
```

## Mô tả

Toán tử `?.` giống như toán tử chuỗi `.`, ngoại trừ thay vì gây ra lỗi nếu một tham chiếu là [nullish](/en-US/docs/Glossary/Nullish) ([`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}), biểu thức short-circuit với giá trị trả về là `undefined`. Khi được sử dụng với các lời gọi hàm, nó trả về `undefined` nếu hàm được cho không tồn tại.

Điều này dẫn đến các biểu thức ngắn hơn và đơn giản hơn khi truy cập các thuộc tính được chuỗi khi có khả năng một tham chiếu có thể bị thiếu. Nó cũng có thể hữu ích trong khi khám phá nội dung của một object khi không có sự đảm bảo đã biết về thuộc tính nào là bắt buộc.

Ví dụ: hãy xem xét object `obj` có cấu trúc lồng nhau. Không có optional chaining, việc tra cứu một thuộc tính con sâu đòi hỏi phải xác thực các tham chiếu ở giữa, chẳng hạn như:

```js
const nestedProp = obj.first && obj.first.second;
```

Giá trị của `obj.first` được xác nhận là không phải `null` (và không phải `undefined`) trước khi truy cập giá trị của `obj.first.second`. Điều này ngăn chặn lỗi xảy ra nếu bạn truy cập `obj.first.second` trực tiếp mà không kiểm tra `obj.first`.

Đây là một mẫu thành ngữ trong JavaScript, nhưng nó trở nên dài dòng khi chuỗi dài, và không an toàn. Ví dụ: nếu `obj.first` là giá trị {{Glossary("Falsy")}} không phải `null` hoặc `undefined`, chẳng hạn như `0`, nó vẫn sẽ short-circuit và làm cho `nestedProp` trở thành `0`, điều này có thể không mong muốn.

Tuy nhiên, với toán tử optional chaining (`?.`), bạn không cần phải kiểm tra tường minh và short-circuit dựa trên trạng thái của `obj.first` trước khi thử truy cập `obj.first.second`:

```js
const nestedProp = obj.first?.second;
```

Bằng cách sử dụng toán tử `?.` thay vì chỉ `.`, JavaScript biết cần phải kiểm tra ngầm để đảm bảo `obj.first` không phải `null` hoặc `undefined` trước khi cố gắng truy cập `obj.first.second`. Nếu `obj.first` là `null` hoặc `undefined`, biểu thức tự động short-circuit, trả về `undefined`.

Điều này tương đương với những gì sau đây, ngoại trừ biến tạm thời thực sự không được tạo ra:

```js
const temp = obj.first;
const nestedProp =
  temp === null || temp === undefined ? undefined : temp.second;
```

Optional chaining không thể được sử dụng trên một root object chưa được khai báo, nhưng có thể được sử dụng với root object có giá trị `undefined`.

```js example-bad
undeclaredVar?.prop; // ReferenceError: undeclaredVar is not defined
```

### Optional chaining với lời gọi hàm

Bạn có thể sử dụng optional chaining khi cố gắng gọi một phương thức có thể không tồn tại. Điều này có thể hữu ích, ví dụ: khi sử dụng một API trong đó một phương thức có thể không khả dụng, do phiên bản của quá trình triển khai hoặc do một tính năng không có sẵn trên thiết bị của người dùng.

Sử dụng optional chaining với các lời gọi hàm khiến biểu thức tự động trả về `undefined` thay vì ném ra ngoại lệ nếu phương thức không được tìm thấy:

```js
const result = someInterface.customMethod?.();
```

Tuy nhiên, nếu có một thuộc tính với tên như vậy không phải là hàm, sử dụng `?.` vẫn sẽ gây ra ngoại lệ {{jsxref("TypeError")}} "someInterface.customMethod is not a function".

> [!NOTE]
> Nếu `someInterface` chính nó là `null` hoặc `undefined`, một ngoại lệ {{jsxref("TypeError")}} vẫn sẽ được ném ra ("someInterface is null"). Nếu bạn mong đợi rằng `someInterface` chính nó có thể là `null` hoặc `undefined`, bạn phải sử dụng `?.` tại vị trí này như: `someInterface?.customMethod?.()`.

`eval?.()` là cách ngắn nhất để vào chế độ [_indirect eval_](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#direct_and_indirect_eval).

### Optional chaining với biểu thức

Bạn cũng có thể sử dụng toán tử optional chaining với [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation), cho phép truyền một biểu thức làm tên thuộc tính:

```js
const propName = "x";
const nestedProp = obj?.[propName];
```

Điều này đặc biệt hữu ích cho mảng, vì các chỉ số mảng phải được truy cập bằng dấu ngoặc vuông.

```js
function printMagicIndex(arr) {
  console.log(arr?.[42]);
}

printMagicIndex([0, 1, 2, 3, 4, 5]); // undefined
printMagicIndex(); // undefined; if not using ?., this would throw an error: "Cannot read properties of undefined (reading '42')"
```

### Optional chaining không hợp lệ

Không hợp lệ khi cố gắng gán cho kết quả của biểu thức optional chaining:

```js-nolint example-bad
const object = {};
object?.property = 1; // SyntaxError: Invalid left-hand side in assignment
```

[Template literal tags](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates) không thể là optional chain (xem [SyntaxError: tagged template cannot be used with optional chain](/en-US/docs/Web/JavaScript/Reference/Errors/Bad_optional_template)):

```js-nolint example-bad
String?.raw`Hello, world!`;
String.raw?.`Hello, world!`; // SyntaxError: Invalid tagged template on optional chain
```

Constructor của biểu thức {{jsxref("Operators/new", "new")}} không thể là optional chain (xem [SyntaxError: new keyword cannot be used with an optional chain](/en-US/docs/Web/JavaScript/Reference/Errors/Bad_new_optional)):

```js-nolint example-bad
new Intl?.DateTimeFormat(); // SyntaxError: Invalid optional chain from new expression
new Map?.();
```

### Short-circuiting

Khi sử dụng optional chaining với các biểu thức, nếu toán hạng bên trái là `null` hoặc `undefined`, biểu thức sẽ không được đánh giá. Ví dụ:

```js
const potentiallyNullObj = null;
let x = 0;
const prop = potentiallyNullObj?.[x++];

console.log(x); // 0 as x was not incremented
```

Các lần truy cập thuộc tính tiếp theo cũng sẽ không được đánh giá.

```js
const potentiallyNullObj = null;
const prop = potentiallyNullObj?.a.b;
// This does not throw, because evaluation has already stopped at
// the first optional chain
```

Điều này tương đương với:

```js
const potentiallyNullObj = null;
const prop =
  potentiallyNullObj === null || potentiallyNullObj === undefined
    ? undefined
    : potentiallyNullObj.a.b;
```

Tuy nhiên, hành vi short-circuit này chỉ xảy ra dọc theo một "chuỗi" liên tục của các lần truy cập thuộc tính. Nếu bạn [nhóm](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) một phần của chuỗi, các lần truy cập thuộc tính tiếp theo vẫn sẽ được đánh giá.

```js
const potentiallyNullObj = null;
const prop = (potentiallyNullObj?.a).b;
// TypeError: Cannot read properties of undefined (reading 'b')
```

Điều này tương đương với:

```js
const potentiallyNullObj = null;
const temp = potentiallyNullObj?.a;
const prop = temp.b;
```

Ngoại trừ biến `temp` không được tạo ra.

## Ví dụ

### Ví dụ cơ bản

Ví dụ này tìm kiếm giá trị của thuộc tính `name` cho thành viên `CSS` trong một map khi không có thành viên đó. Do đó kết quả là `undefined`.

```js
const myMap = new Map();
myMap.set("JS", { name: "Josh", desc: "I maintain things" });

const nameBar = myMap.get("CSS")?.name;
```

### Xử lý callback tùy chọn hoặc event handler

Nếu bạn sử dụng callback hoặc fetch methods từ một object với mẫu [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#object_destructuring), bạn có thể có các giá trị không tồn tại mà bạn không thể gọi như hàm trừ khi bạn đã kiểm tra sự tồn tại của chúng. Sử dụng `?.`, bạn có thể tránh bài kiểm tra bổ sung này:

```js
// Code written without optional chaining
function doSomething(onContent, onError) {
  try {
    // Do something with the data
  } catch (err) {
    // Testing if onError really exists
    if (onError) {
      onError(err.message);
    }
  }
}
```

```js
// Using optional chaining with function calls
function doSomething(onContent, onError) {
  try {
    // Do something with the data
  } catch (err) {
    onError?.(err.message); // No exception if onError is undefined
  }
}
```

### Xếp chồng toán tử optional chaining

Với các cấu trúc lồng nhau, có thể sử dụng optional chaining nhiều lần:

```js
const customer = {
  name: "Carl",
  details: {
    age: 82,
    location: "Paradise Falls", // Detailed address is unknown
  },
};
const customerCity = customer.details?.address?.city;

// This also works with optional chaining function call
const customerName = customer.name?.getName?.(); // Method does not exist, customerName is undefined
```

### Kết hợp với toán tử nullish coalescing

[Toán tử nullish coalescing](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing) có thể được sử dụng sau optional chaining để xây dựng giá trị mặc định khi không tìm thấy:

```js
function printCustomerCity(customer) {
  const customerCity = customer?.city ?? "Unknown city";
  console.log(customerCity);
}

printCustomerCity({
  name: "Nathan",
  city: "Paris",
}); // "Paris"
printCustomerCity({
  name: "Carl",
  details: { age: 82 },
}); // "Unknown city"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
