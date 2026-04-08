---
title: Temporal.PlainYearMonth.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.equals
sidebar: jsref
---

Phương thức **`equals()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về `true` nếu year-month này có giá trị tương đương với một year-month khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}), và `false` trong trường hợp còn lại. Chúng được so sánh cả theo giá trị ngày ISO cơ bản lẫn lịch, vì vậy hai year-month từ các lịch khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/PlainYearMonth/compare", "Temporal.PlainYearMonth.compare()")}} nhưng không bởi `equals()`.

> [!NOTE]
> Các đối tượng `PlainYearMonth` theo dõi một ngày ISO tham chiếu, cũng được dùng trong quá trình so sánh. Ngày này được tự động đặt khi sử dụng phương thức {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}, nhưng có thể được đặt thủ công bằng constructor {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}}, khiến hai year-month tương đương bị coi là khác nhau nếu chúng có các ngày tham chiếu khác nhau. Vì lý do này, bạn nên tránh dùng constructor trực tiếp và ưu tiên phương thức `from()`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainYearMonth")}} đại diện cho year-month khác cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainYearMonth` bằng thuật toán tương tự như {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}.

### Giá trị trả về

`true` nếu year-month này bằng `other` cả về giá trị ngày lẫn lịch, `false` trong trường hợp còn lại.

## Ví dụ

### Sử dụng equals()

```js
const ym1 = Temporal.PlainYearMonth.from("2021-08");
const ym2 = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
console.log(ym1.equals(ym2)); // true

const ym3 = Temporal.PlainYearMonth.from("2021-08-01[u-ca=japanese]");
console.log(ym1.equals(ym3)); // false

const ym4 = Temporal.PlainYearMonth.from("2021-09");
console.log(ym1.equals(ym4)); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/compare", "Temporal.PlainYearMonth.compare()")}}
