---
title: Ngữ cảnh an toàn
slug: Web/Security/Defenses/Secure_Contexts
page-type: guide
spec-urls: https://w3c.github.io/webappsec-secure-contexts/
sidebar: security
---

Một **secure context** là một `Window` hoặc `Worker` đáp ứng các tiêu chuẩn tối thiểu nhất định về xác thực và bảo mật thông tin. Nhiều Web API và tính năng chỉ có thể truy cập trong một secure context. Mục tiêu chính của secure contexts là ngăn các [kẻ tấn công MITM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) truy cập vào các API mạnh có thể làm tổn hại thêm nạn nhân của cuộc tấn công.

## Vì sao một số tính năng nên bị giới hạn?

Một số API trên web rất mạnh, cho phép kẻ tấn công thực hiện những việc sau và nhiều hơn nữa:

- Xâm phạm quyền riêng tư của người dùng.
- Có được quyền truy cập cấp thấp vào máy tính của người dùng.
- Truy cập vào dữ liệu như thông tin xác thực của người dùng.

## Khi nào một ngữ cảnh được xem là an toàn?

Một ngữ cảnh được xem là an toàn khi nó đáp ứng các tiêu chuẩn tối thiểu về xác thực và bảo mật thông tin được định nghĩa trong đặc tả [Secure Contexts](https://w3c.github.io/webappsec-secure-contexts/). Một tài liệu cụ thể được xem là nằm trong một secure context khi nó là [tài liệu đang hoạt động](https://html.spec.whatwg.org/multipage/browsers.html#active-document) của một [top-level browsing context](https://html.spec.whatwg.org/multipage/browsers.html#top-level-browsing-context) (về cơ bản là một cửa sổ hoặc tab chứa) vốn là một secure context.

Ví dụ, ngay cả khi một tài liệu được phân phối qua TLS trong một {{HTMLElement("iframe")}}, ngữ cảnh của nó vẫn **không** được xem là an toàn nếu nó có một ancestor cũng không được phân phối qua TLS.

Tuy nhiên, điều quan trọng cần lưu ý là nếu một ngữ cảnh không an toàn tạo ra một cửa sổ mới (có hoặc không chỉ định [noopener](/en-US/docs/Web/API/Window/open)), thì việc opener không an toàn không ảnh hưởng đến việc cửa sổ mới có được xem là an toàn hay không. Đó là vì việc xác định một tài liệu cụ thể có nằm trong secure context hay không chỉ dựa trên việc xem xét nó trong top-level browsing context mà nó gắn với - chứ không dựa trên việc liệu nó có vô tình được tạo bởi một ngữ cảnh không an toàn hay không.

Các tài nguyên không phải local, để được xem là an toàn, phải đáp ứng các tiêu chí sau:

- Chúng phải được phục vụ qua URL `https://`.
- Các đặc tính bảo mật của kênh mạng được dùng để phân phối tài nguyên không được xem là đã lỗi thời.

## Origin đáng tin cậy có thể có

Một **potentially trustworthy origin** là origin mà trình duyệt có thể thường tin cậy để cung cấp dữ liệu an toàn, dù xét một cách chặt chẽ thì nó không đáp ứng các tiêu chí của secure context.

Các tài nguyên được phân phối cục bộ như những tài nguyên có URL `http://127.0.0.1`, `http://localhost`, và `http://*.localhost` (ví dụ: `http://dev.whatever.localhost/`) không được phân phối bằng HTTPS, nhưng có thể được xem là đã được phân phối an toàn vì chúng nằm trên cùng thiết bị với trình duyệt. Do đó chúng là potentially trustworthy. Điều này rất tiện cho các nhà phát triển kiểm thử ứng dụng cục bộ.

Điều tương tự cũng thường đúng với các URL `file://`.

Các URL `wss://` an toàn của [WebSocket](/en-US/docs/Web/API/WebSockets_API) cũng được xem là potentially trustworthy.

Các scheme URL đặc thù của nhà cung cấp như `app://` hoặc `chrome-extension://` không được tất cả các trình duyệt xem là potentially trustworthy, nhưng có thể được xem như vậy bởi các trình duyệt có nhà cung cấp đã tạo ra chúng.

> [!NOTE]
> Firefox 84 trở lên hỗ trợ các URL `http://localhost` và `http://*.localhost` như các origin đáng tin cậy (các phiên bản trước thì không, vì `localhost` không được đảm bảo ánh xạ tới địa chỉ local/loopback).

## Phát hiện tính năng

Các trang có thể dùng phát hiện tính năng để kiểm tra xem chúng có đang ở trong một secure context hay không bằng cách sử dụng giá trị boolean {{domxref("Window.isSecureContext")}} hoặc {{domxref("WorkerGlobalScope.isSecureContext")}}, được hiển thị trên global scope.

```js
if (window.isSecureContext) {
  // Trang là secure context nên service worker giờ đã sẵn sàng
  navigator.serviceWorker.register("/offline-worker.js").then(() => {
    // …
  });
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Các tính năng nền tảng bị giới hạn trong secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts) - danh sách các tính năng chỉ khả dụng trong secure contexts
- {{domxref("Window.isSecureContext")}} và {{domxref("WorkerGlobalScope.isSecureContext")}}
- <https://permission.site> - Một site cho phép bạn kiểm tra các phép kiểm tra quyền API mà trình duyệt của bạn sử dụng, qua HTTP và HTTPS
- Tiêu đề HTTP [Strict-Transport-Security](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security)
