---
title: Clickjacking
slug: Web/Security/Attacks/Clickjacking
page-type: guide
sidebar: security
---

Trong một cuộc tấn công **clickjacking**, kẻ tấn công lừa người dùng tương tác với một site mục tiêu theo cách mà họ không hề chủ định.

Để làm điều này, kẻ tấn công tạo một site mồi nhử nhúng site mục tiêu của người dùng bên trong một phần tử {{htmlelement("iframe")}}. Site của kẻ tấn công ẩn `<iframe>`, và căn một số phần tử mồi nhử sao cho chúng xuất hiện đúng vị trí với các phần tử trên site mục tiêu kích hoạt hành động nhạy cảm. Khi người dùng cố tương tác với các phần tử mồi nhử này, thay vào đó họ vô tình tương tác với site mục tiêu, và có thể bị lừa thực hiện các hành động mà họ không hề muốn.

## Một ví dụ clickjacking

Giả sử website ngân hàng của người dùng là `https://my-bank.example.com`. Người dùng thường xuyên vẫn đang đăng nhập vào site này. Để đơn giản, ta nói rằng site có một trang với nút chuyển toàn bộ tiền của người dùng cho kẻ tấn công - mặc dù rõ ràng đây là ví dụ phi thực tế, nhưng hoàn toàn có thể hình dung site sẽ có một số phần tử tương tác thực hiện thao tác nhạy cảm nào đó.

![Ảnh chụp website của một ngân hàng, hiển thị nút "Transfer all my money?".](my-bank.png)

Kẻ tấn công tạo một trang web chứa:

- một phần tử {{htmlelement("button")}} có nội dung khuyến khích người dùng nhấp vào
- một phần tử {{htmlelement("iframe")}} nhúng trang của ngân hàng.

```html
<button id="fake-button">Nhấn vào đây để nhận mèo con miễn phí!</button>
<iframe width="800" height="200" src="https://my-bank.example.com"></iframe>
```

Trong CSS của trang, kẻ tấn công:

- ẩn `<iframe>`, ví dụ bằng cách đặt {{cssxref("opacity")}} của nó về 0
- đặt nút ở vị trí giống hệt nút "Transfer all your money?"

```css
iframe {
  opacity: 0;
}

#fake-button {
  position: absolute;
  top: 185px;
  left: 90px;
}
```

Kết quả trông như sau (chúng tôi đặt độ mờ của `<iframe>` là `0.1`, để bạn có thể thấy lớp phủ):

![Ảnh chụp một website clickjacking, hiển thị site ngân hàng được nhúng.](attacker.png)

Nếu người dùng cố nhấp vào "Click here for a free kitten!", họ thực ra sẽ nhấp vào nút vô hình "Transfer all your money?" trên website của ngân hàng. Nếu người dùng đã đăng nhập, yêu cầu mà hành động này gửi tới máy chủ ngân hàng sẽ bao gồm thông tin xác thực thật của người dùng, và yêu cầu sẽ thành công.

## Biện pháp phòng vệ chống clickjacking

### Hạn chế việc nhúng

Clickjacking phụ thuộc vào việc site mục tiêu được nhúng vào site mồi nhử của kẻ tấn công bên trong một `<iframe>`. Biện pháp phòng vệ chính là không cho phép hoặc ít nhất là hạn chế khả năng này.

Có hai công cụ liên quan ở đây:

- Chỉ thị [`frame-ancestors`](/en-US/docs/Web/HTTP/Guides/CSP#clickjacking_protection) trong một [content security policy](/en-US/docs/Web/HTTP/Guides/CSP). Với chỉ thị này, bạn có thể kiểm soát chính xác những tài liệu nào được phép nhúng tài liệu của bạn.
- Header phản hồi {{httpheader("X-Frame-Options")}}. Header này ít chi tiết hơn: nó chỉ cho phép bạn vô hiệu hóa việc nhúng hoàn toàn, hoặc chỉ cho phép nhúng từ tài liệu [same-origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

Chỉ thị `frame-ancestors` là sự thay thế cho `X-Frame-Options`. Bằng cách đặt cả `X-Frame-Options` lẫn `frame-ancestors`, bạn có thể ngăn việc nhúng trên các trình duyệt không hỗ trợ `frame-ancestors`. Vì [hỗ trợ trình duyệt cho `frame-ancestors` rất tốt](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors#browser_compatibility), điều này không phải là mối lo lớn.

Nếu cả `frame-ancestors` và `X-Frame-Options` đều được đặt, thì các trình duyệt hỗ trợ `frame-ancestors` sẽ bỏ qua `X-Frame-Options`.

### Hạn chế cookie giữa các site

Như một biện pháp giảm thiểu bổ sung, các site nên đặt thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) cho session cookie thành `Lax` hoặc `Strict`. Các yêu cầu từ ngữ cảnh nhúng như phần tử `<iframe>` mà không {{glossary("Site", "same-site")}} với tài liệu cấp cao nhất sẽ không bao gồm các cookie này, và vì thế máy chủ sẽ không coi yêu cầu là đến từ người dùng đã đăng nhập.

## Danh sách kiểm tra tóm tắt phòng vệ

- Đặt chỉ thị CSP [`frame-ancestors`](/en-US/docs/Web/HTTP/Guides/CSP#clickjacking_protection) và header phản hồi HTTP {{httpheader("X-Frame-Options")}}, để ngăn site khác nhúng site của bạn như một `<iframe>`, hoặc kiểm soát chặt chẽ site nào có thể nhúng nó.

- Đặt thuộc tính cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) cho session cookie thành `Lax` hoặc `Strict`.

## Xem thêm

- [Clickjacking Defense Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Clickjacking_Defense_Cheat_Sheet.html) tại [owasp.org](https://owasp.org/)
