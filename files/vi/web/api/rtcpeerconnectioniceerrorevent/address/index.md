---
title: "RTCPeerConnectionIceErrorEvent: thuộc tính address"
short-title: address
slug: Web/API/RTCPeerConnectionIceErrorEvent/address
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnectionIceErrorEvent.address
---

{{APIRef("WebRTC")}}

Thuộc tính **`address`** của {{domxref("RTCPeerConnectionIceErrorEvent")}} là một chuỗi cho biết địa chỉ IP cục bộ đang được dùng để giao tiếp với máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}} trong quá trình thương lượng. Lỗi xảy ra liên quan đến địa chỉ này.

## Giá trị

Một chuỗi xác định địa chỉ IP cục bộ của kết nối mạng đến máy chủ ICE nơi các cuộc thương lượng đang diễn ra khi xảy ra lỗi. Địa chỉ này xác định giao diện mạng trên thiết bị cục bộ đang được dùng để cố gắng thiết lập kết nối với peer từ xa.

Điều này có thể hữu ích trên các hệ thống đa home, tức là các thiết bị có nhiều hơn một kết nối mạng, để xác định giao diện mạng nào đang được sử dụng. Ví dụ, trên điện thoại di động, thường có ít nhất hai giao diện mạng: kết nối di động và kết nối Wi-Fi.

Nếu địa chỉ IP cục bộ không được tiết lộ như một phần của ICE candidate cục bộ, giá trị của `address` là `null`.

## Ví dụ

Ví dụ này tạo một trình xử lý cho các sự kiện {{domxref("RTCPeerConnection.icecandidateerror_event", "icecandidateerror")}} tạo các thông điệp dễ đọc mô tả giao diện mạng cục bộ cho kết nối cũng như máy chủ ICE đang được dùng để thử mở kết nối, sau đó gọi một hàm để hiển thị những thông tin đó cũng như nội dung thuộc tính {{domxref("RTCPeerConnectionIceErrorEvent.errorText", "errorText")}} của sự kiện.

```js
pc.addEventListener("icecandidateerror", (event) => {
  let networkInfo = `[Local interface: ${event.address}:${event.port}`;
  let iceServerInfo = `[ICE server: ${event.url}`;

  showMessage(errorText, iceServerInfo, networkInfo);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
