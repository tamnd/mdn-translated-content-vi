---
title: Giả mạo yêu cầu liên site (CSRF)
slug: Web/Security/Attacks/CSRF
page-type: guide
sidebar: security
---

Trong một cuộc tấn công cross-site request forgery (CSRF), kẻ tấn công lừa người dùng hoặc trình duyệt thực hiện một yêu cầu HTTP tới site mục tiêu từ một site độc hại. Yêu cầu bao gồm thông tin xác thực của người dùng và khiến máy chủ thực hiện một hành động có hại, tưởng rằng đó là điều người dùng muốn.

## Tổng quan

Một website thường thực hiện các hành động đặc biệt thay mặt người dùng - chẳng hạn mua sản phẩm hoặc đặt lịch hẹn - bằng cách nhận một yêu cầu HTTP từ trình duyệt của người dùng, thường đi kèm các tham số mô tả hành động cần thực hiện. Để bảo đảm yêu cầu thực sự đến từ đúng người dùng, máy chủ mong đợi yêu cầu bao gồm {{glossary("Credential", "thông tin xác thực")}} của người dùng: ví dụ, một cookie chứa session ID của người dùng.

Trong ví dụ bên dưới, người dùng trước đó đã đăng nhập vào ngân hàng của họ, và trình duyệt đã lưu một session cookie cho người dùng. Trang có một phần tử {{htmlelement("form")}}, cho phép người dùng chuyển tiền cho người khác. Khi người dùng gửi form, trình duyệt gửi một yêu cầu {{httpmethod("POST")}} tới máy chủ, bao gồm dữ liệu form. Nếu người dùng đã đăng nhập, yêu cầu sẽ bao gồm cookie của họ. Máy chủ xác thực cookie và thực hiện hành động đặc biệt - trong trường hợp này là chuyển tiền:

![Sơ đồ cho thấy người dùng gửi form trên trình duyệt, trình duyệt sau đó gửi yêu cầu POST tới máy chủ, và máy chủ xác thực yêu cầu.](form-post.svg)

Trong hướng dẫn này, chúng ta sẽ gọi một yêu cầu như vậy, vốn thực hiện một hành động đặc biệt, là một _state-changing request_.

