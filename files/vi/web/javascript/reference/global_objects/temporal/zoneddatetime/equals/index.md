---
title: Temporal.ZonedDateTime.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.equals
sidebar: jsref
---

Phương thức **`equals()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về `true` nếu ngày-giờ này tương đương về giá trị với một ngày-giờ khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}), và `false` trong trường hợp ngược lại. Chúng được so sánh theo cả giá trị thời điểm, múi giờ và lịch, do đó hai ngày-giờ từ các lịch hoặc múi giờ khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/ZonedDateTime/compare", "Temporal.ZonedDateTime.compare()")}} nhưng không phải bởi `equals()`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, đối tượng, hoặc thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu thị ngày-giờ khác cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.ZonedDateTime` bằng cùng thuật toán như {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}.

### Giá trị trả về

`true` nếu ngày-giờ này bằng `other` về cả giá trị thời điểm, múi giờ và lịch, `false` trong trường hợp còn lại.

Lưu ý rằng các múi giờ được chuẩn hóa trước khi so sánh, vì vậy nếu [ID múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) của chúng đều có tên và xác định cùng một múi giờ, chúng sẽ được coi là giống nhau ngay cả khi các tên chính xác có thể là bí danh của nhau. Các định danh offset được so sánh theo giá trị offset mà chúng đại diện. Các định danh offset không bao giờ so sánh bằng với các định danh có tên ngay cả khi múi giờ được định danh bằng tên luôn sử dụng offset đó.

## Ví dụ

### Sử dụng equals()

```js
// Asia/Kolkata và Asia/Calcutta là bí danh của nhau
const dt1 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56+05:30[Asia/Kolkata]",
);
const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56+05:30[Asia/Calcutta]",
);
console.log(dt1.equals(dt2)); // true

const dt3 = Temporal.ZonedDateTime.from("2021-07-01T12:34:56+05:30[+05:30]");
console.log(dt1.equals(dt3)); // false

const dt4 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56+05:30[Asia/Kolkata][u-ca=buddhist]",
);
console.log(dt1.equals(dt4)); // false
```

### Kiểm tra xem hai định danh múi giờ có tương đương không

```js
function sameTimeZone(timeZone1, timeZone2) {
  const dt1 = Temporal.ZonedDateTime.from({
    year: 2021,
    month: 7,
    day: 1,
    timeZone: timeZone1,
  });
  const dt2 = Temporal.ZonedDateTime.from({
    year: 2021,
    month: 7,
    day: 1,
    timeZone: timeZone2,
  });
  return dt1.equals(dt2);
}

console.log(sameTimeZone("Asia/Kolkata", "Asia/Calcutta")); // true
console.log(sameTimeZone("Asia/Shanghai", "Asia/Taipei")); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/compare", "Temporal.ZonedDateTime.compare()")}}
