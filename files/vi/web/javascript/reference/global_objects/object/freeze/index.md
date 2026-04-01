---
title: Object.freeze()
short-title: freeze()
slug: Web/JavaScript/Reference/Global_Objects/Object/freeze
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.freeze
sidebar: jsref
---

Phương thức tĩnh **`Object.freeze()`** _đóng băng_ một đối tượng. Đóng băng một đối tượng [ngăn mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions) và làm cho các thuộc tính hiện có trở nên không thể ghi và không thể cấu hình. Một đối tượng bị đóng băng không thể thay đổi thêm: không thể thêm thuộc tính mới, không thể xóa thuộc tính hiện có, không thể thay đổi khả năng đếm, khả năng cấu hình, khả năng ghi hoặc giá trị của chúng, và prototype của đối tượng không thể gán lại. `freeze()` trả về cùng đối tượng đã được truyền vào.

Đóng băng một đối tượng là mức độ toàn vẹn cao nhất mà JavaScript cung cấp.

{{InteractiveExample("JavaScript Demo: Object.freeze()")}}

```js interactive-example
const obj = {
  prop: 42,
};

Object.freeze(obj);

obj.prop = 33;
// Throws an error in strict mode

console.log(obj.prop);
// Expected output: 42
```

## Cú pháp

```js-nolint
Object.freeze(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần đóng băng.

### Giá trị trả về

Đối tượng đã được truyền vào hàm.

## Mô tả

Đóng băng một đối tượng tương đương với [ngăn mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions) và sau đó thay đổi tất cả [`configurable` của descriptor thuộc tính](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) hiện có thành `false` — và đối với data property, `writable` cũng thành `false`. Không thể thêm hoặc xóa bất cứ thứ gì khỏi tập hợp thuộc tính của đối tượng bị đóng băng. Bất kỳ nỗ lực nào để làm vậy sẽ thất bại, hoặc silently hoặc bằng cách ném {{jsxref("TypeError")}} (thường xuyên nhất, nhưng không chỉ, khi ở {{jsxref("Strict_mode", "strict mode", "", 1)}}).

Đối với data property của đối tượng bị đóng băng, giá trị của chúng không thể thay đổi vì các thuộc tính `writable` và `configurable` được đặt thành `false`. Accessor property (getter và setter) hoạt động như cũ — giá trị thuộc tính được trả về bởi getter vẫn có thể thay đổi, và setter vẫn có thể được gọi mà không ném lỗi khi đặt thuộc tính. Lưu ý rằng các giá trị là đối tượng vẫn có thể được sửa đổi, trừ khi chúng cũng bị đóng băng. Là một đối tượng, mảng có thể bị đóng băng; sau khi làm vậy, các phần tử của nó không thể bị thay đổi và không thể thêm hoặc xóa phần tử khỏi mảng.

[Các phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) không phải là thuộc tính và không có khái niệm property descriptor. Đóng băng một đối tượng có phần tử private không ngăn các giá trị của phần tử private đó bị thay đổi. (Đóng băng đối tượng thường được dùng như một biện pháp bảo mật chống lại code bên ngoài, nhưng code bên ngoài không thể truy cập phần tử private.) Các phần tử private không thể được thêm hoặc xóa khỏi đối tượng, dù đối tượng có bị đóng băng hay không.

`freeze()` trả về cùng đối tượng đã được truyền vào hàm. Nó _không_ tạo một bản sao đóng băng.

Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} có các phần tử sẽ gây ra {{jsxref("TypeError")}}, vì chúng là các view trên bộ nhớ và chắc chắn sẽ gây ra các vấn đề khác:

```js
Object.freeze(new Uint8Array(0)); // Không có phần tử
// Uint8Array []

Object.freeze(new Uint8Array(1)); // Có phần tử
// TypeError: Cannot freeze array buffer views with elements

Object.freeze(new DataView(new ArrayBuffer(32))); // Không có phần tử
// DataView {}

Object.freeze(new Float64Array(new ArrayBuffer(64), 63, 0)); // Không có phần tử
// Float64Array []

Object.freeze(new Float64Array(new ArrayBuffer(64), 32, 2)); // Có phần tử
// TypeError: Cannot freeze array buffer views with elements
```

Lưu ý rằng vì ba thuộc tính tiêu chuẩn (`buf.byteLength`, `buf.byteOffset` và `buf.buffer`) là chỉ đọc (như đối với {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}}), không có lý do gì để cố gắng đóng băng các thuộc tính này.

Không giống như {{jsxref("Object.seal()")}}, các thuộc tính hiện có trong các đối tượng bị đóng băng với `Object.freeze()` được làm bất biến và data property không thể gán lại.

## Ví dụ

### Đóng băng đối tượng

```js
const obj = {
  prop() {},
  foo: "bar",
};

// Trước khi đóng băng: có thể thêm thuộc tính mới,
// và có thể thay đổi hoặc xóa các thuộc tính hiện có
obj.foo = "baz";
obj.lumpy = "woof";
delete obj.prop;

// Đóng băng.
const o = Object.freeze(obj);

// Giá trị trả về là cùng đối tượng mà chúng ta đã truyền vào.
o === obj; // true

// Đối tượng đã bị đóng băng.
Object.isFrozen(obj); // === true

