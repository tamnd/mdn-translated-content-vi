---
title: "RTCPeerConnection: phương thức tĩnh generateCertificate()"
short-title: generateCertificate()
slug: Web/API/RTCPeerConnection/generateCertificate_static
page-type: web-api-static-method
browser-compat: api.RTCPeerConnection.generateCertificate_static
---

{{APIRef("WebRTC")}}

Hàm tĩnh **`generateCertificate()`** của giao diện {{domxref("RTCPeerConnection")}} tạo một chứng chỉ X.509 và khóa riêng tương ứng, rồi trả về một promise được giải quyết với {{domxref("RTCCertificate")}} mới sau khi quá trình tạo hoàn tất.

## Cú pháp

```js-nolint
RTCPeerConnection.generateCertificate(keygenAlgorithm)
```

### Tham số

- `keygenAlgorithm`
  - : Một chuỗi định danh thuật toán của [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API) hoặc một đối tượng. Xem {{domxref("SubtleCrypto.generateKey()")}} để biết chi tiết định dạng của đối tượng.

> [!NOTE]
> `generateCertificate()` là phương thức tĩnh, vì vậy nó luôn được gọi trên chính giao diện `RTCPeerConnection`, không phải trên một thể hiện.

### Giá trị trả về

Một promise được giải quyết thành một đối tượng {{domxref("RTCCertificate")}} mới chứa khóa mới dựa trên các tùy chọn được chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu dạng chuẩn hóa của `keygenAlgorithm` chỉ định một thuật toán hoặc cấu hình thuật toán mà trình duyệt không hỗ trợ, hoặc trình duyệt không cho phép dùng với {{domxref("RTCPeerConnection")}}.

Các lỗi khác cũng có thể xảy ra; ví dụ, nếu `keygenAlgorithm` được chỉ định không thể chuyển thành công thành từ điển {{domxref("RTCCertificateExpiration")}}, lỗi xảy ra trong quá trình chuyển đổi đó sẽ được ném ra.

## Mô tả

Nếu chỉ định một chuỗi, nó phải là chuỗi tên thuật toán tương thích với [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API).
Ngoài ra, bạn có thể cung cấp chi tiết cụ thể cho cấu hình thuật toán bằng cách truyền một đối tượng dựa trên một trong các lớp con của lớp {{domxref("CryptoKey/algorithm","Algorithm")}} của Web Crypto API.

### Cấu hình chuẩn

Tất cả trình duyệt đều phải hỗ trợ hai cấu hình sau.
Hoàn toàn có thể thiết lập _mặc định_ của trình duyệt khác đi, nhưng hai cấu hình này luôn được hỗ trợ.

#### RSASSA-PKCS1-v1_5

```js
let stdRSACertificate = {
  name: "RSASSA-PKCS1-v1_5",
  modulusLength: 2048,
  publicExponent: new Uint8Array([1, 0, 1]),
  hash: "SHA-256",
};
```

#### ECDSA

```js
let stdECDSACertificate = {
  name: "ECDSA",
  namedCurve: "P-256",
};
```

### Thời hạn hết hạn của chứng chỉ

Theo mặc định, chứng chỉ mới được cấu hình với `expires` bằng 2.592.000.000 mili giây, tức 30 ngày.
Thời hạn hết hạn không thể vượt quá 31.536.000.000 mili giây, tức 365 ngày.
Cũng cần lưu ý rằng trình duyệt có thể tiếp tục giới hạn thời hạn hết hạn của chứng chỉ nếu chúng muốn.

## Ví dụ

### Chỉ định chi tiết thuật toán

Ví dụ này yêu cầu một chứng chỉ RSASSA-PKCS1-v1_5 mới với hash SHA-256 và độ dài modulus 2048.

```js
RTCPeerConnection.generateCertificate({
  name: "RSASSA-PKCS1-v1_5",
  hash: "SHA-256",
  modulusLength: 2048,
  publicExponent: new Uint8Array([1, 0, 1]),
}).then((cert) => {
  const pc = new RTCPeerConnection({ certificates: [cert] });
});
```

### Chỉ định thuật toán bằng tên

Ví dụ dưới đây chỉ định một chuỗi yêu cầu chứng chỉ [ECDSA](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm).

```js
RTCPeerConnection.generateCertificate("ECDSA");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Web Crypto API](/en-US/docs/Web/API/Web_Crypto_API)
- [Website security](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security)
- [Web security](/en-US/docs/Web/Security)
- {{Glossary("Symmetric-key cryptography")}}
- {{DOMxRef("Crypto")}}
