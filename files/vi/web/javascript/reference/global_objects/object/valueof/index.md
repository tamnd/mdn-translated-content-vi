---
title: Object.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Object/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các thực thể {{jsxref("Object")}} chuyển đổi giá trị `this` [thành một đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion). Phương thức này được thiết kế để các đối tượng dẫn xuất ghi đè nhằm cung cấp logic [chuyển đổi kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion) tùy chỉnh.

{{InteractiveExample("JavaScript Demo: Object.prototype.valueOf()")}}

```js interactive-example
function MyNumberType(n) {
  this.number = n;
}

MyNumberType.prototype.valueOf = function () {
  return this.number;
};

const object = new MyNumberType(4);

console.log(object + 3);
// Expected output: 7
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị `this`, được chuyển đổi thành một đối tượng.

> [!NOTE]
> Để `valueOf` có ích trong quá trình chuyển đổi kiểu, nó phải trả về một giá trị nguyên thủy. Vì tất cả các kiểu nguyên thủy đều có phương thức `valueOf()` riêng của chúng, việc gọi `primitiveValue.valueOf()` thường không gọi `Object.prototype.valueOf()`.

## Mô tả

JavaScript gọi phương thức `valueOf` để [chuyển đổi một đối tượng thành giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). Bạn hiếm khi cần gọi phương thức `valueOf` trực tiếp; JavaScript tự động gọi nó khi gặp một đối tượng trong ngữ cảnh cần giá trị nguyên thủy.

Phương thức này được gọi ưu tiên bởi [chuyển đổi số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion), nhưng [chuyển đổi chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) gọi `toString()` ưu tiên trước, và `toString()` rất có khả năng trả về một giá trị chuỗi (ngay cả với cài đặt mặc định của {{jsxref("Object.prototype.toString()")}}), vì vậy `valueOf()` thường không được gọi trong trường hợp này.

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả ngoại trừ [các đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `toString()`. Cài đặt mặc định của `Object.prototype.valueOf()` được cố tình làm cho vô dụng: bằng cách trả về một đối tượng, giá trị trả về của nó sẽ không bao giờ được sử dụng bởi bất kỳ [thuật toán chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion) nào. Nhiều đối tượng tích hợp sẵn ghi đè phương thức này để trả về giá trị nguyên thủy phù hợp. Khi bạn tạo một đối tượng tùy chỉnh, bạn có thể ghi đè `valueOf()` để gọi một phương thức tùy chỉnh, cho phép đối tượng tùy chỉnh của bạn được chuyển đổi thành giá trị nguyên thủy. Thông thường, `valueOf()` được dùng để trả về giá trị có ý nghĩa nhất cho đối tượng — không giống `toString()`, giá trị đó không nhất thiết phải là chuỗi. Ngoài ra, bạn có thể thêm phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), cho phép kiểm soát quá trình chuyển đổi nhiều hơn, và luôn được ưu tiên hơn `valueOf` hoặc `toString` trong mọi chuyển đổi kiểu.

## Ví dụ

### Sử dụng valueOf()

Phương thức `valueOf()` mặc định trả về chính giá trị `this`, được chuyển đổi thành đối tượng nếu chưa phải là đối tượng. Do đó, giá trị trả về của nó sẽ không bao giờ được dùng bởi bất kỳ thuật toán chuyển đổi nguyên thủy nào.

```js
const obj = { foo: 1 };
console.log(obj.valueOf() === obj); // true

console.log(Object.prototype.valueOf.call("primitive"));
// [String: 'primitive'] (a wrapper object)
```

### Ghi đè valueOf cho các đối tượng tùy chỉnh

Bạn có thể tạo một hàm được gọi thay thế cho phương thức `valueOf` mặc định. Hàm của bạn không nên nhận tham số nào, vì nó sẽ không được truyền tham số nào khi được gọi trong quá trình chuyển đổi kiểu.

Ví dụ, bạn có thể thêm phương thức `valueOf` vào lớp tùy chỉnh `Box`.

```js
class Box {
  #value;
  constructor(value) {
    this.#value = value;
  }
  valueOf() {
    return this.#value;
  }
}
```

Với đoạn mã trên, bất cứ khi nào một đối tượng kiểu `Box` được dùng trong ngữ cảnh cần biểu diễn dưới dạng giá trị nguyên thủy (nhưng không cụ thể là chuỗi), JavaScript tự động gọi hàm đã định nghĩa ở trên.

```js
const box = new Box(123);
console.log(box + 456); // 579
console.log(box == 123); // true
```

Phương thức `valueOf` của một đối tượng thường được JavaScript gọi, nhưng bạn cũng có thể gọi nó trực tiếp như sau:

```js
box.valueOf();
```

### Sử dụng toán tử cộng một ngôi trên đối tượng

[Toán tử cộng một ngôi](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus) thực hiện [ép kiểu số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) trên toán hạng của nó, đối với hầu hết các đối tượng không có [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), điều đó có nghĩa là gọi `valueOf()`. Tuy nhiên, nếu đối tượng không có phương thức `valueOf()` tùy chỉnh, cài đặt mặc định sẽ khiến `valueOf()` bị bỏ qua và thay vào đó sử dụng giá trị trả về của `toString()`.

```js
+new Date(); // the current timestamp; same as new Date().getTime()
+{}; // NaN (toString() returns "[object Object]")
+[]; // 0 (toString() returns an empty string list)
+[1]; // 1 (toString() returns "1")
+[1, 2]; // NaN (toString() returns "1,2")
+new Set([1]); // NaN (toString() returns "[object Set]")
+{ valueOf: () => 42 }; // 42
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
- {{jsxref("parseInt()")}}
- {{jsxref("Symbol.toPrimitive")}}
