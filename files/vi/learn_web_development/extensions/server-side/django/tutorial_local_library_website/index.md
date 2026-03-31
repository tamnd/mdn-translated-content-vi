---
title: "Hướng dẫn Django: Website Thư viện Cục bộ"
short-title: "1: Hướng dẫn thư viện cục bộ"
slug: Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/development_environment", "Learn_web_development/Extensions/Server-side/Django/skeleton_website", "Learn_web_development/Extensions/Server-side/Django")}}

Bài viết này là cái nhìn tổng quan về hướng dẫn MDN Django và giới thiệu website ví dụ "thư viện cục bộ" chúng tôi sẽ sử dụng xuyên suốt các trang tiếp theo.
Bạn sẽ tìm hiểu những gì hướng dẫn bao gồm, cách bắt đầu, cách yêu cầu trợ giúp, và mọi thứ khác bạn cần để xây dựng và triển khai ứng dụng Python phía máy chủ đầu tiên của mình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Đọc phần <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Introduction">Giới thiệu về Django</a>.
        Đối với các bài tiếp theo bạn cũng cần phải <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment">thiết lập môi trường phát triển Django</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Giới thiệu ứng dụng ví dụ được sử dụng trong hướng dẫn này, và cho phép người đọc hiểu những chủ đề nào sẽ được đề cập.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Chào mừng đến với hướng dẫn Django "Thư viện Cục bộ" của MDN, trong đó chúng tôi phát triển một website có thể được sử dụng để quản lý danh mục cho một thư viện cục bộ.

Trong loạt bài hướng dẫn này bạn sẽ:

- Sử dụng các công cụ của Django để tạo website và ứng dụng khung xương.
- Khởi động và dừng máy chủ phát triển.
- Tạo các mô hình để đại diện cho dữ liệu của ứng dụng.
- Sử dụng trang quản trị Django để điền vào dữ liệu cho trang.
- Tạo các khung nhìn để truy xuất dữ liệu cụ thể để phản hồi các yêu cầu khác nhau, và các mẫu để hiển thị dữ liệu dưới dạng HTML để hiển thị trong trình duyệt.
- Tạo các bộ ánh xạ để liên kết các mẫu URL khác nhau với các khung nhìn cụ thể.
- Thêm ủy quyền người dùng và phiên làm việc để kiểm soát hành vi và truy cập trang.
- Làm việc với biểu mẫu.
- Viết code kiểm tra cho ứng dụng của bạn.
- Sử dụng bảo mật của Django một cách hiệu quả.
- Triển khai ứng dụng của bạn lên môi trường sản xuất.

Bạn đã học về một số chủ đề này rồi, và đã đề cập ngắn gọn đến những chủ đề khác. Đến cuối chuỗi hướng dẫn, bạn nên biết đủ để tự phát triển các ứng dụng Django đơn giản.

## Website LocalLibrary

_LocalLibrary_ là tên website mà chúng tôi sẽ tạo và phát triển qua chuỗi hướng dẫn này. Như bạn có thể đoán, mục đích của website là cung cấp danh mục trực tuyến cho một thư viện nhỏ cục bộ, nơi người dùng có thể duyệt sách có sẵn và quản lý tài khoản của họ.

Ví dụ này đã được chọn cẩn thận vì nó có thể mở rộng để hiển thị nhiều hay ít chi tiết tùy theo nhu cầu của chúng ta, và có thể được sử dụng để giới thiệu gần như bất kỳ tính năng Django nào. Quan trọng hơn, nó cho phép chúng tôi cung cấp một lộ trình _được hướng dẫn_ qua các chức năng quan trọng nhất trong web framework Django:

- Trong những bài hướng dẫn đầu tiên, chúng tôi sẽ định nghĩa một thư viện _chỉ duyệt_ đơn giản mà thành viên thư viện có thể sử dụng để tìm hiểu sách nào có sẵn. Điều này cho phép chúng tôi khám phá các hoạt động phổ biến với hầu hết mọi website: đọc và hiển thị nội dung từ cơ sở dữ liệu.
- Khi chúng tôi tiến bộ, ví dụ thư viện mở rộng tự nhiên để minh họa các tính năng Django nâng cao hơn. Ví dụ chúng ta có thể mở rộng thư viện để cho phép người dùng đặt giữ sách, và sử dụng điều này để minh họa cách sử dụng biểu mẫu và hỗ trợ xác thực người dùng.

Mặc dù đây là ví dụ rất có thể mở rộng, nó được gọi là _**Local**Library_ vì một lý do — chúng tôi hy vọng hiển thị thông tin tối thiểu giúp bạn bắt đầu và chạy với Django nhanh chóng. Kết quả là chúng tôi sẽ lưu trữ thông tin về sách, bản sao sách, tác giả và thông tin quan trọng khác. Tuy nhiên, chúng tôi sẽ không lưu trữ thông tin về các mục khác mà thư viện có thể lưu trữ, hoặc cung cấp cơ sở hạ tầng cần thiết để hỗ trợ nhiều trang thư viện hoặc các tính năng "thư viện lớn" khác.

## Tôi bị mắc kẹt, tôi có thể lấy nguồn từ đâu?

Khi bạn làm việc qua hướng dẫn, chúng tôi sẽ cung cấp các đoạn code phù hợp để bạn sao chép và dán ở mỗi điểm, và sẽ có code khác mà chúng tôi hy vọng bạn sẽ tự mở rộng (với một số hướng dẫn).

Nếu bạn bị mắc kẹt, bạn có thể tìm thấy phiên bản phát triển đầy đủ của website [trên GitHub tại đây](https://github.com/mdn/django-locallibrary-tutorial).

## Tóm tắt

Bây giờ khi bạn biết thêm một chút về website _LocalLibrary_ và những gì bạn sẽ học, đã đến lúc bắt đầu tạo [dự án khung xương](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website) để chứa ví dụ của chúng ta.

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/development_environment", "Learn_web_development/Extensions/Server-side/Django/skeleton_website", "Learn_web_development/Extensions/Server-side/Django")}}
