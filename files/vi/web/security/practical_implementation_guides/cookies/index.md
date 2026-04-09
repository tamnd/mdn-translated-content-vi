---
title: Cấu hình cookie an toàn
slug: Web/Security/Practical_implementation_guides/Cookies
page-type: guide
sidebar: security
---

Hạn chế quyền truy cập vào cookie càng nhiều càng tốt.

## Vấn đề

Cookie thường chứa mã định danh phiên hoặc thông tin nhạy cảm khác. Vì vậy, việc truy cập trái phép vào cookie có thể gây ra hàng loạt vấn đề, bao gồm các vấn đề về [quyền riêng tư](/en-US/docs/Web/Privacy), tấn công [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking), tấn công [cross-site request forgery (CSRF)](/en-US/docs/Web/Security/Attacks/CSRF), và nhiều hơn nữa.

## Giải pháp

Để giảm thiểu phạm vi của các lỗ hổng cookie trên site của bạn, hãy hạn chế quyền truy cập vào cookie càng nhiều càng tốt bằng cách bao gồm các thuộc tính cookie sau khi gửi header phản hồi [`Set-Cookie`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie):

- `Name`
  - : Thêm tiền tố `__Secure-` hoặc `__Host-` vào tên cookie để ngăn cookie bị ghi đè bởi các nguồn không an toàn.
    - Dùng `__Host-` cho mọi cookie chỉ cần dùng trên một domain cụ thể (không có subdomain) và `Path` được đặt là `/`.
    - Dùng `__Secure-` cho tất cả các cookie khác.
- `Secure`
  - : Luôn đặt thuộc tính `Secure`, cho biết cookie chỉ nên được gửi qua HTTPS.
- `HttpOnly`
  - : Đặt thuộc tính `HttpOnly` cho mọi cookie không cần truy cập từ JavaScript (ví dụ, qua {{domxref("Document.cookie")}}).

    Đặc biệt, các cookie chứa mã định danh phiên không nên cho JavaScript truy cập, để giúp ngăn một cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) đánh cắp mã định danh phiên.

- `Expires` và `Max-Age`
  - : Cookie nên hết hạn ngay khi không còn cần nữa. Đặc biệt, mã định danh phiên nên hết hạn nhanh nhất có thể.
    - `Expires`: Đặt một ngày hết hạn tuyệt đối cho cookie được chỉ định.
    - `Max-Age`: Đặt một ngày hết hạn tương đối cho cookie được chỉ định.

      > [!NOTE]
      > `Expires` đã có sớm hơn `Max-Age`; tuy nhiên, `Max-Age` ít dễ gây lỗi hơn, và sẽ được ưu tiên khi cả hai đều được đặt. Lý do là khi bạn đặt ngày giờ `Expires`, chúng tương đối với máy khách đang thiết lập cookie. Nếu máy chủ được đặt ở thời gian khác, điều này có thể gây lỗi.

      Nếu không đặt `Expires` lẫn `Max-Age`, cookie sẽ được giữ cho đến khi người dùng đóng trình duyệt, rồi sau đó sẽ bị loại bỏ.

- `Domain`
  - : Chỉ đặt thuộc tính `Domain` nếu cookie cần có thể truy cập trên các domain khác, và trong trường hợp đó hãy đặt nó thành domain hạn chế nhất có thể.
- `Path`
  - : Đặt `Path` hạn chế nhất có thể.
- `SameSite`
  - : Đặt thuộc tính [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) thành `Strict` hoặc `Lax`, để hạn chế việc truyền cookie trong các yêu cầu bắt nguồn từ một {{glossary("site")}} khác.

    Đây là một biện pháp phòng thủ một phần trước các cuộc tấn công [CSRF](/en-US/docs/Web/Security/Attacks/CSRF#defense_in_depth_samesite_cookies), [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking#clickjacking_defenses), và một số cuộc tấn công [rò rỉ cross-site](/en-US/docs/Web/Security/Attacks/XS-Leaks#samesite_cookies).

## Ví dụ

Thiết lập một cookie mã định danh phiên chỉ có thể truy cập trên host hiện tại và hết hạn khi người dùng đóng trình duyệt:

```http
Set-Cookie: MOZSESSIONID=980e5da39d4b472b9f504cac9; Path=/; Secure; HttpOnly
```

Dùng tiền tố `__Secure-` để thiết lập một mã định danh phiên cho tất cả site `example.org`, hết hạn sau 30 ngày. Cookie này không được bao gồm trong hầu hết các yêu cầu cross-site, nhưng được bao gồm trong các điều hướng tới site của bạn từ một site khác, chẳng hạn bằng cách nhấp vào một liên kết:

```http
Set-Cookie: __Secure-MOZSESSIONID=7307d70a86bd4ab5a00499762; Max-Age=2592000; Domain=example.org; Path=/; Secure; HttpOnly; SameSite=Lax
```

Thiết lập một cookie dài hạn cho host hiện tại, có thể được JavaScript truy cập, khi người dùng chấp nhận điều khoản dịch vụ. Cookie này không được bao gồm trong hầu hết các yêu cầu cross-site, nhưng được bao gồm trong các điều hướng tới site của bạn từ một site khác, chẳng hạn bằng cách nhấp vào một liên kết:

```http
Set-Cookie: __Host-ACCEPTEDTOS=true; Expires=Fri, 31 Dec 9999 23:59:59 GMT; Path=/; Secure; SameSite=Lax
```

Thiết lập một cookie chứa mã định danh phiên. Cookie này không được gửi trong bất kỳ yêu cầu cross-site nào, kể cả các điều hướng tới site của bạn từ một site khác:

```http
Set-Cookie: __Host-BMOSESSIONID=YnVnemlsbGE=; Max-Age=2592000; Path=/; Secure; HttpOnly; SameSite=Strict
```

## Xem thêm

- [Sử dụng HTTP cookies](/en-US/docs/Web/HTTP/Guides/Cookies)
- [Third-party cookies](/en-US/docs/Web/Privacy/Guides/Third-party_cookies)
- [`Document.cookie`: Security](/en-US/docs/Web/API/Document/cookie#security)
- [RFC 6265 (HTTP Cookies)](https://datatracker.ietf.org/doc/html/rfc6265) (2011)
