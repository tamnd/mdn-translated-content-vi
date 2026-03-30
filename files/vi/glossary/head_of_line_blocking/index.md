---
title: Chặn đầu hàng
short-title: HOL blocking
slug: Glossary/Head_of_line_blocking
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong mạng máy tính, **head-of-line blocking** (_HOL blocking_ - tắc nghẽn đầu hàng) đề cập đến một nút cổ chai hiệu suất xảy ra khi một hàng đợi các {{glossary("packet", "gói tin")}} bị giữ lại bởi gói tin đầu tiên trong hàng đợi, mặc dù các gói tin khác trong hàng đợi có thể được xử lý.

Trong HTTP/1.1, các yêu cầu trên một kết nối {{glossary("TCP")}} duy nhất thường được gửi tuần tự — một yêu cầu mới không thể được thực hiện trên kết nối trong khi đang chờ phản hồi cho yêu cầu trước.
Điều này có thể dẫn đến vấn đề HOL blocking ngay cả khi có nhiều kết nối TCP giữa client và server.

HTTP/1.1 định nghĩa một tính năng tùy chọn gọi là _HTTP pipelining_ đã cố gắng không thành công để giải quyết HOL blocking, bằng cách cho phép gửi các yêu cầu mà không cần chờ các phản hồi trước đó.
Thật không may, thiết kế của HTTP/1.1 có nghĩa là các phản hồi phải được trả về theo cùng thứ tự với các yêu cầu được nhận, vì vậy HOL blocking vẫn có thể xảy ra nếu một yêu cầu mất nhiều thời gian để hoàn thành.
Các điều kiện mạng như tắc nghẽn, mất gói tin (và các lần truyền lại TCP kết quả), hoặc {{glossary("TCP slow start")}} cũng có thể làm chậm truyền và khiến các phản hồi sau bị chặn bởi các phản hồi trước.

{{glossary("HTTP 2", "HTTP/2")}} giảm HOL blocking ở mức ứng dụng bằng cách giới thiệu _multiplexing_ yêu cầu và phản hồi.
Với tính năng này, nhiều yêu cầu và phản hồi có thể được xen kẽ trên một kết nối TCP duy nhất sử dụng các luồng được đánh số độc lập, và ưu tiên luồng giúp server quyết định luồng nào sẽ gửi trước.
Mất gói tin ở lớp vận chuyển vẫn có thể gây ra HOL blocking trên các luồng vì HTTP/2 chạy trên TCP — một phân đoạn TCP bị mất có thể chặn tất cả các luồng được mang trên kết nối đó cho đến khi dữ liệu bị mất được truyền lại.

{{glossary("HTTP 3", "HTTP/3")}} loại bỏ head-of-line blocking ở lớp vận chuyển bằng cách sử dụng {{glossary("QUIC")}} qua {{glossary("UDP")}} và do đó vấn đề HOL trên HTTP không còn tồn tại.
QUIC cung cấp nhiều luồng độc lập với khôi phục mất mát theo từng luồng, vì vậy mất gói tin chỉ ảnh hưởng đến luồng nơi nó xảy ra thay vì toàn bộ kết nối. Điều này loại bỏ vấn đề HOL ở mức TCP.

## Xem thêm

- Các thuật ngữ liên quan
  - {{glossary("HTTP")}}, {{glossary("HTTP 2", "HTTP/2")}}, {{glossary("HTTP 3", "HTTP/3")}}
  - {{glossary("TCP")}}, {{glossary("QUIC")}}, {{glossary("UDP")}}
- [Populating the page: how browsers work](/en-US/docs/Web/Performance/Guides/How_browsers_work)
- [Head-of-line blocking](https://en.wikipedia.org/wiki/Head-of-line_blocking) trên Wikipedia
