---
title: "CharacterData: phương thức remove()"
short-title: remove()
slug: Web/API/CharacterData/remove
page-type: web-api-instance-method
browser-compat: api.CharacterData.remove
---

{{APIRef("DOM")}}

Phương thức **`remove()`** của {{domxref("CharacterData")}} xóa nó khỏi nút cha của nó.
Nếu nó không có nút cha, việc gọi `remove()` sẽ không làm gì cả.

## Cú pháp

```js-nolint
remove()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng `remove()`

```html
<span>Result: </span>A long string.
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.remove(); // Xóa văn bản
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.deleteData()")}}
- {{domxref("DocumentType.remove()")}}
- {{domxref("Element.remove()")}}
