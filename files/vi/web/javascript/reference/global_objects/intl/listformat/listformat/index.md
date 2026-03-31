---
title: Intl.ListFormat() constructor
short-title: Intl.ListFormat()
slug: Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/ListFormat
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.ListFormat.ListFormat
sidebar: jsref
---

Constructor **`Intl.ListFormat()`** tạo các đối tượng {{jsxref("Intl.ListFormat")}}.

{{InteractiveExample("JavaScript Demo: Intl.ListFormat() constructor", "taller")}}

```js interactive-example
const vehicles = ["Motorcycle", "Bus", "Car"];

const formatter = new Intl.ListFormat("en", {
  style: "long",
  type: "conjunction",
});
console.log(formatter.format(vehicles));
// Expected output: "Motorcycle, Bus, and Car"

const formatter2 = new Intl.ListFormat("de", {
  style: "short",
  type: "disjunction",
});
console.log(formatter2.format(vehicles));
// Expected output: "Motorcycle, Bus oder Car"

const formatter3 = new Intl.ListFormat("en", { style: "narrow", type: "unit" });
console.log(formatter3.format(vehicles));
// Expected output: "Motorcycle Bus Car"
```

## Cú pháp

```js-nolint
new Intl.ListFormat()
new Intl.ListFormat(locales)
new Intl.ListFormat(locales, options)
```

> [!NOTE]
> `Intl.ListFormat()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các mã định danh ngôn ngữ như vậy. Ngôn ngữ mặc định của runtime được sử dụng khi `undefined` được truyền vào hoặc khi không có mã định danh ngôn ngữ nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau, theo thứ tự được lấy ra (tất cả đều tùy chọn):
    - `localeMatcher`
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem [Xác định và thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `type`
      - : Chỉ ra kiểu nhóm. Các giá trị có thể là:
        - `"conjunction"` (mặc định)
          - : Để nhóm các phần tử danh sách dựa trên "and": "A, B, and C"
        - `"disjunction"`
          - : Để nhóm các phần tử danh sách dựa trên "or": "A, B, or C"
        - `"unit"`
          - : Để nhóm các phần tử danh sách như một đơn vị kết hợp (không dựa trên "and" hay "or"): "A, B, C"
    - `style`
      - : Kiểu nhóm (ví dụ: liệu có bao gồm dấu phân cách danh sách và liên từ hay không). Các giá trị có thể là:
        - `"long"` (mặc định)
          - : Định dạng danh sách điển hình. Ví dụ: "A, B, and C"
        - `"short"`
          - : Khoảng cách, độ dài hoặc sự hiện diện của liên từ, và các dấu phân cách có thể thay đổi. Thường bạn sẽ muốn các phần tử đầu vào cũng được viết tắt. Ví dụ: "A, B, & C"
        - `"narrow"`
          - : Nếu có thể, định dạng danh sách được rút gọn thêm, để đầu ra ngắn nhất có thể. Ví dụ: "A, B, C"

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng format

Ví dụ sau cho thấy cách tạo một bộ định dạng danh sách sử dụng ngôn ngữ tiếng Anh.

```js
const list = ["Motorcycle", "Bus", "Car"];

console.log(new Intl.ListFormat("en-GB", { type: "conjunction" }).format(list));
// Motorcycle, Bus and Car

console.log(new Intl.ListFormat("en-GB", { type: "disjunction" }).format(list));
// Motorcycle, Bus or Car
```

### Dấu phẩy Oxford

[Dấu phẩy Oxford](https://en.wikipedia.org/wiki/Serial_comma) là dấu phẩy được đặt ngay trước liên từ kết nối (thường là "and" hoặc "or") trong danh sách ba hoặc nhiều phần tử. Khá gây tranh cãi, ngôn ngữ `en-US` sử dụng dấu phẩy Oxford, trong khi ngôn ngữ `en-GB` thì không.

```js
const list = ["Motorcycle", "Bus", "Car"];

console.log(new Intl.ListFormat("en-GB", { type: "conjunction" }).format(list));
// Motorcycle, Bus and Car

console.log(new Intl.ListFormat("en-US", { type: "conjunction" }).format(list));
// Motorcycle, Bus, and Car
```

### Định dạng đơn vị

Sử dụng `style: "unit"` để định dạng các phần tử danh sách như một đơn vị kết hợp. Trên thực tế, {{jsxref("Intl.DurationFormat")}} sử dụng định dạng danh sách kiểu đơn vị để định dạng thời lượng.

```js
const marathon = [
  [42, "kilometer"],
  [195, "meter"],
];

console.log(
  new Intl.ListFormat("en-US", { type: "unit" }).format(
    marathon.map((component) =>
      component[0].toLocaleString("en-US", {
        style: "unit",
        unit: component[1],
        unitDisplay: "long",
      }),
    ),
  ),
);
// 42 kilometers, 195 meters
```

### Kiểu short và narrow

Các kiểu `"short"` và `"narrow"` hữu ích cho các biểu diễn danh sách gọn nhẹ.

```js
const list = ["Motorcycle", "Bus", "Car"];
console.log(new Intl.ListFormat("en-US", { style: "short" }).format(list));
// Motorcycle, Bus, & Car

console.log(new Intl.ListFormat("en-US", { style: "narrow" }).format(list));
// Motorcycle, Bus, Car

console.log(new Intl.ListFormat("en-GB", { style: "short" }).format(list));
// Motorcycle, Bus and Car

console.log(new Intl.ListFormat("en-GB", { style: "narrow" }).format(list));
// Motorcycle, Bus, Car
```

Các phần tử đầu vào không được chuyển đổi, nhưng bạn sẽ thường muốn rút gọn chúng.

```js
const marathon = [
  [42, "kilometer"],
  [195, "meter"],
];

function formatDistance(locale, distance, style) {
  return new Intl.ListFormat(locale, { type: "unit", style }).format(
    marathon.map((component) =>
      component[0].toLocaleString(locale, {
        style: "unit",
        unit: component[1],
        unitDisplay: style,
      }),
    ),
  );
}

console.log(formatDistance("en-US", marathon, "long"));
// 42 kilometers, 195 meters
console.log(formatDistance("en-US", marathon, "short"));
// 42 km, 195 m
console.log(formatDistance("en-US", marathon, "narrow"));
// 42km 195m
```

### Lựa chọn liên từ

Từ liên từ được sử dụng có thể phụ thuộc vào giá trị chuỗi của các phần tử danh sách. Ví dụ, trong tiếng Tây Ban Nha, liên từ là `"y"` cho hầu hết các từ, nhưng là `"e"` cho các từ bắt đầu bằng nguyên âm `"i"`.

```js
const words = ["fuerte", "indomable"];
const formatter = new Intl.ListFormat("es-ES", { type: "conjunction" });

console.log(formatter.format(words));
// fuerte e indomable
console.log(formatter.format(words.toReversed()));
// indomable y fuerte
```

Thuật toán được sử dụng để xác định liên từ không hoàn hảo (ví dụ: nó không thể luôn xác định cách phát âm của một từ từ cách viết), nhưng nó nên hoạt động trong trường hợp chung.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Intl")}}
