---
title: Date.prototype.toUTCString()
short-title: toUTCString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toUTCString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toUTCString
sidebar: jsref
---

Phương thức **`toUTCString()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho ngày này theo định dạng [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-7.1.1.1), với năm âm được cho phép. Múi giờ luôn là UTC. `toGMTString()` là bí danh của phương thức này.

{{InteractiveExample("JavaScript Demo: Date.prototype.toUTCString()", "shorter")}}

```js interactive-example
const event = new Date("14 Jun 2017 00:00:00 PDT");

console.log(event.toUTCString());
// Expected output: "Wed, 14 Jun 2017 07:00:00 GMT"
```

## Cú pháp

```js-nolint
toUTCString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày đã cho sử dụng múi giờ UTC (xem mô tả để biết định dạng). Trả về `"Invalid Date"` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Giá trị được trả về bởi `toUTCString()` là một chuỗi có dạng `Www, dd Mmm yyyy HH:mm:ss GMT`, trong đó:

| Chuỗi định dạng | Mô tả                                                            |
| --------------- | ---------------------------------------------------------------- |
| `Www`           | Ngày trong tuần, gồm ba chữ cái (ví dụ: `Sun`, `Mon`)            |
| `dd`            | Ngày trong tháng, gồm hai chữ số với số không đứng trước nếu cần |
| `Mmm`           | Tháng, gồm ba chữ cái (ví dụ: `Jan`, `Feb`)                      |
| `yyyy`          | Năm, gồm bốn chữ số trở lên với số không đứng trước nếu cần      |
| `HH`            | Giờ, gồm hai chữ số với số không đứng trước nếu cần              |
| `mm`            | Phút, gồm hai chữ số với số không đứng trước nếu cần             |
| `ss`            | Giây, gồm hai chữ số với số không đứng trước nếu cần             |

### Tạo bí danh

API `Date` của JavaScript được lấy cảm hứng từ thư viện `java.util.Date` của Java (trong khi cái sau đã trở thành kế thừa thực tế kể từ Java 1.1 năm 1997). Cụ thể, lớp `Date` của Java có phương thức `toGMTString` — được đặt tên không tốt, vì [Giờ trung bình Greenwich](https://en.wikipedia.org/wiki/Greenwich_Mean_Time) không tương đương với [Giờ phối hợp quốc tế](https://en.wikipedia.org/wiki/Coordinated_Universal_Time), trong khi các ngày JavaScript luôn hoạt động theo giờ UTC. Vì lý do tương thích web, `toGMTString` vẫn tồn tại như một bí danh của `toUTCString` và chúng đề cập đến cùng một đối tượng hàm. Điều này có nghĩa:

```js
Date.prototype.toGMTString.name === "toUTCString";
```

## Ví dụ

### Sử dụng toUTCString()

```js
const d = new Date(0);
console.log(d.toUTCString()); // 'Thu, 01 Jan 1970 00:00:00 GMT'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.toLocaleString()")}}
- {{jsxref("Date.prototype.toString()")}}
- {{jsxref("Date.prototype.toISOString()")}}
