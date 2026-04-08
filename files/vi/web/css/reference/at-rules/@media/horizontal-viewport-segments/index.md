---
title: horizontal-viewport-segments
slug: Web/CSS/Reference/At-rules/@media/horizontal-viewport-segments
page-type: css-media-feature
status:
  - experimental
browser-compat: css.at-rules.media.horizontal-viewport-segments
sidebar: cssref
---

{{SeeCompatTable}}

Tính năng media **`horizontal-viewport-segments`** trong [CSS](/vi/docs/Web/CSS) phát hiện xem thiết bị có một số lượng phân đoạn viewport cụ thể được bố trí theo chiều ngang (cạnh nhau) hay không.

Liên quan đến [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API), tính năng `vertical-viewport-segments` có thể được dùng để tạo thiết kế responsive hoạt động tốt trên các thiết bị đa viewport — thiết bị có màn hình được chia thành các phân đoạn viewport riêng biệt về mặt logic, chẳng hạn như thiết bị gập hoặc thiết bị có bản lề.

## Cú pháp

Tính năng `horizontal-viewport-segments` được xác định bởi giá trị {{cssxref("integer")}} từ `1` trở lên, đại diện cho số lượng phân đoạn viewport nằm ngang mà thiết bị có.

- Giá trị sẽ là `1` trong các trường hợp:
  - Thiết bị không có khả năng gập (ví dụ: điện thoại thông minh hoặc máy tính bảng màn hình đơn thông thường)
  - Thiết bị gập đang ở trạng thái mở hoàn toàn hoặc đóng lại (ở [tư thế thiết bị `continuous`](/en-US/docs/Web/API/Device_Posture_API#continuous)).
  - Thiết bị hai màn hình có bản lề hoặc thiết bị gập đang ở trạng thái gập và định hướng dọc sao cho các phân đoạn nằm chồng lên nhau.
- Giá trị sẽ là `2` đối với thiết bị hai màn hình có bản lề hoặc thiết bị gập đang ở trạng thái gập (ở [tư thế thiết bị `folded`](/en-US/docs/Web/API/Device_Posture_API#folded)) và định hướng ngang sao cho các phân đoạn nằm cạnh nhau.
- Giá trị có thể lớn hơn `2` đối với thiết bị gập có nhiều hơn một nếp gập.

## Ví dụ

### Sử dụng cơ bản `horizontal-viewport-segments`

Trong đoạn mã này, chúng ta sử dụng media query `horizontal-viewport-segments` để xử lý trường hợp thiết bị gập có các phân đoạn nằm cạnh nhau.

Chúng ta đặt container bên trái có chiều rộng bằng chiều rộng phân đoạn bên trái (`env(viewport-segment-width 0 0)`), và container bên phải có chiều rộng bằng chiều rộng phân đoạn bên phải (`env(viewport-segment-width 1 0)`).

Để tính toán chiều rộng phần gập ở giữa, chúng ta lấy offset cạnh trái của container bên phải trừ đi offset cạnh phải của container bên trái (`calc(env(viewport-segment-left 1 0) - env(viewport-segment-right 0 0));`).

```css
.wrapper {
  height: 100%;
  display: flex;
}

@media (horizontal-viewport-segments: 2) {
  .wrapper {
    flex-direction: row;
  }

  .list-view {
    width: env(viewport-segment-width 0 0);
  }

  .fold {
    width: calc(
      env(viewport-segment-left 1 0) - env(viewport-segment-right 0 0)
    );
    background-color: black;
    height: 100%;
  }

  .detail-view {
    width: env(viewport-segment-width 1 0);
  }
}
```

Xem [demo Viewport segment API](https://mdn.github.io/dom-examples/viewport-segments-api/) để có bản demo hoạt động đầy đủ ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/viewport-segments-api)). Cũng hãy xem [Sử dụng Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API/Using) để biết giải thích demo đầy đủ.

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tính năng `@media` {{cssxref("@media/vertical-viewport-segments", "vertical-viewport-segments")}}
- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
- [Origin trial for Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) qua developer.chrome.com (2024)
