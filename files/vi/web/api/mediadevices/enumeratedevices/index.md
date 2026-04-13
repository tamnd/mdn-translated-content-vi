---
title: "MediaDevices: phương thức enumerateDevices()"
short-title: enumerateDevices()
slug: Web/API/MediaDevices/enumerateDevices
page-type: web-api-instance-method
browser-compat: api.MediaDevices.enumerateDevices
---

{{APIRef("Media Capture and Streams")}}{{SecureContext_Header}}

Phương thức **`enumerateDevices()`** của giao diện {{domxref("MediaDevices")}} yêu cầu một danh sách các thiết bị đầu vào và đầu ra phương tiện hiện có, chẳng hạn microphone, camera, tai nghe, v.v.
{{jsxref("Promise")}} trả về sẽ được resolve thành một mảng các đối tượng {{domxref("MediaDeviceInfo")}} mô tả các thiết bị.

Danh sách trả về sẽ bỏ qua các thiết bị bị chặn bởi [Permission Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) của tài liệu: [`microphone`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/microphone), [`camera`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/camera), [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) (cho thiết bị đầu ra), v.v.
Quyền truy cập một số thiết bị không mặc định còn bị điều tiết bởi [Permissions API](/en-US/docs/Web/API/Permissions_API), và danh sách sẽ bỏ qua các thiết bị mà người dùng chưa cấp quyền rõ ràng.

## Cú pháp

```js-nolint
enumerateDevices()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve với một mảng các đối tượng {{domxref("MediaDeviceInfo")}}.
Mỗi đối tượng trong mảng mô tả một thiết bị đầu vào hoặc đầu ra phương tiện có sẵn.
Thứ tự có ý nghĩa: các thiết bị mặc định sẽ được liệt kê trước.

Ngoài thiết bị mặc định, chỉ những thiết bị đã được cấp quyền mới được xem là "có sẵn".

Nếu thiết bị là thiết bị đầu vào, một đối tượng {{domxref("InputDeviceInfo")}} sẽ được trả về thay thế.

Nếu việc liệt kê thất bại, promise sẽ bị reject.

## Yêu cầu bảo mật

Việc truy cập API này bị ràng buộc bởi các điều kiện sau:

- Phương thức phải được gọi trong một [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Tài liệu phải đang hoạt động hoàn chỉnh và trạng thái hiển thị phải là "visible".

## Ví dụ

Ví dụ sau xuất danh sách các thiết bị mà trình duyệt của bạn hỗ trợ.

```js
if (!navigator.mediaDevices?.enumerateDevices) {
  console.log("enumerateDevices() not supported.");
} else {
  // Liệt kê camera và microphone.
  navigator.mediaDevices
    .enumerateDevices()
    .then((devices) => {
      devices.forEach((device) => {
        console.log(`${device.kind}: ${device.label} id = ${device.deviceId}`);
      });
    })
    .catch((err) => {
      console.error(`${err.name}: ${err.message}`);
    });
}
```

Kết quả có thể là:

```plain
videoinput: id = csO9c0YpAf274OuCPUA53CNE0YHlIr2yXCi+SqfBZZ8=
audioinput: id = RKxXByjnabbADGQNNZqLVLdmXlS0YkETYCIbg+XxnvM=
audioinput: id = r2/xw1xUPIyZunfV1lGrKOma5wTOvCkWfZ368XCndm0=
```

hoặc nếu một hay nhiều {{domxref("MediaStream")}} đang hoạt động hoặc quyền duy trì đã được cấp:

```plain
videoinput: FaceTime HD Camera (Built-in) id=csO9c0YpAf274OuCPUA53CNE0YHlIr2yXCi+SqfBZZ8=
audioinput: default (Built-in Microphone) id=RKxXByjnabbADGQNNZqLVLdmXlS0YkETYCIbg+XxnvM=
audioinput: Built-in Microphone id=r2/xw1xUPIyZunfV1lGrKOma5wTOvCkWfZ368XCndm0=
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaDevices.getUserMedia")}}
- [WebRTC](/en-US/docs/Web/API/WebRTC_API) - trang giới thiệu của API
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) - API cho các đối tượng media stream
- [Taking webcam photos](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos) - bài hướng dẫn dùng `getUserMedia()` để chụp ảnh thay vì video
