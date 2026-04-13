---
title: "RTCPeerConnection: phương thức getStats()"
short-title: getStats()
slug: Web/API/RTCPeerConnection/getStats
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.getStats
---

{{APIRef("WebRTC")}}

Phương thức **`getStats()`** của giao diện {{domxref("RTCPeerConnection")}} trả về một promise được giải quyết với dữ liệu cung cấp thống kê về toàn bộ kết nối hoặc về {{domxref("MediaStreamTrack")}} được chỉ định.

## Cú pháp

```js-nolint
getStats()
getStats(selector)

getStats(selector, successCallback, failureCallback) // deprecated
```

### Tham số

- `selector` {{optional_inline}}
  - : Một {{domxref("MediaStreamTrack")}} để thu thập thống kê.
    Nếu giá trị này là `null` (giá trị mặc định), thống kê sẽ được thu thập cho toàn bộ {{domxref("RTCPeerConnection")}}.

### Tham số lỗi thời

- `successCallback` {{deprecated_inline}}
  - : Hàm gọi lại được gọi khi báo cáo đã được tạo thành công.
- `failureCallback` {{deprecated_inline}}
  - : Hàm gọi lại được gọi khi báo cáo không thể được tạo.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{domxref("RTCStatsReport")}} cung cấp thống kê kết nối.
Nội dung báo cáo phụ thuộc vào `selector` và các chi tiết khác của kết nối.

### Ngoại lệ

Phương thức này không ném ngoại lệ; thay vào đó, nó từ chối promise trả về với một trong các lỗi sau:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném khi không có {{domxref("RTCRtpSender")}} hoặc {{domxref("RTCRtpReceiver")}} nào có `track` khớp với `selector` được chỉ định, hoặc khi `selector` khớp với nhiều hơn một sender hoặc receiver.

## Ví dụ

Ví dụ này tạo một hàm định kỳ bằng {{domxref("Window.setInterval", "setInterval()")}} để thu thập thống kê cho một {{domxref("RTCPeerConnection")}} mỗi giây, tạo báo cáo ở dạng HTML và chèn nó vào một phần tử cụ thể trong DOM.

```js
setInterval(() => {
  myPeerConnection.getStats(null).then((stats) => {
    let statsOutput = "";

    stats.forEach((report) => {
      statsOutput +=
        `<h2>Report: ${report.type}</h2>\n<strong>ID:</strong> ${report.id}<br>\n` +
        `<strong>Timestamp:</strong> ${report.timestamp}<br>\n`;

      // Bây giờ là thống kê cho báo cáo này; chúng ta cố ý bỏ qua những
      // mục đã được đưa lên đầu ở trên

      Object.keys(report).forEach((statName) => {
        if (
          statName !== "id" &&
          statName !== "timestamp" &&
          statName !== "type"
        ) {
          statsOutput += `<strong>${statName}:</strong> ${report[statName]}<br>\n`;
        }
      });
    });

    document.querySelector(".stats-box").innerHTML = statsOutput;
  });
}, 1000);
```

Đoạn mã này hoạt động bằng cách gọi `getStats()`, rồi khi promise được giải quyết, lặp qua các đối tượng {{domxref("RTCStatsReport")}} được trả về.
Mỗi báo cáo sẽ có một phần riêng với tiêu đề và toàn bộ thống kê bên dưới, trong đó type, ID và timestamp được xử lý riêng để đặt chúng ở đầu danh sách.

Sau khi HTML cho báo cáo được tạo, nó được chèn vào phần tử có lớp `"stats-box"` bằng cách đặt thuộc tính {{domxref("Element.innerHTML", "innerHTML")}} của phần tử đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
