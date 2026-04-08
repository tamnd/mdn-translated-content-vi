---
title: "RegExp: lastIndex"
short-title: lastIndex
slug: Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.RegExp.lastIndex
sidebar: jsref
---

Thuộc tính dữ liệu **`lastIndex`** của một instance {{jsxref("RegExp")}} chỉ định chỉ mục để bắt đầu kết quả khớp tiếp theo.

{{InteractiveExample("JavaScript Demo: RegExp: lastIndex")}}

```js interactive-example
const regex = /foo/g;
const str = "table football, foosball";

regex.test(str);

console.log(regex.lastIndex);
// Expected output: 9

regex.test(str);

console.log(regex.lastIndex);
// Expected output: 19
```

## Giá trị

Một số nguyên không âm.

{{js_property_attributes(1, 0, 0)}}

## Mô tả

Thuộc tính này chỉ được đặt nếu instance biểu thức chính quy sử dụng cờ `g` để chỉ ra tìm kiếm global, hoặc cờ `y` để chỉ ra tìm kiếm sticky. Các quy tắc sau áp dụng khi {{jsxref("RegExp/exec", "exec()")}} được gọi trên một đầu vào nhất định:

- Nếu `lastIndex` lớn hơn độ dài của đầu vào, `exec()` sẽ không tìm thấy kết quả khớp, và `lastIndex` sẽ được đặt về 0.
- Nếu `lastIndex` nhỏ hơn hoặc bằng độ dài của đầu vào, `exec()` sẽ cố gắng khớp đầu vào bắt đầu từ `lastIndex`.
  - Nếu `exec()` tìm thấy kết quả khớp, thì `lastIndex` sẽ được đặt về vị trí kết thúc của chuỗi khớp trong đầu vào.
  - Nếu `exec()` không tìm thấy kết quả khớp, thì `lastIndex` sẽ được đặt về 0.

Các phương thức liên quan đến regex khác, chẳng hạn như {{jsxref("RegExp.prototype.test()")}}, {{jsxref("String.prototype.match()")}}, {{jsxref("String.prototype.replace()")}}, v.v., gọi `exec()` bên trong, vì vậy chúng có các hiệu ứng khác nhau trên `lastIndex`. Xem trang tương ứng của chúng để biết chi tiết.

## Ví dụ

### Sử dụng lastIndex

Xem xét chuỗi câu lệnh sau:

```js
const re = /(hi)?/g;
```

Khớp với chuỗi rỗng.

```js
console.log(re.exec("hi"));
console.log(re.lastIndex);
```

Trả về `["hi", "hi"]` với `lastIndex` bằng 2.

```js
console.log(re.exec("hi"));
console.log(re.lastIndex);
```

Trả về `["", undefined]`, một mảng rỗng có phần tử thứ không là chuỗi khớp. Trong trường hợp này, chuỗi rỗng vì `lastIndex` là 2 (và vẫn là 2) và `hi` có độ dài 2.

### Sử dụng lastIndex với regex sticky

Thuộc tính `lastIndex` có thể ghi. Bạn có thể đặt nó để regex bắt đầu tìm kiếm tiếp theo tại một chỉ mục nhất định.

Cờ `y` hầu như luôn yêu cầu đặt `lastIndex`. Nó luôn khớp chặt chẽ tại `lastIndex` và không cố gắng bất kỳ vị trí nào sau đó. Điều này thường hữu ích khi viết parser, khi bạn muốn khớp các token chỉ tại vị trí hiện tại.

```js
const stringPattern = /"[^"]*"/y;
const input = `const message = "Hello world";`;

stringPattern.lastIndex = 6;
console.log(stringPattern.exec(input)); // null

stringPattern.lastIndex = 16;
console.log(stringPattern.exec(input)); // ['"Hello world"']
```

### Tua lại lastIndex

Cờ `g` cũng hưởng lợi từ việc đặt `lastIndex`. Một trường hợp sử dụng phổ biến là khi chuỗi được sửa đổi trong giữa một tìm kiếm global. Trong trường hợp này, chúng ta có thể bỏ lỡ một kết quả khớp cụ thể nếu chuỗi bị rút ngắn. Chúng ta có thể tránh điều này bằng cách tua lại `lastIndex`.

