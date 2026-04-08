---
title: vertical-viewport-segments
slug: Web/CSS/Reference/At-rules/@media/vertical-viewport-segments
page-type: css-media-feature
status:
  - experimental
browser-compat: css.at-rules.media.vertical-viewport-segments
sidebar: cssref
---

{{SeeCompatTable}}

Đặc trưng media CSS **`vertical-viewport-segments`** phát hiện xem thiết bị có số lượng phân đoạn viewport nhất định được bố trí theo chiều dọc (từ trên xuống dưới) hay không.

Liên quan đến [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API), đặc trưng `vertical-viewport-segments` có thể được dùng để tạo các thiết kế responsive hoạt động tốt trên các thiết bị đa viewport — các thiết bị có màn hình được chia thành các phân đoạn viewport riêng biệt về mặt logic, chẳng hạn như thiết bị gập hoặc thiết bị có bản lề.

## Cú pháp

Đặc trưng `vertical-viewport-segments` được chỉ định là giá trị {{cssxref("integer")}} từ `1` trở lên, đại diện cho số lượng phân đoạn viewport dọc mà thiết bị có.

- Giá trị sẽ là `1` cho:
  - Thiết bị không gập được (ví dụ: điện thoại thông minh hoặc máy tính bảng màn hình đơn tiêu chuẩn).
  - Thiết bị gập được đang ở trạng thái mở hoàn toàn hoặc đóng lại (ở [tư thế thiết bị `continuous`](/en-US/docs/Web/API/Device_Posture_API#continuous)).
  - Thiết bị hai màn hình có bản lề hoặc thiết bị gập được đang gập lại và hướng nằm ngang sao cho các phân đoạn nằm cạnh nhau.
- Giá trị sẽ là `2` cho thiết bị hai màn hình có bản lề hoặc thiết bị gập được đang gập lại (ở [tư thế thiết bị `folded`](/en-US/docs/Web/API/Device_Posture_API#folded)) và hướng dọc sao cho các phân đoạn nằm chồng lên nhau.
- Giá trị có thể lớn hơn `2` cho các thiết bị gập được có nhiều hơn một nếp gập.

## Ví dụ

### Cách dùng cơ bản của `vertical-viewport-segments`

Trong đoạn mã này, chúng ta sử dụng media query `vertical-viewport-segments` để xử lý trường hợp thiết bị gập được có các phân đoạn từ trên xuống dưới.

Chúng ta đặt container trên có chiều cao bằng chiều cao phân đoạn trên (`env(viewport-segment-height 0 0)`), và container dưới có chiều cao bằng chiều cao phân đoạn dưới (`env(viewport-segment-height 0 1)`).

Để tính toán chiều cao mà nếp gập chiếm giữa hai phần, chúng ta trừ độ lệch cạnh dưới của container trên từ độ lệch cạnh trên của container dưới (`calc(env(viewport-segment-top 0 1) - env(viewport-segment-bottom 0 0));`).

```css
.wrapper {
  height: 100%;
  display: flex;
}

@media (vertical-viewport-segments: 2) {
  .wrapper {
    flex-direction: column;
  }

  .list-view {
    height: env(viewport-segment-height 0 0);
  }

  .fold {
    width: 100%;
    height: calc(
      env(viewport-segment-top 0 1) - env(viewport-segment-bottom 0 0)
    );
    background-color: black;
  }

  .detail-view {
    height: env(viewport-segment-height 0 1);
  }
}
```

Xem [demo Viewport segment API](https://mdn.github.io/dom-examples/viewport-segments-api/) để có bản demo hoạt động đầy đủ ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/viewport-segments-api)). Ngoài ra hãy xem [Sử dụng Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API/Using) để có giải thích demo đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Đặc trưng `@media` {{cssxref("@media/horizontal-viewport-segments", "horizontal-viewport-segments")}}
- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
- [Origin trial cho Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) via developer.chrome.com (2024)
