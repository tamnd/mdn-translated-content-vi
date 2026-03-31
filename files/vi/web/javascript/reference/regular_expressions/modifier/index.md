---
title: "Modifier: (?ims-ims:...)"
slug: Web/JavaScript/Reference/Regular_expressions/Modifier
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.modifier
sidebar: jssidebar
---

Một **modifier** ghi đè các cài đặt [flag](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#regex_flags) trong một phần cụ thể của regular expression. Nó có thể được sử dụng để bật hoặc tắt các flags thay đổi ý nghĩa của một số phần tử cú pháp regex. Các flags này là [`i`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase), [`m`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline), và [`s`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll).

## Cú pháp

```regex
(?flags1:pattern)
(?flags1-flags2:pattern)
```

> [!NOTE]
> JavaScript chỉ có dạng modifier "bounded", trong đó pattern được đặt bên trong nhóm modifier. Hầu hết các ngôn ngữ khác hỗ trợ modifiers có dạng "unbounded", trong đó modifier được áp dụng đến cuối nhóm chứa gần nhất.

### Tham số

- `flags1` {{optional_inline}}
  - : Một chuỗi các flags cần bật. Có thể chứa bất kỳ kết hợp nào của `i`, `m`, và `s`.
- `flags2` {{optional_inline}}
  - : Một chuỗi các flags cần tắt. Có thể chứa bất kỳ kết hợp nào của `i`, `m`, và `s`, nhưng không được chứa bất kỳ flags nào có trong `flags1`.
- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).

## Mô tả

Một số flags thay đổi ý nghĩa của các phần tử cú pháp regex:

- Flag [`i`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) làm cho regex không phân biệt hoa/thường bằng cách làm cho tất cả [literal characters](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) và [character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) ngầm định là chữ thường.
- Flag [`m`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) thay đổi hành vi của [input boundary assertions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion) `^` và `$` để khớp với đầu và cuối của mỗi dòng, ngoài đầu và cuối của chuỗi đầu vào.
- Flag [`s`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll) thay đổi hành vi của ký tự [wildcard](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard) `.` để khớp bất kỳ ký tự nào, bao gồm cả ký tự kết thúc dòng.

Đôi khi bạn muốn những thay đổi này chỉ có hiệu lực trong một phần cụ thể của một regex pattern. Bạn có thể làm như vậy bằng cách bao bọc phần đó trong một modifier. Ví dụ:

```js
/(?i:Hello) world/;
```

Trong regex này, flag `i` chỉ được bật cho phần `Hello` của pattern. Phần `world` phân biệt hoa/thường. Do đó, nó khớp `Hello world`, `hello world`, và `HELLO world`, nhưng không phải `HELLO WORLD`. Đoạn sau tương đương, bằng cách bật flag `i` toàn cục, và sau đó tắt nó cho phần `world`:

```js
/Hello (?-i:world)/i;
```

Các tham số `flags1` và `flags2` có thể chứa bất kỳ kết hợp nào của `i`, `m`, và `s`. Tuy nhiên, các flags phải là duy nhất giữa `flags1` và `flags2`—bạn không thể bật hoặc tắt một flag hai lần, hoặc bật một flag và sau đó ngay lập tức tắt nó.

Các tham số `flags1` và `flags2` là tùy chọn, nhưng ít nhất một phải không rỗng. `(?flags1-:pattern)` là một modifier chỉ bật flags (tương đương với `(?flags1:pattern)`). `(?-flags2:pattern)` là một modifier chỉ tắt flags. `(?:pattern)` chỉ là một [non-capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group), và `(?-:pattern)` là lỗi cú pháp.

Các flags khác không có ý nghĩa trong một modifier và do đó là lỗi cú pháp nếu được bao gồm:

- Các flags [`g`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) và [`y`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) xác định cách các lần gọi nhiều lần đến [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) hoạt động và ảnh hưởng đến hành vi khớp của toàn bộ regex.
- Flag [`d`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices) bật thông tin bổ sung trong kết quả [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) và ảnh hưởng đến hành vi khớp của toàn bộ regex.
- Các flags [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) và [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) thay đổi hành vi của regex engine theo cách quá phức tạp để được sửa đổi cục bộ. Chúng cũng có các hiệu ứng toàn cục trên regex, chẳng hạn như cách [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) được tiến.

## Ví dụ

### Chỉ khớp định dạng đa dòng ở đầu chuỗi

Regex sau định nghĩa một định dạng cho một chuỗi đa dòng. `^` đầu tiên đại diện cho đầu của toàn bộ chuỗi đầu vào, bằng cách nằm trong modifier `(?-m:)`, trong khi tất cả các ký tự `^` khác đại diện cho đầu của một dòng:

```js
const pattern = /(?-m:^)---\n^title:.*^slug:.*^---/ms;

const input = `---
title: "Modifier: (?ims-ims:...)"
slug: Web/JavaScript/Reference/Regular_expressions/Modifier
---`;

pattern.test(input); // true

// Extra line break at the start of string
const input2 = `\n${input}`;

pattern.test(input2); // false
```

### Khớp một số từ không phân biệt hoa/thường

Hãy tưởng tượng bạn đang tìm tất cả các khai báo biến được gọi là `foo` hoặc `bar` (vì chúng là các tên xấu). Từ có thể xuất hiện ở bất kỳ chữ hoa/thường nào, nhưng bạn biết từ khóa luôn là chữ thường, vì vậy bạn có thể làm điều này:

```js
const pattern = /(?:var|let|const) (?i:foo|bar)\b/;

pattern.test("let foo;"); // true
pattern.test("const BAR = 1;"); // true
pattern.test("Let foo be a number"); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Non-capturing group: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
