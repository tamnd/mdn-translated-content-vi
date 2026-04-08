---
title: Object.groupBy()
short-title: groupBy()
slug: Web/JavaScript/Reference/Global_Objects/Object/groupBy
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.groupBy
sidebar: jsref
---

> [!NOTE]
> Trong một số phiên bản của một số trình duyệt, phương thức này được triển khai như phương thức `Array.prototype.group()`. Do các vấn đề tương thích web, nó hiện được triển khai như một phương thức tĩnh. Xem [bảng tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

Phương thức tĩnh **`Object.groupBy()`** nhóm các phần tử của một iterable đã cho theo các giá trị chuỗi được trả về bởi hàm callback được cung cấp. Đối tượng được trả về có các thuộc tính riêng biệt cho mỗi nhóm, chứa các mảng với các phần tử trong nhóm đó.

Phương thức này nên được sử dụng khi tên nhóm có thể được biểu diễn bằng chuỗi. Nếu bạn cần nhóm các phần tử bằng khóa là một giá trị tùy ý, hãy sử dụng {{jsxref("Map.groupBy()")}} thay thế.

{{InteractiveExample("JavaScript Demo: Object.groupBy()", "taller")}}

```js interactive-example
const inventory = [
  { name: "asparagus", type: "vegetables", quantity: 9 },
  { name: "bananas", type: "fruit", quantity: 5 },
  { name: "goat", type: "meat", quantity: 23 },
  { name: "cherries", type: "fruit", quantity: 12 },
  { name: "fish", type: "meat", quantity: 22 },
];

const result = Object.groupBy(inventory, ({ quantity }) =>
  quantity < 6 ? "restock" : "sufficient",
);
console.log(result.restock);
// [{ name: "bananas", type: "fruit", quantity: 5 }]
```

## Cú pháp

```js-nolint
Object.groupBy(items, callbackFn)
```

### Tham số

- `items`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) mà các phần tử sẽ được nhóm.
- `callbackFn`
  - : Hàm được thực thi cho mỗi phần tử trong iterable. Nó nên trả về một giá trị có thể được ép kiểu thành property key (chuỗi hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)) chỉ ra nhóm của phần tử hiện tại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

Một [đối tượng `null`-prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) với các thuộc tính cho tất cả các nhóm, mỗi nhóm được gán một mảng chứa các phần tử của nhóm liên kết.

## Mô tả

`Object.groupBy()` gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong iterable. Hàm callback nên trả về chuỗi hoặc symbol (các giá trị không phải các kiểu này sẽ được [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion)) chỉ ra nhóm của phần tử liên kết. Các giá trị được trả về bởi `callbackFn` được sử dụng làm khóa cho đối tượng được trả về bởi `Object.groupBy()`. Mỗi khóa có một mảng liên kết chứa tất cả các phần tử mà callback trả về cùng giá trị.

Các phần tử trong đối tượng được trả về và iterable ban đầu là như nhau (không phải {{Glossary("deep copy", "bản sao sâu")}}). Việc thay đổi cấu trúc nội bộ của các phần tử sẽ được phản ánh trong cả iterable ban đầu và đối tượng được trả về.

## Ví dụ

### Sử dụng Object.groupBy()

Đầu tiên chúng ta định nghĩa một mảng chứa các đối tượng đại diện cho kho hàng của các loại thực phẩm khác nhau. Mỗi thực phẩm có `type` và `quantity`.

```js
const inventory = [
  { name: "asparagus", type: "vegetables", quantity: 5 },
  { name: "bananas", type: "fruit", quantity: 0 },
  { name: "goat", type: "meat", quantity: 23 },
  { name: "cherries", type: "fruit", quantity: 5 },
  { name: "fish", type: "meat", quantity: 22 },
];
```

Đoạn code dưới đây nhóm các phần tử theo giá trị của thuộc tính `type` của chúng.

```js
const result = Object.groupBy(inventory, ({ type }) => type);

/* Result is:
{
  vegetables: [
    { name: 'asparagus', type: 'vegetables', quantity: 5 },
  ],
  fruit: [
    { name: "bananas", type: "fruit", quantity: 0 },
    { name: "cherries", type: "fruit", quantity: 5 }
  ],
  meat: [
    { name: "goat", type: "meat", quantity: 23 },
    { name: "fish", type: "meat", quantity: 22 }
  ]
}
*/
```

Arrow function chỉ trả về `type` của mỗi phần tử mảng mỗi khi nó được gọi. Lưu ý rằng đối số hàm `{ type }` là một ví dụ cơ bản về [cú pháp destructuring đối tượng cho đối số hàm](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#unpacking_properties_from_objects_passed_as_a_function_parameter). Điều này giải nén thuộc tính `type` của một đối tượng được truyền vào như một tham số, và gán nó cho một biến có tên `type` trong phần thân của hàm. Đây là cách rất súc tích để truy cập các giá trị liên quan của các phần tử trong một hàm.

Chúng ta cũng có thể tạo các nhóm được suy ra từ các giá trị trong một hoặc nhiều thuộc tính của các phần tử. Dưới đây là một ví dụ rất tương tự đặt các mục vào nhóm `ok` hoặc `restock` dựa trên giá trị của trường `quantity`.

```js
function myCallback({ quantity }) {
  return quantity > 5 ? "ok" : "restock";
}

const result2 = Object.groupBy(inventory, myCallback);

/* Result is:
{
  restock: [
    { name: "asparagus", type: "vegetables", quantity: 5 },
    { name: "bananas", type: "fruit", quantity: 0 },
    { name: "cherries", type: "fruit", quantity: 5 }
  ],
  ok: [
    { name: "goat", type: "meat", quantity: 23 },
    { name: "fish", type: "meat", quantity: 22 }
  ]
}
*/
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.groupBy` in `core-js`](https://github.com/zloirock/core-js#array-grouping)
- [es-shims polyfill of `Object.groupBy`](https://www.npmjs.com/package/object.groupby)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("Object.fromEntries()")}}
- {{jsxref("Map.groupBy()")}}
