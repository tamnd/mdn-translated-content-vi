---
title: ResizeObserverEntry
slug: Web/API/ResizeObserverEntry
page-type: web-api-interface
browser-compat: api.ResizeObserverEntry
---

{{APIRef("Resize Observer API")}}

Giao diện **`ResizeObserverEntry`** đại diện cho đối tượng được truyền vào hàm callback của hàm tạo {{domxref('ResizeObserver.ResizeObserver','ResizeObserver()')}}, cho phép bạn truy cập các kích thước mới của {{domxref("Element")}} hoặc {{domxref("SVGElement")}} đang được quan sát.

## Thuộc tính thể hiện

- {{domxref('ResizeObserverEntry.borderBoxSize')}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng chứa kích thước border box mới của phần tử đang được quan sát khi callback chạy.
- {{domxref('ResizeObserverEntry.contentBoxSize')}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng chứa kích thước content box mới của phần tử đang được quan sát khi callback chạy.
- {{domxref('ResizeObserverEntry.devicePixelContentBoxSize')}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng chứa kích thước content box mới tính bằng {{glossary("device pixel", "điểm ảnh thiết bị")}} của phần tử đang được quan sát khi callback chạy.
- {{domxref('ResizeObserverEntry.contentRect')}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref('DOMRectReadOnly')}} chứa kích thước mới của phần tử đang được quan sát khi callback chạy. Lưu ý rằng đây hiện là một thuộc tính cũ, chỉ còn được giữ lại trong đặc tả vì lý do tương thích ngược.
- {{domxref('ResizeObserverEntry.target')}} {{ReadOnlyInline}}
  - : Tham chiếu đến {{domxref('Element')}} hoặc {{domxref("SVGElement")}} đang được quan sát.

> [!NOTE]
> Content box là hộp chứa nội dung có thể được đặt vào, tức là border box trừ đi phần padding và độ dày viền. Border box bao gồm nội dung, padding và viền. Xem [Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) để biết thêm giải thích.

## Phương thức thể hiện

Không có.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html) ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)).

Lưu ý rằng mã này bao quát ba trường hợp tương thích khác nhau:

- Một số trình duyệt cũ có thể hỗ trợ `contentRect` nhưng không hỗ trợ `contentBoxSize`.
- Các phiên bản cũ của Firefox hỗ trợ `contentBoxSize`, nhưng triển khai sai nó dưới dạng một đối tượng đơn lẻ thay vì một mảng.
- Các trình duyệt hiện đại hỗ trợ `contentBoxSize` dưới dạng một mảng các đối tượng, để có thể báo cáo kích thước hộp cho các phần tử bị phân mảnh (ví dụ, trong tình huống nhiều cột).

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      // Tiêu chuẩn biến contentBoxSize thành một mảng...
      if (entry.contentBoxSize[0]) {
        h1Elem.style.fontSize = `${Math.max(1.5, entry.contentBoxSize[0].inlineSize / 200)}rem`;
        pElem.style.fontSize = `${Math.max(1, entry.contentBoxSize[0].inlineSize / 600)}rem`;
      } else {
        // ... nhưng các phiên bản Firefox cũ coi nó như một mục đơn lẻ
        h1Elem.style.fontSize = `${Math.max(1.5, entry.contentBoxSize.inlineSize / 200)}rem`;
        pElem.style.fontSize = `${Math.max(1, entry.contentBoxSize.inlineSize / 600)}rem`;
      }
    } else {
      h1Elem.style.fontSize = `${Math.max(1.5, entry.contentRect.width / 200)}rem`;
      pElem.style.fontSize = `${Math.max(1, entry.contentRect.width / 600)}rem`;
    }
  }
  console.log("Kích thước đã thay đổi");
});

resizeObserver.observe(divElem);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
