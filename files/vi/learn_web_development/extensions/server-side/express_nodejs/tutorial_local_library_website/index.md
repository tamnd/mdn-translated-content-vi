---
title: "Hướng dẫn Express: Trang web Thư viện cục bộ"
short-title: "1: Local library tutorial"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment", "Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bài viết này là tổng quan về hướng dẫn Express MDN và giới thiệu trang web ví dụ "thư viện cục bộ" mà chúng tôi sẽ sử dụng trong vài trang tiếp theo.
Bạn sẽ tìm hiểu những gì hướng dẫn đề cập, cách bắt đầu, cách yêu cầu giúp đỡ và mọi thứ khác bạn cần để xây dựng và triển khai ứng dụng JavaScript phía máy chủ đầu tiên của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Đọc <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction">Giới thiệu về Express</a>.
        Đối với các bài viết sau, bạn cũng cần <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment">thiết lập môi trường phát triển Node</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để giới thiệu ứng dụng ví dụ được sử dụng trong hướng dẫn này và cho phép người đọc hiểu những chủ đề nào sẽ được đề cập.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Chào mừng đến với hướng dẫn "Thư viện cục bộ" Express (Node) của MDN, trong đó chúng tôi phát triển một trang web có thể được sử dụng để quản lý danh mục cho một thư viện cục bộ.

Trong loạt bài hướng dẫn này, bạn sẽ:

- Sử dụng công cụ _Trình tạo ứng dụng Express_ để tạo trang web và ứng dụng khung.
- Khởi động và dừng máy chủ web Node.
- Sử dụng cơ sở dữ liệu để lưu trữ dữ liệu ứng dụng của bạn.
- Tạo các route để yêu cầu thông tin khác nhau và các mẫu ("views") để render dữ liệu dưới dạng HTML để hiển thị trong trình duyệt.
- Làm việc với các biểu mẫu.
- Triển khai ứng dụng của bạn lên môi trường sản xuất.

Bạn đã học về một số chủ đề này rồi và đã đề cập ngắn gọn đến một số chủ đề khác. Đến cuối loạt hướng dẫn, bạn sẽ biết đủ để tự phát triển các ứng dụng Express đơn giản.

## Trang web LocalLibrary

_LocalLibrary_ là tên của trang web mà chúng tôi sẽ tạo và phát triển trong suốt loạt hướng dẫn này. Như bạn có thể đoán, mục đích của trang web là cung cấp danh mục trực tuyến cho một thư viện cục bộ nhỏ, nơi người dùng có thể duyệt các sách có sẵn và quản lý tài khoản của họ.

Ví dụ này đã được lựa chọn cẩn thận vì nó có thể mở rộng để hiển thị nhiều hoặc ít chi tiết tùy theo nhu cầu của chúng tôi và có thể được sử dụng để giới thiệu hầu hết mọi tính năng Express. Quan trọng hơn, nó cho phép chúng tôi cung cấp một _con đường có hướng dẫn_ qua các chức năng bạn sẽ cần trong bất kỳ trang web nào:

- Trong vài bài hướng dẫn đầu tiên, chúng tôi sẽ định nghĩa một thư viện _chỉ duyệt_ đơn giản mà các thành viên thư viện có thể sử dụng để tìm hiểu xem có sách nào đang có sẵn không. Điều này cho phép chúng tôi khám phá các hoạt động phổ biến với hầu hết mọi trang web: đọc và hiển thị nội dung từ cơ sở dữ liệu.
- Khi chúng tôi tiến triển, ví dụ thư viện tự nhiên mở rộng để thể hiện các tính năng trang web nâng cao hơn. Ví dụ: chúng tôi có thể mở rộng thư viện để cho phép tạo sách mới, và sử dụng điều này để thể hiện cách sử dụng biểu mẫu và hỗ trợ xác thực người dùng.

Mặc dù đây là một ví dụ rất có thể mở rộng, nó được gọi là _**Local**Library_ vì một lý do — chúng tôi hy vọng hiển thị thông tin tối thiểu sẽ giúp bạn bắt đầu với Express nhanh chóng. Do đó, chúng tôi sẽ lưu trữ thông tin về sách, bản sao sách, tác giả và thông tin chính khác. Tuy nhiên, chúng tôi sẽ không lưu trữ thông tin về các mục khác mà thư viện có thể cho mượn, hoặc cung cấp cơ sở hạ tầng cần thiết để hỗ trợ nhiều trang web thư viện hoặc các tính năng "thư viện lớn" khác.

## Tôi bị kẹt, tôi có thể lấy mã nguồn ở đâu?

Khi bạn thực hiện qua hướng dẫn, chúng tôi sẽ cung cấp các đoạn mã phù hợp để bạn sao chép và dán tại mỗi điểm và sẽ có mã khác mà chúng tôi hy vọng bạn sẽ tự mở rộng (với một số hướng dẫn).

Thay vì sao chép và dán tất cả các đoạn mã, hãy thử gõ chúng ra. Điều đó sẽ có ích cho bạn về lâu dài vì bạn sẽ quen thuộc hơn với mã lần sau khi bạn đến viết điều gì đó tương tự.

Nếu bạn bị kẹt, bạn có thể tìm thấy phiên bản phát triển đầy đủ của trang web [trên GitHub tại đây](https://github.com/mdn/express-locallibrary-tutorial).

> [!NOTE]
> Các phiên bản cụ thể của node, Express và các module khác mà tài liệu này đã được kiểm thử được liệt kê trong [package.json](https://github.com/mdn/express-locallibrary-tutorial/blob/main/package.json) của dự án.

## Tóm tắt

Bây giờ bạn biết thêm một chút về trang web _LocalLibrary_ và những gì bạn sắp học, đã đến lúc bắt đầu tạo [dự án khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website) để chứa ví dụ của chúng tôi.

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment", "Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
