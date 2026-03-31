---
title: RegExp.prototype.exec()
short-title: exec()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/exec
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.exec
sidebar: jsref
---

Phương thức **`exec()`** của các instance {{jsxref("RegExp")}} thực hiện tìm kiếm với biểu thức chính quy này để tìm kết quả khớp trong một chuỗi được chỉ định và trả về mảng kết quả, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

{{InteractiveExample("JavaScript Demo: RegExp.prototype.exec()")}}

```js interactive-example
const regex = /fo+/g;
const str = "table football, foosball";
let array;

while ((array = regex.exec(str)) !== null) {
  console.log(`Found ${array[0]}. Next starts at ${regex.lastIndex}.`);
  // Expected output: "Found foo. Next starts at 9."
  // Expected output: "Found foo. Next starts at 19."
}
```

## Cú pháp

```js-nolint
exec(str)
```

### Tham số

- `str`
  - : Chuỗi để khớp với biểu thức chính quy. Tất cả các giá trị được [ép thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua nó hoặc truyền `undefined` sẽ khiến `exec()` tìm kiếm chuỗi `"undefined"`, đây hiếm khi là điều bạn muốn.

### Giá trị trả về

Nếu khớp thất bại, phương thức `exec()` trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và đặt [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) của regex về `0`.

Nếu khớp thành công, phương thức `exec()` trả về một mảng và cập nhật thuộc tính [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) của đối tượng biểu thức chính quy. Mảng trả về có văn bản khớp là phần tử đầu tiên, sau đó là một phần tử cho mỗi nhóm bắt của văn bản khớp. Mảng cũng có các thuộc tính bổ sung sau:

- `index`
  - : Chỉ mục gốc 0 của kết quả khớp trong chuỗi.
- `input`
  - : Chuỗi gốc đã được khớp.
- `groups`
  - : Một [đối tượng prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) của các nhóm bắt được đặt tên, trong đó khóa là tên và giá trị là các nhóm bắt, hoặc {{jsxref("undefined")}} nếu không có nhóm bắt được đặt tên nào được định nghĩa. Xem [nhóm bắt](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) để biết thêm thông tin.
- `indices` {{optional_inline}}
  - : Thuộc tính này chỉ có mặt khi cờ [`d`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices) được đặt. Đây là một mảng trong đó mỗi mục biểu diễn các ranh giới của một kết quả khớp chuỗi con. Chỉ mục của mỗi phần tử trong mảng này tương ứng với chỉ mục của kết quả khớp chuỗi con tương ứng trong mảng được trả về bởi `exec()`. Nói cách khác, mục `indices` đầu tiên biểu diễn toàn bộ kết quả khớp, mục `indices` thứ hai biểu diễn nhóm bắt đầu tiên, v.v. Mỗi mục là một mảng hai phần tử, trong đó số đầu tiên biểu diễn chỉ mục bắt đầu của kết quả khớp và số thứ hai là chỉ mục kết thúc.

    Mảng `indices` cũng có thuộc tính `groups`, chứa một [đối tượng prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) của tất cả các nhóm bắt được đặt tên. Khóa là tên của các nhóm bắt và mỗi giá trị là một mảng hai phần tử, với số đầu tiên là chỉ mục bắt đầu và số thứ hai là chỉ mục kết thúc của nhóm bắt. Nếu biểu thức chính quy không chứa bất kỳ nhóm bắt được đặt tên nào, `groups` là `undefined`.

## Mô tả

Các đối tượng {{jsxref("RegExp")}} trong JavaScript là _stateful_ khi chúng có cờ [global](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) hoặc [sticky](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) được đặt (ví dụ: `/foo/g` hoặc `/foo/y`). Chúng lưu trữ [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) từ kết quả khớp trước. Sử dụng điều này nội bộ, `exec()` có thể được dùng để lặp qua nhiều kết quả khớp trong một chuỗi văn bản (với các nhóm bắt), trái ngược với việc chỉ lấy các chuỗi khớp với {{jsxref("String.prototype.match()")}}.

Khi sử dụng `exec()`, cờ global không có hiệu lực khi cờ sticky được đặt — kết quả khớp luôn là sticky.

`exec()` là phương thức nguyên thủy của regex. Nhiều phương thức regex khác gọi `exec()` nội bộ — bao gồm cả các phương thức được gọi bởi các phương thức chuỗi, như [`[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace). Mặc dù `exec()` tự nó mạnh mẽ (và hiệu quả nhất), nó thường không truyền đạt ý định rõ ràng nhất.

- Nếu bạn chỉ quan tâm liệu regex có khớp với một chuỗi hay không, nhưng không quan tâm điều gì thực sự được khớp, hãy sử dụng {{jsxref("RegExp.prototype.test()")}} thay thế.
- Nếu bạn đang tìm tất cả các lần xuất hiện của một regex global và bạn không quan tâm đến thông tin như nhóm bắt, hãy sử dụng {{jsxref("String.prototype.match()")}} thay thế. Ngoài ra, {{jsxref("String.prototype.matchAll()")}} giúp đơn giản hóa việc khớp nhiều phần của một chuỗi (với nhóm bắt) bằng cách cho phép bạn lặp qua các kết quả khớp.
- Nếu bạn đang thực hiện khớp để tìm vị trí chỉ mục của nó trong chuỗi, hãy sử dụng phương thức {{jsxref("String.prototype.search()")}} thay thế.

`exec()` hữu ích cho các thao tác phức tạp không thể đạt được dễ dàng thông qua bất kỳ phương thức nào ở trên, thường khi bạn cần điều chỉnh thủ công [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex). ({{jsxref("String.prototype.matchAll()")}} sao chép regex, vì vậy thay đổi `lastIndex` trong khi lặp qua `matchAll` không ảnh hưởng đến quá trình lặp.) Để xem một ví dụ như vậy, xem [rewind `lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex#rewinding_lastindex).

## Ví dụ

### Sử dụng exec()

Xem xét ví dụ sau:

```js
// Match "quick brown" followed by "jumps", ignoring characters in between
// Remember "brown" and "jumps"
// Ignore case
const re = /quick\s(?<color>brown).+?(jumps)/dgi;
const result = re.exec("The Quick Brown Fox Jumps Over The Lazy Dog");
```

Bảng sau đây cho thấy trạng thái của `result` sau khi chạy script này:

| Thuộc tính | Giá trị                                                            |
| ---------- | ------------------------------------------------------------------ |
| `[0]`      | `"Quick Brown Fox Jumps"`                                          |
| `[1]`      | `"Brown"`                                                          |
| `[2]`      | `"Jumps"`                                                          |
| `index`    | `4`                                                                |
| `indices`  | `[[4, 25], [10, 15], [20, 25]]`<br />`groups: { color: [10, 15 ]}` |
| `input`    | `"The Quick Brown Fox Jumps Over The Lazy Dog"`                    |
| `groups`   | `{ color: "Brown" }`                                               |

Ngoài ra, `re.lastIndex` sẽ được đặt thành `25`, do regex này là global.

### Tìm các kết quả khớp liên tiếp

Nếu biểu thức chính quy của bạn sử dụng cờ [`g`](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags), bạn có thể sử dụng phương thức `exec()` nhiều lần để tìm các kết quả khớp liên tiếp trong cùng một chuỗi. Khi làm vậy, tìm kiếm bắt đầu tại chuỗi con của `str` được chỉ định bởi thuộc tính {{jsxref("RegExp/lastIndex", "lastIndex")}} của biểu thức chính quy ({{jsxref("RegExp/test", "test()")}} cũng sẽ tăng thuộc tính {{jsxref("RegExp/lastIndex", "lastIndex")}}). Lưu ý rằng thuộc tính {{jsxref("RegExp/lastIndex", "lastIndex")}} sẽ không được đặt lại khi tìm kiếm một chuỗi khác, nó sẽ bắt đầu tìm kiếm tại {{jsxref("RegExp/lastIndex", "lastIndex")}} hiện tại của nó.

Ví dụ, giả sử bạn có script này:

```js
const myRe = /ab*/g;
const str = "abbcdefabh";
let myArray;
while ((myArray = myRe.exec(str)) !== null) {
  let msg = `Found ${myArray[0]}. `;
  msg += `Next match starts at ${myRe.lastIndex}`;
  console.log(msg);
}
```

Script này hiển thị văn bản sau:

```plain
Found abb. Next match starts at 3
Found ab. Next match starts at 9
```

> [!WARNING]
> Có nhiều bẫy có thể dẫn đến việc này trở thành vòng lặp vô hạn!
>
> - _Đừng_ đặt literal biểu thức chính quy (hoặc constructor {{jsxref("RegExp")}}) trong điều kiện `while` — nó sẽ tạo lại regex cho mỗi lần lặp và đặt lại {{jsxref("RegExp/lastIndex", "lastIndex")}}.
> - Hãy chắc chắn rằng cờ [global (`g`)](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) được đặt, hoặc `lastIndex` sẽ không bao giờ được tăng.
> - Nếu regex có thể khớp với các chuỗi có độ dài không (ví dụ: `/^/gm`), hãy tăng {{jsxref("RegExp/lastIndex", "lastIndex")}} của nó thủ công mỗi lần để tránh bị kẹt tại cùng một vị trí.

Bạn thường có thể thay thế loại code này bằng {{jsxref("String.prototype.matchAll()")}} để làm cho nó ít dễ bị lỗi hơn.

### Sử dụng exec() với literal RegExp

Bạn cũng có thể sử dụng `exec()` mà không tạo ra đối tượng {{jsxref("RegExp")}} một cách tường minh:

```js
const matches = /(hello \S+)/.exec("This is a hello world!");
console.log(matches[1]);
```

Điều này sẽ ghi một thông báo chứa `'hello world!'`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("RegExp")}}
