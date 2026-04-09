---
title: Object.prototype.hasOwnProperty()
short-title: hasOwnProperty()
slug: Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.hasOwnProperty
sidebar: jsref
---

Phương thức **`hasOwnProperty()`** của các instance {{jsxref("Object")}} trả về một boolean cho biết đối tượng này có thuộc tính được chỉ định như là thuộc tính riêng của nó hay không (trái với kế thừa).

> [!NOTE]
> {{jsxref("Object.hasOwn()")}} được khuyến nghị thay cho
> `hasOwnProperty()`, trên các trình duyệt hỗ trợ nó.

{{InteractiveExample("JavaScript Demo: Object.prototype.hasOwnProperty()")}}

```js interactive-example
const object = {};
object.foo = 42;

console.log(object.hasOwnProperty("foo"));
// Expected output: true

console.log(object.hasOwnProperty("toString"));
// Expected output: false

console.log(object.hasOwnProperty("hasOwnProperty"));
// Expected output: false
```

## Cú pháp

```js-nolint
hasOwnProperty(prop)
```

### Tham số

- `prop`
  - : Tên {{jsxref("String")}} hoặc [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) của thuộc tính cần kiểm tra.

### Giá trị trả về

Trả về `true` nếu đối tượng có thuộc tính được chỉ định là thuộc tính riêng; ngược lại là `false`.

## Mô tả

Phương thức **`hasOwnProperty()`** trả về `true` nếu thuộc tính được chỉ định là thuộc tính trực tiếp của đối tượng — kể cả khi giá trị là `null` hoặc `undefined`. Phương thức trả về `false` nếu thuộc tính được kế thừa hoặc chưa được khai báo. Không giống toán tử {{jsxref("Operators/in", "in")}}, phương thức này không kiểm tra thuộc tính được chỉ định trong chuỗi prototype của đối tượng.

Phương thức có thể được gọi trên _hầu hết_ các đối tượng JavaScript, vì hầu hết các đối tượng đều kế thừa từ {{jsxref("Object")}}, và do đó kế thừa các phương thức của nó. Ví dụ {{jsxref("Array")}} là một {{jsxref("Object")}}, vì vậy bạn có thể dùng phương thức `hasOwnProperty()` để kiểm tra xem một chỉ số có tồn tại hay không:

```js
const fruits = ["Apple", "Banana", "Watermelon", "Orange"];
fruits.hasOwnProperty(3); // true ('Orange')
fruits.hasOwnProperty(4); // false - not defined
```

Phương thức sẽ không khả dụng trong các đối tượng mà nó bị triển khai lại, hoặc trên [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) (vì những đối tượng này không kế thừa từ `Object.prototype`). Ví dụ cho các trường hợp này được cung cấp bên dưới.

## Ví dụ

### Dùng hasOwnProperty để kiểm tra sự tồn tại của thuộc tính riêng

Đoạn mã sau cho thấy cách xác định xem đối tượng `example` có chứa thuộc tính tên là `prop` hay không.

```js
const example = {};
example.hasOwnProperty("prop"); // false

example.prop = "exists";
example.hasOwnProperty("prop"); // true - 'prop' has been defined

example.prop = null;
example.hasOwnProperty("prop"); // true - own property exists with value of null

example.prop = undefined;
example.hasOwnProperty("prop"); // true - own property exists with value of undefined
```

### Thuộc tính trực tiếp so với thuộc tính kế thừa

Ví dụ sau phân biệt giữa thuộc tính trực tiếp và thuộc tính kế thừa qua chuỗi prototype:

```js
const example = {};
example.prop = "exists";

// `hasOwnProperty` will only return true for direct properties:
example.hasOwnProperty("prop"); // true
example.hasOwnProperty("toString"); // false
example.hasOwnProperty("hasOwnProperty"); // false

// The `in` operator will return true for direct or inherited properties:
"prop" in example; // true
"toString" in example; // true
"hasOwnProperty" in example; // true
```

### Duyệt các thuộc tính của một đối tượng

Ví dụ sau cho thấy cách duyệt các thuộc tính enumerable của một đối tượng mà không thực thi trên các thuộc tính kế thừa.

```js
const buz = {
  fog: "stack",
};

for (const name in buz) {
  if (buz.hasOwnProperty(name)) {
    console.log(`this is fog (${name}) for sure. Value: ${buz[name]}`);
  } else {
    console.log(name); // toString or something else
  }
}
```

Lưu ý rằng vòng lặp {{jsxref("Statements/for...in", "for...in")}} chỉ duyệt các phần tử enumerable: sự vắng mặt của các thuộc tính non-enumerable không được phát ra từ vòng lặp không có nghĩa là `hasOwnProperty` bị giới hạn nghiêm ngặt đối với các phần tử enumerable. Bạn có thể duyệt các thuộc tính non-enumerable với {{jsxref("Object.getOwnPropertyNames()")}}.

### Dùng hasOwnProperty làm tên thuộc tính

JavaScript không bảo vệ tên thuộc tính `hasOwnProperty`; một đối tượng có thuộc tính với tên này có thể trả về kết quả không chính xác:

```js
const foo = {
  hasOwnProperty() {
    return false;
  },
  bar: "Here be dragons",
};

foo.hasOwnProperty("bar"); // re-implementation always returns false
```

Cách khuyến nghị để giải quyết vấn đề này là thay bằng {{jsxref("Object.hasOwn()")}} (trong các trình duyệt hỗ trợ). Các lựa chọn khác bao gồm việc sử dụng `hasOwnProperty` _bên ngoài_:

```js
const foo = { bar: "Here be dragons" };

// Use Object.hasOwn() method - recommended
Object.hasOwn(foo, "bar"); // true

// Use the hasOwnProperty property from the Object prototype
Object.prototype.hasOwnProperty.call(foo, "bar"); // true

// Use another Object's hasOwnProperty
// and call it with 'this' set to foo
({}).hasOwnProperty.call(foo, "bar"); // true
```

Lưu ý rằng trong hai trường hợp đầu không có đối tượng mới nào được tạo.

### Đối tượng được tạo với Object.create(null)

Các [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) không kế thừa từ `Object.prototype`, khiến `hasOwnProperty()` không thể truy cập được.

```js
const foo = Object.create(null);
foo.prop = "exists";
foo.hasOwnProperty("prop"); // Uncaught TypeError: foo.hasOwnProperty is not a function
```

Các giải pháp trong trường hợp này giống với phần trước: ưu tiên dùng {{jsxref("Object.hasOwn()")}}, ngược lại dùng `hasOwnProperty()` của đối tượng bên ngoài.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.hasOwn()")}}
- [Khả năng liệt kê và quyền sở hữu thuộc tính](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Statements/for...in", "for...in")}}
- {{jsxref("Operators/in", "in")}}
- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
