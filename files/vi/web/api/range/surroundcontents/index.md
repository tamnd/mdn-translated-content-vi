---
title: "Range: phương thức surroundContents()"
short-title: surroundContents()
slug: Web/API/Range/surroundContents
page-type: web-api-instance-method
browser-compat: api.Range.surroundContents
---

{{APIRef("DOM")}}

Phương thức **`surroundContents()`** của giao diện {{domxref("Range")}} bao quanh nội dung đã chọn bằng một nút được cung cấp. Nó trích xuất nội dung của range, thay thế các nút con của `newParent` bằng nội dung đã trích xuất, chèn `newParent` vào vị trí của nội dung đã trích xuất, rồi làm cho range chọn `newParent`.

Một ngoại lệ sẽ được ném ra nếu range chỉ chứa một phần của bất kỳ nút nào không phải {{domxref("Text")}}. Range phải chỉ chứa các nút văn bản và các nút được chọn hoàn toàn.

## Cú pháp

```js-nolint
surroundContents(newParent)
```

### Tham số

- `newParent`
  - : Một {{domxref("Node")}} dùng để bao quanh nội dung.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### HTML

```html
<span class="header-text">Put this in a headline</span>
```

### JavaScript

```js
const range = document.createRange();
const newParent = document.createElement("h1");

range.selectNode(document.querySelector(".header-text"));
range.surroundContents(newParent);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
