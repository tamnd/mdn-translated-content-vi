---
title: "StyleSheetList: phương thức item()"
short-title: item()
slug: Web/API/StyleSheetList/item
page-type: web-api-instance-method
browser-compat: api.StyleSheetList.item
---

{{APIRef("CSSOM")}}

Phương thức **`item()`** của giao diện {{domxref("StyleSheetList")}} trả về một đối tượng {{domxref("CSSStyleSheet")}} duy nhất.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Một số nguyên là chỉ mục của item trong bộ sưu tập cần trả về.

### Giá trị trả về

Một đối tượng {{domxref("CSSStyleSheet")}}, hoặc `null` nếu không có item nào tồn tại cho chỉ mục này.

## Ví dụ

Trong ví dụ sau, một vòng lặp for in ra mỗi đối tượng {{domxref("CSSStyleSheet")}} riêng lẻ ra console, bằng cách gọi `item` với giá trị của `i`.

```js
let list = document.styleSheets;

for (let i = 0; i < list.length; i++) {
  console.log(list.item(i));
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
