---
title: Rò rỉ xuyên site (XS-Leaks)
slug: Web/Security/Attacks/XS-Leaks
page-type: guide
sidebar: security
---

Rò rỉ xuyên site (còn gọi là XS-Leaks) là một lớp tấn công trong đó site của kẻ tấn công có thể suy ra thông tin về site mục tiêu, hoặc về mối quan hệ của người dùng với site mục tiêu, bằng cách dùng các API của nền tảng web cho phép các site tương tác với nhau. Thông tin bị rò rỉ có thể bao gồm, chẳng hạn:

- Người dùng đã từng truy cập site mục tiêu hay chưa.
- Người dùng có đang đăng nhập vào site mục tiêu hay không.
- ID của người dùng trên site là gì.
- Người dùng gần đây đã tìm kiếm gì trên site.

Điều này có vẻ ít nguy hiểm hơn nhiều so với, chẳng hạn, một cuộc tấn công [cross-site scripting](/en-US/docs/Web/Security/Attacks/XSS), nhưng nó vẫn có thể gây hậu quả nghiêm trọng cho người dùng. Ví dụ:

- Người dùng có thể có tài khoản trên các website mà họ không muốn công khai. Việc rò rỉ thông tin này cho kẻ tấn công có thể khiến họ đối mặt với tống tiền hoặc trả đũa từ một chính phủ đàn áp (ví dụ, đối với một người dùng đang tìm kiếm thông tin về các thủ thuật y tế cụ thể).
- Biết rằng người dùng có tài khoản trên một site, đặc biệt nếu có thể xác định ID người dùng của họ, có thể khiến một cuộc tấn công lừa đảo tiếp theo trở nên thuyết phục hơn nhiều.

Không giống các cuộc tấn công khác như [XSS](/en-US/docs/Web/Security/Attacks/XSS) hoặc [Clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking), rò rỉ xuyên site không phải là một kỹ thuật duy nhất. Thay vào đó, nó là tên gọi của cả một lớp tấn công khai thác những điểm yếu trong cách trình duyệt cô lập các website với nhau.

Trong hướng dẫn này, chúng ta sẽ không cố mô tả mọi cuộc tấn công và phòng vệ XS-Leaks. Thay vào đó, chúng ta sẽ bắt đầu bằng cách mô tả một vài ví dụ tấn công, rồi phác thảo các điểm yếu nền tảng chung cho phép chúng, rồi mô tả một số biện pháp phòng vệ chung có thể chống lại nhiều tấn công đã biết.

## Ví dụ XS-Leaks

Trong phần này, chúng ta sẽ mô tả ba XS-Leaks khác nhau để cho thấy cách chúng hoạt động.

