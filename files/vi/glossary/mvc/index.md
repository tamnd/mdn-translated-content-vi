---
title: MVC
slug: Glossary/MVC
page-type: glossary-definition
sidebar: glossarysidebar
---

**MVC** (Model-View-Controller - Mô hình-Giao diện-Bộ điều khiển) là một mẫu trong thiết kế phần mềm thường được sử dụng để triển khai giao diện người dùng, dữ liệu và logic điều khiển. Nó nhấn mạnh sự tách biệt giữa logic nghiệp vụ và giao diện hiển thị của phần mềm. "Sự phân tách mối quan tâm" này giúp phân công lao động tốt hơn và cải thiện khả năng bảo trì. Một số mẫu thiết kế khác được dựa trên MVC, chẳng hạn như MVVM (Model-View-Viewmodel), MVP (Model-View-Presenter) và MVW (Model-View-Whatever).

Ba phần của mẫu thiết kế phần mềm MVC có thể được mô tả như sau:

1. Model (Mô hình): Quản lý dữ liệu và logic nghiệp vụ.
2. View (Giao diện): Xử lý bố cục và hiển thị.
3. Controller (Bộ điều khiển): Định tuyến các lệnh đến các phần mô hình và giao diện.

## Ví dụ về Model View Controller

Hãy tưởng tượng một ứng dụng danh sách mua sắm đơn giản. Tất cả những gì chúng ta muốn là một danh sách tên, số lượng và giá của mỗi mặt hàng cần mua trong tuần này. Dưới đây chúng ta sẽ mô tả cách triển khai một số chức năng này bằng MVC.

![Sơ đồ hiển thị các phần khác nhau của kiến trúc MVC.](model-view-controller-light-blue.png)

### Model (Mô hình)

Mô hình xác định dữ liệu mà ứng dụng nên chứa. Nếu trạng thái của dữ liệu này thay đổi, thì mô hình thường sẽ thông báo cho giao diện (để hiển thị có thể thay đổi khi cần) và đôi khi cho bộ điều khiển (nếu cần logic khác để điều khiển giao diện đã được cập nhật).

Quay lại ứng dụng danh sách mua sắm, mô hình sẽ chỉ định dữ liệu mà các mục trong danh sách nên chứa — mặt hàng, giá, v.v. — và những mục danh sách nào đã có mặt.

### View (Giao diện)

Giao diện xác định cách dữ liệu của ứng dụng được hiển thị.

Trong ứng dụng danh sách mua sắm của chúng ta, giao diện sẽ xác định cách danh sách được trình bày cho người dùng và nhận dữ liệu để hiển thị từ mô hình.

### Controller (Bộ điều khiển)

Bộ điều khiển chứa logic cập nhật mô hình và/hoặc giao diện để phản hồi với đầu vào từ người dùng của ứng dụng.

Ví dụ, danh sách mua sắm của chúng ta có thể có các biểu mẫu đầu vào và nút cho phép thêm hoặc xóa mục. Các hành động này yêu cầu mô hình được cập nhật, vì vậy đầu vào được gửi đến bộ điều khiển, sau đó điều chỉnh mô hình cho phù hợp, rồi gửi dữ liệu đã cập nhật đến giao diện.

Tuy nhiên, bạn cũng có thể chỉ muốn cập nhật giao diện để hiển thị dữ liệu theo định dạng khác, ví dụ: thay đổi thứ tự mặt hàng theo bảng chữ cái, hoặc từ thấp đến cao theo giá. Trong trường hợp này, bộ điều khiển có thể xử lý trực tiếp điều này mà không cần cập nhật mô hình.

## MVC trên web

Là một nhà phát triển web, mẫu này có lẽ khá quen thuộc ngay cả khi bạn chưa từng sử dụng nó một cách có ý thức. Mô hình dữ liệu của bạn có lẽ được lưu trong một loại cơ sở dữ liệu nào đó (có thể là cơ sở dữ liệu phía máy chủ truyền thống như MySQL, hoặc giải pháp phía máy khách như [IndexedDB \[en-US\]](/en-US/docs/Web/API/IndexedDB_API)). Mã điều khiển của ứng dụng có lẽ được viết bằng HTML/JavaScript, và giao diện người dùng có lẽ được viết bằng HTML/CSS/những thứ khác bạn thích. Điều này nghe rất giống MVC, nhưng MVC làm cho các thành phần này tuân theo một mẫu chặt chẽ hơn.

Trong những ngày đầu của Web, kiến trúc MVC chủ yếu được triển khai ở phía máy chủ, với máy khách yêu cầu cập nhật qua biểu mẫu hoặc liên kết, và nhận lại các giao diện đã cập nhật để hiển thị trong trình duyệt. Tuy nhiên, ngày nay, nhiều logic hơn được đẩy sang phía máy khách với sự ra đời của các kho lưu trữ dữ liệu phía máy khách và [Fetch API](/en-US/docs/Web/API/Fetch_API) cho phép cập nhật một phần trang khi cần.

Các framework web như [AngularJS](https://en.wikipedia.org/wiki/AngularJS) và [Ember.js](https://en.wikipedia.org/wiki/Ember.js) đều triển khai kiến trúc MVC, mặc dù theo những cách hơi khác nhau.

## Xem thêm

- [Model–view–controller](https://en.wikipedia.org/wiki/Model–view–controller) trên Wikipedia