Trong một cuộc tấn công CSRF, kẻ tấn công tạo một website chứa một form. Thuộc tính [`action` của form](/en-US/docs/Web/HTML/Reference/Elements/form#action) được đặt thành website ngân hàng, và form chứa các trường input ẩn mô phỏng các trường của ngân hàng:

```html
<form action="https://my-bank.example.org/transfer" method="POST">
  <input type="hidden" name="recipient" value="attacker" />
  <input type="hidden" name="amount" value="1000" />
</form>
```

Trang cũng chứa JavaScript tự động gửi form khi trang tải:

```js
const form = document.querySelector("form");
form.submit();
```

Khi người dùng truy cập trang, trình duyệt gửi form tới website của ngân hàng. Vì người dùng đang đăng nhập vào ngân hàng của họ, yêu cầu có thể bao gồm cookie thật của người dùng, nên máy chủ của ngân hàng xác thực yêu cầu thành công, và chuyển tiền:

![Sơ đồ cho thấy một cuộc tấn công CSRF trong đó một trang mồi nhử gửi yêu cầu POST tới website ngân hàng của người dùng.](csrf-form-post.svg)

Có những cách khác để kẻ tấn công thực hiện cross-site request forgery. Ví dụ, nếu website dùng yêu cầu {{httpmethod("GET")}} để thực hiện hành động, thì kẻ tấn công có thể không cần dùng form nữa, và có thể thực hiện tấn công bằng cách gửi cho người dùng một liên kết tới trang chứa markup như sau:

```html
<img
  src="https://my-bank.example.org/transfer?recipient=attacker&amount=1000" />
```

Khi người dùng tải trang, trình duyệt cố lấy tài nguyên ảnh, nhưng thực chất đó là yêu cầu giao dịch.

Nói chung, một cuộc tấn công CSRF có thể xảy ra nếu website của bạn:

- Dùng yêu cầu HTTP để thay đổi một trạng thái nào đó trên máy chủ.
- Chỉ dùng cookie để xác thực rằng yêu cầu đến từ người dùng đã được xác thực.
- Chỉ dùng các tham số trong yêu cầu mà kẻ tấn công có thể đoán trước.

## Phòng vệ chống CSRF

Trong phần này chúng ta sẽ phác thảo ba biện pháp phòng vệ thay thế chống CSRF và một thực hành thứ tư có thể dùng để tạo phòng vệ nhiều lớp cho một trong ba biện pháp kia.

- Phòng vệ chính đầu tiên là [dùng _CSRF token_](#csrf_tokens) nhúng trong trang. Đây là phương pháp phổ biến nhất nếu bạn đang phát hành các yêu cầu thay đổi trạng thái từ phần tử form, như trong ví dụ ở trên.

- Phòng vệ thứ hai là [dùng các header HTTP _Fetch metadata_](#fetch_metadata) để kiểm tra xem yêu cầu thay đổi trạng thái có đang được phát hành cross-site hay không.

- Phòng vệ thứ ba là bảo đảm các yêu cầu thay đổi trạng thái [không phải là _simple requests_](#avoiding_simple_requests), để các yêu cầu cross-origin bị chặn theo mặc định. Phương pháp này phù hợp nếu bạn phát hành yêu cầu thay đổi trạng thái từ các API JavaScript như {{domxref("Window.fetch()", "fetch()")}}.

Cuối cùng, chúng ta sẽ thảo luận thuộc tính cookie [`SameSite`](#defense_in_depth_samesite_cookies), có thể được dùng để tạo phòng vệ nhiều lớp bên cạnh một trong hai phương pháp trên.

### CSRF token

Trong cách phòng vệ này, khi máy chủ phục vụ một trang, nó nhúng một giá trị không thể đoán trước vào trang, gọi là CSRF token. Khi trang hợp lệ gửi yêu cầu thay đổi trạng thái tới máy chủ, nó sẽ bao gồm CSRF token trong yêu cầu HTTP. Máy chủ sau đó có thể kiểm tra giá trị token và chỉ thực hiện yêu cầu nếu nó khớp. Vì kẻ tấn công không thể đoán giá trị token, họ không thể thực hiện một giả mạo thành công. Ngay cả khi kẻ tấn công phát hiện token sau khi nó đã được dùng, yêu cầu cũng không thể bị phát lại nếu token thay đổi mỗi lần.

Với việc gửi form, CSRF token thường được đưa vào một trường form ẩn, để khi form được gửi, token sẽ tự động được gửi lại máy chủ để kiểm tra.

Với API JavaScript như `fetch()`, token có thể được đặt trong cookie hoặc nhúng trong trang, và JavaScript trích giá trị đó ra rồi gửi nó như một header bổ sung.

Các web framework hiện đại thường có hỗ trợ tích hợp cho CSRF token: ví dụ, [Django](https://www.djangoproject.com/) cho phép bạn bảo vệ form bằng tag [`csrf_token`](https://docs.djangoproject.com/en/5.1/ref/csrf/). Điều này tạo ra một trường form ẩn bổ sung chứa token, sau đó framework sẽ kiểm tra nó ở phía máy chủ.

Để tận dụng biện pháp bảo vệ này, bạn phải hiểu mọi nơi trong website mà bạn đang dùng các yêu cầu HTTP thay đổi trạng thái, và bảo đảm bạn đang dùng biện pháp phòng vệ do framework bạn chọn cung cấp.

### Fetch metadata

Fetch metadata là một tập các header yêu cầu HTTP, do trình duyệt thêm vào, cung cấp thêm thông tin về ngữ cảnh của một yêu cầu HTTP. Máy chủ có thể dùng các header này để quyết định có cho phép yêu cầu hay không.

Liên quan nhất tới CSRF là header {{httpheader("Sec-Fetch-Site")}}, cho máy chủ biết yêu cầu này là same-origin, same-site, cross-site, hay được khởi tạo trực tiếp bởi người dùng. Máy chủ có thể dùng thông tin này để cho phép các yêu cầu cross-origin, hoặc chặn chúng như các cuộc tấn công CSRF tiềm năng.

Ví dụ, đoạn mã [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) sau chỉ cho phép các yêu cầu same-site và same-origin:

```js
app.post("/transfer", (req, res) => {
  const secFetchSite = req.headers["sec-fetch-site"];
  if (secFetchSite === "same-origin" || secFetchSite === "same-site") {
    console.log("allowed");
    // Cập nhật trạng thái
  } else {
    console.log("denied");
    // Không cập nhật trạng thái
  }
});
```

Xem {{glossary("Fetch metadata request header")}} để biết danh sách đầy đủ các header Fetch metadata, và [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) để có hướng dẫn dùng tính năng này.

### Tránh simple request

Trình duyệt web phân biệt hai loại yêu cầu HTTP: [_simple_ requests](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests) và các yêu cầu khác.

Simple request, vốn là loại yêu cầu phát sinh từ việc gửi phần tử `<form>`, có thể được gửi cross-origin mà không bị chặn. Vì các form đã có thể thực hiện yêu cầu cross-origin từ những ngày đầu của web, nên vì lý do tương thích, chúng vẫn phải có thể làm như vậy. Đây là lý do chúng ta cần triển khai các chiến lược khác để phòng vệ form khỏi CSRF, chẳng hạn dùng CSRF token.

Tuy nhiên, các phần khác của nền tảng web, đặc biệt là các API JavaScript như {{domxref("Window.fetch()", "fetch()")}}, có thể tạo ra các kiểu yêu cầu khác (ví dụ yêu cầu đặt header tùy chỉnh), và các yêu cầu này theo mặc định không được phép cross-origin, nên một cuộc tấn công CSRF sẽ không thành công.

Vì vậy, một website dùng `fetch()` hoặc `XMLHttpRequest` có thể phòng vệ chống CSRF bằng cách bảo đảm các yêu cầu thay đổi trạng thái mà nó phát ra không bao giờ là simple request.

Ví dụ, đặt {{httpheader("Content-Type")}} của yêu cầu thành `"application/json"` sẽ ngăn nó bị xem là simple request:

```js
fetch("https://my-bank.example.org/transfer", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({ recipient: "joe", amount: "100" }),
});
```

Tương tự, đặt một header tùy chỉnh trên yêu cầu sẽ ngăn nó bị xem là simple request:

```js
fetch("https://my-bank.example.org/transfer", {
  method: "POST",
  headers: {
    "X-MY-BANK-ANTI-CSRF": 1,
  },
  body: JSON.stringify({ recipient: "joe", amount: "100" }),
});
```

Tên header có thể là bất cứ gì, miễn là nó không xung đột với các header chuẩn.

Sau đó máy chủ có thể kiểm tra sự tồn tại của header: nếu nó tồn tại, máy chủ biết rằng yêu cầu không bị coi là simple request.

#### Non-simple request và CORS

Chúng ta đã nói rằng non-simple request theo mặc định không được gửi cross-origin. Vấn đề là giao thức [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS) cho phép một website nới lỏng hạn chế này.

Cụ thể, website của bạn sẽ dễ bị tấn công CSRF từ một origin cụ thể nếu phản hồi của nó cho một yêu cầu thay đổi trạng thái bao gồm:

- Header phản hồi {{httpheader("Access-Control-Allow-Origin")}}, và header này liệt kê origin của bên gửi
- Header phản hồi {{httpheader("Access-Control-Allow-Credentials")}}.

### Phòng vệ nhiều lớp: cookie SameSite

Thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) cung cấp một số bảo vệ chống các cuộc tấn công CSRF. Nó không phải là phòng vệ hoàn chỉnh, và tốt nhất nên được xem là bổ sung cho một trong các phòng vệ khác, tạo ra một mức phòng vệ nhiều lớp.

Thuộc tính này kiểm soát khi nào trình duyệt được phép đưa cookie vào một yêu cầu cross-site. Nó có ba giá trị có thể: `None`, `Lax`, và `Strict`.

Giá trị `Strict` mang lại bảo vệ mạnh nhất: nếu thuộc tính này được đặt, trình duyệt sẽ không đưa cookie vào bất kỳ yêu cầu cross-site nào. Tuy nhiên, điều này tạo ra vấn đề về khả dụng: nếu người dùng đã đăng nhập vào site của bạn, và họ đi theo một liên kết tới site của bạn từ một site khác, thì cookie của bạn sẽ không được gửi kèm, và người dùng sẽ không được nhận ra khi họ tới site của bạn.

Giá trị `Lax` nới lỏng hạn chế này: cookie được đưa vào các yêu cầu cross-site nếu đồng thời thỏa cả hai điều kiện sau:

- Yêu cầu là một điều hướng của ngữ cảnh duyệt cấp cao nhất.
- Yêu cầu dùng một phương thức {{glossary("Safe/HTTP", "an toàn")}}: đáng chú ý là {{httpmethod("GET")}} là an toàn còn {{httpmethod("POST")}} thì không.

Tuy nhiên, `Lax` bảo vệ yếu hơn đáng kể so với `Strict`:

- Kẻ tấn công có thể kích hoạt một điều hướng cấp cao nhất. Ví dụ, ở đầu bài viết này chúng ta đã cho thấy một cuộc tấn công CSRF trong đó kẻ tấn công gửi form tới mục tiêu: điều này được xem là một điều hướng cấp cao nhất. Nếu form được gửi bằng `GET`, thì yêu cầu vẫn sẽ bao gồm cookie với `SameSite=Lax`.
- Ngay cả khi máy chủ có kiểm tra rằng yêu cầu không được gửi bằng `GET`, một số web framework hỗ trợ "method override": điều này cho phép kẻ tấn công gửi một yêu cầu bằng `GET` nhưng khiến máy chủ nhìn nó như thể nó dùng `POST`.

Nhìn chung, bạn nên cố dùng `Strict` cho một số cookie và `Lax` cho những cookie khác:

- `Lax` cho cookie bạn dùng để quyết định xem người dùng đã đăng nhập có nên được hiển thị một trang hay không
- `Strict` cho cookie bạn dùng cho các yêu cầu thay đổi trạng thái mà bạn không muốn cho phép cross-site.

Một vấn đề khác của thuộc tính `SameSite` là nó bảo vệ bạn khỏi các yêu cầu từ một {{glossary("Site", "site")}} khác, chứ không phải từ một {{glossary("Origin", "origin")}} khác. Đây là một mức bảo vệ lỏng hơn, vì (ví dụ) `https://foo.example.org` và `https://bar.example.org` được xem là cùng site, dù chúng là hai origin khác nhau. Trên thực tế, nếu bạn dựa vào bảo vệ same-site, bạn phải tin tưởng tất cả subdomain của site mình.

Xem [Bypassing SameSite cookie restrictions](https://portswigger.net/web-security/csrf/bypassing-samesite-restrictions) để biết thêm chi tiết về các giới hạn của `SameSite`.

## Danh sách kiểm tra tóm tắt phòng vệ

- Hiểu nơi trong website của bạn mà bạn đang triển khai các yêu cầu thay đổi trạng thái dùng session cookie để kiểm tra người dùng nào đã gửi yêu cầu.
- Triển khai ít nhất một trong các phòng vệ chính được mô tả trong tài liệu này:
  - Nếu bạn dùng phần tử `<form>` để phát hành các yêu cầu này, hãy bảo đảm bạn đang dùng một web framework hỗ trợ CSRF token, và dùng nó.
  - Nếu bạn dùng API JavaScript như `fetch()` hoặc `XMLHttpRequest` để phát hành các yêu cầu thay đổi trạng thái, hãy bảo đảm chúng không phải là simple request.
  - Dù bạn dùng cơ chế nào để phát hành yêu cầu, hãy cân nhắc dùng Fetch metadata để chặn các yêu cầu cross-site.
- Tránh dùng phương thức `GET` để phát hành các yêu cầu thay đổi trạng thái.
- Đặt thuộc tính `SameSite` cho session cookie thành `Strict` nếu có thể, hoặc `Lax` nếu bắt buộc phải dùng.

## Xem thêm

- [Cross-Site Request Forgery Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html) tại [owasp.org](https://owasp.org/)
