---
title: ResizeObserverSize
slug: Web/API/ResizeObserverSize
page-type: web-api-interface
browser-compat: api.ResizeObserverSize
---

{{APIRef("Resize Observer API")}}

Giao diện **`ResizeObserverSize`** của [Resize Observer API](/en-US/docs/Web/API/Resize_Observer_API) được sử dụng bởi giao diện {{domxref("ResizeObserverEntry")}} để truy cập các thuộc tính kích thước hộp của phần tử đang được quan sát.

> [!NOTE]
> Trong [bố cục nhiều cột](/en-US/docs/Web/CSS/Guides/Multicol_layout), là một ngữ cảnh phân mảnh, kích thước được trả về bởi `ResizeObserverSize` sẽ là kích thước của cột đầu tiên.

## Thuộc tính phiên bản

- {{domxref("ResizeObserverSize.blockSize")}} {{ReadOnlyInline}}
  - : Chiều dài của hộp viền của phần tử được quan sát theo chiều khối. Đối với các hộp có {{cssxref("writing-mode")}} nằm ngang, đây là chiều dọc, hay chiều cao; nếu chế độ viết là dọc, đây là chiều ngang, hay chiều rộng.
- {{domxref("ResizeObserverSize.inlineSize")}} {{ReadOnlyInline}}
  - : Chiều dài của hộp viền của phần tử được quan sát theo chiều nội tuyến. Đối với các hộp có {{cssxref("writing-mode")}} nằm ngang, đây là chiều ngang, hay chiều rộng; nếu chế độ viết là dọc, đây là chiều dọc, hay chiều cao.

> [!NOTE]
> Để biết thêm giải thích về chế độ viết và các chiều khối và nội tuyến, hãy đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

## Ví dụ

Trong ví dụ này, thuộc tính {{domxref("ResizeObserverEntry.contentBoxSize")}} trả về một đối tượng `ResizeObserverSize`. Đây là một mảng chứa thông tin kích thước cho hộp nội dung của phần tử được quan sát.

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    console.log(entry.contentBoxSize[0]); // một ResizeObserverSize
  }
});

resizeObserver.observe(divElem);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
