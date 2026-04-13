---
title: RTCCertificateStats
slug: Web/API/RTCCertificateStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_certificate
---

{{APIRef("WebRTC")}}

**`RTCCertificateStats`** là một từ điển của [WebRTC API](/en-US/docs/Web/API/WebRTC_API), được dùng để báo cáo thông tin về chứng chỉ sử dụng bởi {{domxref("RTCDtlsTransport")}} và {{domxref("RTCIceTransport")}} bên dưới nó.

Báo cáo có thể được lấy bằng cách lặp qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm thấy một mục có [`type`](/en-US/docs/Web/API/RTCCertificateStats/type) là `certificate`.

## Thuộc tính phiên bản

- {{domxref("RTCCertificateStats.fingerprint", "fingerprint")}}
  - : Một chuỗi chứa dấu vân tay của chứng chỉ, được tính bằng hàm băm được chỉ định trong [`fingerprintAlgorithm`](/en-US/docs/Web/API/RTCCertificateStats/fingerprintAlgorithm).
- {{domxref("RTCCertificateStats.fingerprintAlgorithm", "fingerprintAlgorithm")}}
  - : Một chuỗi chứa tên hàm băm được dùng để tính [`fingerprint`](/en-US/docs/Web/API/RTCCertificateStats/fingerprint) của chứng chỉ, ví dụ như "sha-256".
- {{domxref("RTCCertificateStats.base64Certificate", "base64Certificate")}}
  - : Một chuỗi chứa biểu diễn base-64 của chứng chỉ được mã hóa DER.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây là chung cho tất cả các đối tượng thống kê WebRTC (xem [`RTCStatsReport`](/en-US/docs/Web/API/RTCStatsReport#common_instance_properties) để biết thêm thông tin).

<!-- RTCStats -->

- {{domxref("RTCCertificateStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được theo dõi để tạo ra tập hợp thống kê này.
- {{domxref("RTCCertificateStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCCertificateStats.type", "type")}}
  - : Một chuỗi có giá trị `"certificate"`, cho biết loại thống kê mà đối tượng chứa.

## Ví dụ

Cho một biến `myPeerConnection` là một phiên bản của {{domxref("RTCPeerConnection")}}, đoạn mã dưới đây sử dụng `await` để chờ báo cáo thống kê, sau đó lặp qua nó bằng `RTCStatsReport.forEach()`. Sau đó lọc ra các từ điển chỉ có type là `certificate` và ghi lại kết quả.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "certificate") {
    // Log the certificate information
    console.log(report);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport")}}
- {{domxref("RTCCertificate")}}
