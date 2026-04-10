---
title: "Selection: phương thức selectAllChildren()"
short-title: selectAllChildren()
slug: Web/API/Selection/selectAllChildren
page-type: web-api-instance-method
browser-compat: api.Selection.selectAllChildren
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.selectAllChildren()`** thêm tất cả các phần tử con của nút đã chỉ định vào vùng chọn. Vùng chọn trước đó sẽ bị mất.

## Cú pháp

```js-nolint
selectAllChildren(parentNode)
```

### Tham số

- `parentNode`
  - : Tất cả các phần tử con của `parentNode` sẽ được chọn. Bản thân `parentNode` không thuộc vùng chọn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### HTML

```html
<main>
  <button>Select Footer</button>
  <p>Welcome to my website.</p>
  <p>I hope you enjoy your visit.</p>
</main>
<footer>
  <address>webmaster@example.com</address>
  <p>© 2019</p>
</footer>
```

### JavaScript

```js
const button = document.querySelector("button");
const footer = document.querySelector("footer");

button.addEventListener("click", (e) => {
  window.getSelection().selectAllChildren(footer);
});
```

### Kết quả

{{EmbedLiveSample("Examples", 700, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
