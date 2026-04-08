---
title: String.prototype.substring()
short-title: substring()
slug: Web/JavaScript/Reference/Global_Objects/String/substring
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.substring
sidebar: jsref
---

Phương thức **`substring()`** của các giá trị {{jsxref("String")}} trả về phần của chuỗi này từ chỉ số bắt đầu đến nhưng không bao gồm chỉ số kết thúc, hoặc đến cuối chuỗi nếu không cung cấp chỉ số kết thúc.

{{InteractiveExample("JavaScript Demo: String.prototype.substring()")}}

```js interactive-example
const str = "Mozilla";

console.log(str.substring(1, 3));
// Expected output: "oz"

console.log(str.substring(2));
// Expected output: "zilla"
```

## Cú pháp

```js-nolint
substring(indexStart)
substring(indexStart, indexEnd)
```

### Tham số

- `indexStart`
  - : Chỉ số của ký tự đầu tiên cần đưa vào chuỗi con được trả về.
- `indexEnd` {{optional_inline}}
  - : Chỉ số của ký tự đầu tiên cần loại khỏi chuỗi con được trả về.

### Giá trị trả về

Một chuỗi mới chứa phần được chỉ định của chuỗi đã cho.

## Mô tả

`substring()` trích xuất các ký tự từ `indexStart` đến _nhưng không bao gồm_ `indexEnd`. Cụ thể:

- Nếu `indexEnd` bị bỏ qua hoặc là `undefined`, `substring()` trích xuất các ký tự đến cuối chuỗi.
- Nếu `indexStart` bằng `indexEnd`, `substring()` trả về một chuỗi rỗng.
- Nếu `indexStart` lớn hơn `indexEnd`, thì `substring()` hoạt động như thể hai đối số được hoán đổi; xem ví dụ bên dưới.

Bất kỳ giá trị đối số nào nhỏ hơn `0` hoặc lớn hơn `str.length` đều được coi như `0` và `str.length` tương ứng.

Bất kỳ giá trị đối số nào là {{jsxref("NaN")}} đều được coi như `0`.

## Ví dụ

### Sử dụng substring()

Ví dụ sau sử dụng `substring()` để hiển thị các ký tự từ chuỗi `"Mozilla"`:

<!-- cSpell:ignore Mozill -->

```js
const anyString = "Mozilla";

console.log(anyString.substring(0, 1)); // "M"
console.log(anyString.substring(1, 0)); // "M"

console.log(anyString.substring(0, 6)); // "Mozill"

console.log(anyString.substring(4)); // "lla"
console.log(anyString.substring(4, 7)); // "lla"
console.log(anyString.substring(7, 4)); // "lla"

console.log(anyString.substring(0, 7)); // "Mozilla"
console.log(anyString.substring(0, 10)); // "Mozilla"
```

### Sử dụng substring() với thuộc tính length

Ví dụ sau sử dụng phương thức `substring()` và thuộc tính {{jsxref("String/length", "length")}} để trích xuất các ký tự cuối của một chuỗi cụ thể. Phương pháp này có thể dễ nhớ hơn, vì bạn không cần biết chỉ số bắt đầu và kết thúc như trong các ví dụ trên.

<!-- cSpell:ignore illa zilla -->

```js
const text = "Mozilla";

// Lấy 4 ký tự cuối của chuỗi
console.log(text.substring(text.length - 4)); // in "illa"

// Lấy 5 ký tự cuối của chuỗi
console.log(text.substring(text.length - 5)); // in "zilla"
```

### Sự khác biệt giữa substring() và substr()

Có những khác biệt tinh tế giữa phương thức `substring()` và {{jsxref("String/substr", "substr()")}}, vì vậy bạn nên cẩn thận để không nhầm lẫn giữa chúng.

- Hai tham số của `substr()` là `start` và `length`, còn với `substring()`, chúng là `start` và `end`.
- Chỉ số `start` của `substr()` sẽ quay vòng về cuối chuỗi nếu âm, còn `substring()` sẽ kẹp nó thành `0`.
- Độ dài âm trong `substr()` được coi là không, còn `substring()` sẽ hoán đổi hai chỉ số nếu `end` nhỏ hơn `start`.

Hơn nữa, `substr()` được coi là _tính năng kế thừa trong ECMAScript_, vì vậy tốt nhất là tránh sử dụng nó nếu có thể.

```js
const text = "Mozilla";
console.log(text.substring(2, 5)); // "zil"
console.log(text.substr(2, 3)); // "zil"
```

### Sự khác biệt giữa substring() và slice()

Phương thức `substring()` và {{jsxref("String/slice", "slice()")}} gần như giống hệt nhau, nhưng có một vài điểm khác biệt tinh tế giữa hai phương thức, đặc biệt là cách xử lý các đối số âm.

Phương thức `substring()` hoán đổi hai đối số của nó nếu `indexStart` lớn hơn `indexEnd`, nghĩa là một chuỗi vẫn được trả về. Phương thức {{jsxref("String/slice", "slice()")}} trả về một chuỗi rỗng nếu trường hợp này xảy ra.

```js
const text = "Mozilla";
console.log(text.substring(5, 2)); // "zil"
console.log(text.slice(5, 2)); // ""
```

Nếu một hoặc cả hai đối số là âm hoặc `NaN`, phương thức `substring()` coi chúng như `0`.

```js
console.log(text.substring(-5, 2)); // "Mo"
console.log(text.substring(-5, -2)); // ""
```

`slice()` cũng coi các đối số `NaN` như `0`, nhưng khi được cho các giá trị âm, nó đếm ngược từ cuối chuỗi để tìm các chỉ số.

```js
console.log(text.slice(-5, 2)); // ""
console.log(text.slice(-5, -2)); // "zil"
```

Xem trang {{jsxref("String/slice", "slice()")}} để biết thêm ví dụ với số âm.

### Thay thế một chuỗi con trong một chuỗi

Ví dụ sau thay thế một chuỗi con trong một chuỗi. Nó sẽ thay thế cả các ký tự riêng lẻ và chuỗi con. Lời gọi hàm ở cuối ví dụ tạo ra chuỗi `Brave New Web` từ chuỗi gốc `Brave New World`.

```js
// Thay thế oldS bằng newS trong chuỗi fullS
function replaceString(oldS, newS, fullS) {
  for (let i = 0; i < fullS.length; ++i) {
    if (fullS.substring(i, i + oldS.length) === oldS) {
      fullS =
        fullS.substring(0, i) +
        newS +
        fullS.substring(i + oldS.length, fullS.length);
    }
  }
  return fullS;
}

replaceString("World", "Web", "Brave New World");
```

Lưu ý rằng điều này có thể dẫn đến vòng lặp vô hạn nếu `oldS` là một chuỗi con của `newS` — ví dụ, nếu bạn cố thay thế `"World"` bằng `"OtherWorld"` ở đây.

Một phương pháp tốt hơn để thay thế chuỗi là:

```js
function replaceString(oldS, newS, fullS) {
  return fullS.split(oldS).join(newS);
}
```

Đoạn code trên phục vụ như một ví dụ cho các thao tác chuỗi con. Nếu bạn cần thay thế chuỗi con, hầu hết thời gian bạn sẽ muốn sử dụng {{jsxref("String.prototype.replace()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.substr()")}}
- {{jsxref("String.prototype.slice()")}}
