---
title: device-posture
slug: Web/CSS/Reference/At-rules/@media/device-posture
page-type: css-media-feature
status:
  - experimental
browser-compat: css.at-rules.media.device-posture
sidebar: cssref
---

{{seecompattable}}

Tính năng media **`device-posture`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để phát hiện [tư thế hiện tại](/en-US/docs/Web/API/Device_Posture_API) của thiết bị, tức là liệu khung nhìn đang ở trạng thái phẳng (`continuous`) hay trạng thái gập (`folded`).

## Cú pháp

Tính năng `device-posture` được chỉ định dưới dạng một giá trị từ khóa được chọn trong danh sách bên dưới:

- `continuous`
  - : Cho biết thiết bị đang ở trạng thái màn hình phẳng. Các thiết bị có thể gập sẽ ở trạng thái `continuous` khi chúng nằm phẳng — dù mở hoàn toàn hay đóng hoàn toàn. Các thiết bị không thể gập được coi là phẳng và do đó luôn ở trạng thái `continuous` — điều này bao gồm màn hình cong liền mạch và màn hình máy tính để bàn, laptop, máy tính bảng và điện thoại di động thông thường.
- `folded`
  - : Cho biết thiết bị đang ở trạng thái màn hình gập. Các thiết bị có thể gập sẽ ở trạng thái `folded` khi được sử dụng theo tư thế sách hoặc laptop.

## Ví dụ

Trong ví dụ này, tính năng media `device-posture` phát hiện khi thiết bị ở tư thế gập, thêm margin dựa trên [`orientation`](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation) của nó để tạo khoảng cách lớn hơn giữa hai panel của ứng dụng nhằm dễ đọc hơn.

```css
@media (device-posture: folded) and (orientation: landscape) {
  .list-view {
    margin-inline-end: 60px;
  }
}

@media (device-posture: folded) and (orientation: portrait) {
  .list-view {
    margin-block-end: 60px;
  }
}
```

Để xem đoạn code trên trong thực tế, hãy xem [bản demo Device Posture API](https://mdn.github.io/dom-examples/device-posture-api/) trên thiết bị có thể gập nếu có thể. Công cụ dành cho nhà phát triển trong trình duyệt hiện tại có thể mô phỏng các thiết bị có thể gập, nhưng không bao gồm mô phỏng thiết bị được gập một phần — chỉ có thiết bị mở hoàn toàn hoặc đóng hoàn toàn — vì vậy chúng sẽ luôn trả về `continuous`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DevicePosture")}}
- [Device Posture API](/en-US/docs/Web/API/Device_Posture_API)
- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
