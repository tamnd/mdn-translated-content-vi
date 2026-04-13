---
title: XRSystem
slug: Web/API/XRSystem
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRSystem
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRSystem`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) cung cấp các phương thức cho phép bạn truy cập đối tượng {{domxref("XRSession")}} đại diện cho một phiên WebXR. Với `XRSession` trong tay, bạn có thể sử dụng nó để tương tác với thiết bị Thực tế tăng cường (AR) hoặc Thực tế ảo (VR).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Mặc dù `XRSystem` không cung cấp trực tiếp các thuộc tính, nó kế thừa các thuộc tính từ giao diện cha {{domxref("EventTarget")}}._

## Phương thức phiên bản

_Ngoài việc kế thừa các phương thức từ giao diện cha {{domxref("EventTarget")}}, giao diện `XRSystem` bao gồm các phương thức sau:_

- {{DOMxRef("XRSystem.isSessionSupported", "isSessionSupported()")}} {{Experimental_Inline}}
  - : Trả về một promise phân giải thành `true` nếu trình duyệt hỗ trợ chế độ phiên đã cho.
    Phân giải thành `false` nếu chế độ được chỉ định không được hỗ trợ.
- {{DOMxRef("XRSystem.requestSession", "requestSession()")}} {{Experimental_Inline}}
  - : Trả về một promise phân giải thành {{DOMxRef("XRSession")}} mới với chế độ phiên được chỉ định.

## Sự kiện

- {{domxref("XRSystem.devicechange_event", "devicechange")}} {{Experimental_Inline}}
  - : Được gửi khi tập hợp các thiết bị XR có sẵn thay đổi.
    Cũng có thể sử dụng trình xử lý sự kiện `ondevicechange`.

## Ghi chú sử dụng

Giao diện này trước đây được gọi là `XR` trong các phiên bản trước của đặc tả; nếu bạn thấy các tham chiếu đến `XR` trong mã hoặc tài liệu, hãy thay thế bằng `XRSystem`.

## Ví dụ

Ví dụ sau cho thấy cách sử dụng cả {{domxref("XRSystem.isSessionSupported", "isSessionSupported()")}} và {{domxref("XRSystem.requestSession", "requestSession()")}}.

```js
if (navigator.xr) {
  immersiveButton.addEventListener("click", onButtonClicked);
  navigator.xr.isSessionSupported("immersive-vr").then((isSupported) => {
    immersiveButton.disabled = !isSupported;
  });
}

function onButtonClicked() {
  if (!xrSession) {
    navigator.xr.requestSession("immersive-vr").then((session) => {
      // onSessionStarted() không được hiển thị vì lý do ngắn gọn và rõ ràng.
      onSessionStarted(session);
    });
  } else {
    // Tắt XRSession đang chạy
    xrSession.end().then(() => {
      // Vì có trường hợp sự kiện end không được gửi, hãy gọi trình xử lý ở đây.
      onSessionEnded();
    });
  }
}
```

Mã này bắt đầu bằng cách kiểm tra xem WebXR có sẵn hay không bằng cách tìm kiếm thuộc tính {{domxref("navigator.xr")}}. Nếu tìm thấy, chúng ta biết WebXR có mặt và tiến hành thiết lập trình xử lý cho nút người dùng có thể nhấp để bật/tắt chế độ VR nhập vai.

Tuy nhiên, chúng ta chưa biết liệu chế độ nhập vai mong muốn có sẵn hay không. Để xác định điều này, chúng ta gọi `isSessionSupported()`, truyền tùy chọn phiên mong muốn trước khi bật nút `immersiveButton`, người dùng có thể dùng để chuyển sang chế độ nhập vai chỉ khi chế độ VR nhập vai có sẵn. Nếu VR nhập vai không có sẵn, nút sẽ bị vô hiệu hóa.

Hàm `onButtonClicked()` kiểm tra xem đã có phiên đang chạy chưa. Nếu chưa có, chúng ta sử dụng `requestSession()` để bắt đầu một phiên và sau khi promise được phân giải, chúng ta gọi hàm `onSessionStarted()` để thiết lập phiên render.

Mặt khác, nếu đã có một phiên XR đang diễn ra, chúng ta gọi {{domxref("XRSession.end", "end()")}} để kết thúc phiên hiện tại. Khi phiên hiện tại kết thúc, sự kiện {{domxref("XRSession.end_event", "end")}} được gửi, vì vậy hãy đặt `xrSession` thành `null` trong trình xử lý của nó để ghi lại việc chúng ta không còn phiên đang diễn ra. Như vậy, nếu người dùng nhấp lại vào nút, một phiên mới sẽ bắt đầu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
