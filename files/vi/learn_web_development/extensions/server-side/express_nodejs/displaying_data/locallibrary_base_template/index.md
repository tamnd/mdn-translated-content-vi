---
title: Mẫu cơ sở LocalLibrary
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/LocalLibrary_base_template
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bây giờ chúng ta đã hiểu cách mở rộng template bằng Pug, hãy bắt đầu bằng cách tạo một mẫu cơ sở cho dự án. Mẫu này sẽ có thanh bên với các liên kết đến các trang mà chúng ta hy vọng tạo trong các bài viết hướng dẫn (ví dụ: để hiển thị và tạo sách, thể loại, tác giả, v.v.) và một khu vực nội dung chính mà chúng ta sẽ ghi đè trong từng trang riêng lẻ.

Mở tệp **/views/layout.pug** và thay thế nội dung bằng đoạn mã dưới đây.

```pug
doctype html
html(lang='en')
  head
    title= title
    meta(charset='utf-8')
    meta(name='viewport', content='width=device-width, initial-scale=1')
    link(rel="stylesheet", href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css", integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr", crossorigin="anonymous")
    script(src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js", integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q", crossorigin="anonymous")
    link(rel='stylesheet', href='/stylesheets/style.css')
  body
    div(class='container-fluid')
      div(class='row')
        div(class='col-sm-2')
          block sidebar
            ul(class='sidebar-nav')
              li
                a(href='/catalog') Home
              li
                a(href='/catalog/books') All books
              li
                a(href='/catalog/authors') All authors
              li
                a(href='/catalog/genres') All genres
              li
                a(href='/catalog/bookinstances') All book-instances
              li
                hr
              li
                a(href='/catalog/author/create') Create new author
              li
                a(href='/catalog/genre/create') Create new genre
              li
                a(href='/catalog/book/create') Create new book
              li
                a(href='/catalog/bookinstance/create') Create new book instance (copy)

        div(class='col-sm-10')
          block content
```

Template này sử dụng (và bao gồm) JavaScript và CSS từ [Bootstrap](https://getbootstrap.com/) để cải thiện bố cục và trình bày của trang HTML. Sử dụng Bootstrap hoặc một framework web phía máy khách khác là cách nhanh chóng để tạo ra một trang hấp dẫn có thể co giãn tốt trên các kích thước trình duyệt khác nhau, và nó cũng cho phép chúng ta xử lý trình bày trang mà không cần đi vào bất kỳ chi tiết nào — chúng ta chỉ muốn tập trung vào mã phía máy chủ ở đây!

> [!NOTE]
> Các script được tải từ nguồn chéo, vì vậy sau này trong hướng dẫn, khi chúng ta thêm middleware bảo mật, chúng ta sẽ cần cho phép rõ ràng các tệp này được tải.
> Để biết thêm thông tin, xem [Triển khai > Sử dụng Helmet để bảo vệ chống lại các lỗ hổng đã biết](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment#use_helmet_to_protect_against_well_known_vulnerabilities).

Bố cục nên khá rõ ràng nếu bạn đã đọc phần [Giới thiệu về template](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Template_primer) ở trên. Lưu ý việc sử dụng `block content` như một placeholder cho nơi nội dung của các trang riêng lẻ sẽ được đặt.

Mẫu cơ sở cũng tham chiếu đến một tệp CSS cục bộ (**style.css**) cung cấp một số kiểu bổ sung. Mở tệp **/public/stylesheets/style.css** và thay thế nội dung của nó bằng đoạn mã CSS sau:

```css
.sidebar-nav {
  margin-top: 20px;
  padding: 0;
  list-style: none;
}
```

Bây giờ chúng ta có một mẫu cơ sở để tạo các trang với thanh bên. Trong các phần tiếp theo, chúng ta sẽ sử dụng nó để định nghĩa các trang riêng lẻ.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiếp tục đến bài viết con tiếp theo của phần 5: [Trang chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Home_page).
