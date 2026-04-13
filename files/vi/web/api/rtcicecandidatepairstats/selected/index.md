---
title: "RTCIceCandidatePairStats: selected property"
short-title: selected
slug: Web/API/RTCIceCandidatePairStats/selected
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.selected
---

{{APIRef("WebRTC")}}{{non-standard_header}}

Thuộc tính **`selected`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết liệu cặp ứng viên được mô tả bởi đối tượng này có phải là cặp đang được sử dụng để giao tiếp với đầu từ xa hay không.

Thuộc tính này không chuẩn và chỉ được Firefox hỗ trợ. Cách chuẩn để xác định cặp ứng viên được chọn là xem thuộc tính [`selectedCandidatePairId`](/en-US/docs/Web/API/RTCTransportStats/selectedCandidatePairId) của đối tượng thống kê có type là `transport`.

## Giá trị

`true` nếu cặp ứng viên được mô tả bởi đối tượng này đang được sử dụng, và `false` nếu không.

## Ví dụ

Hàm được hiển thị trong ví dụ này xác định cặp ứng viên hiện đang được chọn từ một báo cáo thống kê bằng cách trước tiên lặp qua từng báo cáo, tìm kiếm báo cáo `transport`. Khi tìm thấy, `selectedCandidatePairId` của transport đó được dùng để lấy {{domxref("RTCIceCandidatePair")}} mô tả kết nối.

Nếu điều đó thất bại, phần thứ hai lặp qua các báo cáo, tìm kiếm bản ghi `candidate-pair` mà thuộc tính `selected` dành riêng cho Firefox là `true`. Cặp ứng viên này sau đó được trả về là cặp đang được chọn.

```js
function getCurrentCandidatePair(statsResults) {
  statsResults.forEach((report) => {
    if (report.type === "transport") {
      currentPair = statsResults.get(report.selectedCandidatePairId);
    }
  });

  if (!currentPair) {
    statsResults.forEach((report) => {
      if (report.type === "candidate-pair" && report.selected) {
        currentPair = report;
      }
    });
  }

  return currentPair;
}
```

## Thông số kỹ thuật

Không nằm trong bất kỳ đặc tả nào. Thuộc tính này là duy nhất đối với Firefox.

## Tương thích trình duyệt

{{Compat}}
