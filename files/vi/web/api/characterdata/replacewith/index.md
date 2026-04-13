---
title: "CharacterData: phương thức replaceWith()"
short-title: replaceWith()
slug: Web/API/CharacterData/replaceWith
page-type: web-api-instance-method
browser-compat: api.CharacterData.replaceWith
---

{{APIRef("DOM")}}

Phương thức **`replaceWith()`** của giao diện {{domxref("CharacterData")}}
thay thế nút này trong danh sách phần tử con của nút cha của nó
bằng một tập các đối tượng {{domxref("Node")}} hoặc chuỗi.

Các chuỗi được chèn dưới dạng nút {{domxref("Text")}}; chuỗi được truyền làm đối số cho hàm khởi tạo {{domxref("Text/Text", "Text()")}}.

## Cú pháp

```js-nolint
replaceWith(...nodes)
```

### Tham số

- `nodes` {{optional_inline}}
  - : Danh sách phân tách bằng dấu phẩy gồm các đối tượng {{domxref("Node")}} hoặc chuỗi sẽ thay thế nút hiện tại.

> [!NOTE]
> Nếu không truyền đối số nào vào, phương thức này sẽ xóa nút khỏi cây DOM.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi nút không thể được chèn vào vị trí đã chỉ định trong hệ phân cấp.

## Ví dụ

```html
<p id="myText">Some text</p>
```

```js
let text = document.getElementById("myText").firstChild;
let em = document.createElement("em");
em.textContent = "Italic text";

text.replaceWith(em); // Replace `Some text` by `Italic text`
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.replaceData()")}}
- {{domxref("DocumentType.replaceWith()")}}
- {{domxref("Element.replaceWith()")}}
