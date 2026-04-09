---
title: "Trợ năng: Cá nhân hóa nào giúp duyệt web an toàn hơn"
short-title: Personalization to help browse safely
slug: Web/Accessibility/Guides/Browsing_safely
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này thảo luận về cách làm cho nội dung web dễ tiếp cận hơn với những người có rối loạn tiền đình, và những người hỗ trợ họ, bằng cách tận dụng các thiết lập cá nhân hóa và trợ năng được tích hợp sẵn trong hệ điều hành. Tận dụng các thiết lập cá nhân hóa có thể giúp tránh việc tiếp xúc với nội dung có thể dẫn đến co giật và/hoặc các phản ứng thể chất khác.

## Cá nhân hóa và thiết lập trợ năng

Từ bài viết, "**[Understanding Success Criterion 2.3.1: Three Flashes or Below Threshold](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html)**"

> Việc nhấp nháy có thể do màn hình, do máy tính kết xuất hình ảnh, hoặc do chính nội dung được kết xuất. Tác giả không kiểm soát được hai yếu tố đầu tiên. Chúng có thể được xử lý bằng thiết kế và tốc độ của màn hình và máy tính.

### Phần cứng và hệ điều hành trên nhiều máy tính cung cấp quyền kiểm soát mà nhà phát triển không có

Người dùng có thể tự bảo vệ mình rất nhiều bằng cách tìm hiểu hệ điều hành, cùng các thiết lập cá nhân hóa và trợ năng của nó. Những người trong khu vực công phải đáp ứng các cá nhân có độ nhạy đặc biệt nên cân nhắc dành riêng ít nhất một máy trạm và làm quen với các thiết lập cá nhân hóa và trợ năng của nó. Hiểu các thiết lập cá nhân hóa và trợ năng thực ra có thể giúp tiết kiệm chi phí. Một máy trạm có thể được cấu hình để vừa phù hợp với người thị lực kém, vừa phù hợp với người có độ nhạy sáng, chỉ bằng cách điều chỉnh các thiết lập cá nhân hóa và trợ năng.

### Hãy dùng trình duyệt hiện đại. Tìm hiểu các thiết lập cá nhân hóa và trợ năng

Trình duyệt hiện đại hỗ trợ đặc tính media CSS [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion). Trình duyệt có thể phát hiện liệu người dùng có yêu cầu trải nghiệm ít chuyển động hơn hay không. Người dùng sẽ truy cập việc này thông qua giao diện trợ năng, như minh họa bên dưới.

![Ảnh chụp màn hình cho thấy cách tắt hoạt ảnh trong Windows 10.](android-remove-animations.png)

Các sự kiện CSS Transition được hỗ trợ. Ví dụ gồm:

- `transitionrun`
- `transitionstart`
- `transitionend`
- `transitioncancel`

### Safari 10.1 trở lên (Máy tính để bàn)

Không bật tự động phát (không áp dụng cho GIF)

#### iOS Safari 10.3 trở lên (Di động và máy tính bảng)

Chọn tùy chọn "Reduce motion" trong cài đặt Trợ năng của hệ điều hành Apple (nguồn hình ảnh: developers.google.com từ bài viết của Thomas Steiner, "Move Ya! Or maybe, don't, if the user prefers-reduced-motion!"). Cách này không áp dụng cho GIF động; nguồn của hoạt ảnh nằm trọn trong GIF và không bị ảnh hưởng bởi các thiết lập này.![Ảnh chụp màn hình cho thấy cách giảm chuyển động trên macOS](macos-reduce-motion.png)

#### Dùng Reader Mode trên trình duyệt

- Bật Content Blockers; loại bỏ quảng cáo, giảm và/hoặc loại bỏ sự phân tán chú ý
- Bật chuyển văn bản thành giọng nói
- Trong một số trình duyệt, bật font theo lựa chọn của bạn
- Bật phóng to trang

#### Tắt GIF động trong trình duyệt

