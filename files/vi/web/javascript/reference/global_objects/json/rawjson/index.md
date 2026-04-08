---
title: JSON.rawJSON()
short-title: rawJSON()
slug: Web/JavaScript/Reference/Global_Objects/JSON/rawJSON
page-type: javascript-static-method
browser-compat: javascript.builtins.JSON.rawJSON
sidebar: jsref
---

Phương thức tĩnh **`JSON.rawJSON()`** tạo một đối tượng "JSON thô" chứa một đoạn văn bản JSON. Khi được tuần tự hóa sang JSON, đối tượng JSON thô được xử lý như thể nó đã là một đoạn JSON. Văn bản này phải là JSON hợp lệ.

## Cú pháp

```js-nolint
JSON.rawJSON(string)
```

### Tham số

- `string`
  - : Văn bản JSON. Phải là JSON hợp lệ **đại diện cho một giá trị nguyên thủy**.

### Giá trị trả về

Một đối tượng có thể được dùng để tạo văn bản JSON với nội dung giống hệt như `string` được cung cấp, mà không có dấu ngoặc kép bao quanh chính chuỗi đó. Đối tượng này [có nguyên mẫu `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) và [bị đóng băng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze) (để nó không bao giờ bị tuần tự hóa vô tình như một đối tượng thông thường bởi bất kỳ loại chuyển đổi nguyên thủy nào), và thuộc tính sau:

- `rawJSON`
  - : `string` JSON gốc được cung cấp.

Ngoài ra, nó có một [trường riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) đánh dấu chính nó là một đối tượng JSON thô. Điều này cho phép nó được nhận dạng bởi {{jsxref("JSON.stringify()")}} và {{jsxref("JSON.isRawJSON()")}}.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu `string` không phải là JSON hợp lệ, hoặc nếu nó đại diện cho một đối tượng hoặc mảng.

## Mô tả

Một đối tượng JSON thô có thể được xem như một cấu trúc dữ liệu không thể thay đổi, nguyên tử giống như bất kỳ loại [nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_values) nào. Nó không phải là đối tượng thông thường và không chứa dữ liệu nào khác ngoài văn bản JSON thô. Nó được sử dụng để "tuần tự hóa trước" dữ liệu thành các định dạng mà `JSON.stringify` không thể tạo ra vì nhiều lý do. Trường hợp sử dụng điển hình nhất là vấn đề mất độ chính xác số dấu phẩy động. Ví dụ:

```js
JSON.stringify({ value: 12345678901234567890 });
// {"value":12345678901234567000}
```

Giá trị không còn tương đương chính xác với số gốc nữa! Điều này là do JavaScript sử dụng biểu diễn dấu phẩy động cho tất cả các số, vì vậy nó không thể biểu diễn chính xác tất cả các số nguyên. Số nguyên `12345678901234567890` bản thân nó đã được làm tròn thành số biểu diễn được gần nhất khi được phân tích bởi JavaScript.

Không có `JSON.rawJSON`, không có cách nào để yêu cầu `JSON.stringify` tạo ra số nguyên `12345678901234567890`, vì đơn giản là không có giá trị số JavaScript tương ứng. Với JSON thô, bạn có thể trực tiếp nói cho `JSON.stringify()` biết một giá trị cụ thể nên được chuỗi hóa như thế nào:

```js
const rawJSON = JSON.rawJSON("12345678901234567890");
JSON.stringify({ value: rawJSON });
// {"value":12345678901234567890}
```

Để xem ví dụ đầy đủ hơn về điều này, hãy xem [Tuần tự hóa số không mất độ chính xác](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON#using_json_numbers).

Lưu ý rằng mặc dù chúng ta đã truyền một chuỗi cho `JSON.rawJSON()`, nó vẫn trở thành một số trong JSON cuối cùng. Điều này là do chuỗi đại diện cho văn bản JSON verbatim. Nếu bạn muốn tuần tự hóa một chuỗi, bạn nên sử dụng `JSON.rawJSON()` với giá trị chuỗi được đặt trong dấu ngoặc kép:

```js
const rawJSON = JSON.rawJSON('"Hello world"');
JSON.stringify({ value: rawJSON });
// {"value":"Hello world"}
```

`JSON.rawJSON` cho phép bạn chèn văn bản JSON tùy ý, nhưng không cho phép bạn tạo JSON không hợp lệ. Bất cứ điều gì không được phép bởi cú pháp JSON cũng không được phép bởi `JSON.rawJSON()`:

```js example-bad
const rawJSON = JSON.rawJSON('"Hello\nworld"'); // Lỗi cú pháp, vì dấu ngắt dòng không được phép trong chuỗi JSON
```

Hơn nữa, bạn không thể sử dụng `JSON.rawJSON()` để tạo các đối tượng hoặc mảng JSON.

## Ví dụ

### Sử dụng JSON.rawJSON() để tạo các biểu thức JSON của các kiểu khác nhau

```js
const numJSON = JSON.rawJSON("123");
const strJSON = JSON.rawJSON('"Hello world"');
const boolJSON = JSON.rawJSON("true");
const nullJSON = JSON.rawJSON("null");

console.log(
  JSON.stringify({
    age: numJSON,
    message: strJSON,
    isActive: boolJSON,
    nothing: nullJSON,
  }),
);

// {"age":123,"message":"Hello world","isActive":true,"nothing":null}
```

Tuy nhiên, bạn không thể sử dụng `JSON.rawJSON()` để tạo các đối tượng hoặc mảng JSON:

```js example-bad
const arrJSON = JSON.rawJSON("[1, 2, 3]");
const objJSON = JSON.rawJSON('{"a": 1, "b": 2}');
// SyntaxError
```

### Sử dụng JSON.rawJSON() để tạo các chuỗi ký tự thoát

Ngoài số, chỉ có một kiểu khác không có sự tương ứng một-một giữa các giá trị JavaScript và văn bản JSON: chuỗi. Khi chuỗi được tuần tự hóa sang JSON, tất cả các điểm mã, ngoại trừ những điểm không hợp lệ bên trong các ký tự chuỗi JSON (chẳng hạn như dấu ngắt dòng), được in nguyên văn:

```js
console.log(JSON.stringify({ value: "\ud83d\ude04" })); // {"value":"😄"}
```

Điều này có thể không mong muốn, vì bên nhận chuỗi này có thể xử lý Unicode khác đi. Để cải thiện khả năng tương tác, bạn có thể chỉ định rõ ràng chuỗi cần được tuần tự hóa với các chuỗi thoát:

```js
const rawJSON = JSON.rawJSON('"\\ud83d\\ude04"');
const objStr = JSON.stringify({ value: rawJSON });
console.log(objStr); // {"value":"\ud83d\ude04"}
console.log(JSON.parse(objStr).value); // 😄
```

Lưu ý rằng hai dấu gạch chéo ngược trong `rawJSON` thực sự đại diện cho một ký tự gạch chéo đơn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `JSON.rawJSON` trong `core-js`](https://github.com/zloirock/core-js#jsonparse-source-text-access)
- {{jsxref("JSON")}}
- {{jsxref("JSON.isRawJSON()")}}
- {{jsxref("JSON.stringify()")}}
