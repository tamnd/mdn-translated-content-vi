---
title: "Range: constructor Range()"
short-title: Range()
slug: Web/API/Range/Range
page-type: web-api-constructor
browser-compat: api.Range.Range
---

{{APIRef("DOM")}}

Constructor **`Range()`** trả về một đối tượng {{domxref("Range")}} mới, có điểm bắt đầu và kết thúc ở độ lệch `0` của đối tượng {{domxref("Window/document", "document")}} toàn cục.

## Cú pháp

```js-nolint
new Range()
```

### Tham số

Không có.

## Ví dụ

Trong ví dụ này, chúng ta tạo một range mới bằng constructor `Range()`, rồi đặt vị trí bắt đầu và kết thúc bằng các phương thức {{domxref("Range.setStartBefore()")}} và {{domxref("Range.setEndAfter()")}}. Sau đó chúng ta chọn range bằng {{domxref("window.getSelection()")}} và {{domxref("Selection.addRange()")}}.

### HTML

```html
<p>First paragraph.</p>
<p>Second paragraph.</p>
<p>Third paragraph.</p>
<p>Fourth paragraph.</p>
```

### JavaScript

```js
const paragraphs = document.querySelectorAll("p");

// Tạo range mới
const range = new Range();

// Bắt đầu range ở đoạn thứ hai
range.setStartBefore(paragraphs[1]);

// Kết thúc range ở đoạn thứ ba
range.setEndAfter(paragraphs[2]);

// Lấy lựa chọn của cửa sổ
const selection = window.getSelection();

// Thêm range vào lựa chọn của cửa sổ
selection.addRange(range);
```

### Kết quả

{{EmbedLiveSample("Examples", 400, 210)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
- {{domxref("Document.createRange()")}}
- [Mô-đun CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API)
