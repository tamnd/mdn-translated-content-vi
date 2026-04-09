---
title: "ClipboardItem: phương thức getType()"
short-title: getType()
slug: Web/API/ClipboardItem/getType
page-type: web-api-instance-method
browser-compat: api.ClipboardItem.getType
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Phương thức **`getType()`** của giao diện {{domxref("ClipboardItem")}} trả về một {{jsxref("Promise")}} được giải quyết với một {{domxref("Blob")}} của {{Glossary("MIME type")}} được yêu cầu, hoặc lỗi nếu không tìm thấy kiểu MIME.

## Cú pháp

```js-nolint
getType(type)
```

### Tham số

- `type`
  - : Một {{Glossary("MIME type")}} hợp lệ.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{domxref("Blob")}}.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : `type` không khớp với một {{Glossary("MIME type")}} đã biết.
- {{jsxref("TypeError")}}
  - : Không chỉ định tham số nào, hoặc `type` không thuộc về {{domxref("ClipboardItem")}}.

## Ví dụ

Trong ví dụ sau, chúng ta trả về tất cả các mục trong clipboard thông qua phương thức {{domxref("clipboard.read()")}}. Với mỗi mục, chúng ta truyền thuộc tính {{domxref("ClipboardItem.types")}} cho phương thức `getType()`, phương thức này trả về đối tượng `Blob` tương ứng.

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
