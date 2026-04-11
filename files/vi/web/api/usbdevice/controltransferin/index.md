---
title: "USBDevice: phương thức controlTransferIn()"
short-title: controlTransferIn()
slug: Web/API/USBDevice/controlTransferIn
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.controlTransferIn
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`controlTransferIn()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBInTransferResult")}} khi một lệnh hoặc yêu cầu trạng thái đã được truyền tới (nhận bởi) thiết bị USB.

## Cú pháp

```js-nolint
controlTransferIn(setup, length)
```

### Tham số

- `setup`
  - : Một đối tượng thiết lập các tùy chọn. Các tùy chọn có sẵn bao gồm:
    - `requestType`
      - : Phải là một trong ba giá trị chỉ định liệu quá trình truyền là `"standard"` (chung cho tất cả thiết bị USB), `"class"` (chung cho một lớp thiết bị theo chuẩn ngành) hoặc `"vendor"`.
    - `recipient`
      - : Chỉ định mục tiêu của quá trình truyền trên thiết bị, một trong các giá trị `"device"`, `"interface"`, `"endpoint"`, hoặc `"other"`.
    - `request`
      - : Một lệnh dành riêng cho nhà cung cấp.
    - `value`
      - : Các tham số yêu cầu dành riêng cho nhà cung cấp.
    - `index`
      - : Số giao diện của người nhận.

- `length`
  - : Số byte tối đa cần đọc từ thiết bị. Dữ liệu thực tế nằm trong {{domxref("USBInTransferResult")}} trong Promise được giải quyết.

### Giá trị trả về

{{jsxref("promise")}} được giải quyết với {{domxref("USBInTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
