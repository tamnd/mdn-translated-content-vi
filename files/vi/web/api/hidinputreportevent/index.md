---
title: HIDInputReportEvent
slug: Web/API/HIDInputReportEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HIDInputReportEvent
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Giao diện **`HIDInputReportEvent`** của [WebHID API](/en-US/docs/Web/API/WebHID_API) được truyền vào sự kiện {{domxref("HIDDevice.inputreport_event", "inputreport")}} của `HIDDevice` khi nhận được một báo cáo đầu vào từ bất kỳ thiết bị HID liên kết nào.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("HIDInputReportEvent.data")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("DataView")}} chứa dữ liệu từ báo cáo đầu vào, ngoại trừ `reportId` nếu giao diện HID sử dụng ID báo cáo.
- {{domxref("HIDInputReportEvent.device")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Phiên bản {{domxref("HIDDevice")}} đại diện cho giao diện HID đã gửi báo cáo đầu vào.
- {{domxref("HIDInputReportEvent.reportId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Tiền tố nhận dạng một byte cho báo cáo này, hoặc 0 nếu giao diện HID không sử dụng ID báo cáo.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ lớp cha, {{domxref("Event")}}._

## Ví dụ

Ví dụ sau đây minh họa việc lắng nghe một `inputReport` cho phép ứng dụng phát hiện nút nào được nhấn trên thiết bị Joy-Con Right. Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Connecting to uncommon HID devices](https://developer.chrome.com/docs/capabilities/hid).

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
