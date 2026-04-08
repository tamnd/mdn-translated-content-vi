---
title: Temporal.PlainDate.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này được tiến về phía trước theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

## Cú pháp

```js-nolint
add(duration)
add(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần thêm vào ngày này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới đại diện cho ngày được xác định bởi `PlainDate` gốc, cộng thêm khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, tức khoảng ±273.972,6 năm, từ Unix epoch.

## Mô tả

`duration` được xử lý theo cách này:

- Tiến về phía trước theo số năm, giữ nguyên `monthCode` và `day`. Nếu `monthCode` không hợp lệ trong năm kết quả (không thể xảy ra với Gregorian và ISO 8601, nhưng có thể xảy ra với các lịch có tháng nhuận), chúng ta điều chỉnh dựa trên tùy chọn `overflow`: đối với `constrain`, chúng ta chọn tháng khác theo quy ước văn hóa của người dùng lịch đó. Ví dụ, vì tháng nhuận thường được coi là bản sao của tháng khác, chúng ta có thể chọn tháng mà nó là bản sao.
- Tiến về phía trước theo số tháng, điều chỉnh năm nếu cần, giữ nguyên `day`. Nếu `day` không hợp lệ trong tháng kết quả (ví dụ, ngày 30 tháng 2), chúng ta điều chỉnh dựa trên tùy chọn `overflow`: đối với `constrain`, chúng ta chọn ngày hợp lệ gần nhất (ví dụ, ngày 28 hoặc 29 tháng 2).
- Tất cả các lịch thường được hỗ trợ đều sử dụng tuần có độ dài cố định, vì vậy số tuần chỉ được chuyển đổi thành số ngày. Nếu quy tắc phức tạp hơn, chúng ta có thể thực hiện cách tiếp cận tương tự như dịch chuyển tháng.
- Đối với tất cả các đơn vị [không theo lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (ngày, giờ, phút, giây, mili giây, micro giây, nano giây), chúng được chuyển đổi thành số ngày. Phần thập phân của một ngày bị bỏ qua. Sau đó, chúng ta tiến về phía trước theo số ngày đó, điều chỉnh tháng và năm nếu cần.

Thêm khoảng thời gian tương đương với [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/subtract) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Thêm khoảng thời gian theo lịch ISO 8601

```js
const start = Temporal.PlainDate.from("2021-01-01");
const end = start.add({ years: 1, months: 2, weeks: 3, days: 4 });
console.log(end.toString()); // 2022-03-26

const end2 = start.add({ years: -1, months: -2, weeks: -3, days: -4 });
console.log(end2.toString()); // 2019-10-07

const distance = Temporal.PlainDate.from("2020-01-01").until("2021-01-01"); // 366 days
const end3 = start.add(distance);
console.log(end3.toString()); // 2022-01-02
```

### Thêm khoảng thời gian theo lịch không phải ISO

```js
const start = Temporal.PlainDate.from("2021-01-01[u-ca=chinese]");
console.log(start.toLocaleString("en-US", { calendar: "chinese" })); // 11/18/2020
const end = start.add({ months: 1 });
console.log(end.toLocaleString("en-US", { calendar: "chinese" })); // 12/18/2020
```

### Thêm khoảng thời gian với tràn số

Nếu chúng ta di chuyển một vài tháng và ngày tương ứng không hợp lệ trong tháng này, thì chúng ta điều chỉnh ngày dựa trên tùy chọn `overflow`.

```js
const start = Temporal.PlainDate.from("2021-01-31");
const end = start.add({ months: 1 });
console.log(end.toString()); // 2021-02-28

// Bất kỳ phép cộng ngày nào thêm đều dựa trên tháng-ngày đã bị kẹp:
const end2 = start.add({ months: 1, days: 31 });
console.log(end2.toString()); // 2021-03-31

// So sánh với cùng phép cộng theo thứ tự khác không gây tràn:
const end3 = start.add({ days: 31 }).add({ months: 1 });
console.log(end3.toString()); // 2021-04-03
```

Tràn cũng có thể xảy ra với tháng, đối với các lịch có số tháng khác nhau trong các năm khác nhau (thường do tháng nhuận).

```js
const start = Temporal.PlainDate.from("2023-04-01[u-ca=chinese]");
console.log(start.toLocaleString("en-US", { calendar: "chinese" })); // 2bis/11/2023; "bis" có nghĩa là tháng nhuận
const end = start.add({ years: 1 });
console.log(end.toLocaleString("en-US", { calendar: "chinese" })); // 3/11/2024

// So sánh:
const start = Temporal.PlainDate.from("2023-04-30[u-ca=chinese]");
console.log(start.toLocaleString("en-US", { calendar: "chinese" })); // 3/11/2023
const end = start.add({ years: 1 });
console.log(end.toLocaleString("en-US", { calendar: "chinese" })); // 3/11/2024; cùng ngày với trên!
```

Lưu ý rằng sau đây không phải là tràn vì tháng có thể tăng lên:

```js
const start = Temporal.PlainDate.from("2021-01-01");
const end = start.add({ days: 100 });
console.log(end.toString()); // 2021-04-11
```

Bạn cũng có thể ném lỗi nếu thành phần ngày nằm ngoài phạm vi:

```js
const start = Temporal.PlainDate.from("2021-01-31");
const end = start.add({ months: 1 }, { overflow: "reject" }); // RangeError: date value "day" not in 1..28: 31

const start = Temporal.PlainDate.from("2023-04-01[u-ca=chinese]");
const end = start.add({ years: 1 }, { overflow: "reject" }); // RangeError: invalid "monthCode" calendar field: M02L
```

### Thêm khoảng thời gian theo giờ

Phần thập phân của một ngày bị bỏ qua.

```js
const start = Temporal.PlainDate.from("2021-01-01");
const end = start.add({ hours: 25 }); // Giống như thêm 1 ngày
console.log(end.toString()); // 2021-01-02
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
