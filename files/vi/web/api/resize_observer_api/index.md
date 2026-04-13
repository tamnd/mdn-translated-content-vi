---
title: API Resize Observer
slug: Web/API/Resize_Observer_API
page-type: web-api-overview
browser-compat: api.ResizeObserver
---

{{DefaultAPISidebar("Resize Observer API")}}

API Resize Observer cung cấp một cơ chế hiệu quả để mã có thể theo dõi một phần tử nhằm phát hiện thay đổi về kích thước của nó, với các thông báo được gửi đến observer mỗi khi kích thước thay đổi.

## Khái niệm và cách dùng

Có rất nhiều trường hợp sử dụng cho các kỹ thuật thiết kế đáp ứng (và cả những kỹ thuật khác) phản hồi lại thay đổi kích thước của một phần tử, nhưng trước đây việc triển khai thường khá cồng kềnh và/hoặc dễ hỏng.

Ví dụ, [media queries](/en-US/docs/Web/CSS/Guides/Media_queries) / {{domxref("window.matchMedia")}} rất hữu ích để cập nhật bố cục tại các điểm cụ thể khi viewport thay đổi kích thước, nhưng nếu bạn muốn thay đổi bố cục để phản ứng với việc kích thước của một phần tử cụ thể thay đổi, chứ không phải của vùng chứa ngoài cùng, thì sao?

Để làm được điều này, một giải pháp giới hạn là lắng nghe các thay đổi của một sự kiện phù hợp gợi ý rằng phần tử bạn quan tâm đang đổi kích thước (ví dụ, sự kiện [resize event](/en-US/docs/Web/API/Window/resize_event) của cửa sổ), rồi sau đó dùng {{domxref("Element.getBoundingClientRect")}} hoặc {{domxref("Window.getComputedStyle")}} để tìm ra kích thước mới hoặc các đặc tính khác của phần tử sau khi resize.

Giải pháp như vậy thường chỉ hoạt động cho một số trường hợp sử dụng hạn chế, gây hại cho hiệu năng (việc liên tục gọi các phương thức ở trên sẽ làm giảm hiệu năng đáng kể), và thường sẽ không hoạt động khi kích thước cửa sổ trình duyệt không thay đổi.

API Resize Observer cung cấp lời giải cho chính những vấn đề như thế này, và còn hơn thế nữa, cho phép bạn dễ dàng quan sát và phản hồi các thay đổi về kích thước của content box hoặc border box của một phần tử theo cách hiệu quả. Nó cung cấp một giải pháp JavaScript cho việc thiếu hụt [element queries](https://www.xanthir.com/b4PR0) vốn thường được nhắc đến trên nền tảng web.

Cách dùng khá đơn giản, gần như giống hệt các observer khác như [Performance Observer](/en-US/docs/Web/API/PerformanceObserver) hoặc [Intersection Observer](/en-US/docs/Web/API/Intersection_Observer_API) - bạn tạo một đối tượng {{domxref("ResizeObserver")}} mới bằng hàm tạo [`ResizeObserver()`](/en-US/docs/Web/API/ResizeObserver/ResizeObserver), rồi dùng {{domxref("ResizeObserver.observe()")}} để yêu cầu nó tìm các thay đổi về kích thước của một phần tử cụ thể. Sau đó, một hàm callback được thiết lập bên trong hàm tạo sẽ chạy mỗi khi kích thước thay đổi, cung cấp quyền truy cập vào các kích thước mới và cho phép bạn làm bất cứ điều gì mình muốn để phản hồi các thay đổi đó.

## Giao diện

- {{domxref("ResizeObserver")}}
  - : Cung cấp khả năng đăng ký các observer mới và bắt đầu hoặc dừng việc theo dõi các phần tử.
- {{domxref("ResizeObserverEntry")}}
  - : Mô tả một phần tử duy nhất đã đổi kích thước, xác định phần tử đó và kích thước mới của nó.

## Ví dụ

Bạn có thể tìm thấy một vài ví dụ đơn giản trong kho GitHub của chúng tôi:

- [resize-observer-border-radius.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-border-radius.html) ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-border-radius.html)): Một ví dụ đơn giản với một hộp màu xanh lá, có kích thước theo phần trăm của kích thước viewport. Khi kích thước viewport thay đổi, các góc bo tròn của hộp cũng thay đổi theo tỷ lệ kích thước của hộp. Chúng ta có thể triển khai điều này chỉ bằng {{cssxref("border-radius")}} với một giá trị phần trăm, nhưng cách đó nhanh chóng dẫn đến các góc elip trông xấu; giải pháp ở trên cho bạn các góc tròn đẹp, tỉ lệ theo kích thước của hộp.
- [resize-observer-text.html](https://mdn.github.io/dom-examples/resize-observer/resize-observer-text.html) ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/resize-observer/resize-observer-text.html)): Ở đây chúng ta dùng resize observer để thay đổi {{cssxref("font-size")}} của một tiêu đề và một đoạn văn khi giá trị của thanh trượt thay đổi, khiến `<div>` chứa chúng đổi chiều rộng. Điều này cho thấy bạn có thể phản hồi các thay đổi về kích thước của một phần tử, ngay cả khi chúng không liên quan gì đến viewport.

Mã thường sẽ theo mẫu như sau (lấy từ `resize-observer-border-radius.html`):

```js
const resizeObserver = new ResizeObserver((entries) => {
  const calcBorderRadius = (size1, size2) =>
    `${Math.min(100, size1 / 10 + size2 / 10)}px`;

  for (const entry of entries) {
    if (entry.borderBoxSize) {
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

## Xem thêm

- [ResizeObserver: Nó giống như document.onresize dành cho phần tử](https://web.dev/articles/resize-observer)
