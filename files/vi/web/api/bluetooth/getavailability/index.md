---
title: "Bluetooth: phương thức getAvailability()"
short-title: getAvailability()
slug: Web/API/Bluetooth/getAvailability
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Bluetooth.getAvailability
---

{{APIRef("Bluetooth API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`getAvailability()`** của giao diện {{DOMxRef("Bluetooth")}} về danh nghĩa sẽ trả về `true` nếu user agent có thể hỗ trợ Bluetooth (vì thiết bị có bộ điều hợp Bluetooth), và `false` nếu ngược lại.

Từ "về danh nghĩa" được dùng vì nếu quyền dùng Web Bluetooth API bị chặn bởi quyền [`Permissions-Policy: bluetooth`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/bluetooth), phương thức này sẽ luôn trả về `false`.
Ngoài ra, người dùng có thể cấu hình trình duyệt để trả về `false` từ lệnh gọi `getAvailability()` ngay cả khi trình duyệt thực sự có bộ điều hợp Bluetooth đang hoạt động, và ngược lại. Giá trị cài đặt này sẽ bị bỏ qua nếu quyền truy cập bị chặn bởi quyền đó.

Ngay cả khi `getAvailability()` trả về `true` và thiết bị thực sự có bộ điều hợp Bluetooth, điều đó cũng không nhất thiết có nghĩa là việc gọi {{DOMxRef("Bluetooth.requestDevice","navigator.bluetooth.requestDevice()")}} sẽ được giải quyết với một {{DOMxRef("BluetoothDevice")}}.
Bộ điều hợp Bluetooth có thể chưa được bật nguồn, và người dùng cũng có thể từ chối quyền dùng API khi được nhắc.

## Cú pháp

```js-nolint
getAvailability()
```

### Tham số

Không có.

### Giá trị trả về

Một {{JSxRef("Promise")}} giải quyết với một {{JSxRef("Boolean")}}.

{{JSxRef("Promise")}} sẽ giải quyết với giá trị `false` nếu quyền truy cập bị chặn bởi [`Permissions-Policy: bluetooth`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/bluetooth), nếu người dùng đã cấu hình trình duyệt luôn giải quyết với `false`, hoặc nếu thiết bị không có bộ điều hợp Bluetooth.
Nếu không, nó sẽ giải quyết với `true`.

### Ngoại lệ

Không có.

## Ví dụ

Đoạn mã sau in ra console một thông báo cho biết thiết bị có hỗ trợ Bluetooth hay không:

```js
navigator.bluetooth.getAvailability().then((available) => {
  if (available) {
    console.log("This device supports Bluetooth!");
  } else {
    console.log("Doh! Bluetooth is not supported");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
