---
title: "RTCCertificate: phương thức getFingerprints()"
short-title: getFingerprints()
slug: Web/API/RTCCertificate/getFingerprints
page-type: web-api-instance-method
browser-compat: api.RTCCertificate.getFingerprints
---

{{APIRef("WebRTC")}}

Phương thức **`getFingerprints()`** của giao diện **{{domxref("RTCCertificate")}}** được sử dụng để lấy một mảng các dấu vân tay chứng chỉ.

Điều này có thể được sử dụng trong mã cấp ứng dụng để lấy dấu vân tay chứng chỉ, là {{glossary("hash function","hàm băm")}} của chứng chỉ được tạo bằng các thuật toán khác nhau được hỗ trợ bởi trình duyệt.

## Cú pháp

```js-nolint
getFingerprints()
```

### Tham số

Không có.

### Giá trị trả về

Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) các giá trị dấu vân tay.
Mỗi dấu vân tay được đại diện bởi một đối tượng với các thuộc tính sau:

- `algorithm`
  - : Một chuỗi chỉ ra thuật toán hàm băm được sử dụng để tạo dấu vân tay trong `value`.
    Các giá trị được phép bao gồm: `"sha-1"`, `"sha-224"`, `"sha-256"`, `"sha-384"`, `"sha-512"`, `"md5"`, `"md2"`.
- `value`
  - : Một chuỗi chứa dấu vân tay chứng chỉ ở dạng chuỗi hex viết thường, được tính bằng hàm băm `algorithm`.
    Định dạng được định nghĩa chính xác hơn trong [RFC4572, Mục 5](https://www.rfc-editor.org/rfc/rfc4572#section-5).

## Mô tả

Các phiên bản {{domxref("RTCCertificate")}} được sử dụng cho một {{DOMxRef("RTCPeerConnection")}} cụ thể có thể được tạo bằng phương thức tĩnh {{DOMxRef("RTCPeerConnection.generateCertificate_static", "RTCPeerConnection.generateCertificate()")}} hoặc lấy từ bộ nhớ trong [IndexedDB](/en-US/docs/Web/API/IndexedDB_API), và được đặt trong hàm khởi tạo.
Nếu không có chứng chỉ nào được truyền trong hàm khởi tạo, chúng sẽ được tạo tự động, trong trường hợp đó, các chứng chỉ được sử dụng có thể được lấy bằng {{DOMxRef("RTCPeerConnection.getConfiguration()")}}.

Các trình duyệt sẽ tự động trao đổi chứng chỉ và dấu vân tay liên kết với mỗi {{DOMxRef("RTCPeerConnection")}} trong giai đoạn đề nghị SDP, và chúng sẽ được sử dụng như một phần của quá trình bắt tay DTLS để xác minh rằng bên từ xa khớp với chứng chỉ/điểm cuối được gửi trong SDP.
Điều này cung cấp xác thực ở cấp độ thấp rằng giao tiếp WebRTC đang được thiết lập với bên từ xa đã khởi tạo đề nghị, nhưng không cung cấp xác thực danh tính của người dùng đang giao tiếp.

## Ví dụ

### Lấy dấu vân tay chứng chỉ

Ví dụ này cho thấy cách bạn có thể lấy dấu vân tay chứng chỉ từ peer cục bộ và so sánh chúng với dấu vân tay từ peer từ xa.

Đầu tiên chúng ta tạo một kết nối và lấy chứng chỉ cùng dấu vân tay của chúng.
Chúng ta lấy dấu vân tay từ peer từ xa bằng "một cơ chế ngoài băng nào đó".

```js
// Lấy dấu vân tay chứng chỉ từ peer cục bộ.
const rtcPeerConnection = new RTCPeerConnection();
const configuration = rtcPeerConnection.getConfiguration();
const certificates = configuration.certificates;
let fingerprintsFromClient;

if (certificates && certificates.length > 0) {
  certificates.forEach((cert) => {
    // Để minh họa, chỉ lấy chứng chỉ đầu tiên
    fingerprintsFromClient = cert.getFingerprints();
    break;
  });
}

// Lấy dấu vân tay chứng chỉ từ peer từ xa cho chứng chỉ cụ thể (mã giả)
const fingerprintsFromServer = [
  /* … */
];
```

Có nhiều cách để so sánh mảng dấu vân tay cho một chứng chỉ cụ thể.
Ở đây chúng ta chuyển đổi các mảng thành đối tượng từ điển nơi tên thuật toán là thuộc tính và sau đó so sánh chúng.

```js
let clientFingerprintDict = Object.fromEntries(
  fingerprintsFromClient.map((x) => [x.algorithm, x.value]),
);
let serverFingerprintDict = Object.fromEntries(
  fingerprintsFromServer.map((x) => [x.algorithm, x.value]),
);

// Hàm so sánh hai đối tượng và trả về true nếu có thuộc tính chung
// và tất cả thuộc tính chung đều khớp.
function compareObjects(obj1, obj2) {
  const commonProperties = Object.keys(obj1).filter((prop) =>
    Object.hasOwn(obj2, prop),
  );
  // Trả về false nếu không có thuộc tính chung
  if (Object.keys(commonProperties).length === 0) return false;

  // Trả về false nếu có thuộc tính chung nào không khớp
  for (const prop of commonProperties) {
    if (obj1[prop] !== obj2[prop]) {
      return false;
    }
  }

  return true;
}

const matchingFingerprints = compareObjects(
  clientFingerprintDict,
  serverFingerprintDict,
);
console.log(matchingFingerprints);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
