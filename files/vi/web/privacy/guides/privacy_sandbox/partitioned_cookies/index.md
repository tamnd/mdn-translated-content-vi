---
title: Cookie có trạng thái phân vùng độc lập (CHIPS)
short-title: CHIPS
slug: Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies
page-type: guide
browser-compat: http.headers.Set-Cookie.Partitioned
sidebar: privacy
---

**Cookies Having Independent Partitioned State** (**CHIPS**, còn được gọi là **partitioned cookies**) cho phép nhà phát triển đưa cookie vào bộ nhớ được phân vùng, với một cookie jar riêng cho mỗi site cấp cao nhất.

Nếu không phân vùng cookie, cookie bên thứ ba có thể cho phép các dịch vụ theo dõi người dùng và liên kết thông tin của họ trên những site cấp cao nhất không liên quan. Cookie được gắn nhãn `Partitioned` là double-keyed: theo origin thiết lập chúng _và_ origin của trang cấp cao nhất.

Điều này có nghĩa là chúng chỉ có thể được đọc trong ngữ cảnh của site cấp cao nhất mà chúng được thiết lập trên đó. Điều này cho phép chặn theo dõi giữa các site, đồng thời vẫn hỗ trợ các công dụng hợp lệ của cookie bên thứ ba như duy trì trạng thái của bản đồ nhúng hoặc widget chat trên một domain và các subdomain của nó, và duy trì thông tin cấu hình cho cân bằng tải CDN của tài nguyên con và các nhà cung cấp Headless CMS.

## CHIPS hoạt động như thế nào?

Để hiểu CHIPS hoạt động ra sao, hãy xem một ví dụ ngắn. Trước đây, khi một site nhúng nội dung qua một {{htmlelement("iframe")}}, nội dung được nhúng có thể đặt cookie trên thiết bị của người dùng để đáp lại yêu cầu giữa các site. Nếu người dùng truy cập những site khác cũng nhúng cùng nội dung đó, nội dung được nhúng có thể truy cập cookie giống hệt đã được thiết lập bởi phiên bản nhúng đầu tiên. Điều này cho phép chủ sở hữu nội dung theo dõi hoạt động của người dùng trên các site này, cũng như bất kỳ site nào khác nhúng cùng nội dung.

Ví dụ:

1. Một người dùng truy cập `https://site-a.example`, site này nhúng nội dung từ `https://3rd-party.example`. `https://3rd-party.example` thiết lập một cookie trên thiết bị của người dùng.
2. Người dùng truy cập `https://site-b.example`, site này cũng nhúng `https://3rd-party.example`. Phiên bản mới này của `https://3rd-party.example` vẫn có thể truy cập cookie đã được thiết lập khi người dùng ở trang trước.

Điều này hoạt động được vì trước đây cookie được lưu cùng một khóa dựa trên host hoặc tên miền của site đã thiết lập chúng, còn gọi là **host key**. Trong trường hợp trên, cookie sẽ được lưu với khóa `("3rd-party.example")`.

Các trình duyệt hỗ trợ CHIPS cung cấp một thuộc tính mới cho HTTP header {{httpheader("Set-Cookie")}} - `Partitioned` - khi được đặt sẽ cho phép chủ site chọn dùng CHIPS:

```http
Set-Cookie: __Host-example=34d8g; SameSite=None; Secure; Path=/; Partitioned;
```

> [!NOTE]
> Cookie phân vùng phải được đặt với `Secure`. Ngoài ra, bạn có thể dùng tiền tố `__Host` khi đặt cookie phân vùng để ràng buộc chúng chỉ với domain hoặc subdomain hiện tại, và điều này được khuyến nghị nếu bạn không cần chia sẻ cookie giữa các subdomain.

Khi `Partitioned` được đặt, cookie bên thứ ba được lưu bằng hai khóa: host key và một **partition key** mới. Partition key dựa trên {{glossary("site")}}, bao gồm cả scheme, của URL cấp cao nhất mà trình duyệt đang truy cập khi yêu cầu được gửi đến endpoint URL đã thiết lập cookie.

Xét lại ví dụ của chúng ta:

1. Một người dùng truy cập `https://site-a.example`, site này nhúng nội dung từ `https://3rd-party.example`. `https://3rd-party.example` thiết lập một cookie trên thiết bị của người dùng bằng `Partitioned`, nghĩa là chủ site đã chọn dùng CHIPS.
2. Khóa lưu trữ của cookie lúc này sẽ là `{("https://site-a.example"), ("3rd-party.example")}`.
3. Khi người dùng truy cập `https://site-b.example`, site này cũng nhúng `https://3rd-party.example`, phiên bản nhúng mới này không còn có thể truy cập cookie vì partition key không khớp.

> [!NOTE]
> CHIPS tương tự với [state partitioning mechanism](/en-US/docs/Web/Privacy/Guides/State_Partitioning) được Firefox triển khai. Tuy nhiên, state partitioning phân vùng bộ nhớ cookie theo mặc định cho ngữ cảnh bên thứ ba, trong khi CHIPS cho phép chọn dùng cookie phân vùng cho cả ngữ cảnh bên thứ nhất lẫn bên thứ ba. Bạn nên dùng cơ chế opt-in của CHIPS thay vì state partitioning để có cookie phân vùng tương thích nhất.

## CHIPS và subdomain

CHIPS vẫn cho phép nội dung bên thứ ba được nhúng trên các subdomain khác nhau của một site truy cập các cookie bên thứ ba do nội dung đó đặt. Hãy xem một ví dụ về site bán lẻ dùng dịch vụ chat bên thứ ba:

1. Một người dùng truy cập `https://shoppy.example`, site này nhúng một dịch vụ chat bên thứ ba từ `https://3rd-party.example/chat` để hỗ trợ người dùng cần trợ giúp. `https://3rd-party.example/chat` thiết lập một cookie trên thiết bị của người dùng bằng `Partitioned`, để duy trì trạng thái của cuộc trò chuyện trên các subdomain khác nhau của site.
2. Khóa lưu trữ của cookie sẽ là `{("https://shoppy.example"), ("3rd-party.example/chat")}`.
3. Người dùng truy cập nhiều subdomain cũng nhúng `https://3rd-party.example/chat`, bao gồm `https://support.shoppy.example` và `https://checkout.shoppy.example`. Các phiên bản nhúng mới có thể truy cập cookie vì partition key vẫn khớp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cookies Having Independent Partitioned State (CHIPS)](https://privacysandbox.google.com/cookies/chips) trên privacysandbox.google.com
- [CHIPS Explainer](https://github.com/privacycg/CHIPS)
