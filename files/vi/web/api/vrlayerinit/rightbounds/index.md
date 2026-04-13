---
title: "VRLayerInit: thuộc tính rightBounds"
short-title: rightBounds
slug: Web/API/VRLayerInit/rightBounds
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getLayers
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính **`rightBounds`** của giao diện {{domxref("VRLayerInit")}} (từ điển) xác định giới hạn kết cấu bên phải của canvas mà nội dung sẽ được trình bày bởi {{domxref("VRDisplay")}}.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một mảng gồm bốn giá trị dấu phẩy động, có thể nhận giá trị từ 0.0 đến 1.0:

1. Offset bên trái của giới hạn.
2. Offset phía trên của giới hạn.
3. Chiều rộng của giới hạn.
4. Chiều cao của giới hạn.

Nếu `leftBounds` không được chỉ định trong từ điển, giá trị mặc định được sử dụng là `[0.5, 0.0, 0.5, 1.0]`.

## Ví dụ

Xem [`VRLayerInit`](/en-US/docs/Web/API/VRLayerInit#examples) để biết mã ví dụ.

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
