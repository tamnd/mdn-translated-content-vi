---
title: "resource: URLs"
short-title: "resource:"
slug: Web/URI/Reference/Schemes/resource
page-type: uri-scheme
sidebar: urlsidebar
---

{{non-standard_header}}

Resource URL, tức các URL có tiền tố bằng scheme `resource:`, được Firefox và các tiện ích mở rộng trình duyệt Firefox dùng để tải tài nguyên nội bộ, nhưng một phần thông tin cũng có thể được các site mà trình duyệt kết nối tới nhìn thấy.

## Cú pháp

```url
resource://<path>
```

- `resource:`
  - : Scheme của URL.
- `<path>`
  - : Một đường dẫn trỏ tới tài nguyên bạn muốn tải.

Một ví dụ:

```url
resource://gre/res/svg.css
```

Khi các mũi tên xuất hiện trong URL resource (`->`), điều đó có nghĩa là tệp đầu tiên đã tải tệp tiếp theo:

```url
resource://<File-loader> -> <File-loaded>
```

Vui lòng tham khảo [tham chiếu URI](/en-US/docs/Web/URI) để biết thêm chi tiết chung.

Trong bài viết này, chúng ta tập trung vào Resource URL, vốn được Firefox dùng nội bộ để trỏ tới các tài nguyên tích hợp sẵn.

## Các mối đe dọa

Vì một phần thông tin được chia sẻ bởi các URL `resource:` có thể được các website truy cập, một trang web có thể chạy các script nội bộ và kiểm tra các tài nguyên nội bộ của Firefox, bao gồm cả các thiết lập mặc định, điều này có thể là một vấn đề nghiêm trọng về bảo mật và quyền riêng tư.

Ví dụ, [một script trên Browserleaks](https://browserleaks.com/resource-urls) làm nổi bật những gì Firefox tiết lộ khi được truy vấn bởi một script đang chạy trên site (bạn có thể tìm mã ở <https://browserleaks.com/resource-urls#more>).

Tệp firefox.js truyền tên và giá trị preference vào hàm pref(). Ví dụ:

```url
http://searchfox.org/mozilla-central/rev/48ea452803907f2575d81021e8678634e8067fc2/browser/app/profile/firefox.js#575
```

Các website có thể dễ dàng thu thập các preference mặc định của Firefox bằng cách ghi đè hàm `pref()` này và dùng script `resource:///defaults/preferences/firefox.js`.

Hơn nữa, một số giá trị mặc định của preference khác nhau giữa các cấu hình build, chẳng hạn như nền tảng và locale, điều đó có nghĩa là các website có thể nhận diện từng người dùng riêng lẻ bằng thông tin này.

## Giải pháp

Để sửa vấn đề này, Mozilla đã thay đổi hành vi tải các URL `resource:` trong [Firefox bug 863246](https://bugzil.la/863246), đã được đưa vào [Firefox 57 (Quantum)](/en-US/docs/Mozilla/Firefox/Releases/57).

Trước đây, nội dung web có thể truy cập bất kỳ URL `resource:` nào mong muốn - không chỉ các tài nguyên nội bộ của Firefox, mà còn cả tài sản của tiện ích mở rộng. Hiện nay hành vi này bị cấm theo mặc định.

Tuy nhiên, Firefox vẫn cần tải tài nguyên trong nội dung web trong một số trường hợp nhất định. Ví dụ, nếu bạn mở trang view source (View Page Source hoặc View Selection Source), bạn sẽ thấy nó cần `viewsource.css` thông qua một URL `resource:`. Các tài nguyên bắt buộc phải được phơi bày cho nội dung web đã được chuyển sang một vị trí mới có tên `resource://content-accessible/`, vốn được cô lập và chỉ chứa các tài nguyên không nhạy cảm. Bằng cách này, chúng ta có thể giữ cho các tài nguyên thiết yếu vẫn được phơi bày và loại bỏ phần lớn các mối đe dọa.

> [!NOTE]
> Khuyến nghị rằng các nhà phát triển web và tiện ích mở rộng không nên cố dùng resource URL nữa. Việc dùng chúng vốn đã là một cách làm tạm bợ, và phần lớn cách dùng sẽ không còn hoạt động nữa.

## Đặc tả

resource: không được định nghĩa trong bất kỳ đặc tả nào.

## Tương thích trình duyệt

resource: chỉ có trên Firefox.

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
- [Danh sách IANA các URI scheme](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml) (`resource:` được [liệt kê ở đây](https://www.iana.org/assignments/uri-schemes/prov/resource))
