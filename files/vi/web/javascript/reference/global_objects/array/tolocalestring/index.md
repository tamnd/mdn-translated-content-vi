---
title: Array.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/Array/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các đối tượng {{jsxref("Array")}} trả về một chuỗi đại diện cho các phần tử của mảng. Các phần tử được chuyển đổi thành chuỗi bằng phương thức `toLocaleString` của chúng và các chuỗi này được phân tách bằng một chuỗi theo ngôn ngữ địa phương (chẳng hạn như dấu phẩy ",").

{{InteractiveExample("JavaScript Demo: Array.prototype.toLocaleString()", "shorter")}}

```js interactive-example
const array = [1, "a", new Date("21 Dec 1997 14:12:00 UTC")];
const localeString = array.toLocaleString("en", { timeZone: "UTC" });

console.log(localeString);
// Expected output: "1,a,12/21/1997, 2:12:00 PM",
// This assumes "en" locale and UTC timezone - your results may vary
```

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi có {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Để biết dạng tổng quát và cách diễn giải tham số `locales`, xem [mô tả tham số trên trang chính của `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính cấu hình. Những gì bạn có thể truyền ở đây phụ thuộc vào loại phần tử đang được chuyển đổi. Ví dụ, đối với số, xem {{jsxref("Number.prototype.toLocaleString()")}}.

### Giá trị trả về

Một chuỗi đại diện cho các phần tử của mảng.

## Mô tả

Phương thức `Array.prototype.toLocaleString` duyệt nội dung của nó, gọi phương thức `toLocaleString` của từng phần tử với các tham số `locales` và `options` được cung cấp, và nối chúng lại với một dấu phân cách được xác định bởi cài đặt (chẳng hạn như dấu phẩy ",").

> [!NOTE]
> Các đối số `locales` hoặc `options` không kiểm soát dấu phân cách được dùng giữa các phần tử mảng; chúng chỉ đơn giản được truyền đến phương thức `toLocaleString()` của từng phần tử. Dấu phân cách thực tế (thường là dấu phẩy) phụ thuộc hoàn toàn vào ngôn ngữ địa phương hiện tại của máy chủ. Nếu bạn muốn định dạng danh sách theo ngôn ngữ địa phương, hãy xem xét dùng {{jsxref("Intl.ListFormat")}} thay thế.

Nếu một phần tử là `undefined`, `null`, nó được chuyển đổi thành chuỗi rỗng thay vì chuỗi `"null"` hoặc `"undefined"`.

Khi được dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `toLocaleString()` lặp qua các vị trí trống như thể chúng có giá trị `undefined`.

Phương thức `toLocaleString()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sử dụng locales và options

Các phần tử của mảng được chuyển đổi thành chuỗi bằng phương thức `toLocaleString` của chúng. Ví dụ, đoạn code sau ngầm gọi phương thức {{jsxref("Number.prototype.toLocaleString()")}} để hiển thị tiền tệ cho các chuỗi và số trong mảng `prices`:

```js
const prices = ["￥7", 500, 8123, 12];
prices.toLocaleString("ja-JP", { style: "currency", currency: "JPY" });

// "￥7,￥500,￥8,123,￥12"
```

### Dấu phân cách danh sách

Dấu phân cách danh sách không bị ảnh hưởng bởi tham số `locales`. Để cấu hình nó, hãy dùng {{jsxref("Intl.ListFormat")}} thay thế.

```js
const nums = [8888, 9999];
console.log(nums.toLocaleString("zh")); // "8,888,9,999"

const formatter = new Intl.ListFormat("zh", {
  type: "conjunction",
  style: "narrow",
});
console.log(formatter.format(nums.map((x) => x.toLocaleString("zh"))));
// "8,888、9,999"
```

### Sử dụng toLocaleString() trên mảng thưa

`toLocaleString()` xử lý các vị trí trống giống như `undefined` và tạo ra dấu phân cách thừa:

```js
console.log([1, , 3].toLocaleString()); // '1,,3'
```

### Gọi toLocaleString() trên đối tượng không phải mảng

Phương thức `toLocaleString()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 1,
  1: 2,
  2: 3,
  3: 4, // ignored by toLocaleString() since length is 3
};
console.log(Array.prototype.toLocaleString.call(arrayLike));
// 1,2,3
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.toString()")}}
- {{jsxref("TypedArray.prototype.toLocaleString()")}}
- {{jsxref("Intl")}}
- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Object.prototype.toLocaleString()")}}
- {{jsxref("Number.prototype.toLocaleString()")}}
- {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}
