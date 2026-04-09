---
title: "ClipboardItem: thuộc tính types"
short-title: types
slug: Web/API/ClipboardItem/types
page-type: web-api-instance-property
browser-compat: api.ClipboardItem.types
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Thuộc tính chỉ đọc **`types`** của giao diện {{domxref("ClipboardItem")}} trả về một {{jsxref("Array")}} các {{Glossary("MIME type", 'MIME types')}} hiện có trong {{domxref("ClipboardItem")}}.

## Giá trị

Một {{jsxref("Array")}} các {{Glossary("MIME type", 'MIME types')}} hiện có.

## Ví dụ

Trong ví dụ dưới đây, chúng ta trả về tất cả các mục trong clipboard thông qua phương thức {{domxref("Clipboard.read()")}}, rồi kiểm tra thuộc tính `types` để lấy các kiểu hiện có trước khi dùng phương thức {{domxref("ClipboardItem.getType()")}} để trả về từng mục dữ liệu dưới dạng {{domxref("Blob")}}. Nếu không tìm thấy nội dung clipboard cho kiểu đã chỉ định, một lỗi sẽ được trả về.

```js
async function getClipboardContents() {
  try {
    const clipboardItems = await navigator.clipboard.read();

    for (const clipboardItem of clipboardItems) {
      for (const type of clipboardItem.types) {
        const blob = await clipboardItem.getType(type);
        // we can now use blob here
      }
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- [Bài viết về hỗ trợ ảnh cho Async Clipboard](https://web.dev/articles/async-clipboard)
