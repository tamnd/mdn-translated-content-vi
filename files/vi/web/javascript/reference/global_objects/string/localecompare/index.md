---
title: String.prototype.localeCompare()
short-title: localeCompare()
slug: Web/JavaScript/Reference/Global_Objects/String/localeCompare
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.localeCompare
sidebar: jsref
---

Phương thức **`localeCompare()`** của các giá trị {{jsxref("String")}} trả về một số cho biết string này đứng trước, sau, hay bằng với string đã cho trong thứ tự sắp xếp. Trong các triển khai có hỗ trợ [API `Intl.Collator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator), phương thức này ủy quyền cho `Intl.Collator`.

Khi so sánh số lượng lớn string, chẳng hạn như sắp xếp mảng lớn, tốt hơn là tạo một đối tượng {{jsxref("Intl.Collator")}} và sử dụng hàm được cung cấp bởi phương thức {{jsxref("Intl/Collator/compare", "compare()")}} của nó.

{{InteractiveExample("JavaScript Demo: String.prototype.localeCompare()")}}

```js interactive-example
const a = "réservé"; // With accents, lowercase
const b = "RESERVE"; // No accents, uppercase

console.log(a.localeCompare(b));
// Expected output: 1
console.log(a.localeCompare(b, "en", { sensitivity: "base" }));
// Expected output: 0
```

## Cú pháp

```js-nolint
localeCompare(compareString)
localeCompare(compareString, locales)
localeCompare(compareString, locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ mà các quy ước định dạng của nó nên được sử dụng.

Trong các triển khai hỗ trợ [API `Intl.Collator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.Collator()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator). Các triển khai không có hỗ trợ `Intl.Collator` được yêu cầu bỏ qua cả hai tham số, làm cho kết quả so sánh được trả về hoàn toàn phụ thuộc vào triển khai — chỉ cần _nhất quán_.

- `compareString`
  - : String mà `referenceStr` được so sánh với. Tất cả các giá trị đều được [ép kiểu thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua hoặc truyền `undefined` khiến `localeCompare()` so sánh với string `"undefined"`, điều này hiếm khi bạn muốn.
- `locales` {{optional_inline}}
  - : Một string với {{glossary("BCP 47 language tag")}}, hoặc một mảng các string như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator#locales) của constructor `Intl.Collator()`.

    Trong các triển khai không có hỗ trợ `Intl.Collator`, tham số này bị bỏ qua và thường sử dụng locale của host.

- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator#options) của constructor `Intl.Collator()`.

    Trong các triển khai không có hỗ trợ `Intl.Collator`, tham số này bị bỏ qua.

Xem [constructor `Intl.Collator()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator) để biết chi tiết về các tham số `locales` và `options` và cách sử dụng chúng.

### Giá trị trả về

Một số **âm** nếu `referenceStr` xuất hiện trước `compareString`; **dương** nếu `referenceStr` xuất hiện sau `compareString`; `0` nếu chúng tương đương.

Trong các triển khai với `Intl.Collator`, điều này tương đương với `new Intl.Collator(locales, options).compare(referenceStr, compareString)`.

## Mô tả

Trả về một số nguyên cho biết `referenceStr` đứng trước, sau hoặc tương đương với `compareString`.

- Âm khi `referenceStr` đứng trước `compareString`
- Dương khi `referenceStr` đứng sau `compareString`
- Trả về `0` nếu chúng tương đương

> [!WARNING]
> Đừng dựa vào các giá trị trả về chính xác là `-1` hoặc `1`!
>
> Các kết quả số nguyên âm và dương khác nhau giữa các trình duyệt (cũng như giữa các phiên bản trình duyệt) vì đặc tả ECMAScript chỉ yêu cầu các giá trị âm và dương. Một số trình duyệt có thể trả về `-2` hoặc `2`, hoặc thậm chí một số giá trị âm hoặc dương nào đó.

## Ví dụ

### Sử dụng localeCompare()

```js
// The letter "a" is before "c" yielding a negative value
"a".localeCompare("c"); // -2 or -1 (or some other negative value)

// Alphabetically the word "check" comes after "against" yielding a positive value
"check".localeCompare("against"); // 2 or 1 (or some other positive value)

// "a" and "a" are equivalent yielding a neutral value of zero
"a".localeCompare("a"); // 0
```

### Sắp xếp một mảng

`localeCompare()` cho phép sắp xếp không phân biệt chữ hoa chữ thường cho một mảng.

```js
const items = ["réservé", "Premier", "Cliché", "communiqué", "café", "Adieu"];
items.sort((a, b) => a.localeCompare(b, "fr", { ignorePunctuation: true }));
// ['Adieu', 'café', 'Cliché', 'communiqué', 'Premier', 'réservé']
```

### Kiểm tra hỗ trợ trình duyệt cho các đối số mở rộng

Các đối số `locales` và `options` chưa được hỗ trợ trong tất cả các trình duyệt.

Để kiểm tra xem một triển khai có hỗ trợ chúng hay không, hãy sử dụng đối số `"i"` (một yêu cầu rằng các thẻ ngôn ngữ không hợp lệ bị từ chối) và tìm kiếm ngoại lệ {{jsxref("RangeError")}}:

```js
function localeCompareSupportsLocales() {
  try {
    "foo".localeCompare("bar", "i");
  } catch (e) {
    return e.name === "RangeError";
  }
  return false;
}
```

### Sử dụng locales

Các kết quả do `localeCompare()` cung cấp khác nhau giữa các ngôn ngữ. Để có thứ tự sắp xếp của ngôn ngữ được sử dụng trong giao diện người dùng ứng dụng của bạn, hãy chắc chắn chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng cách sử dụng đối số `locales`:

```js
console.log("ä".localeCompare("z", "de")); // a negative value: in German, ä sorts before z
console.log("ä".localeCompare("z", "sv")); // a positive value: in Swedish, ä sorts after z
```

### Sử dụng options

Các kết quả do `localeCompare()` cung cấp có thể được tùy chỉnh bằng đối số `options`:

```js
// in German, ä has a as the base letter
console.log("ä".localeCompare("a", "de", { sensitivity: "base" })); // 0

// in Swedish, ä and a are separate base letters
console.log("ä".localeCompare("a", "sv", { sensitivity: "base" })); // a positive value
```

### Sắp xếp số

```js
// by default, "2" > "10"
console.log("2".localeCompare("10")); // 1

// numeric using options:
console.log("2".localeCompare("10", undefined, { numeric: true })); // -1

// numeric using locales tag:
console.log("2".localeCompare("10", "en-u-kn-true")); // -1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Intl.Collator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator)
