---
title: Document Picture-in-Picture API
slug: Web/API/Document_Picture-in-Picture_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Window.documentPictureInPicture
---

{{SeeCompatTable}}{{DefaultAPISidebar("Document Picture-in-Picture API")}}{{securecontext_header}}

**Document Picture-in-Picture API** cho phép mở cửa sổ luôn hiển thị trên cùng có thể được điền với nội dung HTML tùy ý, ví dụ video với các điều khiển tùy chỉnh hoặc một tập hợp luồng hiển thị người tham gia cuộc gọi hội nghị video. API này mở rộng [Picture-in-Picture API cho `<video>`](/en-US/docs/Web/API/Picture-in-Picture_API) trước đó, cho phép một phần tử HTML {{htmlelement("video")}} cụ thể được đặt trong cửa sổ luôn hiển thị trên cùng.

## Khái niệm và cách sử dụng

Thường hữu ích khi có một cửa sổ khác có sẵn cho ứng dụng web ngoài cửa sổ chính mà ứng dụng đang chạy. Bạn có thể muốn duyệt qua các cửa sổ khác trong khi giữ nội dung ứng dụng cụ thể trong tầm nhìn, hoặc bạn muốn cung cấp cho nội dung đó không gian riêng trong khi giữ cửa sổ ứng dụng chính tự do để hiển thị nội dung khác. Bạn có thể xử lý điều này bằng cách mở một cửa sổ trình duyệt mới thông thường, nhưng điều này có hai vấn đề lớn:

1. Bạn phải xử lý việc chia sẻ thông tin trạng thái giữa hai cửa sổ.
2. Cửa sổ ứng dụng bổ sung không luôn ở trên cùng và có thể bị ẩn bởi các cửa sổ khác.

Để giải quyết những vấn đề này, các trình duyệt web đã giới thiệu các API cho phép ứng dụng tạo ra cửa sổ luôn hiển thị trên cùng là một phần của cùng phiên. Trường hợp sử dụng đầu tiên được nhận ra là giữ video đang phát trong cửa sổ riêng để người dùng có thể tiếp tục xem trong khi nhìn vào nội dung khác. Điều này được xử lý bằng [Picture-in-Picture API cho `<video>`](/en-US/docs/Web/API/Picture-in-Picture_API), được sử dụng trực tiếp trên phần tử `<video>`.

Tuy nhiên, API này được tìm thấy là có phần hạn chế, bạn chỉ có thể đặt một phần tử `<video>` trong cửa sổ luôn hiển thị trên cùng với các điều khiển tối thiểu do trình duyệt tạo ra. Để cung cấp tính linh hoạt hơn, **Document Picture-in-Picture API** đã được giới thiệu. Điều này cho phép _bất kỳ_ nội dung nào được đặt trong cửa sổ luôn hiển thị trên cùng cho nhiều trường hợp sử dụng, bao gồm:

- Trình phát video tùy chỉnh luôn hiển thị trên cùng hiển thị một hoặc nhiều video với các điều khiển và kiểu dáng tùy chỉnh.
- Hệ thống hội nghị video cho phép người dùng luôn thấy luồng của người tham gia khác, cùng với các điều khiển để trình bày nội dung, tắt tiếng, kết thúc cuộc gọi, v.v.
- Các công cụ năng suất luôn hiển thị như đồng hồ đếm giờ, ghi chú, danh sách việc cần làm, v.v.
- Cửa sổ riêng để giữ nội dung bổ sung trong khi cửa sổ ứng dụng chính không bị lộn xộn.

### Cách thức hoạt động

Đối tượng {{domxref("DocumentPictureInPicture")}} mới đại diện cho cửa sổ Picture-in-Picture luôn hiển thị trên cùng cho ngữ cảnh tài liệu hiện tại được truy cập qua {{domxref("Window.documentPictureInPicture")}}. Cửa sổ Picture-in-Picture được mở bằng cách gọi phương thức {{domxref("DocumentPictureInPicture.requestWindow()")}}, trả về {{jsxref("Promise")}} giải quyết với đối tượng {{domxref("Window")}} của cửa sổ.

Ngoài ra, bạn có thể thao tác đối tượng `Window` của cửa sổ Picture-in-Picture theo cách bạn muốn, ví dụ nối nội dung bạn muốn hiển thị lên DOM của nó và sao chép stylesheet vào nó để nội dung được nối trông giống nhau như khi ở cửa sổ chính. Bạn cũng có thể đóng cửa sổ Picture-in-Picture (bằng cách nhấp vào điều khiển do trình duyệt cung cấp, hoặc bằng cách chạy {{domxref("Window.close()")}} trên đó), và sau đó phản ứng với việc nó đóng bằng sự kiện [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event) tiêu chuẩn.

Xem [Sử dụng Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using) để biết hướng dẫn sử dụng chi tiết.

## Giao diện

- {{domxref("DocumentPictureInPicture")}}
  - : Điểm vào để tạo và xử lý các cửa sổ Picture-in-Picture của tài liệu.
- {{domxref("DocumentPictureInPictureEvent")}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("DocumentPictureInPicture/enter_event", "enter")}}, kích hoạt khi cửa sổ Picture-in-Picture được mở.

## Phần mở rộng cho các giao diện khác

- {{domxref("Window.documentPictureInPicture")}}
  - : Trả về tham chiếu đến đối tượng {{domxref("DocumentPictureInPicture")}} cho ngữ cảnh tài liệu hiện tại.

## Bổ sung CSS

- {{cssxref("@media/display-mode", "display-mode")}}, giá trị `picture-in-picture`
  - : Giá trị [tính năng phương tiện](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) [CSS](/en-US/docs/Web/CSS) cho phép nhà phát triển áp dụng CSS cho tài liệu dựa trên việc nó có đang được hiển thị trong chế độ Picture-in-Picture hay không.

## Ví dụ

Xem [Ví dụ Document Picture-in-Picture API](https://mdn.github.io/dom-examples/document-picture-in-picture/) để biết bản demo đầy đủ (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/document-picture-in-picture) đầy đủ).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
