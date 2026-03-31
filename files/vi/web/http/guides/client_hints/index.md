---
title: HTTP Client hints
short-title: Client hints
slug: Web/HTTP/Guides/Client_hints
page-type: guide
sidebar: http
---

**Client hints** là một tập hợp các trường [HTTP request header](/en-US/docs/Web/HTTP/Reference/Headers) mà máy chủ có thể chủ động yêu cầu từ client để lấy thông tin về thiết bị, mạng, người dùng và các tùy chọn dành riêng cho user-agent. Máy chủ có thể xác định tài nguyên nào cần gửi, dựa trên thông tin mà client chọn cung cấp.

Tập hợp các header "hint" được liệt kê trong chủ đề [HTTP Headers](/en-US/docs/Web/HTTP/Reference/Headers#client_hints) và [tóm tắt bên dưới](#hint_types).

## Tổng quan

1. Khi trình duyệt lần đầu tiên thực hiện yêu cầu tải trang web, nó sẽ gửi header {{httpheader("User-Agent")}} đến máy chủ.
2. Ngoài ra, nó sẽ gửi cho máy chủ một tập hợp mặc định các header `Sec-CH-UA-*`; tập hợp hint này được gọi là [low entropy hints](#low_entropy_hints). Ví dụ: thiết bị Android sẽ gửi thứ gì đó như thế này:

   ```http
   Sec-CH-UA: "Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"
   Sec-CH-UA-Platform: "Android"
   Sec-CH-UA-Mobile: ?1
   ```

   Các header này cung cấp thông tin sau:
   - {{httpheader("Sec-CH-UA")}}: Phiên bản trình duyệt chính và các thương hiệu liên quan.
   - {{httpheader("Sec-CH-UA-Platform")}}: Nền tảng.
   - {{httpheader("Sec-CH-UA-Mobile")}}: Boolean cho biết liệu trình duyệt có đang chạy trên thiết bị di động (`?1`) hay không (`?0`).

3. Máy chủ có thể thông báo rằng nó hỗ trợ client hints và yêu cầu thêm client hints bằng header phản hồi {{httpheader("Accept-CH")}}, chứa danh sách phân tách bằng dấu phẩy của các header bổ sung mà nó muốn nhận trong các yêu cầu tiếp theo. Ví dụ:

   ```http
   Accept-CH: Sec-CH-UA-Model, Sec-CH-UA-Form-Factors
   ```

   Tập hợp header mặc định luôn được gửi; trong trường hợp này, chúng ta cũng đã yêu cầu:
   - {{httpheader("Sec-CH-UA-Model")}}: Model thiết bị mà nền tảng đang chạy.
   - {{httpheader("Sec-CH-UA-Form-Factors")}}: Hệ số hình thức của thiết bị, cho biết cách người dùng tương tác với user-agent — kích thước màn hình, điều khiển, v.v.

4. Nếu trình duyệt được phép, nó sẽ gửi các header được yêu cầu trong tất cả các yêu cầu tiếp theo, cho đến khi trình duyệt hoặc tab bị đóng. Ví dụ: điện thoại Android mẫu của chúng ta có thể gửi các header được cập nhật sau đây với các yêu cầu tiếp theo:

   ```http
   Sec-CH-UA: "Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"
   Sec-CH-UA-Platform: "Android"
   Sec-CH-UA-Mobile: ?1
   Sec-CH-UA-Model: "Pixel 9"
   Sec-CH-UA-Form-Factors: "Mobile"
   ```

Cách tiếp cận này hiệu quả ở chỗ máy chủ chỉ yêu cầu thông tin mà nó có thể xử lý hữu ích. Nó cũng tương đối "bảo vệ quyền riêng tư", vì tùy thuộc vào client để quyết định thông tin nào nó có thể chia sẻ an toàn.

> [!NOTE]
> Client hints cũng có thể được chỉ định trong HTML bằng cách sử dụng phần tử {{HTMLElement("meta")}} với thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv).
>
> ```html
> <meta http-equiv="Accept-CH" content="Width, Downlink, Sec-CH-UA" />
> ```

## Caching và Client Hints

Client hints xác định tài nguyên nào được gửi trong phản hồi nên thường cũng được bao gồm trong header {{HTTPHeader("Vary")}} của phản hồi bị ảnh hưởng. Điều này đảm bảo rằng tài nguyên khác được lưu vào cache cho mỗi giá trị khác nhau của header hint.

```http
Vary: Accept, Width, ECT
```

Bạn có thể muốn bỏ qua việc chỉ định {{HTTPHeader("Vary")}} hoặc sử dụng một chiến lược khác cho các header client hint nơi giá trị thay đổi nhiều, vì điều này thực sự làm cho tài nguyên không thể cache được. (Một mục cache mới được tạo cho mỗi giá trị duy nhất.) Điều này áp dụng đặc biệt cho các client hint mạng như {{HTTPHeader("Downlink")}} và {{HTTPHeader("RTT")}}. Để biết thêm thông tin, xem [HTTP Caching > Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary).

## Thời gian sống của hint

Máy chủ chỉ định các header client hint mà nó quan tâm đến việc nhận trong header phản hồi `Accept-CH`. User agent thêm các header client hint được yêu cầu, hoặc ít nhất là tập hợp con mà nó muốn chia sẻ với máy chủ đó, vào tất cả các yêu cầu tiếp theo trong phiên duyệt web hiện tại.

Nói cách khác, yêu cầu về một tập hợp hints cụ thể không hết hạn cho đến khi trình duyệt bị tắt.

Máy chủ có thể thay thế tập hợp client hints mà nó muốn nhận bằng cách gửi lại header phản hồi `Accept-CH` với danh sách mới. Ví dụ: để dừng yêu cầu bất kỳ hints nào, nó sẽ gửi `Accept-CH` với danh sách trống.

> [!NOTE]
> Tập hợp client hints được đặt cho một nguồn gốc cụ thể cũng có thể được xóa bằng cách gửi header phản hồi {{httpheader("Clear-Site-Data", "Clear-Site-Data: \"clientHints\"")}} cho URL trong nguồn gốc đó.

## Low entropy hints

Client hints được phân chia rộng rãi thành high entropy hints và low entropy hints. Low entropy hints là những hints không tiết lộ nhiều thông tin có thể được sử dụng để [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting) người dùng. Chúng có thể được gửi theo mặc định trên mỗi yêu cầu client, bất kể header phản hồi `Accept-CH` của máy chủ, tùy thuộc vào [chính sách quyền](https://wicg.github.io/client-hints-infrastructure/#policy-controlled-features). Low entropy hints là:

- {{HTTPHeader("Save-Data")}},
- {{HTTPHeader("Sec-CH-UA")}},
- {{HTTPHeader("Sec-CH-UA-Mobile")}}, và
- {{HTTPHeader("Sec-CH-UA-Platform")}}.

## High entropy hints

High entropy hints là những hints có khả năng tiết lộ nhiều thông tin hơn có thể được sử dụng để lấy dấu vân tay người dùng và do đó được kiểm soát theo cách mà user agent có thể đưa ra quyết định liệu có cung cấp chúng hay không. Quyết định có thể dựa trên tùy chọn người dùng, yêu cầu quyền hoặc [chính sách quyền](https://wicg.github.io/client-hints-infrastructure/#policy-controlled-features). Tất cả client hints không phải low entropy hints đều được coi là high entropy hints.

## Critical client hints

Một _critical client hint_ là một hint mà việc áp dụng phản hồi có thể làm thay đổi đáng kể trang được render, có thể theo cách gây bất tiện hoặc ảnh hưởng đến khả năng sử dụng và do đó phải được áp dụng trước khi nội dung được render. Ví dụ: `Sec-CH-Prefers-Reduced-Motion` thường được coi là critical hint, vì nó có thể ảnh hưởng đáng kể đến hành vi của animation và vì người dùng chọn tùy chọn này cần nó được đặt.

Máy chủ có thể sử dụng header phản hồi {{HTTPHeader("Critical-CH")}} cùng với `Accept-CH` để chỉ định rằng một accepted client hint cũng là critical client hint (header trong `Critical-CH` cũng phải xuất hiện trong `Accept-CH`). User agents nhận phản hồi với `Critical-CH` phải kiểm tra xem các header critical được chỉ định có được gửi trong yêu cầu ban đầu hay không. Nếu không, user agent sẽ thử lại yêu cầu thay vì render trang. Cách tiếp cận này đảm bảo rằng các tùy chọn client được đặt bằng critical client hints luôn được sử dụng, ngay cả khi không có trong yêu cầu đầu tiên hoặc nếu cấu hình máy chủ thay đổi.

Ví dụ: trong trường hợp này, máy chủ cho client biết qua {{httpheader("Accept-CH")}} rằng nó chấp nhận `Sec-CH-Prefers-Reduced-Motion` và {{httpheader("Critical-CH")}} được sử dụng để chỉ định rằng `Sec-CH-Prefers-Reduced-Motion` được coi là critical client hint:

```http
HTTP/1.1 200 OK
Content-Type: text/html
Accept-CH: Sec-CH-Prefers-Reduced-Motion
Vary: Sec-CH-Prefers-Reduced-Motion
Critical-CH: Sec-CH-Prefers-Reduced-Motion
```

> [!NOTE]
> Chúng ta cũng đã chỉ định `Sec-CH-Prefers-Reduced-Motion` trong header {{httpheader("Vary")}} để cho trình duyệt biết rằng nội dung được phục vụ sẽ khác nhau dựa trên giá trị header này, ngay cả khi URL giữ nguyên, vì vậy trình duyệt không nên chỉ sử dụng phản hồi được lưu vào cache hiện có mà thay vào đó nên cache phản hồi này riêng biệt. Mỗi header được liệt kê trong header `Critical-CH` cũng nên có trong header `Accept-CH` và `Vary`.

Vì `Sec-CH-Prefers-Reduced-Motion` là critical hint không có trong yêu cầu ban đầu, client tự động thử lại yêu cầu — lần này cho máy chủ biết qua `Sec-CH-Prefers-Reduced-Motion` rằng nó có tùy chọn người dùng cho animation giảm chuyển động.

```http
GET / HTTP/1.1
Host: example.com
Sec-CH-Prefers-Reduced-Motion: "reduce"
```

Tóm lại, `Accept-CH` yêu cầu tất cả các giá trị bạn muốn cho trang, trong khi `Critical-CH` chỉ yêu cầu tập hợp con các giá trị bạn phải có khi tải để tải trang đúng cách.

## Các loại hint

### User agent client hints

Header client hint User agent (UA) cho phép máy chủ thay đổi các phản hồi dựa trên user agent (trình duyệt), hệ điều hành và thiết bị. Để biết danh sách các header `Sec-CH-UA-*`, xem [User agent client hints headers](/en-US/docs/Web/HTTP/Reference/Headers#user_agent_client_hints).

Client hints có sẵn cho JavaScript trang web thông qua [User Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API).

> [!NOTE]
> Máy chủ hiện tại nhận được hầu hết thông tin tương tự bằng cách phân tích header {{HTTPHeader("User-Agent")}}. Vì lý do lịch sử, header này chứa rất nhiều thông tin phần lớn không liên quan và thông tin có thể được sử dụng để xác định _người dùng cụ thể_. UA client hints cung cấp cách hiệu quả hơn và bảo vệ quyền riêng tư hơn để lấy thông tin mong muốn. Cuối cùng chúng được kỳ vọng sẽ thay thế cách tiếp cận cũ hơn này.

> [!NOTE]
> User-agent client hints không có sẵn bên trong [fenced frames](/en-US/docs/Web/API/Fenced_frame_API) vì chúng dựa trên [permissions policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) delegation, có thể được sử dụng để rò rỉ dữ liệu.

### User preference media features client hints

User Preference Media Features Client Hints cho phép máy chủ thay đổi các phản hồi dựa trên tùy chọn của user agent cho [CSS media features](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) như color scheme hoặc reduced motion. Các header bao gồm: {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}}, {{HTTPHeader("Sec-CH-Prefers-Color-Scheme")}}.

### Device client hints

Device client hints cho phép máy chủ thay đổi các phản hồi dựa trên đặc điểm thiết bị bao gồm bộ nhớ khả dụng và thuộc tính màn hình. Các header bao gồm: {{HTTPHeader("Sec-CH-Device-Memory")}}, {{HTTPHeader("Sec-CH-DPR")}}, {{HTTPHeader("Sec-CH-Viewport-Height")}}, {{HTTPHeader("Sec-CH-Viewport-Width")}}.

### Network client hints

Network client hints cho phép máy chủ thay đổi các phản hồi dựa trên lựa chọn của người dùng, băng thông mạng và độ trễ. Các header bao gồm: {{HTTPHeader("Save-Data")}}, {{HTTPHeader("Downlink")}}, {{HTTPHeader("ECT")}}, {{HTTPHeader("RTT")}}.

## Sử dụng client hints để thiết kế responsive

Có thể sử dụng client hints cho thiết kế responsive, ví dụ để phát hiện xem thiết bị di động hay máy tính bảng có đang render trang web của bạn không.

Điện thoại Android sẽ gửi các client hints mặc định sau đây:

```http
Sec-CH-UA: "Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"
Sec-CH-UA-Platform: "Android"
Sec-CH-UA-Mobile: ?1
```

Mặt khác, máy tính bảng Android sẽ gửi:

```http
Sec-CH-UA: "Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"
Sec-CH-UA-Platform: "Android"
Sec-CH-UA-Mobile: ?0
```

Header {{httpheader("Sec-CH-UA-Mobile")}} có thể được sử dụng để xác định xem thiết bị có phải là thiết bị di động hay không. Đối với các trường hợp sử dụng dành riêng cho phần cứng, tên model thiết bị và hệ số hình thức có thể được yêu cầu qua high-entropy hints {{httpheader("Sec-CH-UA-Model")}} và {{httpheader("Sec-CH-UA-Form-Factors")}}.

Đối với nhiều nhu cầu thiết kế responsive, [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) có thể tiện lợi và linh hoạt hơn. Tuy nhiên, có thể có những trường hợp bạn không có quyền kiểm soát các stylesheet riêng lẻ của trang web và cần thay đổi stylesheet được phục vụ dựa trên chữ ký thiết bị hoặc một số loại tùy chọn người dùng. Có các client hints phản ánh một số "user preference" media queries, chẳng hạn như {{httpheader("Sec-CH-Prefers-Color-Scheme")}}, {{httpheader("Sec-CH-Prefers-Reduced-Motion")}} và {{httpheader("Sec-CH-Prefers-Reduced-Transparency")}}.

## Xem thêm

- [Header Client Hints](/en-US/docs/Web/HTTP/Reference/Headers#client_hints)
- [HTTP Header `Vary`](/en-US/docs/Web/HTTP/Reference/Headers/Vary)
- [Client Hints Infrastructure](https://wicg.github.io/client-hints-infrastructure/)
- [User Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) trên developer.chrome.com (2020)
- [Migrate to User-Agent Client Hints](https://web.dev/articles/migrate-to-ua-ch) trên web.dev (2021)
