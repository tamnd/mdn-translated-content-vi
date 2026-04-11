---
title: "PannerNode: maxDistance property"
short-title: maxDistance
slug: Web/API/PannerNode/maxDistance
page-type: web-api-instance-property
browser-compat: api.PannerNode.maxDistance
---

{{ APIRef("Web Audio API") }}

Thuộc tính `maxDistance` của giao diện {{ domxref("PannerNode") }} là một giá trị double biểu diễn khoảng cách tối đa giữa nguồn âm thanh và người nghe, sau khoảng cách đó âm lượng không giảm thêm nữa. Giá trị này chỉ được dùng bởi mô hình khoảng cách `linear`.

Giá trị mặc định của thuộc tính `maxDistance` là `10000`.

## Giá trị

Một giá trị double. Mặc định là `10000`, và các giá trị không dương không được phép.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu thuộc tính được gán giá trị nằm ngoài phạm vi chấp nhận.

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
