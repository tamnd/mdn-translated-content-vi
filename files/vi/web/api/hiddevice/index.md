---
title: HIDDevice
slug: Web/API/HIDDevice
page-type: web-api-interface
status:
  - experimental
browser-compat: api.HIDDevice
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Giao diện **`HIDDevice`** của [WebHID API](/en-US/docs/Web/API/WebHID_API) đại diện cho một thiết bị HID. Nó cung cấp các thuộc tính để truy cập thông tin về thiết bị, các phương thức để mở và đóng kết nối, cũng như gửi và nhận báo cáo.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này cũng kế thừa các thuộc tính từ {{domxref("EventTarget")}}.

- {{domxref("HIDDevice.opened")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị {{jsxref("boolean")}}, `true` nếu thiết bị đang có kết nối mở.
- {{domxref("HIDDevice.vendorId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `vendorId` của thiết bị HID.
- {{domxref("HIDDevice.productId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `productId` của thiết bị HID.
- {{domxref("HIDDevice.productName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chuỗi chứa tên sản phẩm của thiết bị HID.
- {{domxref("HIDDevice.collections")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng các định dạng báo cáo của thiết bị HID.

### Sự kiện

- {{domxref("HIDDevice.inputreport_event", "inputreport")}} {{Experimental_Inline}}
  - : Kích hoạt khi thiết bị gửi một báo cáo.

## Phương thức phiên bản

Giao diện này cũng kế thừa các phương thức từ {{domxref("EventTarget")}}.

- {{domxref("HIDDevice.open()")}} {{Experimental_Inline}}
  - : Mở kết nối đến thiết bị HID này và trả về một {{jsxref("Promise")}} được giải quyết khi kết nối thành công.
- {{domxref("HIDDevice.close()")}} {{Experimental_Inline}}
  - : Đóng kết nối đến thiết bị HID này và trả về một {{jsxref("Promise")}} được giải quyết khi kết nối đã đóng.
- {{domxref("HIDDevice.forget()")}} {{Experimental_Inline}}
  - : Đóng kết nối đến thiết bị HID này và đặt lại quyền truy cập, trả về một {{jsxref("Promise")}} được giải quyết khi quyền đã được đặt lại.
- {{domxref("HIDDevice.sendReport()")}} {{Experimental_Inline}}
  - : Gửi báo cáo đầu ra đến thiết bị HID này và trả về một {{jsxref("Promise")}} được giải quyết khi báo cáo đã được gửi.
- {{domxref("HIDDevice.sendFeatureReport()")}} {{Experimental_Inline}}
  - : Gửi báo cáo tính năng đến thiết bị HID này và trả về một {{jsxref("Promise")}} được giải quyết khi báo cáo đã được gửi.
- {{domxref("HIDDevice.receiveFeatureReport()")}} {{Experimental_Inline}}
  - : Nhận báo cáo tính năng từ thiết bị HID này dưới dạng một {{jsxref("Promise")}} được giải quyết với một {{jsxref("DataView")}}. Điều này cho phép truy cập có kiểu vào nội dung của thông điệp này.

## Ví dụ

Ví dụ sau minh họa cách lắng nghe sự kiện `inputreport` cho phép ứng dụng phát hiện nút nào được nhấn trên thiết bị Joy-Con Right.

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

Trong ví dụ sau, `sendFeatureReport` được dùng để làm thiết bị nhấp nháy.

```js
const reportId = 1;
for (let i = 0; i < 10; i++) {
  // Turn off
  await device.sendFeatureReport(reportId, Uint32Array.from([0, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
  // Turn on
  await device.sendFeatureReport(reportId, Uint32Array.from([512, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
}
```

Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Kết nối với các thiết bị HID không phổ biến](https://developer.chrome.com/docs/capabilities/hid).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
