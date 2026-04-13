---
title: Xây dựng điện thoại kết nối Internet với PeerJS
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{NextMenu("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup")}}

Một trong những vấn đề chính của WebRTC là việc sử dụng và phát triển nó khá phức tạp — việc xử lý dịch vụ báo hiệu và biết khi nào nên gọi đúng điểm cuối có thể gây nhầm lẫn. Nhưng có một số tin tốt; [ngang hàng](https://peerjs.com/) là một khung WebRTC trừu tượng hóa tất cả logic băng và tín hiệu để bạn có thể tập trung vào chức năng của ứng dụng của mình. PeerJS có hai phần, khung phía máy khách và máy chủ.

Trong loạt bài viết này, chúng ta sẽ tạo một ứng dụng điện thoại đơn giản bằng PeerJS. Chúng ta sẽ sử dụng cả máy chủ và framework phía máy khách, nhưng hầu hết công việc của chúng ta sẽ liên quan đến việc xử lý mã phía máy khách.

## Điều kiện tiên quyết

Đây là hướng dẫn ở trình độ trung cấp; trước khi thử nó, bạn phải cảm thấy thoải mái với:

- [JavaScript vani](/en-US/docs/Web/JavaScript)
- [nút](https://nodejs.org/en)
- [Thể hiện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs)
- [HTML](/en-US/docs/Web/HTML)

Trước khi bắt đầu, bạn cần đảm bảo rằng bạn đã [nút đã cài đặt](https://nodejs.org/en/download) và [Sợi](https://classic.yarnpkg.com/en/docs/install) (hướng dẫn trong các bài viết sau giả sử Yarn, nhưng bạn có thể thoải mái sử dụng [npm](https://docs.npmjs.com/getting-started/) hoặc trình quản lý khác nếu muốn).

> [!LƯU Ý]
> Nếu bạn tìm hiểu tốt hơn bằng cách làm theo mã từng bước, chúng tôi cũng đã cung cấp [hướng dẫn bằng mã](https://github.com/SamsungInternet/WebPhone/tree/master/tutorial) này để bạn có thể sử dụng thay thế.

### Mục lục

1. [Cài đặt](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup)
2. [Xây dựng máy chủ](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server)
3. [Kết nối đồng nghiệp](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers)
   1. [Nhận quyền sử dụng micrô của trình duyệt](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission)
   2. [Hiển thị và ẩn HTML](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html)
   3. [Tạo kết nối ngang hàng](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection)
   4. [Tạo cuộc gọi](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call)
   5. [Trả lời cuộc gọi](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call)
   6. [Kết thúc cuộc gọi](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/End_a_call)

{{NextMenu("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup")}}
