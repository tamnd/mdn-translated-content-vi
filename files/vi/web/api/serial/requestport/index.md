---
title: "Serial: phương thức requestPort()"
short-title: requestPort()
slug: Web/API/Serial/requestPort
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Serial.requestPort
---

{{APIRef("Web Serial API")}}{{SecureContext_Header}}{{SeeCompatTable}}

**`Serial.requestPort()`** là phương thức của giao diện {{domxref("Serial")}} hiển thị hộp thoại cho người dùng để họ chọn một thiết bị nối tiếp để kết nối. Nó trả về một {{jsxref("Promise")}} phân giải thành một thể hiện của {{domxref("SerialPort")}} đại diện cho thiết bị do người dùng chọn.

## Mô tả

Khi người dùng lần đầu truy cập một trang web, trang đó sẽ không có quyền truy cập vào bất kỳ thiết bị nối tiếp nào. Trước tiên, trang web phải gọi `requestPort()` để nhắc người dùng chọn thiết bị mà trang web được phép điều khiển.

Phương thức này phải được gọi thông qua [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation). Người dùng phải tương tác với trang hoặc một phần tử giao diện người dùng thì tính năng này mới hoạt động.

## Cú pháp

```js-nolint
requestPort()
requestPort(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `filters` {{optional_inline}}
      - : Một danh sách các đối tượng chứa mã nhà cung cấp, mã sản phẩm hoặc mã lớp dịch vụ Bluetooth được dùng để lọc ra các loại thiết bị cụ thể mà người dùng có thể yêu cầu kết nối. Nếu không chỉ định bộ lọc nào, người dùng sẽ thấy danh sách mọi thiết bị khả dụng để chọn. Bộ lọc có thể chứa các giá trị sau:
        - `bluetoothServiceClassId` {{optional_inline}}
          - : Một số nguyên không dấu dài hoặc chuỗi đại diện cho mã lớp dịch vụ Bluetooth. Giá trị này có thể là bí danh UUID 16 hoặc 32 bit, bất kỳ UUID hợp lệ nào, hoặc một tên hợp lệ từ [GATT assigned services key](https://github.com/WebBluetoothCG/registries/blob/master/gatt_assigned_services.txt).
        - `usbVendorId` {{optional_inline}}
          - : Một số nguyên không dấu ngắn xác định nhà cung cấp của thiết bị USB. [USB Implementors Forum](https://www.usb.org/) gán các mã này cho từng nhà cung cấp cụ thể.
        - `usbProductId` {{optional_inline}}
          - : Một số nguyên không dấu ngắn xác định thiết bị USB. Mỗi nhà cung cấp tự gán mã cho các sản phẩm của họ.
    - `allowedBluetoothServiceClassIds` {{optional_inline}}
      - : Một danh sách các số nguyên không dấu dài và/hoặc chuỗi đại diện cho mã lớp dịch vụ Bluetooth. Các cổng Bluetooth có mã lớp dịch vụ tùy chỉnh sẽ bị loại khỏi danh sách cổng hiển thị cho người dùng, trừ khi mã lớp dịch vụ đó được bao gồm trong danh sách này. Điều này đúng dù bạn có lọc danh sách hay không.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một thể hiện của {{domxref("SerialPort")}}.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : `Promise` trả về sẽ bị từ chối với lỗi này trong một trong các trường hợp sau:
    - Một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `{{httpheader('Permissions-Policy/serial','serial')}}` chặn việc sử dụng tính năng này.
    - Yêu cầu cấp quyền của người dùng bị từ chối.
- `NotFoundError` {{domxref("DOMException")}}
  - : `Promise` trả về sẽ bị từ chối với ngoại lệ này nếu người dùng không chọn cổng nào khi được nhắc.

## Ví dụ

### Cho phép người dùng chọn bất kỳ thiết bị nào

Ví dụ này nhắc người dùng chọn thiết bị thông qua `requestPort()` khi nhấn `<button>`. Nó không bao gồm bộ lọc, nghĩa là danh sách lựa chọn sẽ gồm tất cả thiết bị khả dụng:

```html
<button id="connect">Connect</button>
```

```js
const connectBtn = document.getElementById("connect");
connectBtn.addEventListener("click", () => {
  try {
    const port = await navigator.serial.requestPort();
    // Kết nối với cổng hoặc thêm nó vào danh sách các cổng khả dụng
  } catch (e) {
    // Người dùng không chọn thiết bị nào
  }
});
```

### Cho phép người dùng chọn thiết bị của một nhà cung cấp cụ thể

Trong trường hợp này, một bộ lọc được truyền vào `requestPort()` với mã nhà cung cấp USB để giới hạn tập thiết bị hiển thị cho người dùng chỉ còn các thiết bị USB do một nhà sản xuất cụ thể tạo ra.

```js
connectBtn.addEventListener("click", () => {
  const usbVendorId = 0xabcd;
  try {
    const port = await navigator.serial.requestPort({ filters: [{ usbVendorId }] });
    // Kết nối với cổng hoặc thêm nó vào danh sách các cổng khả dụng
  } catch (e) {
    // Người dùng không chọn thiết bị nào
  }
});
```

### Cho phép người dùng chọn các dịch vụ dựa trên RFCOMM tùy chỉnh

Mặc dù hầu hết thiết bị cung cấp giao tiếp dựa trên SPP thông qua Bluetooth Classic Serial Port Profile đã được chuẩn hóa, một số thiết bị dùng các dịch vụ tùy chỉnh dựa trên giao tiếp vô tuyến tần số cao (RFCOMM). Các thiết bị này có một Service Class ID không nằm trong dải UUID Bluetooth chuẩn.

Bạn cần truyền danh sách `allowedBluetoothServiceClassIds` vào `requestPort()` để truy cập các dịch vụ dựa trên RFCOMM tùy chỉnh này:

```js
const myBluetoothServiceUuid = "01234567-89ab-cdef-0123-456789abcdef";

// Nhắc người dùng chọn bất kỳ cổng nối tiếp nào
// Quyền truy cập vào dịch vụ Bluetooth RFCOMM tùy chỉnh ở trên sẽ được cho phép
const port = await navigator.serial.requestPort({
  allowedBluetoothServiceClassIds: [myBluetoothServiceUuid],
});
```

Bạn cũng có thể dùng khóa lọc `bluetoothServiceClassId` khi gọi `requestPort()` để nhắc người dùng với danh sách các cổng nối tiếp Bluetooth được lọc theo Service Class ID:

```js
const myBluetoothServiceUuid = "01234567-89ab-cdef-0123-456789abcdef";

// Nhắc người dùng chọn các cổng nối tiếp Bluetooth với
// dịch vụ Bluetooth RFCOMM tùy chỉnh ở trên.
const port = await navigator.serial.requestPort({
  allowedBluetoothServiceClassIds: [myBluetoothServiceUuid],
  filters: [{ bluetoothServiceClassId: myBluetoothServiceUuid }],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
