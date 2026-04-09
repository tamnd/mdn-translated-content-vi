---
title: Xử lý các vấn đề hỗ trợ media trong nội dung web
short-title: Xử lý media không được hỗ trợ
slug: Web/Media/Guides/Formats/Support_issues
page-type: guide
sidebar: mediasidebar
---

Một thực tế khi làm việc với việc trình bày và thao tác âm thanh, video trên web là có rất nhiều định dạng media khác nhau, với mức độ phổ biến và khả năng hỗ trợ rất khác nhau. Việc có nhiều lựa chọn là điều tốt cho người dùng, vì họ có thể chọn định dạng phù hợp nhất với nhu cầu của mình. Tuy nhiên, điều này cũng có một nhược điểm: vì có quá nhiều lựa chọn, cùng với rất nhiều loại giấy phép và nguyên tắc thiết kế khác nhau, nên từng nhà phát triển trình duyệt web phải tự quyết định những kiểu tệp media và codec nào sẽ được hỗ trợ.

Điều này đặt lên vai nhà phát triển web một gánh nặng nhỏ nhưng khá dễ vượt qua: xử lý đúng tình huống khi trình duyệt của người dùng không thể xử lý một kiểu media cụ thể. Hướng dẫn này trình bày các kỹ thuật bạn có thể dùng để phát triển nội dung web đáp ứng nhu cầu media của mình trong khi vẫn mang lại trải nghiệm tương thích rộng nhất có thể. Những chủ đề chúng ta sẽ xem xét gồm nội dung dự phòng, các định dạng media nền tảng, và các thực hành xử lý lỗi sẽ giúp nội dung của bạn hoạt động trong nhiều tình huống nhất có thể.

## Sử dụng khung poster

**Khung poster** là một hình ảnh tĩnh đại diện cho nội dung của video. Đó có thể là khung hình đầu tiên của video; tuy nhiên, trong nhiều trường hợp, khung đầu tiên bị trống, hoặc chỉ chứa logo của một doanh nghiệp, hay một hình ảnh khác không cho người xem bất kỳ ngữ cảnh nào về nội dung video.

Một khung poster tốt là khung hoặc đại diện cho nội dung video, hoặc thậm chí không đến từ chính video nhưng chứa hình ảnh và/hoặc văn bản giúp người xem có ý tưởng hữu ích về nội dung video. Ví dụ, với một phim hành động, khung poster có thể là một hình ảnh mang tính biểu tượng từ một trong những cảnh nổi tiếng nhất của phim.

Một khái niệm tương tự có thể áp dụng cho ảnh tĩnh; nếu hình ảnh bạn muốn hiển thị rất lớn và có thể cần thời gian để tải xuống (đặc biệt trên thiết bị hoặc kết nối chậm hơn), bạn có thể cung cấp một phiên bản có độ phân giải thấp hơn hoặc một phiên bản thay thế sẽ được hiển thị cho đến khi bản chất lượng đầy đủ sẵn sàng.

Chúng ta sẽ xem xét cả hai tình huống này và cách triển khai chúng.

### Khung poster cho video

### Ảnh lũy tiến

Ảnh - dù được nhúng bằng {{HTMLElement("img")}} hay {{HTMLElement("picture")}} - không hỗ trợ một khái niệm tương tự khung poster. Tuy nhiên, có những cách để hiển thị ảnh ở chất lượng thấp trong khi nó vẫn đang tải. Điều này yêu cầu tạo ảnh bằng các định dạng **lũy tiến** (progressive), chẳng hạn như {{Glossary("JPEG")}} lũy tiến hoặc {{Glossary("PNG")}} xen kẽ.

Sau khi ảnh của bạn đã được chuyển sang dạng lũy tiến, bạn có thể dùng nó như bình thường.

```html
<img
  src="/images/staff-photo-huge-progressive.jpg"
  alt="Ảnh nhân viên, chụp vào tháng 1 năm 1972" />
```

Khi dùng ảnh lũy tiến, dữ liệu được lưu theo cách để trình duyệt có thể hiển thị một bản đại diện chất lượng thấp của ảnh càng sớm càng tốt, rồi cập nhật ảnh khi nó tiếp tục tải - hoặc sau khi tải xong - để hiển thị ở chất lượng đầy đủ.

> [!NOTE]
> Ảnh lũy tiến (hoặc xen kẽ) vốn dĩ lớn hơn một chút so với phiên bản không lũy tiến của cùng ảnh. Việc dùng xen kẽ có mang lại lợi ích cho người dùng hay không là điều bạn cần tự cân nhắc.

## Chỉ định nhiều nguồn

## Kiểm tra khả năng tương thích trong JavaScript

{{domxref("HTMLMediaElement.canPlayType")}} và {{domxref("MediaSource.isTypeSupported_static", "MediaSource.isTypeSupported()")}}…

## Phát hiện lỗi phát lại

## Điều chỉnh trình bày bằng CSS

## Quản lý bộ nhớ
