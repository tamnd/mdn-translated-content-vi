---
title: "RTCIceCandidateStats: thuộc tính address"
short-title: address
slug: Web/API/RTCIceCandidateStats/address
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_local-candidate.address
---

{{APIRef("WebRTC")}}

Thuộc tính **`address`** của từ điển {{domxref("RTCIceCandidateStats")}} cho biết địa chỉ của ứng viên {{Glossary("ICE")}}.
Mặc dù ưu tiên địa chỉ được chỉ định là địa chỉ số IPv4 hoặc IPv6, nhưng cũng có thể dùng tên miền đầy đủ.

Khi tên miền được chỉ định, địa chỉ IP đầu tiên được chọn cho địa chỉ đó sẽ được sử dụng, ngay cả khi tên miền ánh xạ tới nhiều địa chỉ IP.

## Giá trị

Địa chỉ IPv4 hoặc IPv6 hoặc tên miền đầy đủ, tương ứng với ứng viên.

- Nếu giá trị của `address` hoàn toàn bao gồm các chữ số từ 0-9 với dấu chấm là dấu phân cách, giá trị được hiểu là địa chỉ IPv4.
- Nếu giá trị hoàn toàn bao gồm các chữ số thập lục phân và ký tự dấu hai chấm (":"), nó được hiểu là địa chỉ IPv6.
- Ngược lại, `address` được giả định là tên miền đầy đủ, được phân giải đầu tiên bằng bản ghi AAAA (giả sử IPv6 khả dụng), sau đó bằng bản ghi A (nếu không tìm thấy kết quả hoặc thiết bị chỉ hỗ trợ IPv4).
  Nếu nhiều địa chỉ IP được trả về, {{Glossary("user agent")}} sẽ chọn một địa chỉ, sau đó được sử dụng trong suốt quá trình xử lý ICE.

## Ghi chú sử dụng

Thuộc tính `address` trước đây được gọi là `ip`, và chỉ cho phép sử dụng địa chỉ IPv4 và IPv6. Việc thêm hỗ trợ tên miền đầy đủ dẫn đến việc đổi tên thuộc tính.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
