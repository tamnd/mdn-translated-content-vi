---
title: "HID: phương thức requestDevice()"
short-title: requestDevice()
slug: Web/API/HID/requestDevice
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HID.requestDevice
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}

**`requestDevice()`** là phương thức của giao diện {{domxref("HID")}} dùng để yêu cầu quyền truy cập vào một thiết bị HID.

User agent sẽ hiển thị một hộp thoại cấp quyền gồm danh sách các thiết bị đã kết nối và yêu cầu người dùng chọn rồi cấp quyền cho một trong số đó.

## Cú pháp

```js-nolint
requestDevice(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa một mảng các đối tượng lọc cho những thiết bị có thể ghép nối. Mỗi đối tượng lọc có thể có các thuộc tính sau:
    - `vendorId` {{optional_inline}}
      - : Một số nguyên đại diện cho vendorId của thiết bị HID được yêu cầu
    - `productId` {{optional_inline}}
      - : Một số nguyên đại diện cho productId của thiết bị HID được yêu cầu.
    - `usagePage` {{optional_inline}}
      - : Một số nguyên đại diện cho thành phần usage page của HID usage của thiết bị được yêu cầu. Usage cho một collection cấp cao nhất được dùng để xác định loại thiết bị.

        Các giá trị HID usage tiêu chuẩn có thể được tìm thấy trong tài liệu [HID Usage Tables](https://usb.org/document-library/hid-usage-tables-17).

    - `usage` {{optional_inline}}
      - : Một số nguyên đại diện cho thành phần usage ID của HID usage của thiết bị được yêu cầu.

> [!NOTE]
> Các bộ lọc thiết bị được dùng để thu hẹp danh sách thiết bị hiển thị cho người dùng. Nếu không có bộ lọc nào, tất cả thiết bị đã kết nối sẽ được hiển thị. Khi có một hoặc nhiều bộ lọc, một thiết bị sẽ được đưa vào nếu bất kỳ bộ lọc nào khớp. Để khớp một bộ lọc, tất cả các quy tắc trong bộ lọc đó phải khớp.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("HIDDevice")}} đã kết nối khớp với các bộ lọc đã truyền vào.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu trang không cho phép truy cập tính năng HID.

## Bảo mật

[Kích hoạt tạm thời](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc. Người dùng phải tương tác với trang hoặc một phần tử giao diện người dùng thì tính năng này mới hoạt động.

## Ví dụ

### Khớp một thiết bị với cả bốn quy tắc lọc

Trong ví dụ sau, một thiết bị HID được yêu cầu có vendor ID là `0xABCD`, product ID là `0x1234`, usage page `0x0C` và usage ID `0x01`. Chỉ các thiết bị khớp với tất cả các quy tắc này mới được hiển thị.

```js
let requestButton = document.getElementById("request-hid-device");
requestButton.addEventListener("click", async () => {
  let device;
  try {
    const devices = await navigator.hid.requestDevice({
      filters: [
        {
          vendorId: 0xabcd,
          productId: 0x1234,
          usagePage: 0x0c,
          usage: 0x01,
        },
      ],
    });
    device = devices[0];
  } catch (error) {
    console.log("Đã xảy ra lỗi.");
  }

  if (!device) {
    console.log("Không có thiết bị nào được chọn.");
  } else {
    console.log(`Thiết bị HID: ${device.productName}`);
  }
});
```

### Một ví dụ với hai bộ lọc

Ví dụ tiếp theo bao gồm hai bộ lọc. Thiết bị sẽ được hiển thị nếu khớp với một trong hai bộ lọc này.

```js
// Lọc các thiết bị có USB Vendor/Product IDs của Nintendo Switch Joy-Con.
const filters = [
  {
    vendorId: 0x057e, // Nintendo Co., Ltd
    productId: 0x2006, // Joy-Con trái
  },
  {
    vendorId: 0x057e, // Nintendo Co., Ltd
    productId: 0x2007, // Joy-Con phải
  },
];

// Nhắc người dùng chọn một thiết bị Joy-Con.
const [device] = await navigator.hid.requestDevice({ filters });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
