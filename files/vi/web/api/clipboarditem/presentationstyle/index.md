---
title: "ClipboardItem: thuộc tính presentationStyle"
short-title: presentationStyle
slug: Web/API/ClipboardItem/presentationStyle
page-type: web-api-instance-property
browser-compat: api.ClipboardItem.presentationStyle
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Thuộc tính chỉ đọc **`presentationStyle`** của giao diện {{domxref("ClipboardItem")}} trả về một chuỗi cho biết cách một mục nên được trình bày.

Ví dụ, trong một số ngữ cảnh, ảnh có thể được hiển thị nội tuyến, còn trong ngữ cảnh khác nó có thể được biểu diễn như một tệp đính kèm.

## Giá trị

Một trong các giá trị `"unspecified"`, `"inline"` hoặc `"attachment"`.

## Ví dụ

Trong ví dụ dưới đây, chúng ta trả về tất cả các mục trong clipboard thông qua phương thức {{domxref("clipboard.read()")}}, rồi ghi log thuộc tính `presentationStyle`.

```js
async function getClipboardContents() {
  try {
    const clipboardItems = await navigator.clipboard.read();

    for (const clipboardItem of clipboardItems) {
      console.log(clipboardItem.presentationStyle);
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
