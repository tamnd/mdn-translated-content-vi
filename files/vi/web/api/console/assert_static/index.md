---
title: "console: phương thức tĩnh assert()"
short-title: assert()
slug: Web/API/console/assert_static
page-type: web-api-static-method
browser-compat: api.console.assert_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.assert()`** ghi một thông báo lỗi vào console nếu phép khẳng định là false. Nếu phép khẳng định là true thì không có gì xảy ra.

## Cú pháp

```js-nolint
console.assert(assertion)

console.assert(assertion, val1)
console.assert(assertion, val1, val2)
console.assert(assertion, val1, val2, /* …, */ valN)

console.assert(assertion, msg)
console.assert(assertion, msg, subst1)
console.assert(assertion, msg, subst1, /* …, */ substN)
```

### Tham số

- `assertion`
  - : Bất kỳ biểu thức boolean nào. Nếu phép khẳng định là false, một thông báo chung cho biết việc khẳng định thất bại sẽ được ghi vào console.
- `val1` … `valN`
  - : Danh sách các giá trị JavaScript cần xuất. Biểu diễn của từng giá trị sẽ được xuất ra console theo đúng thứ tự, sau một thông báo thất bại khẳng định chung (thông báo này có thể khác với thông báo được xuất khi không có các giá trị này), với một dạng phân tách nào đó giữa thông báo và giữa từng giá trị. Có một trường hợp đặc biệt nếu `val1` là chuỗi, được mô tả ngay sau đây.
- `msg`
  - : Một chuỗi JavaScript chứa không hoặc nhiều chuỗi thay thế; các chuỗi này được thay bằng `subst1` đến `substN` theo thứ tự liên tiếp cho đến số lượng chuỗi thay thế. Một dấu hai chấm, một khoảng trắng, rồi chuỗi đã thay thế sẽ được nối vào thông báo khẳng định chung để tạo thành thông báo khẳng định chi tiết, và kết quả sẽ được xuất ra console. Xem [Dùng chuỗi thay thế](/en-US/docs/Web/API/console#using_string_substitutions) để biết cách hoạt động của việc thay thế.
- `subst1` … `substN`
  - : Các giá trị JavaScript dùng để thay thế các chuỗi thay thế trong `msg`. Nếu có nhiều giá trị thay thế hơn số chuỗi thay thế, các giá trị dư ra cũng sẽ được ghi vào console theo cùng cách như khi không có chuỗi định dạng.

Xem [Xuất văn bản ra console](/en-US/docs/Web/API/console#outputting_text_to_the_console) trong tài liệu của {{domxref("console")}} để biết thêm chi tiết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ mã sau minh họa việc dùng một đối tượng JavaScript theo sau phép khẳng định:

```js
const errorMsg = "the # is not even";
for (let number = 2; number <= 5; number++) {
  console.log(`the # is ${number}`);
  console.assert(number % 2 === 0, "%o", { number, errorMsg });
}
// output:
// the # is 2
// the # is 3
// Assertion failed: {number: 3, errorMsg: "the # is not even"}
// the # is 4
// the # is 5
// Assertion failed: {number: 5, errorMsg: "the # is not even"}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.assert()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#assert)
- [Tài liệu của Node.js về `console.assert()`](https://nodejs.org/docs/latest/api/console.html#consoleassertvalue-message)
- [Tài liệu của Google Chrome về `console.dir()`](https://developer.chrome.com/docs/devtools/console/api/#dir)
