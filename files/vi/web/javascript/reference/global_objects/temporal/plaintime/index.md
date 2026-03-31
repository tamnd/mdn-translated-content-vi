---
title: Temporal.PlainTime
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.PlainTime
sidebar: jsref
---

Đối tượng **`Temporal.PlainTime`** đại diện cho một thời gian không có ngày hoặc múi giờ; ví dụ, một sự kiện định kỳ xảy ra cùng một thời điểm mỗi ngày. Về cơ bản, nó được biểu diễn dưới dạng tổ hợp các giá trị giờ, phút, giây, mili-giây, micro-giây và nano-giây.

## Mô tả

`PlainTime` về cơ bản là phần thời gian của đối tượng {{jsxref("Temporal.PlainDateTime")}}, với thông tin ngày đã được loại bỏ. Do thông tin ngày và giờ không tương tác nhiều với nhau, tất cả thông tin chung về thuộc tính thời gian đều được tài liệu hóa tại đây.

### Định dạng RFC 9557

Các đối tượng `PlainTime` có thể được tuần tự hóa và phân tích bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau:

```plain
HH:mm:ss.sssssssss
```

- `HH`
  - : Số hai chữ số từ `00` đến `23`. Có thể được tiền tố bởi ký hiệu chỉ thời gian `T` hoặc `t`.
- `mm` {{optional_inline}}
  - : Số hai chữ số từ `00` đến `59`. Mặc định là `00`.
- `ss.sssssssss` {{optional_inline}}
  - : Số hai chữ số từ `00` đến `59`. Tùy chọn có thể theo sau bởi `.` hoặc `,` và một đến chín chữ số. Mặc định là `00`. Các thành phần `HH`, `mm` và `ss` có thể được phân tách bởi `:` hoặc không có gì. Bạn có thể bỏ qua chỉ `ss` hoặc cả `ss` và `mm`, vì vậy thời gian có thể có một trong ba dạng: `HH`, `HH:mm` hoặc `HH:mm:ss.sssssssss`.

Khi nhập, bạn có thể tùy chọn bao gồm ngày, độ lệch, định danh múi giờ và lịch, theo cùng định dạng như [`PlainDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Chuỗi chỉ có ngày sẽ bị từ chối. Các chú thích khác theo định dạng `[key=value]` cũng bị bỏ qua và không được có cờ critical.

Khi tuần tự hóa, bạn có thể cấu hình số chữ số thập phân của giây.

## Hàm khởi tạo

- {{jsxref("Temporal/PlainTime/PlainTime", "Temporal.PlainTime()")}}
  - : Tạo một đối tượng `Temporal.PlainTime` mới bằng cách trực tiếp cung cấp dữ liệu cơ bản.

## Phương thức tĩnh

- {{jsxref("Temporal/PlainTime/compare", "Temporal.PlainTime.compare()")}}
  - : Trả về một số (-1, 0 hoặc 1) cho biết thời gian đầu tiên đến trước, bằng hoặc sau thời gian thứ hai. Tương đương với việc so sánh từng trường giờ, phút, giây, mili-giây, micro-giây và nano-giây một.
- {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}
  - : Tạo một đối tượng `Temporal.PlainTime` mới từ một đối tượng `Temporal.PlainTime` khác, một đối tượng với các thuộc tính thời gian, hoặc một chuỗi [RFC 9557](#định_dạng_rfc_9557).

## Thuộc tính thực thể

Các thuộc tính này được định nghĩa trên `Temporal.PlainTime.prototype` và được chia sẻ bởi tất cả các thực thể `Temporal.PlainTime`.

- {{jsxref("Object/constructor", "Temporal.PlainTime.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng thực thể. Đối với các thực thể `Temporal.PlainTime`, giá trị ban đầu là hàm khởi tạo {{jsxref("Temporal/PlainTime/PlainTime", "Temporal.PlainTime()")}}.
- {{jsxref("Temporal/PlainTime/hour", "Temporal.PlainTime.prototype.hour")}}
  - : Trả về một số nguyên từ 0 đến 23 đại diện cho thành phần giờ của thời gian này.
- {{jsxref("Temporal/PlainTime/microsecond", "Temporal.PlainTime.prototype.microsecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần micro-giây (10<sup>-6</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainTime/millisecond", "Temporal.PlainTime.prototype.millisecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần mili-giây (10<sup>-3</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainTime/minute", "Temporal.PlainTime.prototype.minute")}}
  - : Trả về một số nguyên từ 0 đến 59 đại diện cho thành phần phút của thời gian này.
- {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần nano-giây (10<sup>-9</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainTime/second", "Temporal.PlainTime.prototype.second")}}
  - : Trả về một số nguyên từ 0 đến 59 đại diện cho thành phần giây của thời gian này.
- `Temporal.PlainTime.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.PlainTime"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thực thể

- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được tiến về phía trước một khoảng thời gian nhất định (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}), cuộn qua đồng hồ nếu cần.
- {{jsxref("Temporal/PlainTime/equals", "Temporal.PlainTime.prototype.equals()")}}
  - : Trả về `true` nếu thời gian này có giá trị tương đương với một thời gian khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}), ngược lại là `false`. Chúng được so sánh theo giá trị thời gian. Tương đương với `Temporal.PlainTime.compare(this, other) === 0`.
- {{jsxref("Temporal/PlainTime/round", "Temporal.PlainTime.prototype.round()")}}
  - : Trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được làm tròn đến đơn vị nhất định.
- {{jsxref("Temporal/PlainTime/since", "Temporal.PlainTime.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một thời gian khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}) đến thời gian này. Khoảng thời gian là dương nếu thời gian kia đến trước thời gian này, và âm nếu sau.
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được lùi về phía sau một khoảng thời gian nhất định (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}), cuộn qua đồng hồ nếu cần.
- {{jsxref("Temporal/PlainTime/toJSON", "Temporal.PlainTime.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho thời gian này trong cùng [định dạng RFC 9557](#định_dạng_rfc_9557) như khi gọi {{jsxref("Temporal/PlainTime/toString", "toString()")}}. Được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/PlainTime/toLocaleString", "Temporal.PlainTime.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn phụ thuộc ngôn ngữ của thời gian này.
- {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho thời gian này theo [định dạng RFC 9557](#định_dạng_rfc_9557).
- {{jsxref("Temporal/PlainTime/until", "Temporal.PlainTime.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ thời gian này đến một thời gian khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}). Khoảng thời gian là dương nếu thời gian kia đến sau thời gian này, và âm nếu trước.
- {{jsxref("Temporal/PlainTime/valueOf", "Temporal.PlainTime.prototype.valueOf()")}}
  - : Ném ra {{jsxref("TypeError")}}, ngăn các thực thể `Temporal.PlainTime` bị [chuyển đổi ngầm sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép tính số học hoặc so sánh.
- {{jsxref("Temporal/PlainTime/with", "Temporal.PlainTime.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này với một số trường được thay thế bằng các giá trị mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal.PlainDateTime")}}
