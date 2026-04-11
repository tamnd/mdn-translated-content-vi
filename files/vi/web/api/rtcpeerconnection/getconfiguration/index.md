---
title: "RTCPeerConnection: phương thức getConfiguration()"
short-title: getConfiguration()
slug: Web/API/RTCPeerConnection/getConfiguration
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.getConfiguration
---

{{APIRef("WebRTC")}}

Phương thức **`getConfiguration()`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng cho biết cấu hình hiện tại của {{domxref("RTCPeerConnection")}} mà phương thức được gọi trên đó.

Cấu hình trả về là cấu hình cuối cùng được áp dụng qua {{domxref("RTCPeerConnection.setConfiguration","setConfiguration()")}}, hoặc nếu `setConfiguration()` chưa được gọi, thì là cấu hình mà `RTCPeerConnection` đã được tạo với.
Cấu hình bao gồm danh sách các máy chủ ICE được kết nối sử dụng, thông tin về chính sách truyền tải và thông tin danh tính.

## Cú pháp

```js-nolint
getConfiguration()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mô tả cấu hình hiện tại của {{domxref("RTCPeerConnection")}}.
Xem [`RTCPeerConnection()`](/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection#parameters) để biết thêm thông tin về các tùy chọn được phép.

## Ví dụ

Ví dụ này thêm một chứng chỉ mới vào một kết nối đang hoạt động nếu nó chưa có chứng chỉ nào đang dùng.

```js
let configuration = myPeerConnection.getConfiguration();

if (configuration.certificates?.length === 0) {
  RTCPeerConnection.generateCertificate({
    name: "RSASSA-PKCS1-v1_5",
    hash: "SHA-256",
    modulusLength: 2048,
    publicExponent: new Uint8Array([1, 0, 1]),
  }).then((cert) => {
    configuration.certificates = [cert];
    myPeerConnection.setConfiguration(configuration);
  });
}
```

Ví dụ này lấy cấu hình hiện tại của {{domxref("RTCPeerConnection")}}, rồi kiểm tra xem nó có chứng chỉ nào được đặt hay không bằng cách xem liệu cấu hình có giá trị cho `certificates` hay không, và độ dài của nó có bằng 0 hay không.

Nếu xác định rằng không có chứng chỉ nào, {{domxref("RTCPeerConnection.generateCertificate_static", "RTCPeerConnection.generateCertificate()")}} sẽ được gọi để tạo chứng chỉ mới; chúng ta cung cấp một trình xử lý hoàn tất sẽ thêm một mảng mới chứa chứng chỉ vừa tạo vào cấu hình hiện tại và truyền nó cho {{domxref("RTCPeerConnection.setConfiguration", "setConfiguration()")}} để thêm chứng chỉ vào kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCPeerConnection.setConfiguration()")}}
- {{domxref("RTCPeerConnection.RTCPeerConnection", "RTCPeerConnection()")}}
- {{domxref("RTCPeerConnection")}}
