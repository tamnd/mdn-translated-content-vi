---
title: "MediaDevices: phương thức selectAudioOutput()"
short-title: selectAudioOutput()
slug: Web/API/MediaDevices/selectAudioOutput
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.MediaDevices.selectAudioOutput
---

{{APIRef("Audio Output Devices API")}}{{securecontext_header}}{{SeeCompatTable}}

Phương thức **`selectAudioOutput()`** của giao diện {{domxref("MediaDevices")}} nhắc người dùng chọn một thiết bị đầu ra âm thanh, chẳng hạn loa hoặc tai nghe. Nếu người dùng chọn một thiết bị, phương thức sẽ cấp quyền cho thiết bị đó được dùng làm audio output sink.

Sau khi chọn, nếu thiết bị sẵn có, nó có thể được liệt kê bằng {{domxref("MediaDevices.enumerateDevices()")}} và đặt làm audio output sink bằng {{domxref("HTMLMediaElement.setSinkId()")}}.

Khi thành công, {{jsxref("Promise")}} trả về sẽ được resolve thành một {{domxref("MediaDeviceInfo")}} mô tả thiết bị đã chọn.

## Cú pháp

```js-nolint
selectAudioOutput()
selectAudioOutput(options)
```

### Tham số

- `options` {{Optional_Inline}}
  - : Một đối tượng cấu hình những thiết bị nào có thể được đưa vào lời nhắc của người dùng.
    - `deviceId` {{Optional_Inline}}
      - : Một chuỗi đại diện cho ID của một thiết bị đơn lẻ đã từng được lộ ra/cấp quyền trước đó.
        Nếu không đặt, hộp thoại sẽ hiển thị tất cả thiết bị đầu ra âm thanh có sẵn.

        Tùy chọn này dành cho ứng dụng muốn lưu một device id để dùng cùng thiết bị đó làm mặc định ở các phiên sau.
        Lưu ý là phương thức có thể trả về một ID mới cho cùng thiết bị, và các ID đã lưu _phải_ được chuyển qua `selectAudioOutput()` thành công trước khi chúng hoạt động với {{domxref("HTMLMediaElement.setSinkId","setSinkId()")}}.

        > [!NOTE]
        > User agent có thể bỏ qua việc nhắc người dùng nếu một ID không-null cụ thể đã từng được lộ ra cho người dùng thông qua `selectAudioOutput()` ở một phiên trước.
        > Trong trường hợp này, user agent có thể chỉ resolve với ID đó, hoặc với một ID mới cho cùng thiết bị nếu nó đã thay đổi.
        > Nếu quyền cho thiết bị đó trước đây đã được cấp nhưng sau đó bị thu hồi, user agent có thể hiển thị tất cả thiết bị được phép, đồng thời làm nổi bật thiết bị có ID đã chỉ định.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve thành một {{domxref("MediaDeviceInfo")}} mô tả thiết bị đầu ra âm thanh do người dùng chọn.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Trả về nếu [Permissions Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) được dùng để chặn việc sử dụng đầu ra âm thanh (đồng thời popup chọn đầu ra âm thanh sẽ không được hiển thị), hoặc người dùng đóng hộp thoại mà không chọn thiết bị.
- `NotFoundError` {{domxref("DOMException")}}
  - : Trả về nếu không có thiết bị đầu ra âm thanh nào khả dụng.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Trả về nếu chưa có {{Glossary("transient activation")}} (bạn phải kích hoạt nó từ một sự kiện giao diện nào đó).

## Yêu cầu bảo mật

Việc truy cập API này bị ràng buộc bởi các điều kiện sau:

- Phương thức phải được gọi trong một [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Cần có [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation).
  Người dùng phải tương tác với trang hoặc một phần tử UI để tính năng này hoạt động.
- Việc truy cập có thể bị ràng buộc bởi HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection).

Trạng thái quyền có thể được kiểm tra bằng phương thức [Permissions API](/en-US/docs/Web/API/Permissions_API) {{domxref("Permissions.query", "navigator.permissions.query()")}}, truyền vào một permission descriptor với quyền `speaker-selection`.

## Ví dụ

Ví dụ này dùng `selectAudioOutput()`, bên trong một hàm được kích hoạt bởi nhấn nút. Nó xuất `deviceId` và nhãn của thiết bị đã chọn nếu có, hoặc một thông báo lỗi.

```js
document.querySelector("#myButton").addEventListener("click", () => {
  if (!navigator.mediaDevices.selectAudioOutput) {
    console.log("selectAudioOutput() not supported.");
    return;
  }

  // Hiển thị hộp thoại và ghi log thiết bị được chọn hoặc lỗi
  navigator.mediaDevices
    .selectAudioOutput()
    .then((device) => {
      console.log(`${device.kind}: ${device.label} id = ${device.deviceId}`);
    })
    .catch((err) => {
      console.error(`${err.name}: ${err.message}`);
    });
});
```

Khi chọn một đầu ra, kết quả có thể là:

```bash
audiooutput: Realtek Digital Output (Realtek(R) Audio) id = 0wE6fURSZ20H0N2NbxqgowQJLWbwo+5ablCVVJwRM3k=
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement.setSinkId()")}}
- {{domxref("HTMLMediaElement.sinkId")}}
- [WebRTC](/en-US/docs/Web/API/WebRTC_API) - trang giới thiệu của API
