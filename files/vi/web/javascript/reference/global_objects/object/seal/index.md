---
title: Object.seal()
short-title: seal()
slug: Web/JavaScript/Reference/Global_Objects/Object/seal
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.seal
sidebar: jsref
---

Phương thức tĩnh **`Object.seal()`** _niêm phong_ một đối tượng. Niêm phong một đối tượng [ngăn mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions) và làm cho các thuộc tính hiện có trở nên không thể cấu hình. Một đối tượng bị niêm phong có tập hợp thuộc tính cố định: không thể thêm thuộc tính mới, không thể xóa thuộc tính hiện có, không thể thay đổi khả năng đếm và khả năng cấu hình của chúng, và prototype không thể gán lại. Giá trị của các thuộc tính hiện có vẫn có thể thay đổi miễn là chúng có thể ghi. `seal()` trả về cùng đối tượng đã được truyền vào.

{{InteractiveExample("JavaScript Demo: Object.seal()")}}

```js interactive-example
const object = {
  foo: 42,
};

Object.seal(object);
object.foo = 33;
console.log(object.foo);
// Expected output: 33

delete object.foo; // Cannot delete when sealed
console.log(object.foo);
// Expected output: 33
```

## Cú pháp

```js-nolint
Object.seal(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần được niêm phong.

### Giá trị trả về

Đối tượng đang được niêm phong.

## Mô tả

Niêm phong một đối tượng tương đương với [ngăn mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions) và sau đó thay đổi tất cả [descriptor thuộc tính](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) hiện có thành `configurable: false`. Điều này có tác dụng làm cho tập hợp thuộc tính trên đối tượng trở nên cố định. Làm cho tất cả các thuộc tính không thể cấu hình cũng ngăn chúng bị chuyển đổi từ data property thành accessor property và ngược lại, nhưng không ngăn các giá trị của data property bị thay đổi. Cố gắng xóa hoặc thêm thuộc tính vào đối tượng bị niêm phong, hoặc chuyển đổi data property thành accessor hoặc ngược lại, sẽ thất bại, hoặc silently hoặc bằng cách ném {{jsxref("TypeError")}} (thường xuyên nhất, mặc dù không phải chỉ, khi ở code {{jsxref("Strict_mode", "strict mode", "", 1)}}).

[Phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) không phải là thuộc tính và không có khái niệm property descriptor. Phần tử private không thể được thêm hoặc xóa khỏi đối tượng, dù đối tượng có bị niêm phong hay không.

Chuỗi prototype vẫn không thay đổi. Tuy nhiên, do tác dụng của [ngăn mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions), `[[Prototype]]` không thể gán lại.

Không giống như {{jsxref("Object.freeze()")}}, các đối tượng được niêm phong bằng `Object.seal()` vẫn có thể thay đổi các thuộc tính hiện có của chúng, miễn là chúng có thể ghi.

## Ví dụ

### Sử dụng Object.seal

```js
const obj = {
  prop() {},
  foo: "bar",
};

// Có thể thêm thuộc tính mới, các thuộc tính hiện có
// có thể được thay đổi hoặc xóa.
obj.foo = "baz";
obj.lumpy = "woof";
delete obj.prop;

const o = Object.seal(obj);

o === obj; // true
Object.isSealed(obj); // true

// Thay đổi giá trị thuộc tính trên đối tượng bị niêm phong
// vẫn hoạt động.
obj.foo = "quux";

// Nhưng không thể chuyển đổi data property thành accessor,
// hoặc ngược lại.
Object.defineProperty(obj, "foo", {
  get() {
    return "g";
  },
}); // ném TypeError

// Bây giờ mọi thay đổi, trừ thay đổi giá trị thuộc tính,
// sẽ thất bại.
obj.quaxxor = "the friendly duck";
// silently không thêm thuộc tính
delete obj.foo;
// silently không xóa thuộc tính

// … và trong strict mode các nỗ lực như vậy
// sẽ ném TypeError.
function fail() {
  "use strict";
  delete obj.foo; // ném TypeError
  obj.sparky = "arf"; // ném TypeError
}
fail();

// Các nỗ lực thêm qua
// Object.defineProperty cũng sẽ ném.
Object.defineProperty(obj, "ohai", {
  value: 17,
}); // ném TypeError
Object.defineProperty(obj, "foo", {
  value: "eit",
}); // thay đổi giá trị thuộc tính hiện có
```

### Đối số không phải đối tượng

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một kiểu nguyên thủy), thì nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, đối số không phải đối tượng sẽ được trả về nguyên vẹn mà không có lỗi, vì các kiểu nguyên thủy đã là, theo định nghĩa, bất biến.

```js
Object.seal(1);
// TypeError: 1 is not an object (mã ES5)

Object.seal(1);
// 1                             (mã ES2015)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.isSealed()")}}
- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Object.freeze()")}}
- {{jsxref("Object.isFrozen()")}}
