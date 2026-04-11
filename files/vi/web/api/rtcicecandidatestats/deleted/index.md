---
title: "RTCIceCandidateStats: thuộc tính deleted"
short-title: deleted
slug: Web/API/RTCIceCandidateStats/deleted
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.deleted
---

{{APIRef("WebRTC")}}

Thuộc tính **`deleted`** của từ điển {{domxref("RTCIceCandidateStats")}} cho biết liệu ứng viên đã bị xóa hoặc giải phóng hay chưa.

## Giá trị

Giá trị Boolean cho biết liệu ứng viên đã bị xóa hoặc giải phóng hay chưa.
Nếu giá trị này là `true`, ứng viên được mô tả bởi đối tượng {{domxref("RTCIceCandidateStats")}} không còn được xem xét nữa. Ý nghĩa cụ thể khác nhau tùy theo loại ứng viên:

- Ứng viên cục bộ
  - : Giá trị `true` có nghĩa ứng viên đã bị xóa như được mô tả trong {{RFC(5245, "", "8.3")}}.
- Ứng viên host
  - : Giá trị `true` cho biết tài nguyên mạng của ứng viên đã được giải phóng. Điều này thường có nghĩa là bất kỳ socket nào liên kết đã được đóng và giải phóng.
- Ứng viên từ xa (TURN)
  - : Giá trị `true` có nghĩa phân bổ {{Glossary("TURN")}} của ứng viên không còn hoạt động.

Kết quả là như nhau; ứng viên không còn được xem xét nếu giá trị này là `true`.

## Ví dụ

Trong ví dụ này, {{domxref("Window.setInterval", "setInterval()")}} được sử dụng để thiết lập một hàm chạy định kỳ để hiển thị thống kê mới nhất cho các ứng viên. Chỉ những ứng viên chưa bị xóa mới được đưa vào đầu ra.

```js
setInterval(() => {
  myPeerConnection.getStats(null).then((stats) => {
    let statsOutput = "";

    stats.forEach((report) => {
      if (
        (stats.type === "local-candidate" ||
          stats.type === "remote.candidate") &&
        !stats.deleted
      ) {
        statsOutput +=
          `<h2>Report: ${report.type}</h3>\n<strong>ID:</strong> ${report.id}<br>\n` +
          `<strong>Timestamp:</strong> ${report.timestamp}<br>\n`;

        // Bây giờ là thống kê cho báo cáo này; chúng tôi cố ý bỏ những cái đã được sắp xếp lên trên
        Object.keys(report).forEach((statName) => {
          if (
            statName !== "id" &&
            statName !== "timestamp" &&
            statName !== "type"
          ) {
            statsOutput += `<strong>${statName}:</strong> ${report[statName]}<br>\n`;
          }
        });
      }
    });

    document.querySelector(".stats-box").innerHTML = statsOutput;
  });
}, 1000);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
