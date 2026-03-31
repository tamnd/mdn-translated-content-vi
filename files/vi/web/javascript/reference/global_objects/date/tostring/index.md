---
title: Date.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho ngày này được diễn giải theo múi giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.toString()", "shorter")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

console.log(event.toString());
// Expected output: "Tue Aug 19 1975 23:15:30 GMT+0200 (CEST)"
// Note: your timezone may vary
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày đã cho (xem mô tả để biết định dạng). Trả về `"Invalid Date"` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Phương thức `toString()` là một phần của [giao thức ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). Vì `Date` có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive), phương thức đó luôn được ưu tiên hơn `toString()` khi một đối tượng `Date` được ngầm [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Tuy nhiên, `Date.prototype[Symbol.toPrimitive]()` vẫn gọi `this.toString()` nội bộ.

Đối tượng {{jsxref("Date")}} ghi đè phương thức {{jsxref("Object/toString", "toString()")}} của {{jsxref("Object")}}. `Date.prototype.toString()` trả về một biểu diễn chuỗi của Date được diễn giải theo múi giờ địa phương, chứa cả ngày lẫn thời gian — nó kết hợp biểu diễn chuỗi được chỉ định trong {{jsxref("Date/toDateString", "toDateString()")}} và {{jsxref("Date/toTimeString", "toTimeString()")}} với nhau, thêm một khoảng trắng giữa chúng. Ví dụ: "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)".

`Date.prototype.toString()` phải được gọi trên các instance {{jsxref("Date")}}. Nếu giá trị `this` không kế thừa từ `Date.prototype`, sẽ ném {{jsxref("TypeError")}}.

- Nếu bạn chỉ muốn lấy phần _ngày_, hãy sử dụng {{jsxref("Date/toDateString", "toDateString()")}}.
- Nếu bạn chỉ muốn lấy phần _thời gian_, hãy sử dụng {{jsxref("Date/toTimeString", "toTimeString()")}}.
- Nếu bạn muốn ngày được diễn giải theo UTC thay vì múi giờ địa phương, hãy sử dụng {{jsxref("Date/toUTCString", "toUTCString()")}}.
- Nếu bạn muốn định dạng ngày theo định dạng thân thiện hơn với người dùng (ví dụ: bản địa hóa), hãy sử dụng {{jsxref("Date/toLocaleString", "toLocaleString()")}}.

## Ví dụ

### Sử dụng toString()

```js
const d = new Date(0);
console.log(d.toString()); // "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
- {{jsxref("Date.prototype.toDateString()")}}
- {{jsxref("Date.prototype.toLocaleString()")}}
- {{jsxref("Date.prototype.toTimeString()")}}
