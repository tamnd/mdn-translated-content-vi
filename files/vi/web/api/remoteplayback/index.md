---
title: RemotePlayback
slug: Web/API/RemotePlayback
page-type: web-api-interface
browser-compat: api.RemotePlayback
---

{{APIRef("Remote Playback API")}}

Giao diện **`RemotePlayback`** của {{domxref('Remote Playback API','','',' ')}} cho phép trang phát hiện sự khả dụng của các thiết bị phát từ xa, sau đó kết nối và điều khiển phát trên các thiết bị đó.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha {{DOMxRef("EventTarget")}}._

- {{domxref("RemotePlayback.state")}} {{ReadOnlyInline}}
  - : Đại diện cho trạng thái kết nối của `RemotePlayback`. Một trong các giá trị:
    - `"connecting"`
      - : Tác nhân người dùng đang cố gắng khởi tạo phát từ xa với thiết bị đã chọn.
    - `"connected"`
      - : Quá trình chuyển đổi từ phát cục bộ sang phát từ xa đã xảy ra, tất cả các lệnh bây giờ sẽ được thực hiện trên thiết bị từ xa.
    - `"disconnected"`
      - : Phát từ xa chưa được khởi tạo, đã thất bại khi khởi tạo, hoặc đã bị dừng.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha {{DOMxRef("EventTarget")}}._

- {{domxref("RemotePlayback.watchAvailability()")}}
  - : Theo dõi danh sách các thiết bị phát từ xa khả dụng và trả về một {{jsxref("Promise")}} được giải quyết với `callbackId` của một thiết bị phát từ xa khả dụng.
- {{domxref("RemotePlayback.cancelWatchAvailability()")}}
  - : Hủy yêu cầu theo dõi tính khả dụng của các thiết bị phát từ xa.
- {{domxref("RemotePlayback.prompt()")}}
  - : Nhắc người dùng chọn và cấp quyền kết nối với một thiết bị phát từ xa.

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha {{DOMxRef("EventTarget")}}._

- {{domxref("RemotePlayback.connecting_event", "connecting")}}
  - : Được kích hoạt khi tác nhân người dùng khởi tạo phát từ xa.
- {{domxref("RemotePlayback.connect_event", "connect")}}
  - : Được kích hoạt khi tác nhân người dùng kết nối thành công với thiết bị từ xa.
- {{domxref("RemotePlayback.disconnect_event", "disconnect")}}
  - : Được kích hoạt khi tác nhân người dùng ngắt kết nối khỏi thiết bị từ xa.

## Ví dụ

Ví dụ sau minh họa một trình phát với điều khiển tùy chỉnh hỗ trợ phát từ xa. Ban đầu nút được dùng để chọn thiết bị bị ẩn:

```html
<video id="videoElement" src="https://example.org/media.ext">
  <button id="deviceBtn" class="hidden">Pick device</button>
</video>
```

```css
.hidden {
  display: none;
}
```

Phương thức {{domxref("RemotePlayback.watchAvailability()")}} được dùng để theo dõi các thiết bị phát từ xa khả dụng. Nếu có thiết bị, dùng callback để hiện nút.

```js
const deviceBtn = document.getElementById("deviceBtn");
const videoElem = document.getElementById("videoElement");

function availabilityCallback(available) {
  // Show or hide the device picker button depending on device availability.
  if (available) {
    deviceBtn.classList.remove("hidden");
  } else {
    deviceBtn.classList.add("hidden");
  }
}

videoElem.remote.watchAvailability(availabilityCallback).catch(() => {
  // If the device cannot continuously watch available,
  // show the button to allow the user to try to prompt for a connection.
  deviceBtn.classList.remove("hidden");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
