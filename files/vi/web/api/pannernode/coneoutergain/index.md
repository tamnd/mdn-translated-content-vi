---
title: "PannerNode: coneOuterGain property"
short-title: coneOuterGain
slug: Web/API/PannerNode/coneOuterGain
page-type: web-api-instance-property
browser-compat: api.PannerNode.coneOuterGain
---

{{ APIRef("Web Audio API") }}

Thuộc tính `coneOuterGain` của giao diện {{ domxref("PannerNode") }} là một giá trị double mô tả mức giảm âm lượng bên ngoài hình nón, được xác định bởi thuộc tính {{domxref("PannerNode.coneOuterAngle", "coneOuterAngle")}}.

Giá trị mặc định của thuộc tính `coneOuterGain` là `0`, nghĩa là không có âm thanh nào được nghe thấy bên ngoài hình nón.

## Giá trị

Một giá trị double. Mặc định là `0`, và giá trị có thể nằm trong khoảng 0–1.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính được gán giá trị nằm ngoài phạm vi chấp nhận (0–1).

## Ví dụ

Xem [`PannerNode.orientationX`](/en-US/docs/Web/API/PannerNode/orientationX#example) để có mã ví dụ minh họa cách thay đổi các tham số hướng của {{domxref("PannerNode")}} kết hợp với {{domxref("PannerNode.coneInnerAngle", "coneInnerAngle")}} và {{domxref("PannerNode.coneOuterAngle", "coneOuterAngle")}} ảnh hưởng đến âm lượng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
