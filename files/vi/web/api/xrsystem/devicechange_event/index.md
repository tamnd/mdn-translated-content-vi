---
title: "XRSystem: sự kiện devicechange"
short-title: devicechange
slug: Web/API/XRSystem/devicechange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRSystem.devicechange_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện **`devicechange`** được kích hoạt trên đối tượng {{DOMxRef("XRSystem")}} bất cứ khi nào tính khả dụng của các thiết bị XR nhập vai thay đổi; ví dụ, khi tai nghe VR hoặc kính AR được kết nối hoặc ngắt kết nối. Đây là một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

> [!NOTE]
> Không nhầm lẫn với sự kiện {{domxref("MediaDevices")}} {{DOMxRef("MediaDevices.devicechange_event", "devicechange")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("devicechange", (event) => { })

ondevicechange = (event) => { }
```

Nếu việc sử dụng WebXR bị chặn bởi chính sách quyền `xr-spatial-tracking` [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), các sự kiện `devicechange` sẽ không kích hoạt.

## Loại sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Mô tả

### Điều kiện kích hoạt

Được kích hoạt bất cứ khi nào tính khả dụng của các thiết bị XR nhập vai thay đổi. Ví dụ, khi tai nghe VR hoặc kính AR được kết nối hoặc ngắt kết nối.

### Trường hợp sử dụng

Bạn có thể sử dụng sự kiện này để, ví dụ, theo dõi tính khả dụng của thiết bị tương thích WebXR để bạn có thể bật phần tử UI mà người dùng có thể dùng để kích hoạt chế độ nhập vai. Điều này được thể hiện trong [ví dụ](#ví-dụ) bên dưới.

## Ví dụ

Ví dụ được hiển thị ở đây xử lý sự kiện `devicechange` bằng cách bật/tắt tính khả dụng của nút "Enter XR" dựa trên việc có thiết bị nhập vai nào đang có sẵn hay không.

```js
if (navigator.xr) {
  navigator.xr.addEventListener("devicechange", (event) => {
    navigator.xr.isSessionSupported("immersive-vr").then((immersiveOK) => {
      enableXRButton.disabled = !immersiveOK;
    });
  });
}
```

Khi nhận được `devicechange`, trình xử lý được thiết lập trong mã này gọi phương thức `XR` {{domxref("XRSystem.isSessionSupported", "isSessionSupported()")}} để tìm hiểu xem có thiết bị nào có thể xử lý các bài trình chiếu VR nhập vai không. Nếu có, nút để vào chế độ XR được bật; ngược lại nó bị vô hiệu hóa.

Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện `ondevicechange` để đặt một trình xử lý cho các sự kiện `devicechange`:

```js
if (navigator.xr) {
  navigator.xr.ondevicechange = (event) => {
    // …
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
