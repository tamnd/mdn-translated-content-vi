---
title: Private State Token API
slug: Web/API/Private_State_Token_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.fetch.init_privateToken_parameter
spec-urls: https://wicg.github.io/trust-token-api/
---

{{DefaultAPISidebar("Private State Token API")}}{{SeeCompatTable}}

**Private State Token API** cung cấp cơ chế truyền tín hiệu tin cậy về tính xác thực của người dùng từ ngữ cảnh duyệt web này sang ngữ cảnh khác, mà không chia sẻ danh tính người dùng hay cho phép theo dõi hoạt động của họ trên các trang web.

## Khái niệm và cách sử dụng

Để ngăn chặn gian lận trên web, các trang web và dịch vụ cần thiết lập và truyền đạt tín hiệu tin cậy chứng minh người dùng là người thật, không phải bot hay bên thứ ba độc hại.

- Tin cậy được thiết lập qua các cơ chế như [CAPTCHA](https://en.wikipedia.org/wiki/CAPTCHA), xác minh địa chỉ email hoặc lịch sử mua hàng.
- Tin cậy truyền thống được truyền đạt giữa các nguồn gốc khác nhau thông qua các cơ chế như [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies).

Thật không may, các kỹ thuật dựa trên cookie hiện tại không an toàn và có thể bị dùng cho {{glossary("fingerprinting")}} và theo dõi người dùng, gây hại cho quyền riêng tư.

Private state token giải quyết vấn đề này, cho phép tín hiệu tin cậy được truyền đạt giữa các nguồn gốc mà không cần theo dõi thụ động, sử dụng [Privacy Pass protocol](https://privacypass.github.io/) trong nền.

> [!NOTE]
> Private state token không phải là sự thay thế cho CAPTCHA hay các cơ chế thiết lập tin cậy khác. Private state token cung cấp cách _truyền đạt_ tin cậy về người dùng, không phải _thiết lập_ tin cậy.

### Private state token hoạt động như thế nào?

1. Khi một trang web đã thiết lập tin cậy về người dùng (ví dụ qua CAPTCHA), nó có thể phát hành một token mật mã được lưu trữ an toàn trong trình duyệt của người dùng. Trang web này được gọi là **issuer** (nhà phát hành).
2. Một trang web khác có thể xác minh rằng cùng người dùng đó đáng tin cậy bằng cách kiểm tra xem trình duyệt của họ có lưu token được phát hành bởi một issuer mà trang web tin tưởng không. Nếu có, họ có thể đổi token đó để nhận **redemption record** (bản ghi đổi thưởng). Trang web này được gọi là **redeemer** (người đổi thưởng).
3. Redemption record sau đó được dùng để cấp cho người dùng quyền truy cập dịch vụ như thể họ đã xác thực trực tiếp với trang đó, và cũng có thể được chuyển tiếp cho các bên khác để truyền đạt tin cậy.

Private state token được mã hóa, vì vậy không thể xác định cá nhân hoặc kết nối các phiên tin cậy và không tin cậy để khám phá danh tính người dùng.

Xem [Sử dụng Private State Token API](/en-US/docs/Web/API/Private_State_Token_API/Using) để biết hướng dẫn sử dụng private state token.

## Giao diện

Private State Token API không có giao diện riêng.

### Mở rộng các giao diện khác

- {{domxref("Document.hasPrivateToken()")}}
  - : Trả về promise được hoàn thành với giá trị boolean cho biết trình duyệt có lưu private state token từ một issuer cụ thể không.
- {{domxref("Document.hasRedemptionRecord()")}}
  - : Trả về promise được hoàn thành với giá trị boolean cho biết trình duyệt có redemption record có nguồn gốc từ một issuer cụ thể không.
- {{domxref("HTMLIFrameElement.privateToken")}}
  - : Phản ánh giá trị của thuộc tính `privateToken` của `<iframe>`.
- {{domxref("Window.fetch", "fetch()")}} / {{domxref("Request.Request", "Request()")}}, tùy chọn [`privateToken`](/en-US/docs/Web/API/RequestInit#privatetoken)
  - : Một đối tượng đại diện cho thao tác private state token. Các lệnh gọi fetch với tùy chọn `privateToken` được chỉ định sẽ khởi tạo các thao tác như phát hành hoặc đổi token.
- {{domxref("XMLHttpRequest.setPrivateToken()")}}
  - : Thêm thông tin private state token vào lệnh gọi `XMLHttpRequest`, để khởi tạo các thao tác private state token.

## Phần tử HTML

- {{htmlelement("iframe")}}, thuộc tính [`privateToken`](/en-US/docs/Web/HTML/Reference/Elements/iframe#privatetoken)
  - : Chứa biểu diễn chuỗi của đối tượng tùy chọn đại diện cho thao tác private state token. IFrame chứa thuộc tính này có thể được dùng để khởi tạo các thao tác như phát hành hoặc đổi token.

## HTTP headers

- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}}
  - : Kiểm soát việc sử dụng các thao tác `token-request`.
- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}}
  - : Kiểm soát việc sử dụng các thao tác `token-redemption` và `send-redemption-record`.
- {{httpheader("Sec-Redemption-Record")}}
  - : Header yêu cầu chuyển tiếp redemption record cho bên khác để truyền đạt tin cậy khi thực hiện fetch request `send-redemption-record`.
- {{httpheader("Sec-Private-State-Token")}}
  - : Tồn tại dưới dạng header yêu cầu lẫn phản hồi, được dùng trong các yêu cầu phát hành và đổi thưởng để truyền dữ liệu yêu cầu (như nonces bị làm mù dùng để tạo token) và dữ liệu phản hồi (như token và redemption record).
- {{httpheader("Sec-Private-State-Token-Crypto-Version")}}
  - : Header yêu cầu gửi đến issuer server cho biết phiên bản giao thức mật mã nào nên được dùng để ký nonces bị làm mù khi tạo token.
- {{httpheader("Sec-Private-State-Token-Lifetime")}}
  - : Header phản hồi, được gửi bởi redeemer server, để cho trình duyệt biết nên lưu cache redemption record cụ thể trong bao lâu.

## Cân nhắc bảo mật

Các thao tác `token-request` của private state token được kiểm soát bởi chỉ thị {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} của {{httpheader("Permissions-Policy")}}, trong khi các thao tác `token-redemption` và `send-redemption-record` được kiểm soát bởi chỉ thị {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}}.

Cụ thể, khi chính sách được định nghĩa chặn việc sử dụng, mọi nỗ lực khởi tạo thao tác private state token qua fetch request đều sẽ thất bại.

## Ví dụ

Xem [Private State Token Demo Issuer](https://privatetokens.dev/) để xem ví dụ triển khai.

## Thông số kỹ thuật

{{specifications}}

## Tương thích trình duyệt

{{Compat}}
