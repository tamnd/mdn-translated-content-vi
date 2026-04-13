---
title: "RTCDataChannel: tài sản đáng tin cậy"
short-title: reliable
slug: Web/API/RTCDataChannel/reliable
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.RTCDataChannel.reliable
---

{{APIRef("WebRTC")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`reliable`** cho biết kênh dữ liệu có được
đáng tin cậy.

> [!CẢNH BÁO]
> Thuộc tính này đã lỗi thời. Thay vào đó, hãy sử dụng {{domxref("RTCDataChannel.ordered")}} trong bất kỳ
> mã mới và cập nhật mã hiện có càng sớm càng tốt.


## Giá trị

`true` nếu kết nối của {{domxref("RTCDataChannel")}} đáng tin cậy;
`false` nếu không.


## Thông số kỹ thuật


Không còn là một phần của bất kỳ đặc điểm kỹ thuật nào.

## Khả năng tương thích của trình duyệt


{{Compat}}


## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.ordered")}}
