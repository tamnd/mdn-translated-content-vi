---
title: Web Bluetooth API
slug: Web/API/Web_Bluetooth_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Bluetooth
---

{{DefaultAPISidebar("Bluetooth API")}}{{SeeCompatTable}}

Web Bluetooth API cung cấp khả năng kết nối và tương tác với các thiết bị ngoại vi Bluetooth Low Energy.

> [!NOTE]
> API này _không có sẵn_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được lộ ra qua {{domxref("WorkerNavigator")}}).

## Giao diện

- {{DOMxRef("Bluetooth")}}
  - : Cung cấp các phương thức để kiểm tra khả năng sẵn có của Bluetooth và yêu cầu quyền truy cập vào thiết bị.
- {{DOMxRef("BluetoothCharacteristicProperties")}}
  - : Cung cấp các thuộc tính của một `BluetoothRemoteGATTCharacteristic` cụ thể.
- {{DOMxRef("BluetoothDevice")}}
  - : Đại diện cho một thiết bị Bluetooth trong một môi trường thực thi script cụ thể.
- {{DOMxRef("BluetoothRemoteGATTCharacteristic")}}
  - : Đại diện cho một GATT Characteristic, là một phần tử dữ liệu cơ bản cung cấp thêm thông tin về dịch vụ của một thiết bị ngoại vi.
- {{DOMxRef("BluetoothRemoteGATTDescriptor")}}
  - : Đại diện cho một GATT Descriptor, cung cấp thêm thông tin về giá trị của một characteristic.
- {{DOMxRef("BluetoothRemoteGATTServer")}}
  - : Đại diện cho một GATT Server trên thiết bị từ xa.
- {{DOMxRef("BluetoothRemoteGATTService")}}
  - : Đại diện cho một dịch vụ do GATT server cung cấp, bao gồm một thiết bị, danh sách các dịch vụ được tham chiếu và danh sách các characteristic của dịch vụ này.

## Mở rộng các giao diện khác

Bluetooth API mở rộng các API sau, bổ sung những tính năng được liệt kê.

### Navigator

- {{domxref("Navigator.bluetooth")}}
  - : Trả về một đối tượng {{domxref("Bluetooth")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng của Web Bluetooth API.

## Cân nhắc về bảo mật

Web Bluetooth API chỉ có thể được dùng trong một ngữ cảnh an toàn.

Quyền truy cập API này được kiểm soát bởi chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/bluetooth","bluetooth")}}.
Danh sách cho phép mặc định cho chính sách `bluetooth` là `self`, cho phép dùng Bluetooth trong các frame lồng nhau cùng nguồn gốc nhưng mặc định ngăn nội dung từ bên thứ ba truy cập.
Truy cập khác nguồn gốc được bật bằng cách chỉ định các origin được phép trong cả header HTTP `Permissions-Policy: bluetooth` và `<iframe>` mong muốn.

Để dùng tính năng này, trước tiên người dùng phải cấp quyền rõ ràng. Họ sẽ không được nhắc cấp quyền nếu quyền đã bị chặn vì lý do khác, chẳng hạn như bị ngăn bởi Permissions Policy.
Lời nhắc cấp quyền sẽ xuất hiện khi gọi {{domxref("Bluetooth.requestDevice()")}} để yêu cầu truy cập vào một thiết bị Bluetooth mới mà chưa được cấp quyền. Đối tượng toàn cục sở hữu cũng phải có {{glossary("transient activation")}}.
Bạn có thể dùng {{domxref("Bluetooth.getDevices()")}} để truy xuất mọi thiết bị mà trước đó site đã được cấp quyền.

Phương thức {{domxref("Permissions/query","navigator.permissions.query()")}} của [Permissions API](/en-US/docs/Web/API/Permissions_API) có thể được dùng với quyền `bluetooth` để kiểm tra xem site có quyền sử dụng thiết bị Bluetooth hay không.
Trạng thái quyền sẽ là `granted`, `denied` hoặc `prompt` (cần người dùng xác nhận qua lời nhắc):

```js
const btPermission = await navigator.permissions.query({ name: "bluetooth" });
if (btPermission.state !== "denied") {
  // Thực hiện gì đó
}
```

<!-- Phần bên dưới là đúng theo đặc tả, nhưng chưa được triển khai tại thời điểm viết: https://github.com/WebBluetoothCG/web-bluetooth/issues/620#issuecomment-1986689299.
-->
<!--
Bạn cũng có thể dùng `query()` để truy xuất trực tiếp các thiết bị đã từng được cấp quyền cho site.
Ví dụ, đoạn mã sau (đã sửa từ ví dụ trong đặc tả) trả về thiết bị Bluetooth gần nhất đã được dùng và đã được người dùng cấp quyền:

```js
const btPermission = await navigator.permissions.query({
  name: "bluetooth",
  deviceId: sessionStorage.lastDevice,
});
if (result.devices.length === 1) {
  return result.devices[0];
} else {
  throw new DOMException("Lost permission", "NotFoundError");
}
```

Lưu ý rằng các tùy chọn có thể truyền cho `query()` với quyền `bluetooth` cũng chính là các tùy chọn có thể truyền làm đối số cho {{DOMxRef("Bluetooth.requestDevice()")}}.
Giá trị {{jsxref("Promise")}} trả về sẽ được giải quyết thành `BluetoothPermissionResult`, một đối tượng {{domxref("PermissionStatus")}} mở rộng, trả về một mảng các thiết bị được phép trong thuộc tính `devices`.
-->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
