---
title: "USBDevice: phương thức clearHalt()"
short-title: clearHalt()
slug: Web/API/USBDevice/clearHalt
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.clearHalt
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`clearHalt()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết khi điều kiện tạm dừng được xóa. Điều kiện tạm dừng xảy ra khi quá trình truyền dữ liệu tới hoặc từ thiết bị có trạng thái `'stall'`, điều này yêu cầu trang web (hệ thống _host_ trong thuật ngữ USB) phải xóa điều kiện đó. Xem thêm thông tin chi tiết.

## Cú pháp

```js-nolint
clearHalt(direction, endpointNumber)
```

### Tham số

- `direction`
  - : Cho biết liệu đầu vào hay đầu ra của thiết bị cần được xóa. Các giá trị hợp lệ là `'in'` hoặc `'out'`.
- `endpointNumber`
  - : Cho biết số của điểm cuối cần xóa. Promise sẽ bị từ chối nếu điểm cuối không hợp lệ được cung cấp.

### Giá trị trả về

Một {{jsxref("promise")}}.

## Ví dụ

Ví dụ sau đây cho thấy cách kiểm tra và xóa điều kiện `'stall'` trong kết quả của một lần truyền dữ liệu.

> [!NOTE]
> Dữ liệu nào có thể được truyền tới thiết bị USB và cách thức truyền là đặc thù và độc đáo đối với từng thiết bị.

```js
while (true) {
  let result = await data.transferIn(1, 6);

  if (result.data && result.data.byteLength === 6) {
    console.log(`Channel 1: ${result.data.getUint16(0)}`);
    console.log(`Channel 2: ${result.data.getUint16(2)}`);
    console.log(`Channel 5: ${result.data.getUint16(4)}`);
  }

  if (result.status === "stall") {
    console.warn("Endpoint stalled. Clearing.");
    await device.clearHalt("in", 1);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
