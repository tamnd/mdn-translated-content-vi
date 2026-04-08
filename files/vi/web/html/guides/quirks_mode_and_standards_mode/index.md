---
title: Understanding quirks and standards modes
short-title: Quirks and standards modes
slug: Web/HTML/Guides/Quirks_mode_and_standards_mode
page-type: guide
sidebar: htmlsidebar
---

Trong những ngày đầu của web, các trang thường được viết theo hai phiên bản: Một phiên bản dành cho Netscape Navigator và một phiên bản dành cho Microsoft Internet Explorer. Khi các tiêu chuẩn web được tạo ra tại W3C, các trình duyệt không thể chỉ bắt đầu sử dụng chúng ngay, vì làm như vậy sẽ phá vỡ hầu hết các trang web hiện có. Do đó, các trình duyệt đã giới thiệu hai chế độ để xử lý các trang web tuân thủ tiêu chuẩn mới khác với các trang web kế thừa cũ.

Hiện tại có ba chế độ được sử dụng bởi các layout engine trong trình duyệt web: quirks mode, limited-quirks mode và no-quirks mode. Trong **quirks mode**, layout mô phỏng hành vi trong Navigator 4 và Internet Explorer 5. Điều này rất cần thiết để hỗ trợ các trang web được xây dựng trước khi các tiêu chuẩn web được áp dụng rộng rãi. Trong **no-quirks mode**, hành vi là (hy vọng) hành vi mong muốn được mô tả trong các đặc tả HTML và CSS hiện đại. Trong **limited-quirks mode**, chỉ có một số rất ít quirk được triển khai.

Limited-quirks mode và no-quirks mode trước đây được gọi là chế độ "almost-standards" và "full standards". Những tên này đã được thay đổi vì hành vi hiện đã được chuẩn hóa.

## Trình duyệt xác định chế độ nào sẽ sử dụng như thế nào?

Đối với các tài liệu [HTML](/en-US/docs/Web/HTML), trình duyệt sử dụng doctype ở đầu tài liệu để quyết định xử lý nó trong quirks mode hay no-quirks mode. Để đảm bảo trang của bạn sử dụng no-quirks mode, hãy đảm bảo trang của bạn có doctype như trong ví dụ này:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Hello World!</title>
  </head>
  <body></body>
</html>
```

Doctype được hiển thị trong ví dụ, `<!doctype html>`, là đơn giản nhất có thể, và là doctype được khuyến nghị bởi các tiêu chuẩn HTML hiện tại. Các phiên bản trước của tiêu chuẩn HTML đề xuất các biến thể khác, nhưng tất cả các trình duyệt hiện tại đều sẽ sử dụng no-quirks mode cho doctype này. Không có lý do hợp lệ nào để sử dụng doctype phức tạp hơn. Nếu bạn sử dụng doctype khác, bạn có thể gặp rủi ro chọn một doctype kích hoạt limited-quirks mode hoặc quirks mode.

Đặt doctype ngay ở đầu tài liệu HTML của bạn, trước bất kỳ nội dung nào khác.

Mục đích duy nhất của `<!doctype html>` là kích hoạt no-quirks mode. Các phiên bản doctype của tiêu chuẩn HTML cũ cung cấp ý nghĩa bổ sung, nhưng không có trình duyệt nào từng sử dụng doctype cho bất kỳ mục đích nào khác ngoài việc chuyển đổi giữa các chế độ render.

Xem thêm mô tả chi tiết về [khi nào các trình duyệt khác nhau chọn các chế độ khác nhau](https://hsivonen.fi/doctype/).

### XHTML

Nếu bạn phục vụ trang của mình dưới dạng [XHTML](/en-US/docs/Glossary/XHTML) bằng cách sử dụng kiểu MIME `application/xhtml+xml` trong header HTTP `Content-Type`, bạn không cần doctype để bật no-quirks mode, vì các tài liệu như vậy luôn sử dụng no-quirks mode.

Nếu bạn phục vụ nội dung giống XHTML bằng cách sử dụng kiểu MIME `text/html`, trình duyệt sẽ đọc nó như HTML, và bạn sẽ cần doctype để sử dụng no-quirks mode.

## Làm thế nào để xem chế độ nào đang được sử dụng?

Nếu trang được render trong quirks hoặc limited-quirks mode, Firefox sẽ ghi một cảnh báo vào tab console trong công cụ dành cho nhà phát triển. Nếu cảnh báo này không được hiển thị, Firefox đang sử dụng no-quirks mode.

Giá trị của `document.compatMode` trong JavaScript sẽ cho biết tài liệu có ở quirks mode hay không. Nếu giá trị của nó là `"BackCompat"`, tài liệu ở quirks mode. Nếu không, nó sẽ có giá trị `"CSS1Compat"`.
