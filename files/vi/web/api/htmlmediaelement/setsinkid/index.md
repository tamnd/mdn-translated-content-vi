---
title: "HTMLMediaElement: phương thức setSinkId()"
short-title: setSinkId()
slug: Web/API/HTMLMediaElement/setSinkId
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.setSinkId
---

{{APIRef("Audio Output Devices API")}}{{securecontext_header}}

Phương thức **`setSinkId()`** của giao diện {{domxref("HTMLMediaElement")}} đặt ID của thiết bị âm thanh sẽ sử dụng cho đầu ra và trả về {{jsxref("Promise")}}.

Điều này chỉ hoạt động khi ứng dụng được phép sử dụng thiết bị được chỉ định.
Để biết thêm thông tin, hãy xem [security requirements](#security_requirements) bên dưới.

## Cú pháp

```js-nolint
setSinkId(sinkId)
```

### Tham số

- `sinkId`
- : {{domxref("MediaDeviceInfo.deviceId")}} của thiết bị đầu ra âm thanh.

### Giá trị trả về

{{jsxref("Promise")}} phân giải thành {{jsxref("undefined")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
- : Được trả về nếu [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được sử dụng để chặn việc sử dụng đầu ra âm thanh.
- `NotFoundError` {{domxref("DOMException")}}
- : Được trả về nếu `deviceId` không khớp với bất kỳ thiết bị đầu ra âm thanh nào.
- `AbortError` {{domxref("DOMException")}}
- : Được trả về nếu việc chuyển thiết bị đầu ra âm thanh sang thiết bị âm thanh mới không thành công.

## Yêu cầu bảo mật

Quyền truy cập vào API phải tuân theo các ràng buộc sau:

- Phương thức này phải được gọi theo dạng [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Quyền truy cập có thể được kiểm soát bởi [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- Cần có sự cho phép của người dùng để truy cập vào một thiết bị không mặc định.
  Người dùng cấp quyền bằng cách chọn thiết bị được liên kết với ID trong lời nhắc được hiển thị bởi {{domxref("MediaDevices.selectAudioOutput()")}}.

## Ví dụ

Ví dụ này cho thấy cách chọn thiết bị đầu ra âm thanh từ mảng được trả về bởi {{domxref("MediaDevices.enumerateDevices()")}} và đặt thiết bị này làm thiết bị thu âm thanh.
Lưu ý rằng kết quả của `enumerateDevices()` chỉ bao gồm các thiết bị không cần có sự cho phép của người dùng hoặc đã được cấp.

```js
const devices = await navigator.mediaDevices.enumerateDevices();
const audioDevice = devices.find((device) => device.kind === "audiooutput");
const audio = document.createElement("audio");
await audio.setSinkId(audioDevice.deviceId);
console.log(`Audio is being output on ${audio.sinkId}`);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Audio Output Devices API](/en-US/docs/Web/API/Audio_Output_Devices_API)
- {{domxref("MediaDevices.selectAudioOutput()")}}
- {{domxref("HTMLMediaElement.sinkId")}}
