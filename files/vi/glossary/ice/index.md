---
title: ICE
slug: Glossary/ICE
page-type: glossary-definition
sidebar: glossarysidebar
---

**ICE** (_Interactive Connectivity Establishment_) là framework được {{glossary("WebRTC")}} (và một số công nghệ khác) sử dụng để kết nối hai peer bất kể cấu trúc mạng (thường dùng cho trò chuyện âm thanh và video). Giao thức này cho phép hai peer tìm và thiết lập kết nối dù cả hai có thể đang sử dụng Network Address Translator ({{glossary("NAT")}}) để chia sẻ địa chỉ IP toàn cầu với các thiết bị khác trên các mạng cục bộ tương ứng.

Thuật toán ICE tìm đường dẫn có độ trễ thấp nhất để kết nối hai peer, thử các tùy chọn theo thứ tự:

1. Kết nối UDP trực tiếp (Trong trường hợp này—và chỉ trong trường hợp này—một máy chủ {{glossary("STUN")}} được sử dụng để tìm địa chỉ đối diện mạng của một peer)
2. Kết nối TCP trực tiếp, qua cổng HTTP
3. Kết nối TCP trực tiếp, qua cổng HTTPS
4. Kết nối gián tiếp qua máy chủ relay/{{glossary("TURN")}} (nếu kết nối trực tiếp thất bại, ví dụ như khi một peer ở sau tường lửa chặn NAT traversal)

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API), giao thức web chính sử dụng ICE
- [Các giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
- {{rfc("8445")}}, đặc tả IETF cho ICE
- {{domxref("RTCIceCandidate")}}, giao diện đại diện cho một ICE candidate
