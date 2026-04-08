---
title: BigInt.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.BigInt.toString
sidebar: jsref
---

Phương thức **`toString()`** của các giá trị {{jsxref("BigInt")}} trả về một chuỗi đại diện cho giá trị {{jsxref("BigInt")}} đã chỉ định. Ký tự "n" ở cuối không phải là một phần của chuỗi.

{{InteractiveExample("JavaScript Demo: BigInt.prototype.toString()")}}

```js interactive-example
console.log(1024n.toString());
// Expected output: "1024"

console.log(1024n.toString(2));
// Expected output: "10000000000"

console.log(1024n.toString(16));
// Expected output: "400"
```

## Cú pháp

```js-nolint
toString()
toString(radix)
```

### Tham số

- `radix` {{optional_inline}}
  - : Một số nguyên trong phạm vi từ 2 đến 36 chỉ định cơ số để biểu diễn giá trị BigInt. Mặc định là 10.

### Giá trị trả về

Một chuỗi đại diện cho giá trị {{jsxref("BigInt")}} đã chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `radix` nhỏ hơn 2 hoặc lớn hơn 36.

## Mô tả

Đối tượng {{jsxref("BigInt")}} ghi đè phương thức `toString` của {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các giá trị {{jsxref("BigInt")}}, phương thức `toString()` trả về biểu diễn chuỗi của giá trị trong cơ số đã chỉ định.

Đối với các cơ số trên 10, các chữ cái của bảng chữ cái biểu thị các chữ số lớn hơn 9. Ví dụ, đối với số thập lục phân (cơ số 16), `a` đến `f` được dùng.

Nếu giá trị BigInt đã chỉ định là âm, dấu được bảo toàn. Điều này đúng ngay cả khi cơ số là 2; chuỗi được trả về là biểu diễn nhị phân dương của giá trị BigInt đứng trước bởi dấu `-`, **không** phải bù hai của giá trị BigInt.

Phương thức `toString()` yêu cầu giá trị `this` của nó là một nguyên thủy `BigInt` hoặc đối tượng bao bọc. Nó ném {{jsxref("TypeError")}} cho các giá trị `this` khác mà không cố gắng ép kiểu chúng thành giá trị BigInt.

Vì `BigInt` không có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), JavaScript gọi phương thức `toString()` tự động khi một _đối tượng_ `BigInt` được dùng trong ngữ cảnh mong đợi chuỗi, chẳng hạn như trong [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Tuy nhiên, các _giá trị nguyên thủy_ BigInt không tham khảo phương thức `toString()` để được [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) — thay vào đó, chúng được chuyển đổi trực tiếp bằng cùng thuật toán như triển khai ban đầu của `toString()`.

```js
BigInt.prototype.toString = () => "Overridden";
console.log(`${1n}`); // "1"
console.log(`${Object(1n)}`); // "Overridden"
```

## Ví dụ

### Sử dụng toString()

```js
17n.toString(); // "17"
66n.toString(2); // "1000010"
254n.toString(16); // "fe"
(-10n).toString(2); // "-1010"
(-0xffn).toString(2); // "-11111111"
```

### BigInt âm không

Không có BigInt âm không vì không có số không âm trong các số nguyên. `-0.0` là khái niệm dấu phẩy động IEEE chỉ xuất hiện trong kiểu [`Number`](/en-US/docs/Web/JavaScript/Guide/Data_structures#number_type) của JavaScript.

```js
(-0n).toString(); // "0"
BigInt(-0).toString(); // "0"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("BigInt.prototype.toLocaleString()")}}
- {{jsxref("BigInt.prototype.valueOf()")}}
- {{jsxref("Number.prototype.toString()")}}