// Bây giờ mọi thay đổi sẽ thất bại
obj.foo = "quux"; // silently không làm gì
// silently không thêm thuộc tính
obj.quaxxor = "the friendly duck";

// Trong strict mode, các nỗ lực như vậy sẽ ném TypeError
function fail() {
  "use strict";
  obj.foo = "sparky"; // ném TypeError
  delete obj.foo; // ném TypeError
  delete obj.quaxxor; // trả về true vì thuộc tính 'quaxxor' chưa được thêm
  obj.sparky = "arf"; // ném TypeError
}

fail();

// Các nỗ lực thay đổi thông qua Object.defineProperty;
// cả hai câu lệnh dưới đây đều ném TypeError.
Object.defineProperty(obj, "ohai", { value: 17 });
Object.defineProperty(obj, "foo", { value: "eit" });

// Cũng không thể thay đổi prototype
// cả hai câu lệnh dưới đây sẽ ném TypeError.
Object.setPrototypeOf(obj, { x: 20 });
obj.__proto__ = { x: 20 };
```

### Đóng băng mảng

```js
const a = [0];
Object.freeze(a); // Mảng không thể sửa đổi bây giờ.

a[0] = 1; // thất bại silently

// Trong strict mode, nỗ lực như vậy sẽ ném TypeError
function fail() {
  "use strict";
  a[0] = 1;
}

fail();

// Cố gắng push
a.push(2); // ném TypeError
```

Đối tượng bị đóng băng là _bất biến_. Tuy nhiên, nó không nhất thiết là _hằng số_. Ví dụ sau cho thấy đối tượng bị đóng băng không phải là hằng số (đóng băng là shallow).

```js
const obj1 = {
  internal: {},
};

Object.freeze(obj1);
obj1.internal.a = "value";

obj1.internal.a; // 'value'
```

Để là đối tượng hằng số, toàn bộ đồ thị tham chiếu (tham chiếu trực tiếp và gián tiếp đến các đối tượng khác) chỉ phải tham chiếu đến các đối tượng bất biến bị đóng băng. Đối tượng bị đóng băng được gọi là bất biến vì toàn bộ _trạng thái_ đối tượng (giá trị và tham chiếu đến các đối tượng khác) trong toàn bộ đối tượng là cố định. Lưu ý rằng chuỗi, số và boolean luôn bất biến và Function và Array là các đối tượng.

### Đóng băng sâu

Kết quả của việc gọi `Object.freeze(object)` chỉ áp dụng cho các thuộc tính ngay lập tức của chính `object` và sẽ ngăn việc thêm, xóa hoặc gán lại giá trị _chỉ_ trên `object`. Nếu giá trị của các thuộc tính đó là đối tượng, thì những đối tượng đó không bị đóng băng và có thể là mục tiêu của việc thêm, xóa hoặc gán lại giá trị thuộc tính.

```js
const employee = {
  name: "Mayank",
  designation: "Developer",
  address: {
    street: "Rohini",
    city: "Delhi",
  },
};

Object.freeze(employee);

employee.name = "Dummy"; // thất bại silently trong non-strict mode
employee.address.city = "Noida"; // các thuộc tính của đối tượng con có thể sửa đổi

console.log(employee.address.city); // "Noida"
```

Để làm cho một đối tượng bất biến, hãy đóng băng đệ quy mỗi thuộc tính không nguyên thủy (đóng băng sâu). Sử dụng mẫu theo từng trường hợp cụ thể dựa trên thiết kế của bạn khi bạn biết đối tượng không chứa [chu trình](<https://en.wikipedia.org/wiki/Cycle_(graph_theory)>) trong đồ thị tham chiếu, nếu không một vòng lặp vô tận sẽ được kích hoạt. Ví dụ, các hàm được tạo bằng cú pháp [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function) có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) với thuộc tính `constructor` trỏ đến chính hàm đó, vì vậy chúng có chu trình theo mặc định. Các hàm khác, chẳng hạn như [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), vẫn có thể bị đóng băng.

Một cải tiến cho `deepFreeze()` sẽ là lưu trữ các đối tượng nó đã truy cập, để bạn có thể ngăn việc gọi đệ quy `deepFreeze()` khi một đối tượng đang trong quá trình được làm bất biến. Để xem một ví dụ, hãy xem [sử dụng `WeakSet` để phát hiện tham chiếu vòng tròn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakSet#detecting_circular_references). Bạn vẫn có nguy cơ đóng băng một đối tượng không nên bị đóng băng, chẳng hạn như [`window`](/en-US/docs/Web/API/Window).

```js
function deepFreeze(object) {
  // Lấy tên thuộc tính được định nghĩa trên đối tượng
  const propNames = Reflect.ownKeys(object);

  // Đóng băng các thuộc tính trước khi đóng băng bản thân
  for (const name of propNames) {
    const value = object[name];

    if ((value && typeof value === "object") || typeof value === "function") {
      deepFreeze(value);
    }
  }

  return Object.freeze(object);
}

const obj2 = {
  internal: {
    a: null,
  },
};

deepFreeze(obj2);

obj2.internal.a = "anotherValue"; // thất bại silently trong non-strict mode
obj2.internal.a; // null
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.isFrozen()")}}
- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.isSealed()")}}
