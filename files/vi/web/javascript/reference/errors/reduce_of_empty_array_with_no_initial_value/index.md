---
title: "TypeError: Reduce of empty array with no initial value"
slug: Web/JavaScript/Reference/Errors/Reduce_of_empty_array_with_no_initial_value
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "reduce of empty array with no initial value" xảy ra khi hàm reduce được sử dụng.

## Thông báo

```plain
TypeError: Reduce of empty array with no initial value (V8-based & Firefox & Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Trong JavaScript, có một số hàm reduce:

- {{jsxref("Array.prototype.reduce()")}}, {{jsxref("Array.prototype.reduceRight()")}}
  và
- {{jsxref("TypedArray.prototype.reduce()")}},
  {{jsxref("TypedArray.prototype.reduceRight()")}}).

Các hàm này tùy chọn nhận một `initialValue` (sẽ được sử dụng làm đối số đầu tiên trong lần gọi đầu tiên của `callback`). Tuy nhiên, nếu không có giá trị khởi đầu nào được cung cấp, nó sẽ sử dụng phần tử đầu tiên của {{jsxref("Array")}} hoặc {{jsxref("TypedArray")}} làm giá trị khởi đầu. Lỗi này xảy ra khi truyền vào một mảng rỗng vì không có giá trị khởi đầu nào có thể được trả về trong trường hợp đó.

## Ví dụ

### Các trường hợp không hợp lệ

Vấn đề này thường xuất hiện khi kết hợp với filter
({{jsxref("Array.prototype.filter()")}}, {{jsxref("TypedArray.prototype.filter()")}})
để loại bỏ tất cả các phần tử của danh sách, khiến không còn phần tử nào để dùng làm giá trị khởi đầu.

```js example-bad
const ints = [0, -1, -2, -3, -4, -5];
ints
  .filter((x) => x > 0) // loại bỏ tất cả các phần tử
  .reduce((x, y) => x + y); // không còn phần tử nào để dùng làm giá trị khởi đầu.
```

Tương tự, vấn đề tương tự có thể xảy ra nếu có lỗi đánh máy trong selector, hoặc số lượng phần tử trong danh sách không như mong đợi:

```js example-bad
const names = document.getElementsByClassName("names");
const nameList = Array.prototype.reduce.call(
  names,
  (acc, name) => `${acc}, ${name}`,
);
```

### Các trường hợp hợp lệ

Những vấn đề này có thể được giải quyết theo hai cách khác nhau.

Một cách là thực sự cung cấp một `initialValue` là phần tử trung lập của toán tử, chẳng hạn như 0 cho phép cộng, 1 cho phép nhân, hoặc một chuỗi rỗng cho phép ghép chuỗi.

```js example-good
const ints = [0, -1, -2, -3, -4, -5];
ints
  .filter((x) => x > 0) // loại bỏ tất cả các phần tử
  .reduce((x, y) => x + y, 0); // giá trị khởi đầu là phần tử trung lập của phép cộng
```

Một cách khác là xử lý trường hợp mảng rỗng, hoặc trước khi gọi `reduce`, hoặc trong callback sau khi thêm một giá trị khởi đầu dummy bất ngờ.

```js example-good
const names = document.getElementsByClassName("names");

let nameList1 = "";
if (names.length >= 1) {
  nameList1 = Array.prototype.reduce.call(
    names,
    (acc, name) => `${acc}, ${name}`,
  );
}
// nameList1 === "" khi names rỗng.

const nameList2 = Array.prototype.reduce.call(
  names,
  (acc, name) => {
    if (acc === "")
      // giá trị khởi đầu
      return name;
    return `${acc}, ${name}`;
  },
  "",
);
// nameList2 === "" khi names rỗng.
```

## Xem thêm

- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("Array.prototype.reduceRight()")}}
- {{jsxref("TypedArray.prototype.reduce()")}}
- {{jsxref("TypedArray.prototype.reduceRight()")}}
- {{jsxref("Array")}}
- {{jsxref("TypedArray")}}
- {{jsxref("Array.prototype.filter()")}}
- {{jsxref("TypedArray.prototype.filter()")}}
