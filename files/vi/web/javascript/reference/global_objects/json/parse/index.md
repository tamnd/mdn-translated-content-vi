---
title: JSON.parse()
short-title: parse()
slug: Web/JavaScript/Reference/Global_Objects/JSON/parse
page-type: javascript-static-method
browser-compat: javascript.builtins.JSON.parse
sidebar: jsref
---

Phương thức tĩnh **`JSON.parse()`** phân tích cú pháp một chuỗi JSON, tạo ra giá trị hoặc đối tượng JavaScript được mô tả bởi chuỗi đó. Có thể cung cấp hàm _reviver_ tùy chọn để thực hiện biến đổi trên đối tượng kết quả trước khi trả về.

{{InteractiveExample("JavaScript Demo: JSON.parse()")}}

```js interactive-example
const json = '{"result":true, "count":42}';
const obj = JSON.parse(json);

console.log(obj.count);
// Expected output: 42

console.log(obj.result);
// Expected output: true
```

## Cú pháp

```js-nolint
JSON.parse(text)
JSON.parse(text, reviver)
```

### Tham số

- `text`
  - : Chuỗi cần phân tích cú pháp dưới dạng JSON. Xem đối tượng {{jsxref("JSON")}} để biết mô tả về cú pháp JSON.
- `reviver` {{optional_inline}}
  - : Nếu là hàm, thì hàm này quy định cách mỗi giá trị được tạo ra ban đầu bởi quá trình phân tích được biến đổi trước khi trả về. Các giá trị không thể gọi được bỏ qua. Hàm được gọi với các đối số sau:
    - `key`
      - : Khóa liên kết với giá trị.
    - `value`
      - : Giá trị được tạo ra bởi quá trình phân tích.
    - `context` {{optional_inline}}
      - : Một đối tượng ngữ cảnh chứa trạng thái liên quan đến biểu thức hiện tại đang được khôi phục. Đây là một đối tượng mới cho mỗi lần gọi hàm reviver. Nó chỉ được truyền khi khôi phục các giá trị nguyên thủy, không phải khi `value` là đối tượng hoặc mảng. Nó chứa thuộc tính sau:
        - `source`
          - : Chuỗi JSON gốc đại diện cho giá trị này.

### Giá trị trả về

Giá trị {{jsxref("Object")}}, {{jsxref("Array")}}, chuỗi, số, boolean hoặc `null` tương ứng với `text` JSON đã cho.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu chuỗi cần phân tích không phải là JSON hợp lệ.

## Mô tả

