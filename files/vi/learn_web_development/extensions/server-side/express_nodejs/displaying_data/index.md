---
title: "Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện"
short-title: "5: Displaying data"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/routes", "Learn_web_development/Extensions/Server-side/Express_Nodejs/forms", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bây giờ chúng tôi đã sẵn sàng thêm các trang hiển thị sách trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website) và dữ liệu khác. Các trang sẽ bao gồm trang chủ hiển thị số lượng bản ghi chúng tôi có cho mỗi loại mô hình và các trang danh sách và chi tiết cho tất cả các mô hình của chúng tôi. Trong quá trình đó, chúng tôi sẽ có kinh nghiệm thực tế trong việc lấy bản ghi từ cơ sở dữ liệu và sử dụng mẫu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành các chủ đề hướng dẫn trước (bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes">Hướng dẫn Express Phần 4: Tuyến đường và bộ điều khiển</a>).
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách thực hiện các thao tác cơ sở dữ liệu không đồng bộ bằng <code>async</code>/<code>await</code>, cách sử dụng ngôn ngữ mẫu Pug và cách lấy dữ liệu từ URL trong các hàm bộ điều khiển.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Trong các bài hướng dẫn trước, chúng tôi đã định nghĩa [các mô hình Mongoose](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose) mà chúng tôi có thể sử dụng để tương tác với cơ sở dữ liệu và tạo một số bản ghi thư viện ban đầu. Sau đó, chúng tôi đã [tạo tất cả các tuyến đường](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes) cần thiết cho trang web LocalLibrary, nhưng với các hàm "bộ điều khiển giả" (đây là các hàm bộ điều khiển khung chỉ trả về thông báo "chưa được triển khai" khi truy cập trang).

Bước tiếp theo là cung cấp các triển khai đúng đắn cho các trang _hiển thị_ thông tin thư viện của chúng ta (chúng ta sẽ tìm hiểu cách triển khai các trang có biểu mẫu để tạo, cập nhật hoặc xóa thông tin trong các bài viết sau). Điều này bao gồm cập nhật các hàm bộ điều khiển để lấy bản ghi bằng mô hình của chúng ta và định nghĩa các mẫu để hiển thị thông tin này cho người dùng.

Chúng tôi sẽ bắt đầu bằng cách cung cấp các chủ đề tổng quan/nhập môn giải thích cách quản lý các thao tác không đồng bộ trong các hàm bộ điều khiển và cách viết mẫu bằng Pug. Sau đó, chúng tôi sẽ cung cấp các triển khai cho từng trang "chỉ đọc" chính của chúng tôi với giải thích ngắn gọn về bất kỳ tính năng đặc biệt hoặc mới nào mà chúng sử dụng.

Đến cuối bài viết này, bạn nên có hiểu biết đầu cuối tốt về cách hoạt động của các tuyến đường, hàm không đồng bộ, views và mô hình trong thực tế.

## Các bài viết con của hướng dẫn hiển thị dữ liệu thư viện

Các bài viết con sau đây hướng dẫn qua quá trình thêm các tính năng khác nhau cần thiết để hiển thị các trang web cần thiết.
Bạn cần đọc và thực hành từng bài theo thứ tự, trước khi chuyển sang bài tiếp theo.

1. [Nhập môn về mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Template_primer)
2. [Mẫu cơ sở LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/LocalLibrary_base_template)
3. [Trang chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Home_page)
4. [Trang danh sách sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_list_page)
5. [Trang danh sách phiên bản sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_list_page)
6. [Định dạng ngày bằng luxon](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Date_formatting_using_moment)
7. [Trang danh sách tác giả và thử thách trang danh sách thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_list_page)
8. [Trang chi tiết thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Genre_detail_page)
9. [Trang chi tiết sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Book_detail_page)
10. [Trang chi tiết tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_detail_page)
11. [Trang chi tiết phiên bản sách và thử thách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/BookInstance_detail_page_and_challenge)

## Tóm tắt

Bây giờ chúng tôi đã tạo tất cả các trang "chỉ đọc" cho trang web của mình: trang chủ hiển thị số lượng phiên bản của mỗi mô hình, và các trang danh sách và chi tiết cho sách, phiên bản sách, tác giả và thể loại. Trong quá trình đó, chúng tôi đã có được nhiều kiến thức cơ bản về bộ điều khiển, quản lý luồng điều khiển khi sử dụng các thao tác không đồng bộ, tạo views bằng _Pug_, truy vấn cơ sở dữ liệu của trang web bằng mô hình, truyền thông tin đến view và tạo cũng như mở rộng mẫu. Các thử thách cũng sẽ dạy người đọc một chút về xử lý ngày tháng bằng _Luxon_.

Trong bài viết tiếp theo, chúng tôi sẽ xây dựng trên kiến thức của mình, tạo biểu mẫu HTML và mã xử lý biểu mẫu để bắt đầu sửa đổi dữ liệu được lưu trữ bởi trang web.

## Xem thêm

- [Sử dụng Template engine với Express](https://expressjs.com/en/guide/using-template-engines.html) (tài liệu Express)
- [Pug](https://pugjs.org/api/getting-started.html) (tài liệu Pug)
- [Luxon](https://moment.github.io/luxon/#/) (tài liệu Luxon)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/routes", "Learn_web_development/Extensions/Server-side/Express_Nodejs/forms", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
