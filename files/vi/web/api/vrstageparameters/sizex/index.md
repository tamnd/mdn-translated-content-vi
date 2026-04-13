---
title: "VRStageParameters: thuộc tính sizeX"
short-title: sizeX
slug: Web/API/VRStageParameters/sizeX
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRStageParameters.sizeX
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`sizeX`** của giao diện {{domxref("VRStageParameters")}} _trả về chiều rộng_ của giới hạn khu vực chơi tính bằng mét.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Giới hạn được định nghĩa là hình chữ nhật căn chỉnh theo trục trên sàn, vì lý do an toàn. Nội dung không nên yêu cầu người dùng di chuyển ra ngoài các giới hạn này; tuy nhiên, người dùng có thể bỏ qua giới hạn dẫn đến các giá trị vị trí nằm ngoài hình chữ nhật này. Tâm của hình chữ nhật ở (0,0,0) trong tọa độ không gian đứng.

## Giá trị

Một số float đại diện cho chiều rộng tính bằng mét.

## Ví dụ

Xem [`VRStageParameters`](/en-US/docs/Web/API/VRStageParameters#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
