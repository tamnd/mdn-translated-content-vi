---
title: "Bluetooth: phương thức getDevices()"
short-title: getDevices()
slug: Web/API/Bluetooth/getDevices
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Bluetooth.getDevices
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`getDevices()`** của giao diện {{DOMxRef("Bluetooth")}} trả về một mảng chứa các thiết bị Bluetooth mà origin này được phép truy cập, bao gồm cả những thiết bị đang ngoài phạm vi hoặc đã tắt nguồn.

## Cú pháp

```js-nolint
getDevices()
```

### Tham số

Không có.

### Giá trị trả về

Một {{JSxRef("Promise")}} giải quyết với một mảng các đối tượng {{DOMxRef("BluetoothDevice")}}.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác này không được phép trong ngữ cảnh hiện tại do [các cân nhắc về bảo mật](/en-US/docs/Web/API/Web_Bluetooth_API#security_considerations), chẳng hạn như khi được gọi trong lúc quyền truy cập vào tài liệu hiện tại bị chặn bởi chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/bluetooth","bluetooth")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
