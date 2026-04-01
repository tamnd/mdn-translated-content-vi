---
title: Boolean() constructor
short-title: Boolean()
slug: Web/JavaScript/Reference/Global_Objects/Boolean/Boolean
page-type: javascript-constructor
browser-compat: javascript.builtins.Boolean.Boolean
sidebar: jsref
---

Hàm tạo **`Boolean()`** tạo ra các đối tượng {{jsxref("Boolean")}}. Khi được gọi như một hàm thông thường, nó trả về các giá trị nguyên thủy kiểu Boolean.

{{InteractiveExample("JavaScript Demo: Boolean() constructor")}}

```js interactive-example
const flag = new Boolean();
console.log(typeof flag);
// Expected output: object
console.log(flag === false);
// Expected output: false

const flag2 = Boolean();
console.log(typeof flag2);
// Expected output: boolean
console.log(flag2 === false);
// Expected output: true
```

## Cú pháp

```js-nolint
new Boolean(value)
Boolean(value)
```

> [!NOTE]
> `Boolean()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng với các hiệu ứng khác nhau. Xem [Giá trị trả về](#return_value).

### Tham số

- `value`
  - : Giá trị ban đầu của đối tượng `Boolean`.

### Giá trị trả về

Khi `Boolean()` được gọi như một hàm (không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new)), nó trả về `value` [chuyển đổi thành boolean nguyên thủy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

Khi `Boolean()` được gọi như một hàm tạo (với `new`), nó ép buộc `value` thành boolean nguyên thủy và trả về một đối tượng {{jsxref("Boolean")}} bao bọc, **không** phải là nguyên thủy.

> [!WARNING]
> Bạn hiếm khi cần sử dụng `Boolean` như một hàm tạo.

## Mô tả

Giá trị được truyền vào tham số đầu tiên được [chuyển đổi thành giá trị boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion). Nếu giá trị bị bỏ qua hoặc là `0`, `-0`, `0n`, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), `false`, {{jsxref("NaN")}}, {{jsxref("undefined")}}, hoặc chuỗi rỗng (`""`), thì đối tượng có giá trị ban đầu là `false`. Tất cả các giá trị khác, kể cả bất kỳ đối tượng nào, mảng rỗng (`[]`), hoặc chuỗi `"false"`, đều tạo ra đối tượng với giá trị ban đầu là `true`.

> [!NOTE]
> Khi thuộc tính phi tiêu chuẩn [`document.all`](/en-US/docs/Web/API/Document/all) được sử dụng làm đối số cho hàm tạo này, kết quả là đối tượng `Boolean` với giá trị `false`. Thuộc tính này là kế thừa, phi tiêu chuẩn và không nên được sử dụng.

## Ví dụ

### Tạo đối tượng Boolean với giá trị ban đầu là false

```js
const bZero = new Boolean(0);
const bNull = new Boolean(null);
const bEmptyString = new Boolean("");
const bfalse = new Boolean(false);

typeof bfalse; // "object"
Boolean(bfalse); // true
```

Lưu ý cách chuyển đổi đối tượng `Boolean` thành nguyên thủy bằng `Boolean()` luôn trả về `true`, ngay cả khi đối tượng giữ giá trị `false`. Do đó bạn luôn nên tránh xây dựng các đối tượng bao bọc `Boolean`.

Nếu bạn cần lấy giá trị nguyên thủy từ đối tượng bao bọc, thay vì sử dụng hàm `Boolean()`, hãy sử dụng phương thức [`valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean/valueOf) của đối tượng đó.

```js
const bfalse = new Boolean(false);

bfalse.valueOf(); // false
```

### Tạo đối tượng `Boolean` với giá trị ban đầu là `true`

```js
const btrue = new Boolean(true);
const btrueString = new Boolean("true");
const bfalseString = new Boolean("false");
const bSuLin = new Boolean("Su Lin");
const bArrayProto = new Boolean([]);
const bObjProto = new Boolean({});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Boolean](/en-US/docs/Glossary/Boolean)
