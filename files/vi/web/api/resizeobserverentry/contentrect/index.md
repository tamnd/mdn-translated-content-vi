---
title: "ResizeObserverEntry: thuộc tính contentRect"
short-title: contentRect
slug: Web/API/ResizeObserverEntry/contentRect
page-type: web-api-instance-property
browser-compat: api.ResizeObserverEntry.contentRect
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc `contentRect` của giao diện {{domxref("ResizeObserverEntry")}} trả về một đối tượng {{domxref('DOMRectReadOnly')}} chứa kích thước mới của phần tử đang được quan sát khi callback chạy. Lưu ý rằng thuộc tính này được hỗ trợ tốt hơn {{domxref("ResizeObserverEntry.borderBoxSize")}} hoặc {{domxref("ResizeObserverEntry.contentBoxSize")}}, nhưng nó còn sót lại từ một triển khai sớm hơn của API Resize Observer, vẫn được giữ trong đặc tả vì lý do tương thích web, và có thể sẽ bị loại bỏ trong các phiên bản tương lai.

## Giá trị

Một đối tượng {{domxref('DOMRectReadOnly')}} chứa kích thước mới của phần tử được chỉ ra bởi thuộc tính {{domxref("ResizeObserverEntry.target", "target")}}.

Nếu `target` là một {{domxref("Element")}} HTML, `contentRect` được trả về là content box của phần tử. Nếu `target` là một {{domxref("SVGElement")}}, `contentRect` được trả về là bounding box của SVG.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html) ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)). Ví dụ này dùng một phép kiểm tra tính năng đơn giản để xem trình duyệt có hỗ trợ thuộc tính mới hơn {{domxref("ResizeObserverEntry.contentBoxSize")}} hay không - nếu có, nó dùng thuộc tính đó để lấy dữ liệu kích thước cần thiết. Nếu không, nó dùng `contentRect`.

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      h1Elem.style.fontSize = `${Math.max(
        1.5,
        entry.contentBoxSize.inlineSize / 200,
      )}rem`;
      pElem.style.fontSize = `${Math.max(
        1,
        entry.contentBoxSize.inlineSize / 600,
      )}rem`;
    } else {
      h1Elem.style.fontSize = `${Math.max(
        1.5,
        entry.contentRect.width / 200,
      )}rem`;
      pElem.style.fontSize = `${Math.max(1, entry.contentRect.width / 600)}rem`;
    }
  }
});

resizeObserver.observe(divElem);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