`JSON.parse()` phân tích cú pháp một chuỗi JSON theo [ngữ pháp JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON#full_json_grammar), sau đó đánh giá chuỗi như thể đó là một biểu thức JavaScript. Trường hợp duy nhất mà một đoạn văn bản JSON đại diện cho một giá trị khác với cùng biểu thức JavaScript là khi xử lý khóa `"__proto__"` — xem [Cú pháp literal đối tượng và JSON](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#object_literal_syntax_vs._json).

### Tham số reviver

Nếu có `reviver`, giá trị được tính toán bởi quá trình phân tích được _biến đổi_ trước khi trả về. Cụ thể, giá trị được tính toán và tất cả các thuộc tính của nó (theo thứ tự [depth-first](https://en.wikipedia.org/wiki/Depth-first_search), bắt đầu từ các thuộc tính lồng nhau nhất và tiến đến chính giá trị gốc) đều được chạy riêng lẻ qua `reviver`.

`reviver` được gọi với đối tượng chứa thuộc tính đang được xử lý là `this` (trừ khi bạn định nghĩa `reviver` là hàm mũi tên, trong trường hợp đó không có ràng buộc `this` riêng biệt) và hai đối số: `key` và `value`, đại diện cho tên thuộc tính dưới dạng chuỗi (ngay cả đối với mảng) và giá trị thuộc tính. Đối với các giá trị nguyên thủy, thêm tham số `context` được truyền, chứa văn bản nguồn của giá trị này. Nếu hàm `reviver` trả về {{jsxref("undefined")}} (hoặc không trả về giá trị — ví dụ, nếu thực thi rơi ra khỏi cuối hàm), thuộc tính bị xóa khỏi đối tượng. Ngược lại, thuộc tính được xác định lại là giá trị trả về. Nếu `reviver` chỉ biến đổi một số giá trị chứ không phải các giá trị khác, hãy chắc chắn trả về tất cả các giá trị không được biến đổi như cũ — nếu không, chúng sẽ bị xóa khỏi đối tượng kết quả.

Tương tự như tham số `replacer` của {{jsxref("JSON.stringify()")}}, đối với mảng và đối tượng, `reviver` sẽ được gọi lần cuối cùng trên giá trị gốc với chuỗi rỗng làm `key` và đối tượng gốc làm `value`. Đối với các giá trị JSON hợp lệ khác, `reviver` hoạt động tương tự và được gọi một lần với chuỗi rỗng làm `key` và chính giá trị đó làm `value`.

Nếu bạn trả về một giá trị khác từ `reviver`, giá trị đó sẽ hoàn toàn thay thế giá trị được phân tích ban đầu. Điều này cũng áp dụng cho giá trị gốc. Ví dụ:

```js
const transformedObj = JSON.parse('[1,5,{"s":1}]', (key, value) =>
  typeof value === "object" ? undefined : value,
);

console.log(transformedObj); // undefined
```

Không có cách nào để giải quyết vấn đề này một cách chung. Bạn không thể xử lý đặc biệt trường hợp khi `key` là chuỗi rỗng, vì các đối tượng JSON cũng có thể chứa các khóa là chuỗi rỗng. Bạn cần biết chính xác loại biến đổi nào cần thiết cho mỗi khóa khi triển khai reviver.

Lưu ý rằng `reviver` được chạy sau khi giá trị được phân tích. Vì vậy, ví dụ, các số trong văn bản JSON đã được chuyển đổi thành số JavaScript, và có thể mất độ chính xác trong quá trình đó. Một cách để truyền các số lớn mà không mất độ chính xác là tuần tự hóa chúng dưới dạng chuỗi, và khôi phục chúng thành [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt), hoặc các định dạng độ chính xác tùy ý phù hợp khác.

Bạn cũng có thể sử dụng thuộc tính `context.source` để truy cập văn bản nguồn JSON gốc đại diện cho giá trị, như được hiển thị dưới đây:

```js
const bigJSON = '{"gross_gdp": 12345678901234567890}';
const bigObj = JSON.parse(bigJSON, (key, value, context) => {
  if (key === "gross_gdp") {
    // Ignore the value because it has already lost precision
    return BigInt(context.source);
  }
  return value;
});
```

## Ví dụ

### Sử dụng JSON.parse()

```js
JSON.parse("{}"); // {}
JSON.parse("true"); // true
JSON.parse('"foo"'); // "foo"
JSON.parse('[1, 5, "false"]'); // [1, 5, "false"]
JSON.parse("null"); // null
```

### Sử dụng tham số reviver

```js
JSON.parse(
  '{"p": 5}',
  (key, value) =>
    typeof value === "number"
      ? value * 2 // return value * 2 for numbers
      : value, // return everything else unchanged
);
// { p: 10 }

JSON.parse('{"1": 1, "2": 2, "3": {"4": 4, "5": {"6": 6}}}', (key, value) => {
  console.log(key);
  return value;
});
// 1
// 2
// 4
// 6
// 5
// 3
// ""
```

### Sử dụng reviver khi kết hợp với replacer của JSON.stringify()

Để một giá trị có thể được khôi phục đúng cách (tức là nó được giải tuần tự hóa thành cùng đối tượng gốc), quá trình tuần tự hóa phải bảo toàn thông tin kiểu dữ liệu. Ví dụ, bạn có thể sử dụng tham số `replacer` của {{jsxref("JSON.stringify()")}} cho mục đích này:

```js
// Maps are normally serialized as objects with no properties.
// We can use the replacer to specify the entries to be serialized.
const map = new Map([
  [1, "one"],
  [2, "two"],
  [3, "three"],
]);

const jsonText = JSON.stringify(map, (key, value) =>
  value instanceof Map ? Array.from(value.entries()) : value,
);

console.log(jsonText);
// [[1,"one"],[2,"two"],[3,"three"]]

const map2 = JSON.parse(jsonText, (key, value) =>
  Array.isArray(value) && value.every(Array.isArray) ? new Map(value) : value,
);

console.log(map2);
// Map { 1 => "one", 2 => "two", 3 => "three" }
```

Vì JSON không có không gian cú pháp để chú thích siêu dữ liệu kiểu dữ liệu, để khôi phục các giá trị không phải là đối tượng thuần túy, bạn phải xem xét một trong các cách sau:

- Tuần tự hóa toàn bộ đối tượng thành chuỗi và thêm tiền tố với nhãn kiểu dữ liệu.
- "Đoán" dựa trên cấu trúc của dữ liệu (ví dụ, mảng gồm các mảng hai phần tử)
- Nếu hình dạng của payload cố định, dựa trên tên thuộc tính (ví dụ, tất cả các thuộc tính tên `registry` chứa các đối tượng `Map`).

### JSON không hợp lệ

Khi `JSON.parse` nhận được một chuỗi không tuân theo ngữ pháp JSON, nó ném ra `SyntaxError`.

Mảng và đối tượng không thể có [dấu phẩy cuối](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) trong JSON:

```js example-bad
JSON.parse("[1, 2, 3, 4, ]");
// SyntaxError: Unexpected token ] in JSON at position 13

JSON.parse('{"foo": 1, }');
// SyntaxError: Unexpected token } in JSON at position 12
```

Chuỗi JSON phải được phân cách bằng dấu ngoặc kép (không phải đơn):

```js example-bad
JSON.parse("{'foo': 1}");
// SyntaxError: Unexpected token ' in JSON at position 1

JSON.parse("'string'");
// SyntaxError: Unexpected token ' in JSON at position 0
```

Nếu bạn viết JSON bên trong một chuỗi ký tự JavaScript, bạn nên sử dụng dấu ngoặc đơn để phân cách chuỗi ký tự JavaScript, hoặc thoát các dấu ngoặc kép phân cách chuỗi JSON:

```js-nolint example-good
JSON.parse('{"foo": 1}'); // OK
JSON.parse("{\"foo\": 1}"); // OK
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của hành vi `JSON.parse` hiện đại (tham số `context` của reviver) trong `core-js`](https://github.com/zloirock/core-js#jsonparse-source-text-access)
- {{jsxref("JSON.stringify()")}}
