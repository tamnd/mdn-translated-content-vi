---
title: "ResizeObserverEntry: thuộc tính devicePixelContentBoxSize"
short-title: devicePixelContentBoxSize
slug: Web/API/ResizeObserverEntry/devicePixelContentBoxSize
page-type: web-api-instance-property
browser-compat: api.ResizeObserverEntry.devicePixelContentBoxSize
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc **`devicePixelContentBoxSize`** của giao diện {{domxref("ResizeObserverEntry")}} trả về một mảng chứa kích thước theo điểm ảnh thiết bị của phần tử đang được quan sát khi callback chạy.

## Giá trị

Một mảng chứa các đối tượng với kích thước mới của phần tử được quan sát tính bằng điểm ảnh thiết bị. Mảng này là cần thiết để hỗ trợ các phần tử có nhiều fragment, xuất hiện trong các tình huống nhiều cột. Mỗi đối tượng trong mảng chứa hai thuộc tính:

- `blockSize`
  - : Kích thước content-box, tính bằng điểm ảnh thiết bị, theo chiều block của phần tử được quan sát. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều dọc, tức chiều cao; nếu writing-mode là dọc, đây là chiều ngang, tức chiều rộng.
- `inlineSize`
  - : Kích thước content box, tính bằng điểm ảnh thiết bị, theo chiều inline của phần tử được quan sát. Với các hộp có {{cssxref("writing-mode")}} ngang, đây là chiều ngang, tức chiều rộng; nếu writing-mode là dọc, đây là chiều dọc, tức chiều cao.

> [!NOTE]
> Để biết thêm thông tin về writing mode và các kích thước block và inline, hãy đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

## Ví dụ

Ví dụ sau được lấy từ bài viết [Pixel-perfect rendering with devicePixelContentBox](https://web.dev/articles/device-pixel-content-box). Vì hàm callback của một {{domxref("ResizeObserver")}} được gọi sau layout nhưng trước paint, điều này tạo cơ hội để ghi lại kích thước chính xác tính bằng điểm ảnh vật lý nhằm bảo đảm ánh xạ một-một giữa điểm ảnh của canvas và điểm ảnh vật lý.

```js
const observer = new ResizeObserver((entries) => {
  const entry = entries.find((entry) => entry.target === canvas);
  canvas.width = entry.devicePixelContentBoxSize[0].inlineSize;
  canvas.height = entry.devicePixelContentBoxSize[0].blockSize;

  /* ... render to canvas ... */
});
observer.observe(canvas, { box: "device-pixel-content-box" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
