---
title: "USBDevice: phương thức controlTransferOut()"
short-title: controlTransferOut()
slug: Web/API/USBDevice/controlTransferOut
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.controlTransferOut
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`controlTransferOut()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("USBOutTransferResult")}} khi một lệnh hoặc thao tác trạng thái đã được truyền từ thiết bị USB.

## Cú pháp

```js-nolint
controlTransferOut(setup, data)
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

- `data`
  - : Một {{jsxref("TypedArray")}} chứa dữ liệu sẽ được truyền tới thiết bị. Không phải tất cả các lệnh đều yêu cầu dữ liệu; một số lệnh có thể gửi dữ liệu chỉ thông qua tham số value. Hãy kiểm tra với thiết bị của bạn để biết yêu cầu cụ thể của từng yêu cầu.

### Giá trị trả về

Một {{jsxref("promise")}} được giải quyết với {{domxref("USBOutTransferResult")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
