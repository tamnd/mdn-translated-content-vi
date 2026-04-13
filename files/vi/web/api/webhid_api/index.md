---
title: WebHID API
slug: Web/API/WebHID_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.HID
---

{{DefaultAPISidebar("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Human Interface Device (HID) là một loại thiết bị nhận dữ liệu từ con người hoặc xuất dữ liệu cho con người. Thuật ngữ này cũng chỉ giao thức HID, một chuẩn cho giao tiếp hai chiều giữa máy chủ và thiết bị được thiết kế để đơn giản hóa quy trình cài đặt. Giao thức HID ban đầu được phát triển cho thiết bị USB nhưng sau đó đã được triển khai trên nhiều giao thức khác, bao gồm cả Bluetooth.

## Giao diện

- {{domxref("HID")}}
  - : Cung cấp các phương thức để kết nối với thiết bị HID, liệt kê các thiết bị HID đang được gắn và các trình xử lý sự kiện cho thiết bị HID đã kết nối.
- {{domxref("HIDDevice")}}
  - : Đại diện cho một thiết bị HID. Một thiết bị vật lý đơn lẻ có thể được biểu diễn bởi nhiều đối tượng `HIDDevice`.
- {{domxref("HIDInputReportEvent")}}
  - : Được truyền tới sự kiện {{domxref("HIDDevice.inputreport_event", "inputreport")}} của `HIDDevice` khi một báo cáo đầu vào được nhận từ bất kỳ thiết bị HID liên quan nào.
- {{domxref("HIDConnectionEvent")}}
  - : Được truyền tới các sự kiện `HID` {{domxref("HID.connect_event", "connect")}} và {{domxref("HID.disconnect_event", "disconnect")}} khi một thiết bị được kết nối hoặc ngắt kết nối.

## Ví dụ

Bạn có thể kết nối với một thiết bị bằng phương thức {{domxref("HID.requestDevice","requestDevice()")}}. Trong trường hợp này, chúng ta chọn từ tất cả thiết bị khả dụng.

```js
const device = await navigator.hid.requestDevice({ filters: [] });
// Một hộp thoại có tiêu đề `... wants to connect to a HID Device` với các nút `Cancel` và `Connect` sẽ xuất hiện cùng danh sách thiết bị để chọn.
// Chọn một thiết bị rồi nhấn nút `Connect`. Sau đó thiết bị sẽ là một mảng chứa thiết bị đã chọn.
```

Chúng ta có thể lấy tất cả thiết bị mà website đã từng được cấp quyền truy cập trước đó và ghi tên thiết bị ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`Thiết bị HID: ${device.productName}`);
});
```

Chúng ta có thể đăng ký trình nghe sự kiện cho việc ngắt kết nối của bất kỳ thiết bị HID nào.

```js
navigator.hid.addEventListener("disconnect", (event) => {
  console.log(`HID đã ngắt kết nối: ${event.device.productName}`);
  console.dir(event);
});
// Ví dụ, khi bàn phím đang kết nối của tôi bị ngắt kết nối, nhật ký trong console sẽ hiển thị:
// HID đã ngắt kết nối: USB Keyboard
// {
//    bubbles: false
//    cancelBubble: false
//    cancelable: false
//    composed: false
//    currentTarget: HID {onconnect: null, ondisconnect: null}
//    defaultPrevented: false
//    device: HIDDevice {oninputreport: null, opened: false, vendorId: 6700, productId: 11555, productName: "USB Keyboard", …}
//    eventPhase: 0
//    isTrusted: true
//    path: []
//    returnValue: true
//    srcElement: HID {onconnect: null, ondisconnect: null}
//    target: HID {onconnect: null, ondisconnect: null}
//    timeStamp: 18176.600000023842
//    type: "disconnect"
// }

// Sự kiện ở trên là một thể hiện của giao diện HIDConnectionEvent.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
