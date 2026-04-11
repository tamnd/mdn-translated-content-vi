---
title: "HTMLSelectElement: phương thức remove()"
short-title: remove()
slug: Web/API/HTMLSelectElement/remove
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.remove
---

{{ APIRef("HTML DOM") }}

Phương thức **`HTMLSelectElement.remove()`** xóa phần tử tại chỉ số được chỉ định khỏi tập hợp tùy chọn của phần tử `select` này.

## Cú pháp

```js-nolint
remove(index)
```

### Tham số

- `index`
  - : Một số nguyên bắt đầu từ 0 biểu thị chỉ số của {{ domxref("HTMLOptionElement") }} cần xóa khỏi tập hợp. Nếu không tìm thấy chỉ số, phương thức sẽ không có tác dụng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```html
<select id="existingList" name="existingList">
  <option value="1">Option: Value 1</option>
  <option value="2">Option: Value 2</option>
  <option value="3">Option: Value 3</option>
</select>
```

```js
let sel = document.getElementById("existingList");
sel.remove(1);
```

HTML hiện giờ là:

```html
<select id="existingList" name="existingList">
  <option value="1">Option: Value 1</option>
  <option value="3">Option: Value 3</option>
</select>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Element.remove") }}, phương thức được gọi khi remove được gọi mà không có đối số trên một {{ domxref("HTMLSelectElement") }}.
- {{domxref("HTMLSelectElement")}} triển khai nó.
