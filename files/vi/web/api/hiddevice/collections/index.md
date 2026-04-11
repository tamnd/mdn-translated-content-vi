---
title: "HIDDevice: thuộc tính collections"
short-title: collections
slug: Web/API/HIDDevice/collections
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDDevice.collections
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính chỉ đọc **`collections`** của giao diện {{domxref("HIDDevice")}} trả về một mảng các định dạng báo cáo.

## Giá trị

Một mảng các định dạng báo cáo. Mỗi phần tử chứa các trường sau:

- `usagePage`
  - : Một số nguyên đại diện cho thành phần trang sử dụng của HID usage liên kết với bộ sưu tập này. Trang sử dụng của bộ sưu tập cấp cao nhất được dùng để xác định loại thiết bị.

    Các giá trị HID usage tiêu chuẩn có thể tìm thấy trong tài liệu [HID Usage Tables](https://usb.org/document-library/hid-usage-tables-17).

- `usage`
  - : Một số nguyên đại diện cho thành phần ID sử dụng của HID usage liên kết với bộ sưu tập này.
- `type`
  - : Một giá trị 8-bit đại diện cho loại bộ sưu tập, mô tả mối quan hệ giữa các mục được nhóm lại. Một trong các giá trị sau:
    - `0x00`
      - : Physical (nhóm các trục)
    - `0x01`
      - : Application (chuột, bàn phím)
    - `0x02`
      - : Logical (dữ liệu có liên quan)
    - `0x03`
      - : Report
    - `0x04`
      - : Named array
    - `0x05`
      - : Usage switch
    - `0x06`
      - : Usage modified
    - `0x07` đến `0x7F`
      - : Dành riêng cho sử dụng trong tương lai
    - `0x80` đến `0xFF`
      - : Do nhà cung cấp định nghĩa

    Thông tin thêm về các loại này có thể tìm thấy trong tài liệu [Device Class Definition](https://www.usb.org/document-library/device-class-definition-hid-111).

- `children`
  - : Một mảng các bộ sưu tập con có cùng định dạng với bộ sưu tập cấp cao nhất.
- `inputReports`
  - : Một mảng các mục `inputReport` đại diện cho từng báo cáo đầu vào được mô tả trong bộ sưu tập này.
- `outputReports`
  - : Một mảng các mục `outputReport` đại diện cho từng báo cáo đầu ra được mô tả trong bộ sưu tập này.
- `featureReports`
  - : Một mảng các mục `featureReport` đại diện cho từng báo cáo tính năng được mô tả trong bộ sưu tập này.

## Ví dụ

Ví dụ sau minh họa cách truy cập các phần tử khác nhau sau khi thuộc tính `collections` được trả về. Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Kết nối với các thiết bị HID không phổ biến](https://developer.chrome.com/docs/capabilities/hid).

```js
for (const collection of device.collections) {
  // A HID collection includes usage, usage page, reports, and subcollections.
  console.log(`Usage: ${collection.usage}`);
  console.log(`Usage page: ${collection.usagePage}`);

  for (const inputReport of collection.inputReports) {
    console.log(`Input report: ${inputReport.reportId}`);
    // Loop through inputReport.items
  }

  for (const outputReport of collection.outputReports) {
    console.log(`Output report: ${outputReport.reportId}`);
    // Loop through outputReport.items
  }

  for (const featureReport of collection.featureReports) {
    console.log(`Feature report: ${featureReport.reportId}`);
    // Loop through featureReport.items
  }

  // Loop through subcollections with collection.children
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
