---
title: Asynchronous
slug: Glossary/Asynchronous
page-type: glossary-definition
sidebar: glossarysidebar
---

Thuật ngữ **bất đồng bộ** (asynchronous) đề cập đến hai hoặc nhiều đối tượng hoặc sự kiện không tồn tại hoặc không xảy ra cùng một lúc, nghĩa là chúng **không** {{glossary("synchronous", "đồng bộ")}}. Khi nhiều thứ liên quan xảy ra mà không cái nào phụ thuộc vào sự hoàn thành của các thứ trước đó, chúng là bất đồng bộ.

Trong điện toán, từ "bất đồng bộ" được sử dụng trong hai ngữ cảnh chính, như được giải thích dưới đây.

## Trong mạng lưới và truyền thông

Giao tiếp bất đồng bộ là một phương pháp trao đổi tin nhắn trong đó việc gửi, nhận và xử lý mỗi tin nhắn không phụ thuộc vào việc gửi, nhận hoặc xử lý của các tin nhắn khác. Trong giao tiếp bất đồng bộ, mỗi bên nhận và xử lý tin nhắn khi thuận tiện hoặc có thể làm vậy, thay vì làm điều đó ngay lập tức khi nhận. Ngoài ra, các tin nhắn có thể được gửi mà không cần chờ xác nhận, với sự hiểu biết rằng nếu có vấn đề xảy ra, người nhận sẽ yêu cầu sửa chữa hoặc xử lý tình huống theo cách khác.

Email là một loại giao tiếp bất đồng bộ của con người. Người gửi gửi một email. Người nhận đọc email và trả lời nó (hoặc không) khi thuận tiện, không nhất thiết ngay lập tức. Tất cả các bên có thể tiếp tục gửi và nhận tin nhắn bất cứ lúc nào. Email không phải được lên lịch theo một trình tự cụ thể.

Trong phần mềm bất đồng bộ, thực hiện một yêu cầu, chẳng hạn đến một máy chủ, không chặn các tiến trình khác trong khi chờ phản hồi. Phần mềm có thể tiếp tục thực hiện các tác vụ khác. Ví dụ, trong [các API dựa trên promise](/en-US/docs/Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API), các đối tượng {{JSxRef("Promise")}} được tạo ra cho các thao tác dài. Sau khi thao tác hoàn thành, promise được xử lý. Với promise, phần mềm không cần phải chờ thao tác kết thúc.

## Trong thiết kế phần mềm

Thiết kế phần mềm bất đồng bộ mở rộng khái niệm này bằng cách xây dựng code cho phép chương trình yêu cầu thực hiện một tác vụ song song với tác vụ ban đầu (hoặc các tác vụ), mà không dừng lại để chờ tác vụ hoàn thành. Khi tác vụ phụ hoàn thành, tác vụ ban đầu được thông báo bằng cơ chế đã thỏa thuận để nó biết công việc đã xong, và kết quả, nếu có, đã sẵn sàng.

Có một số kỹ thuật lập trình để triển khai phần mềm bất đồng bộ. Xem bài viết [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS) để có phần giới thiệu về chúng.

## Xem thêm

- [Học: Thực hiện yêu cầu mạng với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests) (Learning Area)
- Các thuật ngữ liên quan:
  - {{glossary("Synchronous")}}
