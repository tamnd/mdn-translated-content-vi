---
title: "HIDDevice: sự kiện inputreport"
short-title: inputreport
slug: Web/API/HIDDevice/inputreport_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HIDDevice.inputreport_event
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Sự kiện **`inputreport`** của giao diện {{domxref("HIDDevice")}} được kích hoạt khi nhận được báo cáo mới từ thiết bị HID.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("inputreport", (event) => { })

oninputreport = (event) => { }
```

## Loại sự kiện

Một {{domxref("HIDInputReportEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("HIDInputReportEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("HIDInputReportEvent.data")}} {{ReadOnlyInline}}
  - : Một {{jsxref("DataView")}} chứa dữ liệu từ báo cáo đầu vào, không bao gồm `reportId` nếu giao diện HID sử dụng ID báo cáo.
- {{domxref("HIDInputReportEvent.device")}} {{ReadOnlyInline}}
  - : Phiên bản {{domxref("HIDDevice")}} đại diện cho giao diện HID đã gửi báo cáo đầu vào.
- {{domxref("HIDInputReportEvent.reportId")}} {{ReadOnlyInline}}
  - : Tiền tố nhận dạng một byte cho báo cáo này, hoặc 0 nếu giao diện HID không sử dụng ID báo cáo.

## Ví dụ

Ví dụ sau minh họa cách lắng nghe sự kiện `inputreport` cho phép ứng dụng phát hiện nút nào được nhấn trên thiết bị Joy-Con Right. Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Kết nối với các thiết bị HID không phổ biến](https://developer.chrome.com/docs/capabilities/hid).

```js
device.addEventListener("inputreport", (event) => {
  const { data, device, reportId } = event;

  // Handle only the Joy-Con Right device and a specific report ID.
  if (device.productId !== 0x2007 && reportId !== 0x3f) return;

  const value = data.getUint8(0);
  if (value === 0) return;

  const someButtons = { 1: "A", 2: "X", 4: "B", 8: "Y" };
  console.log(`User pressed button ${someButtons[value]}.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
