---
title: "HTMLSelectElement: phương thức item()"
short-title: item()
slug: Web/API/HTMLSelectElement/item
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.item
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLSelectElement.item()`** trả về {{domxref("Element")}} tương ứng với {{domxref("HTMLOptionElement")}} có vị trí trong danh sách tùy chọn khớp với chỉ số được truyền vào tham số, hoặc `null` nếu không có phần tử nào.

Trong JavaScript, dùng cú pháp ngoặc vuông với một `unsigned long`, như `selectElt[index]`, tương đương với `selectElt.namedItem(index)`.

## Cú pháp

```js-nolint
item(index)
// or collection[index]
```

### Tham số

- `index`
  - : Một số nguyên không âm biểu thị vị trí của option trong danh sách.

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
// Returns the HTMLOptionElement representing #o2
elem1 = document.forms[0]["myFormControl"][1];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSelectElement")}} triển khai nó.
