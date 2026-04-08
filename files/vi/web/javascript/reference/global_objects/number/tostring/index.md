---
title: Number.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Number/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.toString
sidebar: jsref
---

Phương thức **`toString()`** của các giá trị {{jsxref("Number")}} trả về một chuỗi biểu diễn giá trị số này.

{{InteractiveExample("JavaScript Demo: Number.prototype.toString()")}}

```js interactive-example
function hexColor(c) {
  if (c < 256) {
    return Math.abs(c).toString(16);
  }
  return 0;
}

console.log(hexColor(233));
// Expected output: "e9"

console.log(hexColor("11"));
// Expected output: "b"
```

## Cú pháp

```js-nolint
toString()
toString(radix)
```

### Tham số

- `radix` {{optional_inline}}
  - : Một số nguyên trong khoảng `2` đến `36` chỉ định cơ số để sử dụng khi biểu diễn giá trị số. Mặc định là 10.

### Giá trị trả về

Một chuỗi biểu diễn giá trị số được chỉ định. Ký hiệu khoa học được sử dụng nếu cơ số là 10 và độ lớn của số (bỏ qua dấu) lớn hơn hoặc bằng 10<sup>21</sup> hoặc nhỏ hơn 10<sup>-6</sup>.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `radix` nhỏ hơn 2 hoặc lớn hơn 36.
- {{jsxref("TypeError")}}
  - : Ném ra nếu phương thức này được gọi trên một đối tượng không phải là {{jsxref("Number")}}.

## Mô tả

Đối tượng {{jsxref("Number")}} ghi đè phương thức `toString` của {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các giá trị `Number`, phương thức `toString` trả về biểu diễn chuỗi của giá trị trong cơ số được chỉ định.

Đối với các cơ số lớn hơn 10, các chữ cái của bảng chữ cái biểu thị các chữ số lớn hơn 9. Ví dụ, đối với các số thập lục phân (cơ số 16) `a` đến `f` được sử dụng.

Nếu giá trị số được chỉ định là âm, dấu được giữ nguyên. Điều này đúng ngay cả khi cơ số là 2; chuỗi trả về là biểu diễn nhị phân dương của giá trị số được đứng trước bởi dấu `-`, **không** phải là bù hai của giá trị số.

Cả `0` và `-0` đều có `"0"` là biểu diễn chuỗi của chúng. {{jsxref("Infinity")}} trả về `"Infinity"` và {{jsxref("NaN")}} trả về `"NaN"`.

Nếu số không phải là số nguyên, dấu chấm thập phân `.` được sử dụng để phân tách các vị trí thập phân. [Ký hiệu khoa học](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#exponential) được sử dụng nếu cơ số là 10 và độ lớn của số (bỏ qua dấu) lớn hơn hoặc bằng 10<sup>21</sup> hoặc nhỏ hơn 10<sup>-6</sup>. Trong trường hợp này, chuỗi trả về luôn chỉ định rõ ràng dấu của số mũ.

```js
console.log((10 ** 21.5).toString()); // "3.1622776601683794e+21"
console.log((10 ** 21.5).toString(8)); // "526665530627250154000000"
```

Biểu diễn cơ bản cho các số dấu phẩy động là ký hiệu khoa học cơ số 2 (xem [mã hóa số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding)). Tuy nhiên, phương thức `toString()` không trực tiếp sử dụng biểu diễn chính xác nhất này của giá trị số. Thay vào đó, thuật toán sử dụng số ít chữ số có nghĩa nhất cần thiết để phân biệt đầu ra với các giá trị số liền kề. Ví dụ, nếu số lớn, sẽ có nhiều biểu diễn chuỗi tương đương của cùng một số dấu phẩy động, và `toString()` sẽ chọn cái có nhiều số 0 nhất ở bên phải (đối với bất kỳ cơ số nào).

```js
console.log((1000000000000000128).toString()); // "1000000000000000100"
console.log(1000000000000000100 === 1000000000000000128); // true
```

Mặt khác, {{jsxref("Number.prototype.toFixed()")}} và {{jsxref("Number.prototype.toPrecision()")}} cho phép bạn chỉ định độ chính xác và có thể chính xác hơn `toString()`.

Phương thức `toString()` yêu cầu giá trị `this` của nó là một nguyên thủy `Number` hoặc đối tượng bao bọc. Nó ném {{jsxref("TypeError")}} cho các giá trị `this` khác mà không cố gắng ép buộc chúng sang giá trị số.

Vì `Number` không có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), JavaScript gọi phương thức `toString()` tự động khi một _đối tượng_ `Number` được sử dụng trong ngữ cảnh cần chuỗi, chẳng hạn trong [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Tuy nhiên, các giá trị _nguyên thủy_ Number không tham khảo phương thức `toString()` để được [ép buộc thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) — thay vào đó, chúng được chuyển đổi trực tiếp bằng cùng thuật toán như triển khai ban đầu của `toString()`.

```js
Number.prototype.toString = () => "Overridden";
console.log(`${1}`); // "1"
console.log(`${new Number(1)}`); // "Overridden"
```

## Ví dụ

### Sử dụng toString()

```js
const count = 10;
console.log(count.toString()); // "10"

console.log((17).toString()); // "17"
console.log((17.2).toString()); // "17.2"

const x = 6;
console.log(x.toString(2)); // "110"
console.log((254).toString(16)); // "fe"
console.log((-10).toString(2)); // "-1010"
console.log((-0xff).toString(2)); // "-11111111"
```

### Chuyển đổi cơ số của chuỗi số

Nếu bạn có một chuỗi biểu diễn một số trong cơ số không thập phân, bạn có thể sử dụng [`parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) và `toString()` để chuyển đổi nó sang một cơ số khác.

```js
const hex = "CAFEBABE";
const bin = parseInt(hex, 16).toString(2); // "11001010111111101011101010111110"
```

Hãy cảnh giác với việc mất độ chính xác: nếu chuỗi số gốc quá lớn (lớn hơn [`Number.MAX_SAFE_INTEGER`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER), ví dụ), bạn nên sử dụng [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) thay thế. Tuy nhiên, hàm tạo `BigInt` chỉ hỗ trợ các chuỗi biểu diễn số literal (tức là các chuỗi bắt đầu bằng `0b`, `0o`, `0x`). Trong trường hợp cơ số gốc của bạn không phải là nhị phân, bát phân, thập phân hay thập lục phân, bạn có thể cần tự viết bộ chuyển đổi cơ số, hoặc sử dụng thư viện.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
