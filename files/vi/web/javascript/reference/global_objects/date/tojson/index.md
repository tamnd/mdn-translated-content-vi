---
title: Date.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Date/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho ngày này theo cùng định dạng ISO như {{jsxref("Date/toISOString", "toISOString()")}}.

{{InteractiveExample("JavaScript Demo: Date.prototype.toJSON()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30 UTC");

const jsonDate = event.toJSON();

console.log(jsonDate);
// Expected output: "1975-08-19T23:15:30.000Z"

console.log(new Date(jsonDate).toUTCString());
// Expected output: "Tue, 19 Aug 1975 23:15:30 GMT"
```

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày đã cho theo [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) theo giờ quốc tế, hoặc `null` khi ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date). Đối với các ngày hợp lệ, giá trị trả về giống như giá trị của {{jsxref("Date/toISOString", "toISOString()")}}.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Date` được chuyển thành chuỗi. Phương thức này thường nhằm mục đích, theo mặc định, tuần tự hóa hữu ích các đối tượng {{jsxref("Date")}} trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được giải tuần tự hóa bằng constructor {{jsxref("Date/Date", "Date()")}} làm reviver của {{jsxref("JSON.parse()")}}.

Phương thức đầu tiên cố gắng chuyển đổi giá trị `this` của nó [thành giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với `"number"` làm gợi ý), {{jsxref("Object/valueOf", "valueOf()")}} và {{jsxref("Object/toString", "toString()")}} theo thứ tự đó. Nếu kết quả là một số [không hữu hạn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isFinite), `null` được trả về. (Điều này thường tương ứng với một ngày không hợp lệ, có {{jsxref("Date/valueOf", "valueOf()")}} trả về {{jsxref("NaN")}}.) Nếu không, nếu giá trị nguyên thủy được chuyển đổi không phải là một số hoặc là một số hữu hạn, giá trị trả về của {{jsxref("Date/toISOString", "this.toISOString()")}} được trả về.

Lưu ý rằng phương thức không kiểm tra xem giá trị `this` có phải là đối tượng {{jsxref("Date")}} hợp lệ hay không. Tuy nhiên, việc gọi `Date.prototype.toJSON()` trên các đối tượng không phải `Date` sẽ thất bại trừ khi biểu diễn nguyên thủy số của đối tượng là `NaN`, hoặc đối tượng cũng có phương thức `toISOString()`.

## Ví dụ

### Sử dụng toJSON()

```js
const jsonDate = new Date(0).toJSON(); // '1970-01-01T00:00:00.000Z'
const backToDate = new Date(jsonDate);

console.log(jsonDate); // 1970-01-01T00:00:00.000Z
```

### Tuần tự hóa khứ hồi

Khi phân tích cú pháp JSON chứa chuỗi ngày, bạn có thể sử dụng constructor {{jsxref("Date/Date", "Date()")}} để phục hồi chúng thành các đối tượng ngày gốc.

```js
const fileData = {
  author: "Maria",
  title: "Date.prototype.toJSON()",
  createdAt: new Date(2019, 3, 15),
  updatedAt: new Date(2020, 6, 26),
};
const response = JSON.stringify(fileData);

// Imagine transmission through network

const data = JSON.parse(response, (key, value) => {
  if (key === "createdAt" || key === "updatedAt") {
    return new Date(value);
  }
  return value;
});

console.log(data);
```

> [!NOTE]
> Reviver của `JSON.parse()` phải cụ thể với cấu trúc payload mà bạn mong đợi, vì việc tuần tự hóa là _không thể đảo ngược_: không thể phân biệt giữa một chuỗi đại diện cho một Date và một chuỗi bình thường.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.toLocaleDateString()")}}
- {{jsxref("Date.prototype.toTimeString()")}}
- {{jsxref("Date.prototype.toUTCString()")}}
