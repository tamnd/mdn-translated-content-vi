---
title: "RTCInboundRtpStreamStats: thuộc tính qpSum"
short-title: qpSum
slug: Web/API/RTCInboundRtpStreamStats/qpSum
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.qpSum
---

{{APIRef("WebRTC")}}

Thuộc tính **`qpSum`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết tổng các giá trị **Quantization Parameter** (**QP**) cho mỗi khung hình được gửi hoặc nhận trên track video tương ứng với đối tượng `RTCInboundRtpStreamStats` này.

Nhìn chung, số lớn hơn cho thấy dữ liệu video bị nén nhiều hơn.

> [!NOTE]
> Giá trị này chỉ có sẵn cho media video.

## Giá trị

Một số nguyên dương.

## Mô tả

[Lượng tử hóa](https://en.wikipedia.org/wiki/Quantization) là quá trình áp dụng nén có mất mát cho một phạm vi giá trị, cho kết quả là một **giá trị lượng tử** duy nhất.
Giá trị này thay thế cho phạm vi giá trị, từ đó giảm số lượng giá trị khác nhau xuất hiện trong toàn bộ tập dữ liệu, làm cho dữ liệu dễ nén hơn.
Quá trình lượng tử hóa và lượng nén có thể được kiểm soát bằng một hoặc nhiều tham số.

Điều quan trọng cần nhớ là giá trị QP có thể thay đổi định kỳ, thậm chí mỗi khung hình, vì vậy rất khó để biết chắc chắn mức độ nén là bao nhiêu.
Tốt nhất bạn chỉ có thể ước tính.
Ví dụ, bạn có thể sử dụng giá trị của {{domxref("RTCReceivedRtpStreamStats.framesDecoded")}} nếu nhận media (hoặc {{domxref("RTCSentRtpStreamStats.framesEncoded")}} nếu gửi) để lấy số khung hình đã xử lý cho đến nay, và tính toán giá trị trung bình từ đó.

Ngoài ra, ý nghĩa chính xác của giá trị QP phụ thuộc vào {{Glossary("codec")}} được sử dụng.
Ví dụ, đối với codec VP8, giá trị QP có thể từ 1 đến 127 và được tìm thấy trong phần tử tiêu đề khung `"y_ac_qi"`, được định nghĩa trong {{RFC(6386, "", "19.2")}}.
H.264 sử dụng QP từ 0 đến 51; trong trường hợp này, nó là chỉ số được dùng để lấy ma trận tỷ lệ trong quá trình lượng tử hóa.

## Ví dụ

### Tính lượng tử hóa trung bình

Hàm `calculateAverageQP()` dưới đây tính QP trung bình cho đối tượng {{domxref("RTCStatsReport")}} đã cho chứa thống kê luồng RTP, trả về 0 nếu đối tượng không mô tả luồng RTP.

```js
function calculateAverageQP(stats) {
  let frameCount = 0;

  switch (stats.type) {
    case "inbound-rtp":
    case "remote-inbound-rtp":
      frameCount = stats.framesDecoded;
      break;
    case "outbound-rtp":
    case "remote-outbound-rtp":
      frameCount = stats.framesEncoded;
      break;
    default:
      return 0;
  }

  return status.qpSum / frameCount;
}
```

Lưu ý rằng các giá trị QP có thể khác nhau giữa các codec.
Do đó giá trị này chỉ có thể hữu ích khi so sánh với cùng một codec.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
