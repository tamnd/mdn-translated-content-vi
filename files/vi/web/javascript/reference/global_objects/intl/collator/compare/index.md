---
title: Intl.Collator.prototype.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Collator/compare
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Collator.compare
sidebar: jsref
---

Phương thức **`compare()`** của các instance {{jsxref("Intl.Collator")}} so sánh hai chuỗi theo thứ tự sắp xếp của đối tượng collator này.

{{InteractiveExample("JavaScript Demo: Intl.Collator.prototype.compare()")}}

```js interactive-example
const enCollator = new Intl.Collator("en");
const deCollator = new Intl.Collator("de");
const svCollator = new Intl.Collator("sv");

console.log(enCollator.compare("z", "a") > 0);
// Expected output: true

console.log(deCollator.compare("z", "ä") > 0);
// Expected output: true

console.log(svCollator.compare("z", "ä") > 0);
// Expected output: false
```

## Cú pháp

```js-nolint
compare(string1, string2)
```

### Tham số

- `string1`, `string2`
  - : Các chuỗi cần so sánh với nhau.

### Giá trị trả về

Một số biểu thị mối quan hệ thứ tự giữa `string1` và `string2` theo thứ tự sắp xếp của đối tượng {{jsxref("Intl.Collator")}} này:

- Một giá trị âm nếu `string1` đứng trước `string2`;
- Một giá trị dương nếu `string1` đứng sau `string2`;
- 0 nếu chúng được coi là bằng nhau.

## Ví dụ

### Sử dụng compare để sắp xếp mảng

Sử dụng hàm `compare` để sắp xếp các mảng. Lưu ý rằng hàm này được ràng buộc với collator từ đó nó được lấy ra, vì vậy nó có thể được truyền trực tiếp đến {{jsxref("Array.prototype.sort()")}}.

```js
const a = ["Offenbach", "Österreich", "Odenwald"];
const collator = new Intl.Collator("de-u-co-phonebk");
a.sort(collator.compare);
console.log(a.join(", ")); // "Odenwald, Österreich, Offenbach"
```

### Sử dụng compare để tìm kiếm trong mảng

Sử dụng hàm `compare` để tìm các chuỗi khớp trong mảng:

```js
const a = ["Congrès", "congres", "Assemblée", "poisson"];
const collator = new Intl.Collator("fr", {
  usage: "search",
  sensitivity: "base",
});
const s = "congres";
const matches = a.filter((v) => collator.compare(v, s) === 0);
console.log(matches.join(", ")); // "Congrès, congres"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Collator")}}
- {{jsxref("String.prototype.localeCompare()")}}
