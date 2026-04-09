---
title: Ngữ cảnh an toàn
slug: Web/Security/Defenses/Secure_Contexts
page-type: guide
spec-urls: https://w3c.github.io/webappsec-secure-contexts/
sidebar: security
---

**Ngữ cảnh an toàn** là một `Window` hoặc `Worker` đáp ứng một số tiêu chuẩn tối thiểu về xác thực và tính bảo mật. Nhiều Web API và tính năng chỉ có thể truy cập trong ngữ cảnh an toàn. Mục tiêu chính của ngữ cảnh an toàn là ngăn các kẻ tấn công [MITM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) truy cập vào những API mạnh có thể khiến nạn nhân bị xâm hại nghiêm trọng hơn.

## Vì sao một số tính năng cần bị hạn chế?

Một số API trên web rất mạnh, cho phép kẻ tấn công làm những việc sau và hơn thế nữa:

- Xâm phạm quyền riêng tư của người dùng.
- Có được quyền truy cập mức thấp vào máy tính của người dùng.
- Truy cập dữ liệu như thông tin xác thực của người dùng.

## Khi nào một ngữ cảnh được coi là an toàn?

Một ngữ cảnh được coi là an toàn khi nó đáp ứng các tiêu chuẩn tối thiểu về xác thực và tính bảo mật được định nghĩa trong đặc tả [Secure Contexts](https://w3c.github.io/webappsec-secure-contexts/). Một tài liệu cụ thể được coi là nằm trong ngữ cảnh an toàn khi nó là [tài liệu đang hoạt động](https://html.spec.whatwg.org/multipage/browsers.html#active-document) của một [ngữ cảnh duyệt cấp cao nhất](https://html.spec.whatwg.org/multipage/browsers.html#top-level-browsing-context) (về cơ bản là cửa sổ hoặc tab chứa nó) và ngữ cảnh đó là ngữ cảnh an toàn.

Ví dụ, ngay cả với một tài liệu được phân phối qua TLS bên trong một {{HTMLElement("iframe")}}, ngữ cảnh của nó **không** được coi là an toàn nếu nó có một tổ tiên không được phân phối qua TLS.

Tuy nhiên, điều quan trọng cần lưu ý là nếu một ngữ cảnh không an toàn khiến một cửa sổ mới được tạo ra (có hoặc không chỉ định [noopener](/en-US/docs/Web/API/Window/open)), thì việc trình mở đó không an toàn không ảnh hưởng đến việc cửa sổ mới có được coi là an toàn hay không. Đó là vì việc xác định một tài liệu cụ thể có nằm trong ngữ cảnh an toàn hay không chỉ dựa trên việc xem xét nó trong ngữ cảnh duyệt cấp cao nhất mà nó gắn với, chứ không dựa trên việc có một ngữ cảnh không an toàn nào đã được dùng để tạo ra nó hay không.

Các tài nguyên không phải cục bộ, để được coi là an toàn, phải đáp ứng các tiêu chí sau:

- Chúng phải được phục vụ qua URL `https://`.
- Các thuộc tính bảo mật của kênh mạng dùng để phân phối tài nguyên không được bị coi là lỗi thời.

## Các origin có thể được tin cậy

**Origin có thể được tin cậy** là origin mà trình duyệt nhìn chung có thể tin tưởng để cung cấp tính an toàn cho dữ liệu, dù nói chính xác thì nó không đáp ứng hoàn toàn các tiêu chí của ngữ cảnh an toàn.

Các tài nguyên được phân phối cục bộ như `http://127.0.0.1`, `http://localhost`, và `http://*.localhost` (ví dụ `http://dev.whatever.localhost/`) không được phân phối bằng HTTPS, nhưng vẫn có thể được coi là đã được phân phối an toàn vì chúng nằm trên cùng thiết bị với trình duyệt. Vì vậy chúng là những origin có thể được tin cậy. Điều này rất thuận tiện cho các nhà phát triển khi kiểm thử ứng dụng cục bộ.

Điều tương tự nhìn chung cũng đúng với URL `file://`.

URL [WebSocket](/en-US/docs/Web/API/WebSockets_API) an toàn (`"wss://"`) cũng được coi là có thể được tin cậy.

Các scheme URL riêng của nhà cung cấp như `app://` hoặc `chrome-extension://` không được mọi trình duyệt coi là có thể được tin cậy, nhưng chúng hoàn toàn có thể được các trình duyệt do chính nhà cung cấp đó phát hành xem là đáng tin cậy.

> [!NOTE]
> Firefox 84 trở lên hỗ trợ URL `http://localhost` và `http://*.localhost` như các origin đáng tin cậy (các phiên bản trước đó thì không, vì `localhost` không được đảm bảo sẽ ánh xạ tới địa chỉ cục bộ hoặc loopback).

## Phát hiện tính năng

Các trang có thể dùng phát hiện tính năng để kiểm tra xem chúng có đang ở trong ngữ cảnh an toàn hay không bằng cách dùng giá trị boolean {{domxref("Window.isSecureContext")}} hoặc {{domxref("WorkerGlobalScope.isSecureContext")}}, được lộ ra trên phạm vi toàn cục.

```js
if (window.isSecureContext) {
  // Trang đang ở trong ngữ cảnh an toàn nên service worker đã khả dụng
  navigator.serviceWorker.register("/offline-worker.js").then(() => {
    // …
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Các tính năng nền tảng chỉ khả dụng trong ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts) - danh sách các tính năng chỉ có trong ngữ cảnh an toàn
- {{domxref("Window.isSecureContext")}} và {{domxref("WorkerGlobalScope.isSecureContext")}}
- <https://permission.site> - Một website cho phép bạn kiểm tra các cơ chế kiểm tra quyền API mà trình duyệt áp dụng, qua HTTP và HTTPS
- Header HTTP [Strict-Transport-Security](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security)
