---
title: Audio Output Devices API
slug: Web/API/Audio_Output_Devices_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.MediaDevices.selectAudioOutput
  - api.HTMLMediaElement.setSinkId
  - api.HTMLMediaElement.sinkId
  - http.headers.Permissions-Policy.speaker-selection
spec-urls: https://w3c.github.io/mediacapture-output/
---

{{DefaultAPISidebar("Audio Output Devices API")}}{{securecontext_header}}{{SeeCompatTable}}

**Audio Output Devices API** cho phép ứng dụng web nhắc người dùng chọn thiết bị đầu ra sẽ được dùng để phát âm thanh.

## Khái niệm và cách sử dụng

Các hệ điều hành thường cho phép người dùng chỉ định rằng âm thanh nên được phát qua loa, tai nghe Bluetooth hoặc một thiết bị đầu ra âm thanh nào khác.
API này cho phép ứng dụng cung cấp cùng chức năng đó ngay bên trong trang web.

Ngay cả khi được cho phép bởi một chính sách quyền hạn, việc truy cập vào một thiết bị đầu ra âm thanh cụ thể vẫn cần sự cho phép rõ ràng từ người dùng, vì người dùng có thể đang ở một nơi mà việc phát âm thanh qua một số thiết bị đầu ra là không phù hợp.

API này cung cấp phương thức {{domxref("MediaDevices.selectAudioOutput()")}}, cho phép người dùng chọn đầu ra âm thanh mong muốn từ các thiết bị được cho phép bởi chỉ thị [`speaker-selection`](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) của tiêu đề HTTP {{httpheader("Permissions-Policy")}} cho tài liệu.
Thiết bị được chọn sau đó sẽ có quyền do người dùng cấp, cho phép nó được liệt kê bằng {{domxref("MediaDevices.enumerateDevices()")}} và được đặt làm thiết bị đầu ra âm thanh bằng {{domxref("HTMLMediaElement.setSinkId()")}}.

Các thiết bị âm thanh có thể kết nối và ngắt kết nối một cách bất kỳ.
Những ứng dụng muốn phản ứng với kiểu thay đổi này có thể lắng nghe sự kiện {{domxref("MediaDevices/devicechange_event", "devicechange")}} và dùng {{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}} để xác định xem `sinkId` có xuất hiện trong các thiết bị được trả về hay không.
Ví dụ, điều này có thể kích hoạt việc tạm dừng hoặc tiếp tục phát.

## Giao diện

### Phần mở rộng cho các giao diện khác

Audio Output Devices API mở rộng các API sau, bổ sung các tính năng được liệt kê:

#### MediaDevices

- {{domxref("MediaDevices.selectAudioOutput()")}}
  - : Phương thức này nhắc người dùng chọn một thiết bị đầu ra âm thanh cụ thể, ví dụ như loa hoặc tai nghe.
    Việc chọn một thiết bị sẽ cấp quyền từ người dùng để dùng thiết bị đó và trả về thông tin về thiết bị, bao gồm cả ID của nó.

#### HTMLMediaElement

- {{domxref("HTMLMediaElement.setSinkId()")}}
  - : Phương thức này đặt ID của thiết bị âm thanh sẽ dùng để xuất âm thanh nếu được cho phép.
- {{domxref("HTMLMediaElement.sinkId")}}
  - : Thuộc tính này trả về ID duy nhất của thiết bị âm thanh đang được dùng để xuất âm thanh, hoặc một chuỗi rỗng nếu đang dùng thiết bị mặc định của user agent.

## Yêu cầu bảo mật

Việc truy cập API này chịu các ràng buộc sau:

- Tất cả phương thức và thuộc tính chỉ có thể được gọi trong [secure context](/vi/docs/Web/Security/Defenses/Secure_Contexts).

- {{domxref("MediaDevices.selectAudioOutput()")}} cấp quyền từ người dùng để một thiết bị đã chọn có thể được dùng làm đích đầu ra âm thanh:
  - Quyền truy cập có thể bị kiểm soát bởi [Permission Policy](/vi/docs/Web/HTTP/Guides/Permissions_Policy) HTTP [`speaker-selection`](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection).
  - Cần có [transient user activation](/vi/docs/Web/Security/Defenses/User_activation).
    Người dùng phải tương tác với trang hoặc một phần tử giao diện để phương thức có thể được gọi.

- {{domxref("HTMLMediaElement.setSinkId()")}} đặt một ID đã được cho phép làm đầu ra âm thanh:
  - Quyền truy cập có thể bị kiểm soát bởi [Permission Policy](/vi/docs/Web/HTTP/Guides/Permissions_Policy) HTTP [`speaker-selection`](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection).
  - Cần có quyền của người dùng để đặt một ID thiết bị không mặc định.
    - Quyền này có thể đến từ việc chọn trong lời nhắc được mở bởi `MediaDevices.selectAudioOutput()`
    - Quyền của người dùng để đặt thiết bị đầu ra cũng được cấp ngầm nếu người dùng trước đó đã cấp quyền dùng một thiết bị đầu vào media trong cùng nhóm với {{domxref("MediaDevices.getUserMedia()")}}.

<!-- The line below is "true" but this is not implemented in any browser -->
<!-- The permission status can be queried using the [Permissions API](/en-US/docs/Web/API/Permissions_API) method [`navigator.permissions.query()`](/en-US/docs/Web/API/Permissions/query), passing a permission descriptor with the `speaker-selection` permission. -->

## Ví dụ

Đây là ví dụ sử dụng `selectAudioOutput()` bên trong một hàm được kích hoạt bởi cú nhấp vào nút, sau đó đặt thiết bị đã chọn làm đầu ra âm thanh.

Đoạn mã trước tiên kiểm tra xem `selectAudioOutput()` có được hỗ trợ hay không; nếu có, nó dùng phương thức đó để chọn một đầu ra và trả về một [ID thiết bị](/vi/docs/Web/API/MediaDeviceInfo/deviceId).
Sau đó, chúng ta phát một âm thanh bằng đầu ra mặc định rồi gọi `setSinkId()` để chuyển sang thiết bị đầu ra đã chọn.

```js
document.querySelector("#myButton").addEventListener("click", async () => {
  if (!navigator.mediaDevices.selectAudioOutput) {
    console.log("selectAudioOutput() not supported or not in secure context.");
    return;
  }

  // Display prompt to select device
  const audioDevice = await navigator.mediaDevices.selectAudioOutput();

  // Create an audio element and start playing audio on the default device
  const audio = document.createElement("audio");
  audio.src = "https://example.com/audio.mp3";
  audio.play();

  // Change the sink to the selected audio output device.
  audio.setSinkId(audioDevice.deviceId);
});
```

Lưu ý rằng nếu bạn ghi log chi tiết đầu ra, chúng có thể trông như sau:

```js
console.log(
  `${audioDevice.kind}: ${audioDevice.label} id = ${audioDevice.deviceId}`,
);
// audiooutput: Realtek Digital Output (Realtek(R) Audio) id = 0wE6fURSZ20H0N2NbxqgowQJLWbwo+5ablCVVJwRM3k=
```

## Đặc tả

{{Specifications}}

## Tính tương thích của trình duyệt

{{Compat}}
