---
title: "XRViewport: y property"
short-title: y
slug: Web/API/XRViewport/y
page-type: web-api-instance-property
browser-compat: api.XRViewport.y
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("XRViewport")}} chỉ định độ lệch từ cạnh dưới của bề mặt đích (thường là {{domxref("XRWebGLLayer")}}) đến cạnh dưới của khung nhìn trong bề mặt nơi nội dung WebXR được kết xuất. Thuộc tính {{domxref("XRViewport.x", "x")}} xác định thành phần `x` của điểm gốc, còn kích thước được cho bởi {{domxref("XRViewPort.width", "width")}} và {{domxref("XRViewport.height", "height")}}.

## Giá trị

Độ lệch từ cạnh dưới của bề mặt kết xuất đến cạnh dưới của khung nhìn, tính bằng pixel.

> [!NOTE]
> Mặc dù các API web khác thường coi trục `y` bắt đầu từ trên cùng và tăng dần xuống dưới, WebGL đảo ngược điều này, với `y` tăng dần khi đi lên trên màn hình.

## Ví dụ

Xem trang {{domxref("XRViewport")}} chính để tham khảo ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
