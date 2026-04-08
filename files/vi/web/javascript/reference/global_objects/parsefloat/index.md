---
title: parseFloat()
slug: Web/JavaScript/Reference/Global_Objects/parseFloat
page-type: javascript-function
browser-compat: javascript.builtins.parseFloat
sidebar: jssidebar
---

Hàm **`parseFloat()`** phân tích cú pháp đối số chuỗi và trả về một số dấu phẩy động.

{{InteractiveExample("JavaScript Demo: parseFloat()")}}

```js interactive-example
function circumference(r) {
  return parseFloat(r) * 2.0 * Math.PI;
}

console.log(circumference(4.567));
// Expected output: 28.695307297889173

console.log(circumference("4.567abcdefgh"));
// Expected output: 28.695307297889173

console.log(circumference("abcdefgh"));
// Expected output: NaN
```

## Cú pháp

```js-nolint
parseFloat(string)
```

### Tham số

- `string`
  - : Giá trị cần phân tích, [ép thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Khoảng trắng đầu {{Glossary("whitespace")}} trong đối số này bị bỏ qua.

### Giá trị trả về

Một số dấu phẩy động được phân tích từ `string` đã cho, hoặc {{jsxref("NaN")}} khi ký tự đầu tiên không phải khoảng trắng không thể chuyển đổi thành số.

> [!NOTE]
> JavaScript không có sự phân biệt giữa "số dấu phẩy động" và "số nguyên" ở cấp độ ngôn ngữ. [`parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) và `parseFloat()` chỉ khác nhau ở hành vi phân tích cú pháp, không nhất thiết ở giá trị trả về. Ví dụ, `parseInt("42")` và `parseFloat("42")` sẽ trả về cùng giá trị: {{jsxref("Number")}} 42.

## Mô tả

Hàm `parseFloat` chuyển đổi đối số đầu tiên của nó thành chuỗi, phân tích chuỗi đó như một literal số thập phân, sau đó trả về một số hoặc `NaN`. Cú pháp số mà nó chấp nhận có thể được tóm tắt như sau:

- Các ký tự được `parseFloat()` chấp nhận là dấu cộng (`+`), dấu trừ (`-` U+002D HYPHEN-MINUS), chữ số thập phân (`0` – `9`), dấu chấm thập phân (`.`), chỉ số mũ (`e` hoặc `E`), và literal `"Infinity"`.
- Các dấu `+`/`-` chỉ có thể xuất hiện chính xác ở đầu chuỗi, hoặc ngay sau ký tự `e`/`E`. Dấu chấm thập phân chỉ có thể xuất hiện một lần, và chỉ trước ký tự `e`/`E`. Ký tự `e`/`E` chỉ có thể xuất hiện một lần, và chỉ khi có ít nhất một chữ số trước nó.
- Khoảng trắng đầu trong đối số bị cắt bỏ và bỏ qua.
- `parseFloat()` cũng có thể phân tích cú pháp và trả về {{jsxref("Infinity")}} hoặc `-Infinity` nếu chuỗi bắt đầu bằng `"Infinity"` hoặc `"-Infinity"` đứng trước không hoặc nhiều khoảng trắng.
- `parseFloat()` chọn chuỗi con dài nhất bắt đầu từ đầu tạo ra một literal số hợp lệ. Nếu gặp ký tự không hợp lệ, nó trả về số được biểu diễn đến điểm đó, bỏ qua ký tự không hợp lệ và tất cả các ký tự theo sau.
- Nếu ký tự đầu tiên của đối số không thể bắt đầu một literal số hợp lệ theo cú pháp trên, `parseFloat` trả về {{jsxref("NaN")}}.

Về mặt cú pháp, `parseFloat()` phân tích một tập con cú pháp mà hàm [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) chấp nhận. Cụ thể, `parseFloat()` không hỗ trợ các literal không thập phân với tiền tố `0x`, `0b`, hoặc `0o` nhưng hỗ trợ tất cả các thứ khác. Tuy nhiên, `parseFloat()` dễ tính hơn `Number()` vì nó bỏ qua các ký tự không hợp lệ ở cuối, điều mà sẽ khiến `Number()` trả về `NaN`.

Tương tự với các literal số và `Number()`, số trả về từ `parseFloat()` có thể không chính xác bằng với số được biểu diễn bởi chuỗi, do phạm vi và độ không chính xác của dấu phẩy động. Đối với các số ngoài phạm vi `-1.7976931348623158e+308` đến `1.7976931348623158e+308` (xem {{jsxref("Number.MAX_VALUE")}}), `-Infinity` hoặc `Infinity` được trả về.

## Ví dụ

### Dùng parseFloat()

Tất cả các ví dụ sau đều trả về `3.14`:

```js
parseFloat(3.14);
parseFloat("3.14");
parseFloat("  3.14  ");
parseFloat("314e-2");
parseFloat("0.0314E+2");
parseFloat("3.14some non-digit characters");
parseFloat({
  toString() {
    return "3.14";
  },
});
```

### parseFloat() trả về NaN

Ví dụ sau trả về `NaN`:

```js
parseFloat("FF2");
```

Ngẫu nhiên, vì bản thân chuỗi `NaN` là cú pháp không hợp lệ theo `parseFloat()`, việc truyền `"NaN"` cũng trả về `NaN`.

```js
parseFloat("NaN"); // NaN
```

### Trả về Infinity

Giá trị Infinity được trả về khi số nằm ngoài phạm vi định dạng IEEE 754-2019 64-bit độ chính xác kép:

```js
parseFloat("1.7976931348623159e+308"); // Infinity
parseFloat("-1.7976931348623159e+308"); // -Infinity
```

Infinity cũng được trả về khi chuỗi bắt đầu bằng `"Infinity"` hoặc `"-Infinity"`:

```js
parseFloat("Infinity"); // Infinity
parseFloat("-Infinity"); // -Infinity
```

### Tương tác với giá trị BigInt

`parseFloat()` không xử lý các giá trị {{jsxref("BigInt")}}. Nó dừng lại ở ký tự `n`, và coi chuỗi đứng trước là số nguyên bình thường, có thể mất độ chính xác. Nếu giá trị BigInt được truyền vào `parseFloat()`, nó sẽ được chuyển đổi thành chuỗi, và chuỗi sẽ được phân tích cú pháp như một số dấu phẩy động, điều này cũng có thể dẫn đến mất độ chính xác.

```js example-bad
parseFloat(900719925474099267n); // 900719925474099300
parseFloat("900719925474099267n"); // 900719925474099300
```

Bạn nên truyền chuỗi vào hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) thay thế, không có ký tự `n` ở cuối.

```js example-good
BigInt("900719925474099267");
// 900719925474099267n
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("parseInt()")}}
- {{jsxref("Number.parseFloat()")}}
- {{jsxref("Number.parseInt()")}}
- {{jsxref("Number.prototype.toFixed()")}}
