---
title: String.prototype.slice()
short-title: slice()
slug: Web/JavaScript/Reference/Global_Objects/String/slice
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.slice
sidebar: jsref
---

Phương thức **`slice()`** của các giá trị {{jsxref("String")}} trích xuất một phần của chuỗi này và
trả về nó như một chuỗi mới, không thay đổi chuỗi gốc.

{{InteractiveExample("JavaScript Demo: String.prototype.slice()", "taller")}}

```js interactive-example
const str = "The quick brown fox jumps over the lazy dog.";

console.log(str.slice(31));
// Expected output: "the lazy dog."

console.log(str.slice(4, 19));
// Expected output: "quick brown fox"

console.log(str.slice(-4));
// Expected output: "dog."

console.log(str.slice(-9, -5));
// Expected output: "lazy"
```

## Cú pháp

```js-nolint
slice(indexStart)
slice(indexStart, indexEnd)
```

### Tham số

- `indexStart`
  - : Chỉ số của ký tự đầu tiên cần đưa vào chuỗi con được trả về.
- `indexEnd` {{optional_inline}}
  - : Chỉ số của ký tự đầu tiên cần loại khỏi chuỗi con được trả về.

### Giá trị trả về

Một chuỗi mới chứa phần được trích xuất của chuỗi.

## Mô tả

`slice()` trích xuất văn bản từ một chuỗi và trả về một chuỗi mới.

`slice()` trích xuất đến nhưng không bao gồm `indexEnd`. Ví dụ, `str.slice(4, 8)` trích xuất ký tự thứ năm đến ký tự thứ tám (các ký tự có chỉ số `4`, `5`, `6`, và `7`):

```plain
              indexStart        indexEnd
                  ↓               ↓
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| T | h | e |   | m | i | r | r | o | r |

                  m   i   r   r
                 _______________
                      ↑
                    Result
```

- Nếu `indexStart >= str.length`, một chuỗi rỗng được trả về.
- Nếu `indexStart < 0`, chỉ số được đếm từ cuối chuỗi. Cụ thể hơn, trong trường hợp này, chuỗi con bắt đầu tại `max(indexStart + str.length, 0)`.
- Nếu `indexStart` bị bỏ qua, là `undefined`, hoặc không thể [chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), nó được coi là `0`.
- Nếu `indexEnd` bị bỏ qua hoặc là `undefined`, hoặc nếu `indexEnd >= str.length`, `slice()` trích xuất đến cuối chuỗi.
- Nếu `indexEnd < 0`, chỉ số được đếm từ cuối chuỗi. Cụ thể hơn, trong trường hợp này, chuỗi con kết thúc tại `max(indexEnd + str.length, 0)`.
- Nếu `indexEnd <= indexStart` sau khi chuẩn hóa các giá trị âm (tức là `indexEnd` đại diện cho một ký tự đứng trước `indexStart`), một chuỗi rỗng được trả về.

## Ví dụ

### Sử dụng slice() để tạo một chuỗi mới

Ví dụ sau sử dụng `slice()` để tạo một chuỗi mới.

```js
const str1 = "The morning is upon us."; // Độ dài của str1 là 23.
const str2 = str1.slice(1, 8);
const str3 = str1.slice(4, -2);
const str4 = str1.slice(12);
const str5 = str1.slice(30);
console.log(str2); // he morn
console.log(str3); // morning is upon u
console.log(str4); // is upon us.
console.log(str5); // ""
```

### Sử dụng slice() với chỉ số âm

Ví dụ sau sử dụng `slice()` với các chỉ số âm.

```js
const str = "The morning is upon us.";
str.slice(-3); // 'us.'
str.slice(-3, -1); // 'us'
str.slice(0, -1); // 'The morning is upon us'
str.slice(4, -1); // 'morning is upon us'
```

Ví dụ này đếm ngược từ cuối chuỗi `11` bước để tìm chỉ số bắt đầu và đếm xuôi từ đầu chuỗi `16` bước để tìm chỉ số kết thúc.

```js
console.log(str.slice(-11, 16)); // "is u"
```

Ở đây nó đếm xuôi từ đầu `11` bước để tìm chỉ số bắt đầu và đếm ngược từ cuối `7` bước để tìm chỉ số kết thúc.

```js
console.log(str.slice(11, -7)); // " is u"
```

Các đối số này đếm ngược từ cuối `5` bước để tìm chỉ số bắt đầu và đếm ngược từ cuối `1` bước để tìm chỉ số kết thúc.

```js
console.log(str.slice(-5, -1)); // "n us"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.substr()")}}
- {{jsxref("String.prototype.substring()")}}
- {{jsxref("Array.prototype.slice()")}}
