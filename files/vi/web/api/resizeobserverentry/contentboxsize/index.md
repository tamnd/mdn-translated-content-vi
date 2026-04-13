---
title: "ResizeObserverEntry: thuộc tính contentBoxSize"
short-title: contentBoxSize
slug: Web/API/ResizeObserverEntry/contentBoxSize
page-type: web-api-instance-property
browser-compat: api.ResizeObserverEntry.contentBoxSize
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc **`contentBoxSize`** của giao diện {{domxref("ResizeObserverEntry")}} trả về một mảng chứa kích thước content box mới của phần tử đang được quan sát khi callback chạy.

## Giá trị

Một mảng chứa các đối tượng với kích thước content box mới của phần tử đang được quan sát. Mảng này là cần thiết để hỗ trợ các phần tử có nhiều fragment, xuất hiện trong các tình huống nhiều cột. Mỗi đối tượng trong mảng chứa hai thuộc tính:

- `blockSize`
  - : Chiều dài content box của phần tử được quan sát theo chiều block. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều dọc, tức chiều cao; nếu writing-mode là dọc, đây là chiều ngang, tức chiều rộng.
- `inlineSize`
  - : Chiều dài content box của phần tử được quan sát theo chiều inline. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều ngang, tức chiều rộng; nếu writing-mode là dọc, đây là chiều dọc, tức chiều cao.

> [!NOTE]
> Để biết thêm giải thích về writing mode và các kích thước block và inline, hãy đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-border-radius.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-border-radius.html)
([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-border-radius.html)). Ví dụ này bao gồm một hộp màu xanh lá, có kích thước theo phần trăm kích thước viewport. Khi kích thước viewport thay đổi, các góc bo tròn của hộp thay đổi theo tỷ lệ kích thước của hộp. Chúng ta có thể chỉ cần triển khai điều này bằng {{cssxref("border-radius")}} với một giá trị phần trăm, nhưng cách đó nhanh chóng dẫn đến các góc elip trông xấu; giải pháp này cho bạn những góc vuông đẹp mắt, tỉ lệ theo kích thước của hộp.

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      // Tiêu chuẩn biến contentBoxSize thành một mảng...
      if (entry.contentBoxSize[0]) {
        entry.target.style.borderRadius = `${Math.min(
          100,
          entry.contentBoxSize[0].inlineSize / 10 +
            entry.contentBoxSize[0].blockSize / 10,
        )}px`;
      } else {
        // ... nhưng các phiên bản Firefox cũ coi nó như một mục đơn lẻ
        entry.target.style.borderRadius = `${Math.min(
          100,
          entry.contentBoxSize.inlineSize / 10 +
            entry.contentBoxSize.blockSize / 10,
        )}px`;
      }
    } else {
      entry.target.style.borderRadius = `${Math.min(
        100,
        entry.contentRect.width / 10 + entry.contentRect.height / 10,
      )}px`;
    }
  }
});

resizeObserver.observe(document.querySelector("div"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
