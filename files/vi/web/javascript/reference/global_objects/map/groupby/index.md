---
title: Map.groupBy()
short-title: groupBy()
slug: Web/JavaScript/Reference/Global_Objects/Map/groupBy
page-type: javascript-static-method
browser-compat: javascript.builtins.Map.groupBy
sidebar: jsref
---

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai như phương thức `Array.prototype.groupToMap()`. Do các vấn đề tương thích web, nó hiện được triển khai như một phương thức tĩnh. Kiểm tra [bảng tương thích trình duyệt](#tương_thích_trình_duyệt) để biết chi tiết.

Phương thức tĩnh **`Map.groupBy()`** nhóm các phần tử của một iterable đã cho bằng cách sử dụng các giá trị được trả về bởi một callback function được cung cấp. {{jsxref("Map")}} cuối cùng được trả về sử dụng các giá trị duy nhất từ hàm kiểm tra làm key, có thể được dùng để lấy mảng phần tử trong mỗi nhóm.

Phương thức này chủ yếu hữu ích khi nhóm các phần tử liên kết với một đối tượng, đặc biệt khi đối tượng đó có thể thay đổi theo thời gian. Nếu đối tượng bất biến, bạn có thể thay thế bằng cách biểu diễn nó dưới dạng chuỗi, và nhóm các phần tử với {{jsxref("Object.groupBy()")}}.

{{InteractiveExample("JavaScript Demo: Map.groupBy()", "taller")}}

```js interactive-example
const inventory = [
  { name: "asparagus", type: "vegetables", quantity: 9 },
  { name: "bananas", type: "fruit", quantity: 5 },
  { name: "goat", type: "meat", quantity: 23 },
  { name: "cherries", type: "fruit", quantity: 12 },
  { name: "fish", type: "meat", quantity: 22 },
];

const restock = { restock: true };
const sufficient = { restock: false };
const result = Map.groupBy(inventory, ({ quantity }) =>
  quantity < 6 ? restock : sufficient,
);
console.log(result.get(restock));
// [{ name: "bananas", type: "fruit", quantity: 5 }]
```

## Cú pháp

```js-nolint
Map.groupBy(items, callbackFn)
```

### Tham số

- `items`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) mà các phần tử của nó sẽ được nhóm.
- `callbackFn`
  - : Hàm được thực thi cho mỗi phần tử trong iterable. Nó nên trả về một giá trị ({{Glossary("object")}} hoặc {{Glossary("primitive")}}) chỉ ra nhóm của phần tử hiện tại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

Một đối tượng {{jsxref("Map")}} với các key cho mỗi nhóm, mỗi key được gán cho một mảng chứa các phần tử của nhóm liên quan.

## Mô tả

`Map.groupBy()` gọi một hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong một iterable. Hàm callback nên trả về một giá trị chỉ ra nhóm của phần tử liên quan. Các giá trị được trả về bởi `callbackFn` được dùng làm key cho {{jsxref("Map")}} được trả về bởi `Map.groupBy()`. Mỗi key có một mảng liên kết chứa tất cả các phần tử mà callback trả về cùng một giá trị.

Các phần tử trong {{jsxref("Map")}} được trả về và iterable gốc là giống nhau (không phải {{Glossary("deep copy", "bản sao sâu")}}). Thay đổi cấu trúc nội bộ của các phần tử sẽ được phản ánh trong cả iterable gốc và {{jsxref("Map")}} được trả về.

Phương thức này hữu ích khi bạn cần nhóm thông tin liên quan đến một đối tượng cụ thể có thể thay đổi theo thời gian. Điều này là vì ngay cả khi đối tượng bị sửa đổi, nó vẫn tiếp tục hoạt động như một key của `Map` được trả về. Nếu thay vào đó bạn tạo một biểu diễn chuỗi cho đối tượng và sử dụng nó như một grouping key trong {{jsxref("Object.groupBy()")}}, bạn phải duy trì ánh xạ giữa đối tượng gốc và biểu diễn của nó khi đối tượng thay đổi.

> [!NOTE]
> Để truy cập các nhóm trong `Map` được trả về, bạn phải sử dụng cùng đối tượng ban đầu được dùng làm key trong `Map` (mặc dù bạn có thể sửa đổi các thuộc tính của nó). Bạn không thể dùng một đối tượng khác chỉ tình cờ có cùng tên và thuộc tính.

`Map.groupBy` không đọc giá trị của `this`. Nó có thể được gọi trên bất kỳ đối tượng nào và một instance {{jsxref("Map")}} mới sẽ được trả về.

## Ví dụ

### Sử dụng Map.groupBy()

Đầu tiên chúng ta xác định một mảng chứa các đối tượng biểu diễn kho hàng của các loại thực phẩm khác nhau. Mỗi thực phẩm có `type` và `quantity`.

```js
const inventory = [
  { name: "asparagus", type: "vegetables", quantity: 9 },
  { name: "bananas", type: "fruit", quantity: 5 },
  { name: "goat", type: "meat", quantity: 23 },
  { name: "cherries", type: "fruit", quantity: 12 },
  { name: "fish", type: "meat", quantity: 22 },
];
```

Đoạn code dưới đây sử dụng `Map.groupBy()` với một arrow function trả về các key đối tượng tên là `restock` hoặc `sufficient`, tùy thuộc vào việc phần tử có `quantity < 6` hay không. Đối tượng `result` được trả về là một `Map` vì vậy chúng ta cần gọi `get()` với key để lấy mảng.

```js
const restock = { restock: true };
const sufficient = { restock: false };
const result = Map.groupBy(inventory, ({ quantity }) =>
  quantity < 6 ? restock : sufficient,
);
console.log(result.get(restock));
// [{ name: "bananas", type: "fruit", quantity: 5 }]
```

Lưu ý rằng đối số hàm `{ quantity }` là ví dụ cơ bản về [cú pháp destructuring đối tượng cho đối số hàm](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#unpacking_properties_from_objects_passed_as_a_function_parameter). Điều này giải nén thuộc tính `quantity` của một đối tượng được truyền làm tham số, và gán nó cho một biến tên `quantity` trong thân hàm. Đây là cách rất súc tích để truy cập các giá trị liên quan của phần tử trong một hàm.

Key của `Map` có thể được sửa đổi và vẫn được sử dụng. Tuy nhiên bạn không thể tái tạo key và vẫn dùng nó. Vì lý do này, điều quan trọng là bất cứ thứ gì cần dùng map phải giữ tham chiếu đến các key của nó.

```js
// The key can be modified and still used
restock["fast"] = true;
console.log(result.get(restock));
// [{ name: "bananas", type: "fruit", quantity: 5 }]

// A new key can't be used, even if it has the same structure!
const restock2 = { restock: true };
console.log(result.get(restock2)); // undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Map.groupBy` in `core-js`](https://github.com/zloirock/core-js#array-grouping)
- [es-shims polyfill of `Map.groupBy`](https://www.npmjs.com/package/map.groupby)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("Map/Map", "Map()")}}
- {{jsxref("Object.groupBy()")}}
