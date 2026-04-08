---
title: Temporal.PlainTime.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.since
sidebar: jsref
---

Phương thức **`since()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một thời điểm khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}) đến thời điểm này. Khoảng thời gian là dương nếu thời điểm kia đứng trước thời điểm này, và âm nếu đứng sau.

Phương thức này thực hiện phép tính `this - other`. Để thực hiện `other - this`, hãy dùng phương thức {{jsxref("Temporal/PlainTime/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainTime")}} đại diện cho thời điểm cần trừ khỏi thời điểm này. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode`, và `smallestUnit`. `largestUnit` và `smallestUnit` chỉ chấp nhận các đơn vị: `"hours"`, `"minutes"`, `"seconds"`, `"milliseconds"`, `"microseconds"`, `"nanoseconds"`, hoặc dạng số ít của chúng. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"hours"`. Đối với `smallestUnit`, giá trị mặc định là `"nanoseconds"`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian _kể từ_ `other` đến thời điểm này. Khoảng thời gian là dương nếu `other` đứng trước thời điểm này, và âm nếu đứng sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng since()

```js
const lunchTime = Temporal.PlainTime.from("12:30:00");
const now = Temporal.Now.plainTimeISO();
const duration = now.since(lunchTime);
console.log(`You had lunch ${duration.toLocaleString("en-US")} ago`);
// Ví dụ đầu ra: "You had lunch 3 hr, 42 min, 21 sec, 343 ms, 131 μs, 718 ns ago"

const duration2 = now.since(lunchTime, { smallestUnit: "minutes" });
console.log(`You had lunch ${duration2.toLocaleString("en-US")} ago`);
// Ví dụ đầu ra: "You had lunch 3 hr, 42 min ago"

const duration3 = now.since(lunchTime, {
  largestUnit: "minutes",
  smallestUnit: "minutes",
});
console.log(`You had lunch ${duration3.toLocaleString("en-US")} ago`);
// Ví dụ đầu ra: "You had lunch 222 min ago"
```

### Làm tròn kết quả

Theo mặc định, phần thập phân của `smallestUnit` bị cắt bớt. Bạn có thể làm tròn lên bằng cách sử dụng các tùy chọn `roundingIncrement` và `roundingMode`.

```js
const time1 = Temporal.PlainTime.from("12:30:00");
const time2 = Temporal.PlainTime.from("12:30:01");
const duration = time2.since(time1, {
  smallestUnit: "seconds",
  roundingIncrement: 15,
  roundingMode: "ceil",
});
console.log(duration.toString()); // "PT15S"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainTime/until", "Temporal.PlainTime.prototype.until()")}}
