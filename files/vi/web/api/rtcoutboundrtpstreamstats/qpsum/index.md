---
title: "RTCOutboundRtpStreamStats: qpSum property"
short-title: qpSum
slug: Web/API/RTCOutboundRtpStreamStats/qpSum
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.qpSum
---

{{APIRef("WebRTC")}}

Thuộc tính **`qpSum`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là giá trị được tạo ra bằng cách cộng các giá trị **Quantization Parameter** (**QP**) cho mọi khung hình mà bộ gửi này đã tạo ra đến nay trên track video tương ứng với đối tượng `RTCOutboundRtpStreamStats` này.

Nói chung, con số này càng lớn thì dữ liệu video được nén càng nhiều.

## Giá trị

Giá trị số nguyên không dấu 64-bit cho biết tổng của giá trị tham số lượng tử hóa (QP) cho mọi khung hình đã gửi đến nay trên track được mô tả bởi đối tượng {{domxref("RTCOutboundRtpStreamStats")}}. Vì giá trị QP thường lớn hơn để chỉ ra hệ số nén cao hơn, tổng này càng lớn thì luồng nói chung đã được nén càng nhiều.

> [!NOTE]
> Giá trị này chỉ khả dụng cho phương tiện video.

## Ghi chú sử dụng

[Lượng tử hóa](https://en.wikipedia.org/wiki/Quantization) là quá trình áp dụng nén có mất mát cho một phạm vi giá trị, dẫn đến một **giá trị lượng tử** duy nhất. Giá trị này thay thế cho phạm vi giá trị, do đó giảm số lượng giá trị khác nhau xuất hiện trong tập dữ liệu tổng thể, làm cho dữ liệu dễ nén hơn. Quá trình lượng tử hóa và lượng nén có thể được kiểm soát bằng một hoặc nhiều tham số.

Điều quan trọng cần ghi nhớ là giá trị QP có thể thay đổi định kỳ, thậm chí mỗi khung hình, vì vậy rất khó biết chắc chắn mức nén là bao nhiêu. Điều tốt nhất bạn có thể làm là ước tính. Bạn có thể sử dụng giá trị của {{domxref("RTCSentRtpStreamStats.framesEncoded")}} để lấy số khung hình đã được mã hóa đến nay, và tính trung bình từ đó. Xem [Tính toán lượng tử hóa trung bình](#tinh_toan_luong_tu_hoa_trung_binh) bên dưới để có hàm thực hiện điều này.

Ngoài ra, ý nghĩa chính xác của giá trị QP phụ thuộc vào {{Glossary("codec")}} đang được sử dụng. Ví dụ, đối với codec VP8, giá trị QP có thể từ 1 đến 127 và được tìm thấy trong phần tử header khung hình `"y_ac_qi"`, có giá trị được định nghĩa trong {{RFC(6386, "", "19.2")}}. H.264 dùng QP từ 0 đến 51; trong trường hợp này, nó là chỉ số được dùng để lấy ma trận tỷ lệ trong quá trình lượng tử hóa. Ngoài ra, QP không phải là tham số duy nhất mà codec sử dụng để điều chỉnh nén. Xem đặc tả codec riêng lẻ để biết chi tiết.

## Ví dụ

### Tính toán lượng tử hóa trung bình

Hàm `calculateAverageQP()` được hiển thị bên dưới tính QP trung bình cho đối tượng chứa thống kê luồng RTP, trả về 0 nếu đối tượng không mô tả luồng RTP.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
