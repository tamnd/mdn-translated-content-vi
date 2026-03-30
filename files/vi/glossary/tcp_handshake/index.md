---
title: TCP handshake
slug: Glossary/TCP_handshake
page-type: glossary-definition
sidebar: glossarysidebar
---

{{glossary('TCP','TCP (Transmission Control Protocol)')}} sử dụng **bắt tay ba bước** (còn gọi là TCP handshake, bắt tay ba tin nhắn, và/hoặc SYN-SYN-ACK) để thiết lập kết nối TCP/IP qua mạng dựa trên IP. Tương tự, **bắt tay bốn bước** được dùng để kết thúc kết nối.

Ba tin nhắn được TCP gửi đi để thương lượng và bắt đầu một phiên TCP được gọi là SYN, _SYN-ACK_, và ACK, tương ứng với **SYN**chronize (đồng bộ), **SYN**chronize-**ACK**nowledgement (đồng bộ-xác nhận) và **ACK**nowledge (xác nhận). Cơ chế ba tin nhắn được thiết kế để hai máy tính muốn trao đổi thông tin có thể thương lượng các tham số kết nối trước khi truyền dữ liệu, chẳng hạn như các yêu cầu HTTP từ trình duyệt.

1. Bên khởi tạo, thường là trình duyệt, gửi gói SYN (đồng bộ) TCP đến máy chủ kia, thường là máy chủ.
2. Máy chủ nhận SYN và gửi lại SYN-ACK (đồng bộ-xác nhận).
3. Bên khởi tạo nhận SYN-ACK từ máy chủ và gửi ACK (xác nhận). Máy chủ nhận ACK và kết nối socket TCP được thiết lập.

Bước bắt tay này xảy ra sau khi tra cứu {{glossary('DNS', 'DNS')}} và trước khi bắt tay {{glossary('TLS')}} khi tạo kết nối bảo mật. Kết nối có thể được kết thúc độc lập bởi mỗi bên thông qua bắt tay bốn bước, trong đó một cặp tin nhắn FIN (kết thúc) và ACK được gửi và nhận độc lập bởi mỗi bên.

1. Bên khởi tạo gửi gói FIN đến máy chủ kia.
2. Máy chủ kia gửi gói ACK lại cho bên khởi tạo.
3. Lúc này, kết nối nửa đóng, và máy chủ kia vẫn có thể gửi dữ liệu. (Ví dụ, máy chủ có thể hoàn tất việc gửi dữ liệu đến client khi client đã đóng kết nối của mình đến máy chủ.)
4. Máy chủ kia gửi gói FIN đến bên khởi tạo.
5. Bên khởi tạo gửi gói ACK lại cho máy chủ kia.

## Xem thêm

- [Giao thức Transport Layer Security (TLS)](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- Các thuật ngữ liên quan:
  - {{Glossary("HTTPS")}}
- [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security) trên Wikipedia