```js
const mdLinkPattern = /\[[^[\]]+\]\((?<link>[^()\s]+)\)/dg;

function resolveMDLink(line) {
  let match;
  let modifiedLine = line;
  while ((match = mdLinkPattern.exec(modifiedLine))) {
    const originalLink = match.groups.link;
    const resolvedLink = originalLink.replaceAll(/^files|\/index\.md$/g, "");
    modifiedLine =
      modifiedLine.slice(0, match.indices.groups.link[0]) +
      resolvedLink +
      modifiedLine.slice(match.indices.groups.link[1]);
    // Rewind the pattern to the end of the resolved link
    mdLinkPattern.lastIndex += resolvedLink.length - originalLink.length;
  }
  return modifiedLine;
}

console.log(
  resolveMDLink(
    "[`lastIndex`](files/en-us/web/javascript/reference/global_objects/regexp/lastindex/index.md)",
  ),
); // [`lastIndex`](/en-us/web/javascript/reference/global_objects/regexp/lastindex)
console.log(
  resolveMDLink(
    "[`ServiceWorker`](files/en-us/web/api/serviceworker/index.md) and [`SharedWorker`](files/en-us/web/api/sharedworker/index.md)",
  ),
); // [`ServiceWorker`](/en-us/web/api/serviceworker) and [`SharedWorker`](/en-us/web/api/sharedworker)
```

Hãy thử xóa dòng `mdLinkPattern.lastIndex += resolvedLink.length - originalLink.length` và chạy ví dụ thứ hai. Bạn sẽ thấy rằng liên kết thứ hai không được thay thế đúng cách, vì `lastIndex` đã vượt qua chỉ mục của liên kết sau khi chuỗi bị rút ngắn.

> [!WARNING]
> Ví dụ này chỉ để minh họa. Để xử lý Markdown, bạn nên sử dụng thư viện phân tích cú pháp thay vì regex.

### Tối ưu hóa tìm kiếm

Bạn có thể tối ưu hóa tìm kiếm bằng cách đặt `lastIndex` đến một điểm mà các lần xuất hiện có thể trước đó có thể được bỏ qua. Ví dụ, thay vì:

```js
const stringPattern = /"[^"]*"/g;
const input = `const message = "Hello " + "world";`;

// Pretend we've already dealt with the previous parts of the string
let offset = 26;
const remainingInput = input.slice(offset);
const nextString = stringPattern.exec(remainingInput);
console.log(nextString[0]); // "world"
offset += nextString.index + nextString.length;
```

Hãy xem xét điều này:

```js
stringPattern.lastIndex = offset;
const nextString = stringPattern.exec(remainingInput);
console.log(nextString[0]); // "world"
offset = stringPattern.lastIndex;
```

Điều này có thể hiệu quả hơn vì chúng ta tránh việc cắt chuỗi.

### Tránh tác dụng phụ

Các tác dụng phụ gây ra bởi `exec()` có thể gây nhầm lẫn, đặc biệt nếu đầu vào khác nhau cho mỗi lần `exec()`.

```js
const re = /foo/g;
console.log(re.test("foo bar")); // true
console.log(re.test("foo baz")); // false, because lastIndex is non-zero
```

Điều này thậm chí còn gây nhầm lẫn hơn khi bạn đang tự sửa đổi `lastIndex`. Để kiểm soát các tác dụng phụ, hãy nhớ đặt lại `lastIndex` sau khi mỗi đầu vào được xử lý hoàn toàn.

```js
const re = /foo/g;
console.log(re.test("foo bar")); // true
re.lastIndex = 0;
console.log(re.test("foo baz")); // true
```

Với một số trừu tượng hóa, bạn có thể yêu cầu `lastIndex` được đặt thành một giá trị cụ thể trước mỗi lần gọi `exec()`.

```js
function createMatcher(pattern) {
  // Create a copy, so that the original regex is never updated
  const regex = new RegExp(pattern, "g");
  return (input, offset) => {
    regex.lastIndex = offset;
    return regex.exec(input);
  };
}

const matchFoo = createMatcher(/foo/);
console.log(matchFoo("foo bar", 0)[0]); // "foo"
console.log(matchFoo("foo baz", 0)[0]); // "foo"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
