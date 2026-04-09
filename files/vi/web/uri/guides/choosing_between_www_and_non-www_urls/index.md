---
title: Chọn giữa URL có www và không có www
short-title: Sử dụng 'www' trong URL
slug: Web/URI/Guides/Choosing_between_www_and_non-www_URLs
page-type: guide
sidebar: urlsidebar
---

Một câu hỏi lặp đi lặp lại giữa các chủ sở hữu trang web là nên chọn URL có 'www' (`www.example.com`) hay không có 'www' (`example.com`). Trang này cung cấp một số lời khuyên về lựa chọn nào là tốt nhất.

## Tên miền là gì?

Trong một URL HTTP, chuỗi con đầu tiên theo sau `http://` hoặc `https://` ban đầu được gọi là tên miền. Tên miền này được lưu trữ trên một máy chủ nơi tài liệu nằm.

Một máy chủ không nhất thiết là một máy vật lý: nhiều máy chủ có thể nằm trên cùng một máy vật lý. Hoặc, một máy chủ có thể được xử lý bởi nhiều máy, phối hợp để tạo ra phản hồi hoặc cân bằng tải các yêu cầu giữa chúng. Điểm mấu chốt là về mặt ngữ nghĩa _một tên miền đại diện cho một máy chủ duy nhất_.

## Vậy tôi có phải chọn một trong hai cho trang web của mình không?

- **Có**, bạn cần chọn một và giữ nguyên nó. Việc chọn cái nào làm vị trí canonical là tùy bạn, nhưng nếu đã chọn một, hãy giữ nguyên nó. Điều này sẽ làm cho trang web của bạn trông nhất quán hơn đối với người dùng và công cụ tìm kiếm. Điều đó bao gồm luôn liên kết đến miền đã chọn (điều này không khó nếu bạn dùng URL tương đối trong trang web của mình) và luôn chia sẻ liên kết (qua email/mạng xã hội, v.v.) tới cùng một miền.
- **Không**, bạn có thể có hai. Điều quan trọng là bạn phải nhất quán và đồng bộ với miền nào là miền chính thức. **Miền chính thức này được gọi là tên _canonical_.** Tất cả các liên kết tuyệt đối của bạn nên dùng nó. Nhưng ngay cả như vậy, bạn vẫn có thể để miền còn lại hoạt động: HTTP cho phép hai kỹ thuật để làm rõ cho người dùng hoặc công cụ tìm kiếm miền nào là miền canonical, đồng thời vẫn cho phép miền không canonical hoạt động và cung cấp các trang mong đợi.

Vì vậy, hãy chọn một trong các miền của bạn làm miền canonical! Có hai kỹ thuật bên dưới để cho phép miền không canonical vẫn hoạt động.

## Các kỹ thuật cho URL canonical

Có nhiều cách khác nhau để chọn website nào là _canonical_.

### Dùng chuyển hướng HTTP 301

Trong trường hợp này, bạn cần cấu hình máy chủ nhận các yêu cầu HTTP (nhiều khả năng là cùng một máy chủ cho cả URL có 'www' và không có 'www') để phản hồi bằng một mã phản hồi HTTP {{HTTPStatus(301)}} thích hợp cho mọi yêu cầu đến miền không canonical. Điều này sẽ chuyển hướng trình duyệt đang cố truy cập các URL không canonical sang URL canonical tương ứng của chúng. Ví dụ, nếu bạn chọn dùng URL không có 'www' làm kiểu canonical, bạn nên chuyển hướng tất cả URL có 'www' sang URL tương đương không có 'www'.

Ví dụ:

1. Một máy chủ nhận yêu cầu cho `http://www.example.org/whaddup` (khi miền canonical là example.org).
2. Máy chủ trả lời bằng mã {{HTTPStatus(301)}} với tiêu đề {{HTTPHeader("Location")}} `Location: http://example.org/whaddup`.
3. Client gửi yêu cầu tới vị trí dưới miền canonical: `http://example.org/whaddup`.

Dự án [HTML5 boilerplate](https://github.com/h5bp/html5-boilerplate) có một ví dụ về [cách cấu hình máy chủ Apache để chuyển hướng miền này sang miền kia](https://github.com/h5bp/html5-boilerplate/blob/7a22a33d4041c479d0962499e853501073811887/.htaccess#L219-L258).

### Dùng `<link rel="canonical">`

Có thể thêm một phần tử HTML {{HTMLElement("link")}} đặc biệt vào trang để cho biết địa chỉ canonical của trang là gì. Điều này không ảnh hưởng đến người đọc trang, nhưng cho trình thu thập của công cụ tìm kiếm biết trang thực sự nằm ở đâu. Bằng cách này, công cụ tìm kiếm sẽ không lập chỉ mục cùng một trang nhiều lần, tránh việc nó bị xem là nội dung trùng lặp hoặc spam, và thậm chí loại bỏ hoặc hạ thấp trang của bạn khỏi trang kết quả tìm kiếm.

Khi thêm thẻ như vậy, bạn phục vụ cùng nội dung cho cả hai miền, đồng thời cho công cụ tìm kiếm biết URL nào là canonical. Trong ví dụ trước, `http://www.example.org/whaddup` sẽ phục vụ cùng nội dung như `http://example.org/whaddup`, nhưng có thêm một phần tử {{htmlelement("link")}} trong phần head:

```html
<link href="http://example.org/whaddup" rel="canonical" />
```

Khác với trường hợp trước, lịch sử trình duyệt sẽ xem URL có www và không có www là các mục nhập độc lập.

## Làm cho trang của bạn hoạt động với cả hai

Với các kỹ thuật này, bạn có thể cấu hình máy chủ của mình để phản hồi đúng cho cả miền có tiền tố www và miền không có tiền tố www. Đây là lời khuyên tốt vì bạn không thể đoán trước URL nào người dùng sẽ gõ vào thanh địa chỉ của trình duyệt. Vấn đề là chọn kiểu nào bạn muốn dùng làm vị trí canonical, rồi chuyển hướng kiểu còn lại về nó.

## Quyết định lựa chọn

Đây là một chủ đề rất mang tính chủ quan — nó có thể bị xem là vấn đề [bikeshedding](https://bikeshed.com/). Nếu bạn muốn đọc sâu hơn, dưới đây là một số tài nguyên:

- [Options for bare domains](https://www.netlify.com/blog/2020/03/26/how-to-set-up-netlify-dns-custom-domains-cname-and-a-records/#options-for-bare-domains) trên netlify.com (2020)
- [WWW vs non-WWW – Which Is Better for WordPress SEO?](https://www.wpbeginner.com/beginners-guide/www-vs-non-www-which-is-better-for-wordpress-seo/) trên wpbeginner.com (2023)

## Xem thêm

- [Stats on what people type in the URL bar](https://www.chrisfinke.com/2011/07/25/what-do-people-type-in-the-address-bar/) (2011)
