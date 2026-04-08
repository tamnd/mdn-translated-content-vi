---
title: String.prototype.replaceAll()
short-title: replaceAll()
slug: Web/JavaScript/Reference/Global_Objects/String/replaceAll
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.replaceAll
sidebar: jsref
---

Phương thức **`replaceAll()`** của các giá trị {{jsxref("String")}} trả về một chuỗi mới với tất cả các kết quả khớp của `pattern` được thay thế bởi `replacement`. `pattern` có thể là một chuỗi hoặc một {{jsxref("RegExp")}}, và `replacement` có thể là một chuỗi hoặc một hàm được gọi cho mỗi kết quả khớp. Chuỗi gốc không bị thay đổi.

{{InteractiveExample("JavaScript Demo: String.prototype.replaceAll()")}}

```js interactive-example
const paragraph = "I think Ruth's dog is cuter than your dog!";

console.log(paragraph.replaceAll("dog", "monkey"));
// Expected output: "I think Ruth's monkey is cuter than your monkey!"

// Global flag required when calling replaceAll with regex
const regex = /dog/gi;
console.log(paragraph.replaceAll(regex, "ferret"));
// Expected output: "I think Ruth's ferret is cuter than your ferret!"
```

## Cú pháp

```js-nolint
replaceAll(pattern, replacement)
```

### Tham số

- `pattern`
  - : Có thể là một chuỗi hoặc một đối tượng có phương thức [`Symbol.replace`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) — ví dụ điển hình là một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp). Bất kỳ giá trị nào không có phương thức `Symbol.replace` sẽ bị ép kiểu thành chuỗi.

    Nếu `pattern` [là một regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes), thì regex đó phải có cờ global (`g`) được đặt, nếu không sẽ ném ra lỗi {{jsxref("TypeError")}}.

- `replacement`
  - : Có thể là một chuỗi hoặc một hàm. Replacement có cùng ngữ nghĩa với [`String.prototype.replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace).

### Giá trị trả về

Một chuỗi mới, với tất cả các kết quả khớp của pattern được thay thế bởi replacement.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `pattern` [là một regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes) không có cờ global (`g`) được đặt (thuộc tính [`flags`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/flags) của nó không chứa `"g"`).

## Mô tả

Phương thức này không thay đổi giá trị chuỗi được gọi trên đó. Nó trả về một chuỗi mới.

Khác với [`replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace), phương thức này thay thế tất cả các lần xuất hiện của một chuỗi, không chỉ lần đầu tiên. Mặc dù cũng có thể dùng `replace()` với một regex global được xây dựng động bằng [`RegExp()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) để thay thế tất cả các lần xuất hiện của một chuỗi, điều này có thể gây ra hậu quả không mong muốn nếu chuỗi chứa các ký tự đặc biệt có ý nghĩa trong biểu thức chính quy (điều này có thể xảy ra nếu chuỗi thay thế đến từ đầu vào của người dùng). Mặc dù bạn có thể giảm thiểu trường hợp này bằng {{jsxref("RegExp.escape()")}} để chuyển chuỗi biểu thức chính quy thành một mẫu ký tự, nhưng đơn giản hơn là truyền chuỗi trực tiếp vào `replaceAll()` mà không cần chuyển đổi thành regex.

<!-- cSpell:ignore acke -->

```js
function unsafeRedactName(text, name) {
  return text.replace(new RegExp(name, "g"), "[REDACTED]");
}
function semiSafeRedactName(text, name) {
  return text.replaceAll(name, "[REDACTED]");
}
function superSafeRedactName(text, name) {
  // only match at word boundaries
  return text.replaceAll(
    new RegExp(`\\b${RegExp.escape(name)}\\b`, "g"),
    "[REDACTED]",
  );
}

let report =
  "A hacker called ha.*er used special characters in their name to breach the system.";

console.log(unsafeRedactName(report, "ha.*er")); // "A [REDACTED]s in their name to breach the system."
console.log(semiSafeRedactName(report, "ha.*er")); // "A hacker called [REDACTED] used special characters in their name to breach the system."

report = "A hacker called acke breached the system.";

console.log(semiSafeRedactName(report, "acke")); // "A h[REDACTED]r called [REDACTED] breached the system."
console.log(superSafeRedactName(report, "acke")); // "A hacker called [REDACTED] breached the system."
```

Nếu `pattern` là một đối tượng có phương thức [`Symbol.replace`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) (bao gồm các đối tượng `RegExp`), phương thức đó được gọi với chuỗi đích và `replacement` làm đối số. Giá trị trả về của nó trở thành giá trị trả về của `replaceAll()`. Trong trường hợp này, hành vi của `replaceAll()` được mã hóa hoàn toàn bởi phương thức `[Symbol.replace]()`, do đó sẽ cho kết quả giống với `replace()` (ngoại trừ việc kiểm tra đầu vào thêm rằng regex phải là global).

Nếu `pattern` là một chuỗi rỗng, replacement sẽ được chèn vào giữa mỗi đơn vị mã UTF-16, tương tự như hành vi của [`split()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split).

```js
"xxx".replaceAll("", "_"); // "_x_x_x_"
```

Để biết thêm thông tin về cách các thuộc tính regex (đặc biệt là cờ [sticky](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky)) tương tác với `replaceAll()`, xem [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace).

## Ví dụ

### Sử dụng replaceAll()

```js
"aabbcc".replaceAll("b", ".");
// 'aa..cc'
```

### Regex không global sẽ ném lỗi

Khi dùng giá trị tìm kiếm là biểu thức chính quy, nó phải là global. Cách này sẽ không hoạt động:

```js example-bad
"aabbcc".replaceAll(/b/, ".");
// TypeError: replaceAll must be called with a global RegExp
```

Cách này sẽ hoạt động:

```js example-good
"aabbcc".replaceAll(/b/g, ".");
("aa..cc");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.replaceAll` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.replaceAll`](https://www.npmjs.com/package/string.prototype.replaceall)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("String.prototype.replace()")}}
- {{jsxref("String.prototype.match()")}}
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
