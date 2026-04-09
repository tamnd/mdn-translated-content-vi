---
title: Object.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Object/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các instance {{jsxref("Object")}} trả về một chuỗi đại diện cho đối tượng này. Phương thức này được thiết kế để các đối tượng dẫn xuất ghi đè cho mục đích đặc trưng theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Object.prototype.toLocaleString()")}}

```js interactive-example
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

console.log(date.toLocaleString("ar-EG"));
// Expected output: "٢٠‏/١٢‏/٢٠١٢ ٤:٠٠:٠٠ ص"

const number = 123456.789;

console.log(number.toLocaleString("de-DE"));
// Expected output: "123.456,789"
```

## Cú pháp

```js-nolint
toLocaleString()
```

### Tham số

Không có. Tuy nhiên, tất cả các đối tượng ghi đè phương thức này đều được kỳ vọng nhận tối đa hai tham số, tương ứng với `locales` và `options`, chẳng hạn như {{jsxref("Number.prototype.toLocaleString")}}. Các vị trí tham số không nên được dùng cho bất kỳ mục đích nào khác.

### Giá trị trả về

Giá trị trả về của việc gọi `this.toString()`.

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả trừ [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `toLocaleString()`. `toLocaleString` của {{jsxref("Object")}} trả về kết quả của việc gọi {{jsxref("Object/toString", "this.toString()")}}.

Hàm này được cung cấp để cho các đối tượng có phương thức `toLocaleString` chung, mặc dù không phải tất cả đều sử dụng nó. Trong ngôn ngữ cốt lõi, các đối tượng dựng sẵn sau ghi đè `toLocaleString` để cung cấp định dạng đặc trưng theo ngôn ngữ:

- {{jsxref("Array")}}: {{jsxref("Array.prototype.toLocaleString()")}}
- {{jsxref("Number")}}: {{jsxref("Number.prototype.toLocaleString()")}}
- {{jsxref("Date")}}: {{jsxref("Date.prototype.toLocaleString()")}}
- {{jsxref("TypedArray")}}: {{jsxref("TypedArray.prototype.toLocaleString()")}}
- {{jsxref("BigInt")}}: {{jsxref("BigInt.prototype.toLocaleString()")}}

## Ví dụ

### Sử dụng phương thức toLocaleString() cơ sở

Phương thức `toLocaleString()` cơ sở chỉ đơn giản gọi `toString()`.

```js
const obj = {
  toString() {
    return "My Object";
  },
};
console.log(obj.toLocaleString()); // "My Object"
```

### Ghi đè toLocaleString() của Array

{{jsxref("Array.prototype.toLocaleString()")}} được dùng để in các giá trị mảng dưới dạng chuỗi bằng cách gọi phương thức `toLocaleString()` của từng phần tử và nối kết quả với dấu phân cách đặc trưng theo ngôn ngữ. Ví dụ:

```js
const testArray = [4, 7, 10];

const euroPrices = testArray.toLocaleString("fr", {
  style: "currency",
  currency: "EUR",
});
// "4,00 €,7,00 €,10,00 €"
```

### Ghi đè toLocaleString() của Date

{{jsxref("Date.prototype.toLocaleString()")}} được dùng để in ra biểu diễn ngày phù hợp hơn cho các ngôn ngữ cụ thể. Ví dụ:

```js
const testDate = new Date();
// "Fri May 29 2020 18:04:24 GMT+0100 (British Summer Time)"

const deDate = testDate.toLocaleString("de");
// "29.5.2020, 18:04:24"

const frDate = testDate.toLocaleString("fr");
// "29/05/2020, 18:04:24"
```

### Ghi đè toLocaleString() của Number

{{jsxref("Number.prototype.toLocaleString()")}} được dùng để in ra biểu diễn số phù hợp hơn cho các ngôn ngữ cụ thể, ví dụ với dấu phân cách đúng. Ví dụ:

```js
const testNumber = 2901234564;
// "2901234564"

const deNumber = testNumber.toLocaleString("de");
// "2.901.234.564"

const frNumber = testNumber.toLocaleString("fr");
// "2 901 234 564"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
