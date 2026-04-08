---
title: Intl.Collator
slug: Web/JavaScript/Reference/Global_Objects/Intl/Collator
page-type: javascript-class
browser-compat: javascript.builtins.Intl.Collator
sidebar: jsref
---

Đối tượng **`Intl.Collator`** cho phép so sánh chuỗi nhạy cảm ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.Collator")}}

```js interactive-example
console.log(["Z", "a", "z", "ä"].sort(new Intl.Collator("de").compare));
// Expected output: Array ["a", "ä", "z", "Z"]

console.log(["Z", "a", "z", "ä"].sort(new Intl.Collator("sv").compare));
// Expected output: Array ["a", "z", "Z", "ä"]

console.log(
  ["Z", "a", "z", "ä"].sort(
    new Intl.Collator("de", { caseFirst: "upper" }).compare,
  ),
);
// Expected output: Array ["a", "ä", "Z", "z"]
```

## Constructor

- {{jsxref("Intl/Collator/Collator", "Intl.Collator()")}}
  - : Tạo một đối tượng `Collator` mới.

## Phương thức tĩnh

- {{jsxref("Intl/Collator/supportedLocalesOf", "Intl.Collator.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các ngôn ngữ được hỗ trợ trong số các ngôn ngữ đã cung cấp mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.Collator.prototype` và được chia sẻ bởi tất cả các instance `Intl.Collator`.

- {{jsxref("Object/constructor", "Intl.Collator.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Intl.Collator`, giá trị khởi tạo là constructor {{jsxref("Intl/Collator/Collator", "Intl.Collator")}}.
- `Intl.Collator.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.Collator"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/Collator/compare", "Intl.Collator.prototype.compare()")}}
  - : Hàm getter so sánh hai chuỗi theo thứ tự sắp xếp của đối tượng `Intl.Collator` này.
- {{jsxref("Intl/Collator/resolvedOptions", "Intl.Collator.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn ngôn ngữ và đối chiếu được tính toán trong quá trình khởi tạo đối tượng.

## Ví dụ

### Sử dụng Collator

Ví dụ sau minh họa các kết quả khác nhau có thể xảy ra khi một chuỗi xuất hiện trước, sau, hoặc ở cùng cấp độ với một chuỗi khác:

```js
console.log(new Intl.Collator().compare("a", "c")); // -1, hoặc một giá trị âm khác
console.log(new Intl.Collator().compare("c", "a")); // 1, hoặc một giá trị dương khác
console.log(new Intl.Collator().compare("a", "a")); // 0
```

Lưu ý rằng các kết quả hiển thị trong đoạn mã trên có thể thay đổi tùy theo trình duyệt và phiên bản trình duyệt. Điều này là do các giá trị phụ thuộc vào triển khai cụ thể. Đặc tả chỉ yêu cầu rằng các giá trị trước và sau là âm và dương.

### Sử dụng locales

Kết quả do [`Intl.Collator.prototype.compare()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/compare) cung cấp thay đổi theo từng ngôn ngữ. Để có thứ tự sắp xếp của ngôn ngữ được dùng trong giao diện người dùng của ứng dụng, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng cách sử dụng đối số `locales`:

```js
// in German, ä sorts with a
console.log(new Intl.Collator("de").compare("ä", "z"));
// -1, hoặc một giá trị âm khác

// in Swedish, ä sorts after z
console.log(new Intl.Collator("sv").compare("ä", "z"));
// 1, hoặc một giá trị dương khác
```

### Sử dụng options

Kết quả do [`Intl.Collator.prototype.compare()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/compare) cung cấp có thể được tùy chỉnh bằng cách sử dụng đối số `options`:

```js
// in German, ä has a as the base letter
console.log(new Intl.Collator("de", { sensitivity: "base" }).compare("ä", "a"));
// 0

// in Swedish, ä and a are separate base letters
console.log(new Intl.Collator("sv", { sensitivity: "base" }).compare("ä", "a"));
// 1, hoặc một giá trị dương khác
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl")}}
- {{jsxref("String.prototype.localeCompare()")}}
