---
title: MediaDeviceInfo
slug: Web/API/MediaDeviceInfo
page-type: web-api-interface
browser-compat: api.MediaDeviceInfo
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Giao diện **`MediaDeviceInfo`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} chứa thông tin mô tả một thiết bị đầu vào hoặc đầu ra media duy nhất.

Danh sách thiết bị thu được bằng cách gọi {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}} là một mảng các đối tượng `MediaDeviceInfo`, một đối tượng cho mỗi thiết bị media.

## Thuộc tính phiên bản

- {{domxref("MediaDeviceInfo.deviceId")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi là định danh cho thiết bị được đại diện, được lưu trữ lâu dài qua các phiên. Nó không thể đoán được bởi các ứng dụng khác và là duy nhất với nguồn gốc của ứng dụng đang gọi. Nó được đặt lại khi người dùng xóa cookie (đối với Duyệt web riêng tư, một định danh khác được sử dụng không được lưu trữ qua các phiên).
- {{domxref("MediaDeviceInfo.groupId")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi là định danh nhóm. Hai thiết bị có cùng định danh nhóm nếu chúng thuộc cùng một thiết bị vật lý, ví dụ như một màn hình có cả camera và microphone tích hợp.
- {{domxref("MediaDeviceInfo.kind")}} {{ReadOnlyInline}}
  - : Trả về một giá trị liệt kê là `"videoinput"`, `"audioinput"` hoặc `"audiooutput"`.
- {{domxref("MediaDeviceInfo.label")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi mô tả thiết bị này (ví dụ "External USB Webcam").

> [!NOTE]
> Vì lý do bảo mật, trường `label` luôn trống trừ khi có media stream đang hoạt động _hoặc_ người dùng đã cấp quyền lâu dài cho việc truy cập thiết bị media. Nếu không, tập hợp các nhãn thiết bị có thể được dùng như một phần của cơ chế [fingerprinting](/en-US/docs/Glossary/Fingerprinting) để nhận dạng người dùng.

## Phương thức phiên bản

- {{domxref("MediaDeviceInfo.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `MediaDeviceInfo`.

## Ví dụ

Đây là ví dụ sử dụng {{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}} để lấy danh sách thiết bị.

```js
if (!navigator.mediaDevices || !navigator.mediaDevices.enumerateDevices) {
  console.log("enumerateDevices() not supported.");
} else {
  // List cameras and microphones.
  navigator.mediaDevices
    .enumerateDevices()
    .then((devices) => {
      devices.forEach((device) => {
        console.log(`${device.kind}: ${device.label} id = ${device.deviceId}`);
      });
    })
    .catch((err) => {
      console.log(`${err.name}: ${err.message}`);
    });
}
```

Kết quả có thể là:

```bash
videoinput: id = csO9c0YpAf274OuCPUA53CNE0YHlIr2yXCi+SqfBZZ8=
audioinput: id = RKxXByjnabbADGQNNZqLVLdmXlS0YkETYCIbg+XxnvM=
audioinput: id = r2/xw1xUPIyZunfV1lGrKOma5wTOvCkWfZ368XCndm0=
```

hoặc nếu có một hoặc nhiều media stream đang hoạt động, hoặc nếu đã cấp quyền lâu dài:

```bash
videoinput: FaceTime HD Camera (Built-in) id=csO9c0YpAf274OuCPUA53CNE0YHlIr2yXCi+SqfBZZ8=
audioinput: default (Built-in Microphone) id=RKxXByjnabbADGQNNZqLVLdmXlS0YkETYCIbg+XxnvM=
audioinput: Built-in Microphone id=r2/xw1xUPIyZunfV1lGrKOma5wTOvCkWfZ368XCndm0=
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}}
- {{domxref("MediaDevices.getUserMedia", "navigator.mediaDevices.getUserMedia()")}}
