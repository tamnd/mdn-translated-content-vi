---
title: "Navigator: phương thức requestMIDIAccess()"
short-title: requestMIDIAccess()
slug: Web/API/Navigator/requestMIDIAccess
page-type: web-api-instance-method
browser-compat: api.Navigator.requestMIDIAccess
---

{{APIRef("Web MIDI API")}}{{SecureContext_Header}}

Phương thức **`requestMIDIAccess()`** của giao diện {{domxref('Navigator')}} trả về {{jsxref('Promise')}} thể hiện yêu cầu truy cập vào thiết bị MIDI trên hệ thống của người dùng.
Phương pháp này là một phần của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API), cung cấp phương tiện để truy cập, liệt kê và thao tác với các thiết bị MIDI.

Phương pháp này có thể nhắc người dùng truy cập vào các thiết bị MIDI có sẵn trong hệ thống của họ hoặc có thể sử dụng tùy chọn đã thiết lập trước đó để cấp hoặc từ chối quyền truy cập.
Nếu được cấp quyền thì {{jsxref('Promise')}} sẽ phân giải và trả về đối tượng [`MIDIAccess`](/en-US/docs/Web/API/MIDIAccess).

## Cú pháp

```js-nolint
requestMIDIAccess()
requestMIDIAccess(MIDIOptions)
```

### Thông số

- `MIDIOptions` {{optional_inline}}
  - : {{jsxref('Object')}} thể hiện các tùy chọn để chuyển vào phương thức. Các tùy chọn này là:
    - `sysex`
      - : Giá trị {{jsxref('Boolean')}}, nếu được đặt thành `true`, sẽ cho phép khả năng gửi và nhận tin nhắn dành riêng cho hệ thống (sysex). Giá trị mặc định là `false`.
    - `software`
      - : Giá trị {{jsxref('Boolean')}}, nếu được đặt thành `true`, sẽ cho phép hệ thống sử dụng mọi bộ tổng hợp phần mềm đã cài đặt. Giá trị mặc định là `false`.

### Giá trị trả về

{{jsxref('Promise')}} phân giải bằng đối tượng [`MIDIAccess`](/en-US/docs/Web/API/MIDIAccess).

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Bị ném nếu tài liệu hoặc trang bị đóng do điều hướng của người dùng.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu hệ thống cơ bản phát sinh bất kỳ lỗi nào.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Bị loại bỏ nếu tính năng hoặc tùy chọn không được hệ thống hỗ trợ.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Bị ném nếu người dùng hoặc hệ thống từ chối ứng dụng tạo đối tượng [MIDIAccess](/en-US/docs/Web/API/MIDIAccess) với các tùy chọn được yêu cầu hoặc nếu tài liệu không được phép sử dụng tính năng này (ví dụ: do [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) hoặc do người dùng trước đó đã từ chối yêu cầu cấp phép).

## Yêu cầu bảo mật

Quyền truy cập vào API phải tuân theo các ràng buộc sau:

- Phương thức này phải được gọi trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Quyền truy cập có thể được kiểm soát bởi [`midi`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/midi) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- Người dùng phải cấp quyền rõ ràng để sử dụng API thông qua cơ chế cụ thể cho tác nhân người dùng hoặc đã được cấp quyền trước đó.
  Lưu ý rằng nếu quyền truy cập bị từ chối bởi chính sách cấp phép thì quyền truy cập đó không thể được cấp bởi người dùng.

Trạng thái quyền có thể được truy vấn bằng phương thức [Permissions API](/en-US/docs/Web/API/Permissions_API) [`navigator.permissions.query()`](/en-US/docs/Web/API/Permissions/query), chuyển bộ mô tả quyền với quyền `midi` và thuộc tính `sysex` (tùy chọn):

```js
navigator.permissions.query({ name: "midi", sysex: true }).then((result) => {
  if (result.state === "granted") {
    // Access granted.
  } else if (result.state === "prompt") {
    // Using API will prompt for permission
  }
  // Permission was denied by user prompt or permission policy
});
```

## Ví dụ

### Yêu cầu quyền truy cập MIDI

Trong ví dụ sau, phương thức `Navigator.requestMIDIAccess()` trả về đối tượng {{domxref("MIDIAccess")}}, đối tượng này cho phép truy cập thông tin về cổng MIDI đầu vào và đầu ra.

```js
navigator.requestMIDIAccess().then((access) => {
  // Get lists of available MIDI controllers
  const inputs = access.inputs.values();
  const outputs = access.outputs.values();
  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API)
- [Introduction to Web MIDI](https://code.tutsplus.com/introduction-to-web-midi--cms-25220t)
