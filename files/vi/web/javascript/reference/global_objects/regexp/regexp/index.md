---
title: RegExp() constructor
short-title: RegExp()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/RegExp
page-type: javascript-constructor
browser-compat: javascript.builtins.RegExp.RegExp
sidebar: jsref
---

Constructor **`RegExp()`** tạo ra các đối tượng {{jsxref("RegExp")}}.

Để có phần giới thiệu về biểu thức chính quy, hãy đọc [chương Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) trong [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide).

{{InteractiveExample("JavaScript Demo: RegExp() constructor")}}

```js interactive-example
const regex1 = /\w+/;
const regex2 = new RegExp("\\w+");

console.log(regex1);
// Expected output: /\w+/

console.log(regex2);
// Expected output: /\w+/

console.log(regex1 === regex2);
// Expected output: false
```

## Cú pháp

```js-nolint
new RegExp(pattern)
new RegExp(pattern, flags)
RegExp(pattern)
RegExp(pattern, flags)
```

> [!NOTE]
> `RegExp()` có thể được gọi với hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng đôi khi có hiệu ứng khác nhau. Xem [Giá trị trả về](#return_value).

### Tham số

- `pattern`
  - : Văn bản của biểu thức chính quy. Đây cũng có thể là một đối tượng `RegExp` khác.

- `flags` {{optional_inline}}
  - : Nếu được chỉ định, `flags` là một chuỗi chứa các cờ để thêm vào. Ngoài ra, nếu một đối tượng `RegExp` được cung cấp cho `pattern`, chuỗi `flags` sẽ thay thế bất kỳ cờ nào của đối tượng đó (và `lastIndex` sẽ được đặt lại về `0`).

    `flags` có thể chứa bất kỳ tổ hợp nào của các ký tự sau:
    - [`d` (indices)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices)
      - : Tạo chỉ mục cho các kết quả khớp của chuỗi con.
    - [`g` (global)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global)
      - : Tìm tất cả các kết quả khớp thay vì dừng lại sau kết quả khớp đầu tiên.
    - [`i` (ignore case)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase)
      - : Khi khớp, sự khác biệt về hoa/thường được bỏ qua.
    - [`m` (multiline)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline)
      - : Xử lý các xác nhận bắt đầu và kết thúc (`^` và `$`) như hoạt động trên nhiều dòng. Nói cách khác, khớp với đầu hoặc cuối của _mỗi_ dòng (được phân tách bằng `\n` hoặc `\r`), chứ không chỉ đầu hoặc cuối của toàn bộ chuỗi đầu vào.
    - [`s` (dotAll)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll)
      - : Cho phép `.` khớp với ký tự xuống dòng.
    - [`u` (unicode)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode)
      - : Xử lý `pattern` như một chuỗi các điểm mã Unicode.
    - [`v` (unicodeSets)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets)
      - : Nâng cấp cờ `u` cho phép ký hiệu tập hợp trong các lớp ký tự cũng như các thuộc tính của chuỗi.
    - [`y` (sticky)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky)
      - : Chỉ khớp từ chỉ mục được chỉ định bởi thuộc tính `lastIndex` của biểu thức chính quy này trong chuỗi đích. Không cố gắng khớp từ bất kỳ chỉ mục nào sau đó.

### Giá trị trả về

`RegExp(pattern)` trả về `pattern` trực tiếp nếu tất cả các điều kiện sau đây đều đúng:

- `RegExp()` được gọi không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new);
- [`pattern` là một regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes);
- `pattern.constructor === RegExp` (thường có nghĩa là nó không phải là lớp con);
- `flags` là `undefined`.

Trong tất cả các trường hợp khác, gọi `RegExp()` có hoặc không có `new` đều tạo ra một đối tượng `RegExp` mới. Nếu `pattern` là một regex, nguồn của đối tượng mới là `pattern.source`; ngược lại, nguồn của nó là `pattern` [được ép thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Nếu tham số `flags` không phải là `undefined`, [`flags`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/flags) của đối tượng mới là giá trị của tham số; ngược lại, `flags` của nó là `pattern.flags` (nếu `pattern` là một regex).

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `pattern` không thể được phân tích cú pháp như một biểu thức chính quy hợp lệ.
    - `flags` chứa các ký tự lặp lại hoặc bất kỳ ký tự nào ngoài những ký tự được phép.

## Ví dụ

### Ký hiệu literal và constructor

Có hai cách để tạo đối tượng `RegExp`: _ký hiệu literal_ và _constructor_.

- _Ký hiệu literal_ sử dụng một pattern giữa hai dấu gạch chéo, theo sau là các cờ tùy chọn, sau dấu gạch chéo thứ hai.
- _Hàm constructor_ nhận một chuỗi hoặc đối tượng `RegExp` làm tham số đầu tiên và một chuỗi các cờ tùy chọn làm tham số thứ hai.

Ba biểu thức sau tạo ra cùng một biểu thức chính quy:

```js
/ab+c/i;
new RegExp(/ab+c/, "i"); // literal notation
new RegExp("ab+c", "i"); // constructor
```

Trước khi biểu thức chính quy có thể được sử dụng, chúng phải được biên dịch. Quá trình này cho phép chúng thực hiện khớp hiệu quả hơn. Có hai cách để biên dịch và lấy đối tượng `RegExp`.

Ký hiệu literal dẫn đến biên dịch biểu thức chính quy khi biểu thức được đánh giá. Mặt khác, constructor của đối tượng `RegExp`, `new RegExp('ab+c')`, dẫn đến biên dịch biểu thức chính quy tại thời gian chạy.

Sử dụng chuỗi làm đối số đầu tiên cho constructor `RegExp()` khi bạn muốn [xây dựng biểu thức chính quy từ đầu vào động](#building_a_regular_expression_from_dynamic_inputs).

### Xây dựng biểu thức chính quy từ đầu vào động

```js
const breakfasts = ["bacon", "eggs", "oatmeal", "toast", "cereal"];
const order = "Let me get some bacon and eggs, please";

order.match(new RegExp(`\\b(${breakfasts.join("|")})\\b`, "g"));
// Returns ['bacon', 'eggs']
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của nhiều tính năng `RegExp` hiện đại (`dotAll`, cờ `sticky`, named capture group, v.v.) trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("String.prototype.match()")}}
- {{jsxref("String.prototype.replace()")}}
