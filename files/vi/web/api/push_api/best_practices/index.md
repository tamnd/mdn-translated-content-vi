---
title: Thực hành tốt nhất cho thông báo Web Push API
slug: Web/API/Push_API/Best_Practices
page-type: guide
---

{{DefaultAPISidebar("Push API") }}

Bài viết này tóm tắt các thực hành tốt nhất nên ghi nhớ khi phát triển các trang web và ứng dụng sử dụng Push Notifications để tăng tương tác người dùng.

> "Nếu làm tốt thì rất đáng có, nhưng nếu làm không tốt thì thực sự rất phiền." - Một cuộc trò chuyện nghe lỏm giữa hai nhà phát triển trình duyệt đang thảo luận về đạo đức của thông báo push.

## Tổng quan về thông báo web push

Thông báo Web Push (được tạo bằng sự kết hợp của các API [Notifications](/en-US/docs/Web/API/Notifications_API), [Push](/en-US/docs/Web/API/Push_API) và [Service Worker](/en-US/docs/Web/API/Service_Worker_API)) là một phần của sự ồn ào ngày càng tăng mà các nhà phát triển sản phẩm và nhà tiếp thị đang dùng để thu hút sự chú ý cho trang web của họ. Nếu tìm kiếm "web push notifications", bạn sẽ thấy các bài viết từ chuyên gia tiếp thị cho rằng bạn nên dùng push để lôi kéo người dùng quay lại trang, hoàn tất việc mua hàng, nhận tin mới nhất hoặc xem các liên kết tới sản phẩm được đề xuất.

### Mặt tối

Sự mới lạ của chúng tạo ra một cơ hội mới chưa được khai thác cho các trang web năng nổ tiếp cận khách hàng tiềm năng. Người dùng vừa chuyển tab để trả lời email ư? Hãy kéo họ quay lại bằng một ưu đãi miễn phí vận chuyển sắp hết hạn mà họ không thể bỏ qua!

Nhưng thực sự, đây có phải là cách sử dụng tốt nhất cho thông báo push không? Hay đây chỉ là một biến thể mới của quảng cáo pop-up cũ kỹ?

> "Web push không có nguy cơ rơi vào thư mục spam. Nó cũng không thể bị chặn bởi trình chặn quảng cáo. Nó hiện ngay trên màn hình của bạn ngay cả khi website đã tắt. Trên di động, nó xuất hiện trong khay thông báo, giống như thông báo push của ứng dụng, ngay cả khi trình duyệt không chạy." - một trang tiếp thị giấu tên

### Những cách dùng tích cực của push

Nhưng thông báo push cũng có mặt tích cực và hữu ích. Giả sử bạn và nhóm của bạn thường dùng một chương trình chat để liên lạc, nhưng hôm nay bạn đang làm việc ở một nơi yên tĩnh và nảy sinh sự cố. Giả sử quản lý sản phẩm của bạn phát hiện một vướng mắc trong quy trình duyệt và muốn nhận phản hồi của bạn trước khi tiếp tục.

Sau vài lần không thể thu hút sự chú ý của bạn, họ gửi email, và ứng dụng email của bạn tạo ra một thông báo push giúp cảnh báo bạn thành công, dù ứng dụng web thư của bạn không mở.

Trong tài liệu này, chúng ta sẽ nói về việc dùng thông báo web push một cách có đạo đức. Đôi khi chúng có thể loại bỏ sự bực bội và phiền toái, và đôi khi chúng có thể gây ra chúng. Vì vậy, bạn với tư cách nhà phát triển cần đưa ra các khuyến nghị và quyết định khôn ngoan về việc sử dụng thông báo push.

## Bạn muốn đạt được điều gì với thông báo push này?

Như mọi thứ khác, quyền năng lớn đi kèm trách nhiệm lớn. Mỗi thông báo push nên hữu ích, mang tính thời điểm, và người dùng luôn phải được xin quyền trước khi gửi thông báo đầu tiên, đồng thời phải có cách dễ dàng để từ chối nhận thêm trong tương lai.

Có một số câu hỏi cơ bản bạn có thể dùng để quyết định xem một thông báo push có thực sự cần hay không:

- Có ai đang chờ phản hồi theo thời gian thực không? Trong ví dụ ở trên, quản lý sản phẩm đang chờ phản hồi của bạn, nên thông báo push là phù hợp.
- Có cần cập nhật liên tục không? Tôi dùng một dịch vụ tổng hợp nhiều nguồn tin mạng xã hội. Khi một câu chuyện tôi quan tâm đang lên xu hướng, tôi muốn nhận thông báo!
- Có tin nóng nào cần truyền đi ngay không? Đây là chỗ hơi khó. Đôi khi các trang tin yêu cầu thông báo push để về cơ bản nói rằng "Hãy nhìn tôi! Hãy nhìn tôi!" Tất cả phụ thuộc vào điều người dùng muốn, và bạn có thể dùng hành vi để suy đoán ý định. Ví dụ, nếu người dùng xem hơn một bài viết hoặc nấn ná trên trang của bạn vài phút, có thể họ muốn nhận cập nhật.

Ngoài câu hỏi liệu một thông báo push có cần thiết hay không, còn có nhiều loại thông báo push khác nhau, từ loại thoáng qua rồi biến mất tới loại tồn tại lâu và yêu cầu tương tác.

Chúng tôi khuyên bạn chỉ nên dùng loại yêu cầu tương tác một cách hết sức tiết chế, vì chúng có thể gây khó chịu nhất. Thông báo của bạn nên hỗ trợ người dùng, không làm gián đoạn họ.

## Xây dựng niềm tin

Một số nghiên cứu cho thấy có tới 60% thông báo push bị chặn. Việc cho phép trang web của bạn đẩy thông báo theo thời gian thực đòi hỏi sự tin tưởng. Bạn có thể xây dựng niềm tin bằng một trang web được thiết kế tốt, cung cấp nội dung hữu ích, thể hiện sự tôn trọng người dùng và cho thấy rõ giá trị của việc chấp nhận thông báo push.

## Các biện pháp giảm thiểu của trình duyệt

Vì đã có nhiều lạm dụng thông báo push trong quá khứ, các nhà phát triển trình duyệt đã bắt đầu triển khai các chiến lược để giảm thiểu vấn đề này. Ví dụ, Safari 12.1 hiện yêu cầu, và các trình duyệt khác hoặc đã làm vậy hoặc đang dự định làm vậy, rằng người dùng phải tương tác với trang theo một cách nào đó trước khi trang có thể yêu cầu quyền gửi thông báo push. Điều này ít nhất ngăn người dùng bị hỏi đột ngột trên những trang mà họ chỉ liếc qua một lần và có thể sẽ không bao giờ xem lại.

Với Firefox, xem [Firefox bug 1524619](https://bugzil.la/1524619), nơi Firefox 68 triển khai điều này, bị tắt theo mặc định, phía sau tùy chọn `dom.webnotifications.requireuserinteraction`.

## Xem thêm

- [Notifications API](/en-US/docs/Web/API/Notifications_API)
- [Using the Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
- [Push API](/en-US/docs/Web/API/Push_API)
