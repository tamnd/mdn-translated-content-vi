---
title: "ResizeObserverEntry: thuộc tính target"
short-title: target
slug: Web/API/ResizeObserverEntry/target
page-type: web-api-instance-property
browser-compat: api.ResizeObserverEntry.target
---

{{APIRef("Resize Observer API")}}

Thuộc tính chỉ đọc **`target`** của giao diện {{domxref("ResizeObserverEntry")}} trả về một tham chiếu đến {{domxref('Element')}} hoặc {{domxref('SVGElement')}} đang được quan sát.

## Giá trị

Một {{domxref('Element')}} hoặc {{domxref('SVGElement')}} biểu thị phần tử đang được quan sát.

## Ví dụ

Đoạn mã sau được lấy từ ví dụ [resize-observer-border-radius.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-border-radius.html)
([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-border-radius.html)). Ví dụ này bao gồm một hộp màu xanh lá, có kích thước theo phần trăm kích thước viewport. Khi kích thước viewport thay đổi, các góc bo tròn của hộp thay đổi theo tỷ lệ kích thước của hộp. Chúng ta có thể chỉ cần triển khai điều này bằng {{cssxref("border-radius")}} với một giá trị phần trăm, nhưng cách đó nhanh chóng dẫn đến các góc elip trông xấu; giải pháp này cho bạn những góc vuông đẹp mắt, tỉ lệ theo kích thước của hộp.

Để lấy tham chiếu đến phần tử đang được quan sát để chúng ta có thể cập nhật giá trị {{cssxref("border-radius")}} của nó sau mỗi thay đổi, chúng ta dùng thuộc tính `target` của từng entry - `entry.target.style.borderRadius`.

```js
const resizeObserver = new ResizeObserver((entries) => {
  for (const entry of entries) {
    if (entry.contentBoxSize) {
      entry.target.style.borderRadius = `${Math.min(
        100,
        entry.contentBoxSize.inlineSize / 10 +
          entry.contentBoxSize.blockSize / 10,
      )}px`;
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
