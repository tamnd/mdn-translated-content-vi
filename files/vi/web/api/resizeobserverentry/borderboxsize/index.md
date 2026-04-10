---
title: "ResizeObserverEntry: thuộc tính borderBoxSize"
short-title: borderBoxSize
slug: Web/API/ResizeObserverEntry/borderBoxSize
page-type: web-api-instance-property
browser-compat: api.ResizeObserverEntry.borderBoxSize
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc **`borderBoxSize`** của giao diện {{domxref("ResizeObserverEntry")}} trả về một mảng chứa kích thước border box mới của phần tử đang được quan sát khi callback chạy.

## Giá trị

Một mảng chứa các đối tượng với kích thước border box mới của phần tử đang được quan sát. Mảng này là cần thiết để hỗ trợ các phần tử có nhiều fragment, xuất hiện trong các tình huống nhiều cột. Mỗi đối tượng trong mảng chứa hai thuộc tính:

- `blockSize`
  - : Chiều dài border box của phần tử được quan sát theo chiều block. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều dọc, tức chiều cao; nếu writing-mode là dọc, đây là chiều ngang, tức chiều rộng.
- `inlineSize`
  - : Chiều dài border box của phần tử được quan sát theo chiều inline. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều ngang, tức chiều rộng; nếu writing-mode là dọc, đây là chiều dọc, tức chiều cao.

> [!NOTE]
> Để biết thêm giải thích về writing mode và các kích thước block và inline, hãy đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

## Ví dụ

```js
const resizeObserver = new ResizeObserver((entries) => {
  const calcBorderRadius = (size1, size2) =>
    `${Math.min(100, size1 / 10 + size2 / 10)}px`;

  for (const entry of entries) {
    if (entry.borderBoxSize?.length > 0) {
      entry.target.style.borderRadius = calcBorderRadius(
        entry.borderBoxSize[0].inlineSize,
        entry.borderBoxSize[0].blockSize,
      );
    } else {
      entry.target.style.borderRadius = calcBorderRadius(
        entry.contentRect.width,
        entry.contentRect.height,
      );
    }
  }
});

resizeObserver.observe(document.querySelector("div"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
