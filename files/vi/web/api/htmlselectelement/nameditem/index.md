---
title: "HTMLSelectElement: phương thức namedItem()"
short-title: namedItem()
slug: Web/API/HTMLSelectElement/namedItem
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.namedItem
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLSelectElement.namedItem()`** trả về {{domxref("HTMLOptionElement")}} tương ứng với phần tử {{domxref("HTMLOptionElement")}} có `name` hoặc `id` khớp với tên đã chỉ định, hoặc `null` nếu không có option nào khớp.

Trong JavaScript, dùng `selectElt.namedItem('value')` tương đương với `selectElt.options.namedItem('value')`.

## Cú pháp

```js-nolint
namedItem(str)
```

### Tham số

- `str`
  - : Một chuỗi đại diện cho `name` hoặc `id` của option.

### Giá trị trả về

Một {{domxref("HTMLOptionElement")}} hoặc `null`.

## Ví dụ

### HTML

```html
<form>
  <select id="myFormControl">
    <option id="o1">Opt 1</option>
    <option id="o2">Opt 2</option>
  </select>
</form>
```

### JavaScript

```js
let selectElt = document.getElementById("myFormControl");
elem1 = selectElt.namedItem("o1"); // Returns the HTMLOptionElement representing #o1
```

Nhưng bạn không thể viết:

```js
let selectElt = document.getElementById("myFormControl");
elem1 = selectElt.o1; // Returns undefined
elem1 = selectElt["o1"]; // Returns undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSelectElement")}} triển khai nó.
