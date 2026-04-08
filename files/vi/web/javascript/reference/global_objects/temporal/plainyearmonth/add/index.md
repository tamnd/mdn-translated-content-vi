---
title: Temporal.PlainYearMonth.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.add
sidebar: jsref
---

Phương thức **`add()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng `Temporal.PlainYearMonth` mới đại diện cho year-month này được chuyển tiếp theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

## Cú pháp

```js-nolint
add(duration)
add(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần thêm vào year-month này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán tương tự như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới đại diện cho year-month được chỉ định bởi `PlainYearMonth` ban đầu, cộng với khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, hoặc khoảng ±273.972,6 năm, từ Unix epoch.

## Mô tả

`duration` được xử lý theo cách sau:

- Chuyển tiếp theo số năm, giữ nguyên `monthCode`. Nếu `monthCode` không hợp lệ trong năm kết quả (không thể xảy ra với lịch Gregorian và ISO 8601, nhưng có thể xảy ra với các lịch có tháng nhuận), chúng ta điều chỉnh dựa trên tùy chọn `overflow`: đối với `constrain`, chúng ta chọn một tháng khác theo quy ước văn hóa của người dùng lịch đó. Ví dụ, vì tháng nhuận thường được coi là bản sao của một tháng khác, chúng ta có thể chọn tháng mà nó là bản sao của.
- Chuyển tiếp theo số tháng, điều chỉnh năm nếu cần thiết.
- Đối với tất cả các đơn vị nhỏ hơn `months` (tuần, ngày, giờ, phút, giây, mili giây, micro giây, nano giây), chúng được chuyển đổi thành số ngày. Tất cả các lịch thường được hỗ trợ đều sử dụng tuần có độ dài cố định, vì vậy số tuần chỉ đơn giản là được chuyển đổi thành số ngày. Nếu quy tắc phức tạp hơn, chúng ta có thể áp dụng một cách tiếp cận tương tự như dịch chuyển tháng. Sau đó, chúng ta chuyển tiếp theo số ngày đó, bắt đầu từ ngày đầu tiên của tháng, điều chỉnh tháng và năm nếu cần thiết. Do đó, các khoảng thời gian nhỏ hơn độ dài của tháng hiện tại không có tác dụng.

Ngày tham chiếu nội bộ sau đó được chọn là ngày hợp lệ đầu tiên của tháng, bất kể ngày tham chiếu ban đầu hay số ngày trong khoảng thời gian. Đối với lịch Gregorian, tràn không thể xảy ra vì mỗi năm luôn có 12 tháng, và bất kỳ mức tăng nào nhỏ hơn một tháng đều bị bỏ qua.

Cộng một khoảng thời gian tương đương với [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/subtract) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Cộng một khoảng thời gian trong lịch ISO 8601

```js
const start = Temporal.PlainYearMonth.from("2021-01");
const end = start.add({ years: 1, months: 2, weeks: 3, days: 4 });
console.log(end.toString()); // 2022-03

const end2 = start.add({ years: -1, months: -2, weeks: -3, days: -4 });
console.log(end2.toString()); // 2019-11

const distance = Temporal.PlainYearMonth.from("2020-01").until("2021-01"); // 366 days
const end3 = start.add(distance);
console.log(end3.toString()); // 2022-01
```

### Cộng một khoảng thời gian trong lịch không phải ISO

```js
const start = Temporal.PlainYearMonth.from("2021-02-01[u-ca=chinese]");
console.log(start.toLocaleString("en-US", { calendar: "chinese" })); // 12/2020
console.log(start.toString()); // 2021-01-13[u-ca=chinese]
const end = start.add({ months: 1 });
console.log(end.toLocaleString("en-US", { calendar: "chinese" })); // 1/2021
console.log(end.toString()); // 2021-02-12[u-ca=chinese]

// Adding an extra day has no effect at all
const end2 = start.add({ months: 1, days: 1 });
console.log(end2.toLocaleString("en-US", { calendar: "chinese" })); // 1/2021
// The reference day doesn't change, because it's always the first day of the Chinese month
console.log(end2.toString()); // 2021-02-12[u-ca=chinese]

// Start in a leap month
const start2 = Temporal.PlainYearMonth.from({
  year: 5730,
  monthCode: "M05L",
  calendar: "hebrew",
});
console.log(start2.toLocaleString("en-US", { calendar: "hebrew" })); // Adar I 5730
// End in another leap month
const end3 = start2.add({ years: 3 });
console.log(end3.toLocaleString("en-US", { calendar: "hebrew" })); // Adar I 5733
```

### Cộng một khoảng thời gian với tràn

Nếu chúng ta di chuyển vài năm và tháng tương ứng không hợp lệ trong năm này, thì chúng ta điều chỉnh tháng dựa trên tùy chọn `overflow`.

```js
// Start in a leap month
const start = Temporal.PlainYearMonth.from({
  year: 5730,
  monthCode: "M05L",
  calendar: "hebrew",
});
// Hebrew leap years occur every 2 or 3 years, and 5731 is not a leap year
const end = start.add({ years: 1 });
console.log(end.toLocaleString("en-US", { calendar: "hebrew" })); // Adar 5731
console.log(end.monthCode); // M06
console.log(end.toString()); // 1971-02-26[u-ca=hebrew]

// Any further month additions are based on the clamped year-month
const end2 = start.add({ years: 1, months: 2 });
console.log(end2.monthCode); // M08
console.log(end2.toString()); // 1971-04-26[u-ca=hebrew]

// Compare with the same addition in a different order that results in no overflow:
const end3 = start.add({ months: 2 }).add({ years: 1 });
console.log(end3.monthCode); // M07
console.log(end3.toString()); // 1971-03-27[u-ca=hebrew]
```

Lưu ý rằng điều sau không phải là tràn vì năm có thể chỉ đơn giản là tăng lên:

```js
const start = Temporal.PlainYearMonth.from("2021-01");
const end = start.add({ months: 100 });
console.log(end.toString()); // 2029-05
```

Bạn cũng có thể ném một lỗi nếu thành phần ngày nằm ngoài phạm vi:

```js
const start = Temporal.PlainYearMonth.from({
  year: 5730,
  monthCode: "M05L",
  calendar: "hebrew",
});
const end = start.add({ years: 1 }, { overflow: "reject" }); // RangeError: invalid "monthCode" calendar field: M05L
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