- [Rò rỉ sự tồn tại của trang bằng sự kiện lỗi](#leaking_page_existence_using_error_events): trong cuộc tấn công này, kẻ tấn công có thể xác định liệu các endpoint cụ thể trong site mục tiêu có trả về mã lỗi HTTP hay không, bằng cách cố tải chúng như tài nguyên và lắng nghe các sự kiện {{domxref("HTMLElement/error_event", "error")}} và {{domxref("HTMLElement/load_event", "load")}}. Nếu một số trang chỉ có sẵn cho người dùng đã đăng nhập, kẻ tấn công có thể xác định liệu người dùng có đang đăng nhập vào site mục tiêu hay không.
- [Đếm frame bằng tham chiếu window](#frame_counting_using_window_references): trong cuộc tấn công này, kẻ tấn công lấy được một tham chiếu tới một đối tượng {{domxref("Window", "window")}} đang chứa một trang trong site mục tiêu, ví dụ là giá trị trả về từ lời gọi {{domxref("Window.open()", "window.open()")}}. Sau đó, kẻ tấn công có thể xác định số lượng phần tử {{htmlelement("iframe")}} trong trang mục tiêu, điều này một lần nữa có thể tiết lộ liệu người dùng có đang đăng nhập vào target hay không.
- [Rò rỉ chuyển hướng với CSP](#leaking_redirects_with_a_csp): trong cuộc tấn công này, trang của kẻ tấn công có một [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) chỉ cho phép tải một trang cụ thể từ site mục tiêu, rồi cố tải trang đó. Nếu việc tải trang bị chặn, kẻ tấn công biết rằng target đã chuyển hướng yêu cầu. Việc chuyển hướng này có thể cho biết người dùng đã đăng nhập hay chưa tùy cách site hoạt động.

Cả ba cuộc tấn công đều được triển khai theo cùng một cách: kẻ tấn công tạo một trang thực hiện cuộc tấn công, rồi thuyết phục người dùng truy cập trang đó, chẳng hạn bằng cách gửi email hoặc chia sẻ một bài viết chứa liên kết. Khi người dùng truy cập trang, cuộc tấn công sẽ tự động thực thi.

Trong phần còn lại của mục này, chúng ta sẽ mô tả ba cuộc tấn công này chi tiết hơn một chút, để bạn có cảm nhận cụ thể về cách chúng hoạt động. Mặc dù ba cuộc tấn công nhắm vào các phần rất khác nhau của nền tảng web, chúng có chung một nguyên nhân nền tảng: mức độ mà trình duyệt cho phép các website kết nối và tương tác với nhau thông qua các cơ chế như nhúng frame, tải tài nguyên phụ, hoặc mở cửa sổ mới.

> [!NOTE]
> Để có danh mục đầy đủ hơn về các XS-Leaks, xem [XS-Leaks Wiki](https://xsleaks.dev/) và [OWASP Cross-site Leaks Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/XS_Leaks_Cheat_Sheet.html).

### Rò rỉ sự tồn tại của trang bằng sự kiện lỗi

Trong cuộc tấn công này, kẻ tấn công kiểm tra xem các trang cụ thể trong site mục tiêu có thể được tải hay không, bằng cách xem liệu các lần cố nhúng chúng như tài nguyên có tạo ra lỗi hay không. Nếu các trang này chỉ có sẵn cho người dùng đã đăng nhập, kẻ tấn công có thể xác định liệu người dùng có đăng nhập hay không.

Cuộc tấn công dựa vào khả năng của một website tải tài nguyên từ site khác, ví dụ bằng cách đặt thuộc tính `src` của phần tử {{htmlelement("script")}} thành URL của tài nguyên:

```js
const script = document.createElement("script");
script.src = "https://example.org/admin";
document.head.appendChild(script);
```

Điều này dẫn tới một yêu cầu HTTP tới website `https://example.org/`. Nếu yêu cầu có kèm cookie mà site dùng để nhận diện người dùng, và trang được yêu cầu chỉ có sẵn cho người dùng đã đăng nhập, thì việc yêu cầu thành công hay thất bại sẽ tiết lộ liệu người dùng có đang đăng nhập hay không.

Nếu yêu cầu thất bại, ví dụ vì máy chủ trả về mã trạng thái HTTP {{httpstatus("404")}}, thì phần tử sẽ phát sự kiện {{domxref("HTMLElement.error_event", "error")}}. Nếu yêu cầu thành công, phần tử sẽ phát sự kiện {{domxref("HTMLElement.load_event", "load")}}. Bằng cách lắng nghe các sự kiện này, kẻ tấn công có thể phát hiện liệu người dùng có đang đăng nhập hay không.

```js
const url = "https://example.org/admin";
const script = document.createElement("script");

script.addEventListener("load", (e) => {
  console.log(`${url} exists`);
});

script.addEventListener("error", (e) => {
  console.log(`${url} does not exist`);
});

script.src = url;
document.head.appendChild(script);
```

Kẻ tấn công thậm chí có thể phát hiện ID của người dùng bằng cách thử lặp đi lặp lại việc tải các trang để xem các trang như `https://example.org/users/my_username` có tồn tại hay không.

### Đếm frame bằng tham chiếu window

Trong một cuộc tấn công đếm frame, kẻ tấn công tìm ra số lượng frame hiện đang được tải trong trang mục tiêu. Ngược lại, điều đó rò rỉ thông tin về trạng thái của site mục tiêu, có thể cho phép kẻ tấn công biết, chẳng hạn, liệu người dùng có đang đăng nhập vào site hay không.

Nếu site của kẻ tấn công lấy được một tham chiếu tới một đối tượng {{domxref("Window")}} chứa site mục tiêu, kẻ tấn công có thể đếm số frame trong site mục tiêu bằng cách đọc thuộc tính {{domxref("Window.length", "window.length")}}.

Kẻ tấn công có thể lấy một đối tượng `Window` bằng cách gọi {{domxref("Window.open()", "window.open()")}}:

```js
const target = window.open("https://example.org");
const frames = target.length;
```

Hoặc kẻ tấn công có thể nhúng site mục tiêu trong một phần tử {{htmlelement("iframe")}}, và lấy thuộc tính {{domxref("HTMLIFrameElement.contentWindow", "contentWindow")}} của frame:

```html
<iframe src="https://example.org"></iframe>
```

```js
const target = document.querySelector("iframe").contentWindow;
const frames = target.length;
```

### Rò rỉ chuyển hướng với CSP

Trên một số website, máy chủ sẽ chuyển hướng một yêu cầu, hoặc không, dựa trên việc người dùng có đăng nhập hay không (hoặc có trạng thái đặc biệt nào đó trên site hay không). Ví dụ, hãy tưởng tượng một site hiển thị cho quản trị viên một trang ở `https://admin.example.org/`. Nếu người dùng chưa đăng nhập, và yêu cầu trang này, máy chủ có thể chuyển hướng họ tới `https://login.example.org/`.
Điều này có nghĩa là nếu kẻ tấn công có thể xác định xem một lần cố tải `https://admin.example.org/` có bị chuyển hướng hay không, thì họ sẽ biết liệu người dùng có là quản trị viên trên site hay không.

Trong cuộc tấn công được mô tả ở đây, kẻ tấn công dùng tính năng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) để phát hiện liệu một yêu cầu xuyên site có bị chuyển hướng hay không.

- Trước hết, họ tạo một trang được điều khiển bởi CSP chỉ cho phép các phần tử {{htmlelement("iframe")}} chứa nội dung từ `https://admin.example.org/`.

- Tiếp theo, họ thêm một event listener trong trang để lắng nghe sự kiện {{domxref("Document.securitypolicyviolation_event", "securitypolicyviolation")}}.

- Cuối cùng, họ tạo một phần tử {{htmlelement("iframe")}} và đặt thuộc tính `src` của nó thành `https://admin.example.org/`.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="frame-src https://admin.example.org/" />
  </head>
  <body>
    <script>
      document.addEventListener("securitypolicyviolation", () => {
        console.log("Page was redirected");
      });
      const frame = document.createElement("iframe");
      document.body.appendChild(frame);
      frame.src = "https://admin.example.org/";
    </script>
  </body>
</html>
```

- Nếu người dùng đang đăng nhập với vai trò admin, thì `<iframe>` sẽ tải, và trình duyệt sẽ không phát `securitypolicyviolation`.
- Nếu người dùng không đăng nhập với vai trò admin, máy chủ chuyển hướng tới `https://login.example.org/`. Vì URL này không được cho phép bởi CSP của kẻ tấn công, trình duyệt sẽ chặn `<iframe>` và phát sự kiện `securitypolicyviolation`, và trình xử lý sự kiện của kẻ tấn công sẽ chạy.

Lưu ý rằng cuộc tấn công này vẫn hoạt động ngay cả khi target không cho phép nhúng bằng cơ chế như [`frame-ancestors`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors).

## Phòng vệ chống XS-Leaks

XS-Leaks khai thác các cơ chế trong nền tảng web vốn cho phép các website tương tác với nhau. Tương ứng, các phòng vệ chống XS-Leaks thường liên quan đến việc _cô lập_ website mục tiêu khỏi các kẻ tấn công tiềm năng, bằng cách vô hiệu hóa hoặc kiểm soát các tương tác xuyên site này.

Vì XS-Leaks có thể hoạt động theo nhiều cách khác nhau, không có một phòng vệ duy nhất nào có thể chống lại tất cả. Tuy nhiên, có một số thực hành sẽ hoạt động chống lại nhiều kiểu trong số đó, và chúng tôi sẽ tóm tắt ở đây.

### Fetch metadata

{{glossary("Fetch metadata request header", "Fetch metadata")}} là thuật ngữ dùng cho một tập hợp các HTTP request header cung cấp thông tin về ngữ cảnh của một yêu cầu HTTP, bao gồm:

- {{httpheader("Sec-Fetch-Site")}}: Yêu cầu là same-origin, same-site, hay cross-site.
- {{httpheader("Sec-Fetch-Mode")}}: {{domxref("Request.mode", "mode")}} của yêu cầu.
- {{httpheader("Sec-Fetch-User")}}: Yêu cầu có phải là một điều hướng do người dùng khởi xướng hay không.
- {{httpheader("Sec-Fetch-Dest")}}: {{domxref("Request.destination", "destination")}} của yêu cầu.

Các header fetch metadata không phải là một cơ chế phòng vệ tự thân, nhưng chúng cho phép máy chủ triển khai một chính sách sẽ từ chối những yêu cầu được dùng trong XS-Leaks cũng như các cuộc tấn công khác như [Cross-Site Request Forgery (CSRF)](/en-US/docs/Web/Security/Attacks/CSRF).

Ví dụ, cuộc tấn công [Rò rỉ sự tồn tại của trang bằng sự kiện lỗi](#leaking_page_existence_using_error_events) phụ thuộc vào việc kẻ tấn công có thể thực hiện các yêu cầu xuyên site để tải, như tài nguyên, những trang thuộc về target:

```js
// Attempt to load a page in the target as a resource
const script = document.createElement("script");
script.src = "https://example.org/admin";
document.head.appendChild(script);
```

Máy chủ có thể dùng Fetch metadata để từ chối các yêu cầu này, như trong mã [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) sau:

```js
function isAllowed(req) {
  // Allow same-origin, same-site, and user-initiated requests
  const secFetchSite = req.headers["sec-fetch-site"];
  if (
    secFetchSite === "same-origin" ||
    secFetchSite === "same-site" ||
    secFetchSite === "none"
  ) {
    return true;
  }

  // Allow cross-site navigations, such as clicking links
  const secFetchMode = req.headers["sec-fetch-mode"];
  if (secFetchMode === "navigate" && req.method === "GET") {
    return true;
  }

  // Deny everything else
  return false;
}

app.get("/admin", (req, res) => {
  res.setHeader("Vary", "sec-fetch-site, sec-fetch-mode");
  if (isAllowed(req)) {
    // Respond with the admin page if the user is admin
    getAdminPage(req, res);
  } else {
    res.status(404).send("Not found.");
  }
});
```

Vì yêu cầu của kẻ tấn công là cross-site và không phải là một điều hướng, nên máy chủ này luôn trả về lỗi cho nó, bất kể người dùng có đăng nhập hay không.

Lưu ý rằng chúng ta cũng gửi header phản hồi {{httpheader("Vary")}}. Điều này bảo đảm rằng nếu phản hồi được lưu trong cache, phản hồi đã cache sẽ chỉ được trả cho các yêu cầu có cùng giá trị của các header Fetch metadata mà chúng ta đang dùng.

Một chính sách như vậy được gọi là _Resource Isolation Policy_. Để tìm hiểu kỹ hơn về việc triển khai chính sách cô lập bằng Fetch metadata, xem [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) và [Isolation Policies](https://xsleaks.dev/docs/defenses/isolation-policies/).

### Cookie SameSite

Thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) xác định việc cookie có được gửi trong các yêu cầu xuất phát từ site khác hay không.

Giá trị `Lax` của `SameSite` có nghĩa là các yêu cầu xuyên site sẽ chỉ bao gồm cookie nếu yêu cầu đó là một điều hướng ở cấp cao nhất (nghĩa là, về cơ bản, giá trị trong thanh địa chỉ của trình duyệt thay đổi sang site mục tiêu) và dùng một phương thức {{glossary("Safe/HTTP", "an toàn")}} (đáng chú ý nhất là điều này loại trừ các yêu cầu {{httpmethod("POST")}}).

Điều này có thể bảo vệ chống lại một số XS-Leaks. Ví dụ, cuộc tấn công [Rò rỉ sự tồn tại của trang bằng sự kiện lỗi](#leaking_page_existence_using_error_events) phụ thuộc vào việc kẻ tấn công thực hiện các yêu cầu tài nguyên xuyên site có kèm cookie phiên của người dùng. Đặt `SameSite` thành `Lax` trên cookie phiên của người dùng sẽ ngăn cuộc tấn công này, vì cookie sẽ không được gửi trong yêu cầu của kẻ tấn công, và sẽ không có trang nào yêu cầu đăng nhập được trả về.

Theo nguyên tắc, `SameSite` nên được xem là một biện pháp phòng vệ theo chiều sâu, và nên được triển khai cùng với một chính sách cô lập rõ ràng hơn như chính sách dựa trên Fetch metadata.

### Bảo vệ nhúng frame

Nhiều XS-Leaks dựa vào việc site tấn công có thể nhúng target như một phần tử {{htmlelement("iframe")}}. Ví dụ, đây là một cách mà kẻ tấn công có thể dùng để lấy tham chiếu tới {{domxref("Window", "window")}} của target, nhằm thực hiện tấn công [đếm frame](#frame_counting_using_window_references).

Điều này có nghĩa là một thực hành tốt là ngăn một site có thể được nhúng trừ khi bạn thực sự cần cho phép nhúng, và nếu bạn cần cho phép nhúng, hãy giới hạn nó càng nhiều càng tốt.

Có hai công cụ liên quan ở đây:

- Chỉ thị [`frame-ancestors`](/en-US/docs/Web/HTTP/Guides/CSP#clickjacking_protection) trong một [content security policy](/en-US/docs/Web/HTTP/Guides/CSP).
- Header phản hồi {{httpheader("X-Frame-Options")}}.

Chỉ thị `frame-ancestors` là sự thay thế cho `X-Frame-Options`. Mặc dù [hỗ trợ trình duyệt cho `frame-ancestors` rất tốt](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors#browser_compatibility), một số trình duyệt rất cũ, đặc biệt là Internet Explorer, không hỗ trợ `frame-ancestors`.

Nếu cả `frame-ancestors` và `X-Frame-Options` đều được đặt, thì các trình duyệt hỗ trợ `frame-ancestors` sẽ bỏ qua `X-Frame-Options`. Điều này có nghĩa là không có lý do gì để không đặt `X-Frame-Options` cùng với `frame-ancestors`, và như vậy ngăn nhúng ngay cả trong những trình duyệt không hỗ trợ `frame-ancestors`.

### Cross-Origin Opener Policy (COOP)

Như chúng ta đã thấy trong cuộc tấn công [đếm frame](#frame_counting_using_window_references), một cách khác để lấy tham chiếu tới {{domxref("Window", "window")}} của target là giá trị trả về từ lời gọi {{domxref("Window.open()", "window.open()")}}:

```js
const target = window.open("https://example.com");
```

Header phản hồi {{httpheader("Cross-Origin-Opener-Policy")}} xác định xem một tài liệu có được mở trong cùng một {{glossary("Browsing context", "browsing context group")}} với tài liệu đã mở nó hay không.

Nếu máy chủ của bạn gửi header này và đặt nó thành bất kỳ giá trị nào khác ngoài mặc định `"unsafe-none"`, thì nếu một tài liệu từ origin khác cố mở trang của bạn bằng `window.open()`, trang của bạn sẽ được tải vào một browsing context group khác. Trong số những điều khác, điều này có nghĩa là opener sẽ không nhận được tham chiếu tới đối tượng `window` của trang bạn, và vì vậy sẽ không thể dùng nó trong một cuộc tấn công đếm frame.

## Danh sách kiểm tra tóm tắt phòng vệ

XS-Leaks bao gồm một loạt các cuộc tấn công nhắm vào các phần khác nhau của nền tảng web. Không có một phòng vệ duy nhất nào hoạt động chống lại tất cả chúng và một số rò rỉ, như kiểu khai thác CSP để rò rỉ chuyển hướng, hiện vẫn chưa có phòng vệ nào.

Trong hướng dẫn này, chúng ta đã phác thảo một vài phòng vệ giúp cô lập site của bạn khỏi các kẻ tấn công tiềm năng, và chúng tôi khuyến nghị triển khai tất cả:

- Dùng Fetch metadata để triển khai một chính sách cô lập tài nguyên.
- Đặt thuộc tính `SameSite` cho cookie phiên thành `Strict` nếu có thể, hoặc `Lax` nếu bắt buộc.
- Dùng chỉ thị CSP `frame-ancestors` và header phản hồi `X-Frame-Options` để ngăn site của bạn bị nhúng, hoặc để kiểm soát những site nào có thể nhúng site của bạn.
- Gửi header phản hồi `Cross-Origin-Opener-Policy` để ngăn site khác truy cập đối tượng global `window` của bạn.

## Xem thêm

- [XS-Leaks Wiki](https://xsleaks.dev/) (xsleaks.dev)
- [Cross-site leaks Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/XS_Leaks_Cheat_Sheet.html) (OWASP)
