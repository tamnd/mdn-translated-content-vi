---
title: Intl.NumberFormat.prototype.formatToParts()
short-title: formatToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/formatToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.NumberFormat.formatToParts
sidebar: jsref
---

Phương thức **`formatToParts()`** của các instance {{jsxref("Intl.NumberFormat")}} trả về một mảng các đối tượng đại diện cho từng phần của chuỗi được định dạng mà {{jsxref("Intl/NumberFormat/format", "format()")}} sẽ trả về. Nó hữu ích để xây dựng chuỗi tùy chỉnh từ các token theo locale.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat.prototype.formatToParts()")}}

```js interactive-example
const amount = 654321.987;
const options = { style: "currency", currency: "USD" };
const numberFormat = new Intl.NumberFormat("en-US", options);

const parts = numberFormat.formatToParts(amount);
const partValues = parts.map((p) => p.value);

console.log(partValues);
// Expected output: "["$", "654", ",", "321", ".", "99"]"
```

## Cú pháp

```js-nolint
formatToParts(number)
```

### Tham số

- `number`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng. Chuỗi được phân tích cú pháp theo cách tương tự như trong [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), ngoại trừ `formatToParts()` sẽ dùng giá trị chính xác mà chuỗi đại diện, tránh mất độ chính xác trong quá trình chuyển đổi ngầm định thành số.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa số được định dạng theo từng phần. Mỗi đối tượng có hai thuộc tính, `type` và `value`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi các `value`, theo thứ tự được cung cấp, sẽ tạo ra cùng chuỗi như {{jsxref("Intl/NumberFormat/format", "format()")}}. `type` có thể là một trong các giá trị sau:

- `literal`
  - : Bất kỳ chuỗi nào là một phần của mẫu định dạng; ví dụ `" "`. Lưu ý rằng các token phổ biến như dấu phân cách thập phân hoặc dấu cộng/trừ có các kiểu token riêng của chúng.
- `integer`
  - : Phần nguyên của số, hoặc một đoạn của nó nếu sử dụng nhóm (được kiểm soát bởi `options.useGrouping`).
- `group`
  - : Chuỗi phân cách nhóm, chẳng hạn như `","`. Chỉ có mặt khi sử dụng nhóm (được kiểm soát bởi `options.useGrouping`).
- `decimal`
  - : Chuỗi dấu phân cách thập phân, chẳng hạn như `"."`. Chỉ có mặt khi `fraction` có mặt.
- `fraction`
  - : Phần thập phân của số.
- `compact`
  - : Số mũ compact, chẳng hạn như `"M"` hoặc `"thousands"`. Chỉ có mặt khi `options.notation` là `"compact"`. Dạng (`"short"` hoặc `"long"`) có thể được kiểm soát qua `options.compactDisplay`.
- `exponentSeparator`
  - : Dấu phân cách số mũ, chẳng hạn như `"E"`. Chỉ có mặt khi `options.notation` là `"scientific"` hoặc `"engineering"`.
- `exponentMinusSign`
  - : Chuỗi dấu trừ của số mũ, chẳng hạn như `"-"`. Chỉ có mặt khi `options.notation` là `"scientific"` hoặc `"engineering"` và số mũ âm.
- `exponentInteger`
  - : Giá trị nguyên của số mũ. Chỉ có mặt khi `options.notation` là `"scientific"` hoặc `"engineering"`.
- `nan`
  - : Chuỗi đại diện cho {{jsxref("NaN")}}, chẳng hạn như `"NaN"`. Đây là token duy nhất đại diện cho chính số khi số là `NaN`.
- `infinity`
  - : Chuỗi đại diện cho {{jsxref("Infinity")}} hoặc `-Infinity`, chẳng hạn như `"∞"`. Đây là token duy nhất đại diện cho chính số khi số là `Infinity` hoặc `-Infinity`.
- `plusSign`
  - : Dấu cộng, chẳng hạn như `"+"`.
- `minusSign`
  - : Dấu trừ, chẳng hạn như `"-"`.
- `percentSign`
  - : Ký hiệu phần trăm, chẳng hạn như `"%"`. Chỉ có mặt khi `options.style` là `"percent"`.
- `unit`
  - : Chuỗi đơn vị, chẳng hạn như `"l"` hoặc `"litres"`. Chỉ có mặt khi `options.style` là `"unit"`. Dạng (`"short"`, `"narrow"` hoặc `"long"`) có thể được kiểm soát qua `options.unitDisplay`.
- `currency`
  - : Chuỗi tiền tệ, chẳng hạn như `"$"`, `"€"`, `"Dollar"` hoặc `"Euro"`. Chỉ có mặt khi `options.style` là `"currency"`. Dạng (`"code"`, `"symbol"`, `"narrowSymbol"` hoặc `"name"`) có thể được kiểm soát qua `options.currencyDisplay`.
- `unknown`
  - : Dành riêng cho bất kỳ token nào không được nhận diện là một trong các loại trên; ít khi gặp.

## Ví dụ

### Sử dụng formatToParts()

Phương thức `format()` xuất ra các chuỗi được bản địa hóa, không thể thao tác trực tiếp:

```js
const number = 3500;

const formatter = new Intl.NumberFormat("de-DE", {
  style: "currency",
  currency: "EUR",
});

formatter.format(number);
// "3.500,00 €"
```

Tuy nhiên, trong nhiều giao diện người dùng, bạn có thể muốn tùy chỉnh định dạng của chuỗi này hoặc xen kẽ nó với các văn bản khác. Phương thức `formatToParts()` cung cấp cùng thông tin đó theo từng phần:

```js
formatter.formatToParts(number);

// return value:
[
  { type: "integer", value: "3" },
  { type: "group", value: "." },
  { type: "integer", value: "500" },
  { type: "decimal", value: "," },
  { type: "fraction", value: "00" },
  { type: "literal", value: " " },
  { type: "currency", value: "€" },
];
```

Bây giờ thông tin có sẵn riêng lẻ và có thể được định dạng và nối lại theo cách tùy chỉnh. Ví dụ, bằng cách sử dụng {{jsxref("Array.prototype.map()")}}, [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), [câu lệnh switch](/en-US/docs/Web/JavaScript/Reference/Statements/switch), [template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals) và {{jsxref("Array.prototype.join()")}}, để chèn thêm markup cho các thành phần nhất định.

```js
const numberString = formatter
  .formatToParts(number)
  .map(({ type, value }) => {
    switch (type) {
      case "currency":
        return `<strong>${value}</strong>`;
      default:
        return value;
    }
  })
  .join("");

console.log(numberString);
// "3.500,00 <strong>€</strong>"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Intl/NumberFormat/format", "Intl.NumberFormat.prototype.format()")}}
