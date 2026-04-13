---
title: API Gợi ý máy khách tác nhân người dùng
slug: Web/API/User-Agent_Client_Hints_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.NavigatorUAData
  - api.Navigator.userAgentData
  - api.WorkerNavigator.userAgentData
spec-urls: https://wicg.github.io/ua-client-hints/
---

{{DefaultAPISidebar("User-Agent Client Hints API")}}{{SeeCompatTable}}

**API Gợi ý máy khách tác nhân người dùng** mở rộng [Gợi ý máy khách](/en-US/docs/Web/HTTP/Guides/Client_hints) để cung cấp cách hiển thị thông tin trình duyệt và nền tảng thông qua các tiêu đề phản hồi và yêu cầu User-Agent, cùng với một API JavaScript.

## Khái niệm và cách sử dụng

Phân tích chuỗi User-Agent theo truyền thống là cách để lấy thông tin về trình duyệt hoặc thiết bị của người dùng. Một chuỗi tác nhân người dùng điển hình trông như ví dụ sau, xác định Chrome 92 trên Windows:

```plain
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36
```

Gợi ý máy khách tác nhân người dùng nhằm cung cấp thông tin này theo cách bảo vệ quyền riêng tư hơn bằng cách thực thi mô hình trong đó máy chủ yêu cầu một tập thông tin. Trình duyệt quyết định nội dung trả về. Cách tiếp cận này có nghĩa là tác nhân người dùng có thể cung cấp cài đặt cho phép người dùng ẩn một số thông tin có thể nhận dạng họ khỏi các yêu cầu đó.

Để quyết định nội dung trả về, thông tin được truy cập thông qua API này được chia thành hai nhóm: gợi ý **entropy thấp** và **entropy cao**. Gợi ý entropy thấp là những gợi ý không tiết lộ nhiều thông tin, API làm cho chúng dễ dàng truy cập với mỗi yêu cầu. Gợi ý entropy cao có khả năng tiết lộ nhiều thông tin hơn và do đó bị kiểm soát theo cách mà trình duyệt có thể quyết định có cung cấp chúng hay không. Quyết định này có thể dựa trên tùy chọn người dùng hoặc yêu cầu cấp quyền.

### Các trường hợp sử dụng gợi ý máy khách tác nhân người dùng

Các trường hợp sử dụng tiềm năng bao gồm:

- Cung cấp các polyfill tùy chỉnh cho người dùng khi xác định rằng trình duyệt của họ thiếu một số tính năng nền tảng web.
- Xử lý các lỗi trình duyệt.
- Ghi lại phân tích trình duyệt.
- Điều chỉnh nội dung dựa trên thông tin tác nhân người dùng.
  Điều này bao gồm phục vụ nội dung khác nhau cho thiết bị di động, đặc biệt là các thiết bị được xác định là kém hiệu năng.
  Nó cũng có thể bao gồm điều chỉnh thiết kế để điều chỉnh giao diện cho hệ điều hành của người dùng, hoặc cung cấp liên kết đến các liên kết dành riêng cho hệ điều hành.
- Cung cấp thông báo khi người dùng đăng nhập từ trình duyệt hoặc thiết bị khác như một tính năng bảo mật.
- Cung cấp tệp thực thi nhị phân chính xác trên trang web cung cấp tải xuống.
- Thu thập thông tin về trình duyệt và thiết bị để xác định lỗi ứng dụng.
- Chặn thư rác, bot và trình thu thập dữ liệu.

## Giao diện

- {{domxref("NavigatorUAData")}}
  - : Cung cấp các thuộc tính và phương thức để truy cập dữ liệu về trình duyệt và hệ điều hành của người dùng.

### Mở rộng các giao diện khác

- {{domxref("Navigator.userAgentData")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("NavigatorUAData")}}, cung cấp quyền truy cập thông tin về trình duyệt và hệ điều hành của người dùng.
- {{domxref("WorkerNavigator.userAgentData")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("NavigatorUAData")}}, cung cấp quyền truy cập thông tin về trình duyệt và hệ điều hành của người dùng.

## Ví dụ

### Lấy thương hiệu

Ví dụ sau in giá trị của {{domxref("NavigatorUAData.brands")}} ra console.

```js
console.log(navigator.userAgentData.brands);
```

### Trả về các giá trị entropy cao

Trong ví dụ sau, một số gợi ý được yêu cầu bằng phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}}. Khi promise được giải quyết, thông tin này được in ra console.

```js
navigator.userAgentData
  .getHighEntropyValues([
    "architecture",
    "model",
    "platform",
    "platformVersion",
    "fullVersionList",
  ])
  .then((ua) => {
    console.log(ua);
  });
```

## Cân nhắc bảo mật

Các trang web hỗ trợ thiết lập [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) (thông qua tiêu đề HTTP {{HTTPHeader("Permissions-Policy")}} hoặc thuộc tính {{HTMLElement("iframe")}} [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow)) có thể hạn chế khả năng sử dụng API Gợi ý máy khách tác nhân người dùng bằng chỉ thị {{HTTPHeader("Permissions-Policy/ch-ua-high-entropy-values", "ch-ua-high-entropy-values")}}.

Cụ thể, khi quyền không được cấp, {{domxref("NavigatorUAData.getHighEntropyValues()")}} sẽ chỉ trả về dữ liệu entropy thấp như `brands`, `mobile` và `platform`.

Ví dụ, chính sách sau chỉ cho phép origin hiện tại và hai origin cụ thể khác truy xuất dữ liệu entropy cao.

```http
Permissions-Policy: ch-ua-high-entropy-values=("self https://a.example.com" "https://b.example.com")
```

Sau đó bạn có thể nhúng một trong hai origin kia:

```html
<iframe src="https://a.example.com" allow="ch-ua-high-entropy-values"></iframe>
```

Danh sách cho phép mặc định cho `ch-ua-high-entropy-values` là `*`, cho phép bất kỳ nội dung nào trong tài liệu hiện tại và tất cả ngữ cảnh duyệt lồng nhau sử dụng `getHighEntropyValues()`.

> [!NOTE]
> Quyền truy cập vào các tính năng entropy cao riêng lẻ có thể được kiểm soát bằng [chính sách quyền riêng lẻ](https://wicg.github.io/client-hints-infrastructure/#policy-controlled-features) của chúng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints)
- [Migrate to User-Agent Client Hints](https://web.dev/articles/migrate-to-ua-ch)
