---
title: "ResizeObserverSize: thuộc tính blockSize"
short-title: blockSize
slug: Web/API/ResizeObserverSize/blockSize
page-type: web-api-instance-property
browser-compat: api.ResizeObserverSize.blockSize
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc **`blockSize`** của giao diện {{domxref("ResizeObserverSize")}} trả về chiều dài của hộp viền của phần tử được quan sát theo chiều khối. Đối với các hộp có {{cssxref("writing-mode")}} nằm ngang, đây là chiều dọc, hay chiều cao; nếu chế độ viết là dọc, đây là chiều ngang, hay chiều rộng.

> [!NOTE]
> Để biết thêm giải thích về chế độ viết và các chiều khối và nội tuyến, hãy đọc [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions).

## Giá trị

Một số thập phân đại diện cho kích thước khối theo pixel.

## Ví dụ

Trong ví dụ này, chúng ta trả về một mảng thông tin kích thước với {{domxref("ResizeObserverEntry.contentBoxSize")}}. Thuộc tính `blockSize` trả về kích thước chiều khối của phần tử được quan sát.

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    const elemSize = entry.contentBoxSize[0];
    console.log(elemSize.blockSize); // một số thập phân
  }
});

resizeObserver.observe(divElem);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