Trình duyệt trao cho người dùng rất nhiều quyền; vấn đề chỉ là biết phải vào đâu. Lấy Firefox làm ví dụ, tài liệu giải thích rằng bằng cách đổi giá trị **image.animation_mode** từ "normal" sang "none", tất cả hình ảnh động sẽ bị chặn. Để khôi phục, bạn phải đổi giá trị trở lại thành "normal".

![Ảnh chụp image.animation.mode được chọn trong Firefox](image_animation_mode.png)

#### Dùng tiện ích mở rộng trình duyệt

- [Gif Blocker](https://chromewebstore.google.com/detail/gif-blocker/ahkidgegbmbnggcnmejhobepkaphkfhl?hl=en) Với Chrome, GIF Blocker là một tiện ích có sẵn trong cửa hàng web.
- [Gif Scrubber](https://chromewebstore.google.com/detail/gif-scrubber/gbdacbnhlfdlllckelpdkgeklfjfgcmp?hl=en) Gif Scrubber là một tiện ích mở rộng cho Chrome cho phép bạn điều khiển GIF như một trình phát video. Nó có kho lưu trữ GitHub tại **<https://github.com/0ui/gif-scrubber>**
- [Beeline Reader](https://www.beelinereader.com/) Beeline Reader có tiện ích mở rộng trình duyệt cho phép bạn thiết lập thang xám và font Dyslexi, cùng nhiều thứ khác

![Ảnh chụp cho thấy các chế độ của Beeline Reader mà người dùng có thể chỉnh trong trình duyệt](beelinereader.png)

### Tận dụng các tính năng trợ năng của hệ điều hành

Hầu hết các hệ điều hành như Windows 10 đều có các tùy chọn trợ năng rất mạnh. Thường rất dễ tìm bằng cách gõ (hoặc nói) từ "Accessibility" trong công cụ tìm kiếm của hệ điều hành.

#### Tắt hoạt ảnh trong hệ điều hành

Trong Windows 10, người dùng có thể tắt hoạt ảnh. Cách này không áp dụng cho GIF động; nguồn của hoạt ảnh nằm trọn trong GIF và không bị ảnh hưởng bởi các thiết lập này.

![Ảnh chụp màn hình cho thấy cách tắt hoạt ảnh trong Windows 10](turnoffanimationsinwindows.png)

#### Thang xám

Những người từng bị chấn thương sọ não (TBI) có thể rất nhạy cảm với màu sắc; điều đó có thể đòi hỏi một "khoản đầu tư năng lượng nhận thức" lớn đến mức không còn đủ năng lượng cho các công việc hằng ngày khác. Bật hiển thị thang xám cho nội dung làm giảm tải nhận thức. Nó cũng có thể giúp người dùng có các dạng khuyết tật khác. Một cuộc thảo luận thú vị của người dùng về lợi ích của thang xám có thể được tìm thấy trong chủ đề thảo luận, "[What is the "grayscale" setting for in accessibility options?](https://ask.metafilter.com/312049/What-is-the-grayscale-setting-for-in-accessibility-options)". Đáng chú ý là một người dùng bị động kinh nhạy sáng và dùng nó khi cảm thấy "có dấu hiệu lên cơn".

Hầu hết hệ điều hành đều có cách để người dùng điều chỉnh trên máy trạm. Trong ảnh chụp bên dưới, bạn có thể thấy ví dụ về Windows 10 Accessibility Settings cho phép chọn bộ lọc màu. Thang xám được bật khi nút color filters được chuyển sang "on".

![Hiển thị Windows 10 Accessibility Settings cho GrayScale](colorfiltersgrayscaleinwindows.png)

## Xem thêm

- [Accessibility](/en-US/docs/Web/Accessibility)
- [Accessibility learning path](/en-US/docs/Learn_web_development/Core/Accessibility)
- [Web accessibility for seizures and physical reactions](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)
- [Color vision simulation](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/simulation/index.html)
- Thảo luận: "[What is the "grayscale" setting for in accessibility options?](https://ask.metafilter.com/312049/What-is-the-grayscale-setting-for-in-accessibility-options)"

### Người đóng góp

Xin cảm ơn rất nhiều Eric Eggert từ [Knowbility](https://knowbility.org/) vì các trao đổi và hỗ trợ tuyệt vời về chủ đề này.
